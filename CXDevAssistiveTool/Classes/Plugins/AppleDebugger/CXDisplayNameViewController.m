//
//  CXDisplayNameViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import "CXDisplayNameViewController.h"
#import "CXAssistiveDebuggerView.h"
#import "UIViewController+AssistiveUtil.h"
#import "CXAssistiveDefine.h"
@interface CXDisplayNameViewController ()

@property (nonatomic, strong) CXAssistiveDebuggerView *debuggerView;

@end

@implementation CXDisplayNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUI];
}

- (void)initializeUI {
    
    self.debuggerView = [[CXAssistiveDebuggerView alloc] initWithFrame:CGRectMake(10, CGRectGetHeight([UIScreen mainScreen].bounds)-80-10, CGRectGetWidth([UIScreen mainScreen].bounds)-20, 80)];
    [self.view addSubview:self.debuggerView];
    weak(self);
    [self.debuggerView setCloseHandler:^{
        strong(self);
        [self pluginWindowDidClosed];
    }];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGPoint p = [self.view convertPoint:point toView:self.debuggerView];
    if (CGRectContainsPoint(self.debuggerView.bounds, p)) {
        return YES;
    }
    return NO;
}

@end
