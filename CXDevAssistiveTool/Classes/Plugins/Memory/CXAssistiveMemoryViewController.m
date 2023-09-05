//
//  CXAssistiveMemoryViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/27.
//

#import "CXAssistiveMemoryViewController.h"
#import "CXAssistiveDetectionInfoView.h"
#import "CXAssistiveDefine.h"
#import "UIViewController+AssistiveUtil.h"
#import "UIView+AssistiveUtils.h"
#import "CXAssistiveMemoryHelper.h"

@interface CXAssistiveMemoryViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) CXAssistiveDetectionInfoView *memoryView;


@end

@implementation CXAssistiveMemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self startRecord];
}

- (void)setupUI {
    
    self.memoryView = [[CXAssistiveDetectionInfoView alloc] initWithFrame:CGRectMake(10, AS_ScreenHeight-90, AS_ScreenWidth, 90)];
    [self.memoryView setDetectionInfoViewTitle:@"内存检测"];
    [self.view addSubview:self.memoryView];
    weak(self);
    [self.memoryView setCloseBlock:^{
        strong(self);
        [self stopRecord];
        [self pluginWindowDidClosed];
    }];
}

- (void)startRecord{
    if(!self.timer){
        self.timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(doSecondFunction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)doSecondFunction {
    
    double memory = [CXAssistiveMemoryHelper usedMemory];
    [self.memoryView.detectionView addValue:[NSString stringWithFormat:@"%.2fM",memory] atHeight:memory*self.memoryView.detectionView.as_height/250];
}

- (void)stopRecord {
    
    [self.timer invalidate];
    self.timer = nil;
    [self.memoryView.detectionView resetDetectionView];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGPoint p = [self.view convertPoint:point toView:self.memoryView];
    if (CGRectContainsPoint(self.memoryView.bounds, p)) {
        return YES;
    }
    return NO;
}

- (void)dealloc {
    [self stopRecord];
}

@end
