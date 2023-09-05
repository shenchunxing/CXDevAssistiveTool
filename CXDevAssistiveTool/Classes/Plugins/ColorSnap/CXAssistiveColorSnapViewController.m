//
//  CXAssistiveColorSnapViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/18.
//

#import "CXAssistiveColorSnapViewController.h"
#import "CXColorSnapView.h"
#import "CXColorSnapInfoView.h"
#import "UIViewController+AssistiveUtil.h"

@interface CXAssistiveColorSnapViewController ()<CXColorSnapInfoViewDelegate,CXAssistiveColorSnapViewDelegate>

/* 放大镜 */
@property (nonatomic, strong) CXColorSnapView *colorSnapView;

/* 详细信息 */
@property (nonatomic, strong) CXColorSnapInfoView *colorSnapInfoView;

@end

@implementation CXAssistiveColorSnapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUI];
}

- (void)initializeUI {
    
    self.colorSnapView = [[CXColorSnapView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.colorSnapView.delegate = self;
    [self.view addSubview:self.colorSnapView];
    [self.colorSnapView pointInSuperView:self.view.center];

    self.colorSnapInfoView = [[CXColorSnapInfoView alloc] initWithFrame:CGRectMake(10, CGRectGetHeight([UIScreen mainScreen].bounds)-80-10, CGRectGetWidth([UIScreen mainScreen].bounds)-20, 80)];
    self.colorSnapInfoView.delegate = self;
    [self.view addSubview:self.colorSnapInfoView];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGPoint pPoint = [self.view convertPoint:point toView:self.colorSnapView];
    CGPoint iPoint = [self.view convertPoint:point toView:self.colorSnapInfoView];
    if ([self.colorSnapView pointInside:pPoint withEvent:nil] || [self.colorSnapInfoView pointInside:iPoint withEvent:nil]) {
        return YES;
    }
    return NO;
}

#pragma mark - CXAssistiveColorSnapViewDelegate
- (void)colorSnapView:(CXColorSnapView *)colorSnapView colorHex:(NSString *)colorHex atPosition:(CGPoint)point {
    [self.colorSnapInfoView updateColor:colorHex atPoint:point];
}

#pragma mark - CXColorSnapInfoViewDelegate
- (void)colorSnapInfoViewDidClose:(CXColorSnapInfoView *)infoView {
    
    [self pluginWindowDidClosed];
}


@end
