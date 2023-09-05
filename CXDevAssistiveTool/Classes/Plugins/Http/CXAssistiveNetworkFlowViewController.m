//
//  CXAssistiveNetworkFlowViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/25.
//

#import "CXAssistiveNetworkFlowViewController.h"
#import "UIViewController+AssistiveUtil.h"
#import "CXAssistiveNetworkFlowDataView.h"
#import "UIView+AssistiveUtils.h"

@interface CXAssistiveNetworkFlowViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) CXAssistiveNetworkFlowDataView *flowDataView;

@end

@implementation CXAssistiveNetworkFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self as_setLeftBarItemTitle:@"关闭"];
    [self initial];
}

- (void)initial {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    
    self.flowDataView = [[CXAssistiveNetworkFlowDataView alloc] initWithFrame:CGRectMake(10, 20, self.view.as_width-20, 140)];
    [self.scrollView addSubview:self.flowDataView];
}


- (void)as_viewControllerDidTriggerLeftClick:(UIViewController *)viewController  {
    
    [self pluginWindowDidClosed];
}

@end
