//
//  CXAssistiveNavigationController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/10.
//

#import "CXAssistiveNavigationController.h"
#import "UIColor+AssistiveColor.h"
#import "UIFont+AssistiveFont.h"
#import "UIImage+AssistiveBundle.h"
#import "UIViewController+AssistiveNavigation.h"

@interface CXAssistiveNavigationController ()

@end

@implementation CXAssistiveNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    
//    self.navigationBar.translucent = NO;
    [self.navigationBar setBarTintColor:[UIColor as_mainColor]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont as_17_bold]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    //fix:处理push后隐藏tabbar，并解决了iphonex push后tabbar上移问题
    CGRect rect = self.tabBarController.tabBar.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height - rect.size.height;
    self.tabBarController.tabBar.frame = rect;
}

@end
