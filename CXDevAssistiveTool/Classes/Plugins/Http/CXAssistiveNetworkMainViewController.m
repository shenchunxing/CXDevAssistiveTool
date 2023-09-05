//
//  CXAssistiveNetworkMainViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/25.
//

#import "CXAssistiveNetworkMainViewController.h"
#import "CXAssistiveHttpViewController.h"
#import "CXAssistiveNetworkFlowViewController.h"
#import "CXAssistiveNavigationController.h"
#import "UIColor+AssistiveColor.h"
#import "UIImage+AssistiveBundle.h"

@interface CXAssistiveNetworkMainViewController ()

@end

@implementation CXAssistiveNetworkMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabBar];
    [self setUpControllers];
}

- (void)setUpControllers{
    
    NSArray *controllers = @[@"CXAssistiveHttpViewController",
                             @"CXAssistiveNetworkFlowViewController"];
    NSArray *titles = @[@"网络列表",@"流量统计"];
    NSArray *normalImages = @[@"icon_networklist_default",@"icon_flowstatistics_default"];
    NSArray *selectedImages = @[@"icon_networklist_selected",@"icon_flowstatistics_selected"];
    NSMutableArray *controllerArr = [NSMutableArray array];
    [controllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Class cls = NSClassFromString(controllers[idx]);
        CXAssistiveBaseViewController *viewController = [[cls alloc] init];
        viewController.title = titles[idx];
        viewController.tabBarItem.image = [[UIImage as_imageWithName:normalImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.tabBarItem.selectedImage = [[UIImage as_imageWithName:selectedImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
        [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor as_customColor:0x108eff]} forState:UIControlStateSelected];

        CXAssistiveNavigationController *nav = [[CXAssistiveNavigationController alloc] initWithRootViewController:viewController];
        [controllerArr addObject:nav];
    }];
    self.viewControllers = controllerArr;
}

- (void)setUpTabBar {
    
    self.tabBar.translucent = NO;
    [self.tabBar setBarTintColor:[UIColor as_mainColor]];
    //该表tabbard线条的颜色
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1/[UIScreen mainScreen].scale);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //两个方法缺一不可，否则将无法改变分割线颜色
    [self.tabBar setShadowImage:img];
    [self.tabBar setBackgroundImage:[[UIImage alloc] init]];
}

@end
