//
//  CXScreenShotPreviewViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/11.
//

#import "CXScreenShotPreviewViewController.h"
#import <Photos/PHPhotoLibrary.h>
#import "CXScreenShotToolBar.h"
#import "CXScreenShotImageView.h"
#import "UIView+AssistiveUtils.h"
#import "CXScreenShotHelper.h"
#import "CXAssistiveManager.h"
#import "CXAssistiveMacro.h"
#import "UIViewController+AssistiveUtil.h"

@interface CXScreenShotPreviewViewController ()<CXScreenShotToolBarDelegate>

@property (nonatomic, strong) CXScreenShotImageView *shotImageView;

@property (nonatomic, strong) CXScreenShotToolBar *toolBar;

@property (nonatomic, assign) CGRect oriImageFrame;
@end

@implementation CXScreenShotPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUI];
}

- (void)initializeUI {
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat rate = 0.1;
    CGFloat toolBarHeight = 80;
    CGFloat imgViewTop = rate * height - toolBarHeight / 2.0;
    
    self.shotImageView = [[CXScreenShotImageView alloc] initWithFrame:CGRectMake(rate * width, imgViewTop, 0.8 * width, 0.8 * height)];
    self.shotImageView.shotImage = self.shotImage;
    self.oriImageFrame = self.shotImageView.frame;
    [self.view addSubview:self.shotImageView];
    
    self.toolBar = [[CXScreenShotToolBar alloc] initWithFrame:CGRectMake(self.shotImageView.frame.origin.x, self.shotImageView.frame.origin.y+CGRectGetHeight(self.shotImageView.frame)+10, CGRectGetWidth(self.shotImageView.frame), toolBarHeight)];
    self.toolBar.delegate = self;
    [self.view addSubview:self.toolBar];
}


- (void)cancelAction {
    
    [self pluginWindowDidClosed];
}

- (void)confirmAction {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"保存图片" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入图片名称";
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
    }];
    weak(alertVC);
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        strong(alertVC);
        [self doConfirmAction:alertVC.textFields.firstObject.text];
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:confirm];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)doConfirmAction:(NSString *)name {
    
    self.toolBar.hidden = YES;
    UIImage *image = [self.shotImageView as_convertViewToImage];
    if (image) {
        [[CXScreenShotHelper sharedInstance] saveScreenShot:image name:name complete:nil];
        if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized) {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        }
    }else {
        self.toolBar.hidden = NO;
    }
    [self pluginWindowDidClosed];
}

- (void)screenShotToolBar:(CXScreenShotToolBar *)bar didSeletAction:(CXScreenShotAction)action styleModel:(CXScreenShotStyleModel *)styleModel {
    
    if (action <= CXScreenShotActionText) {
        self.shotImageView.currentAction = action;
        self.shotImageView.styleModel = styleModel;
    } else if (action == CXScreenShotActionRevoke) {
        [self.shotImageView removeLastOperation];
    } else if (action == CXScreenShotActionCancel) {
        [self cancelAction];
    } else if (action == CXScreenShotActionConfirm) {
        [self confirmAction];
    }
}

@end
