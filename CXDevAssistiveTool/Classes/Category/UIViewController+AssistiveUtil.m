//
//  UIViewController+AssistiveUtil.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "UIViewController+AssistiveUtil.h"
#import "CXDevAssistiveWindow.h"

@implementation UIViewController (AssistiveUtil)

- (void)pluginWindowDidClosed {
    
    if ([self.view.window isKindOfClass:[CXDevAssistiveWindow class]]) {
        CXDevAssistiveWindow *window = (CXDevAssistiveWindow *)self.view.window;
        [window pluginWindowDidClosed];
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return YES;
}

- (UIViewController *)as_topViewController {
    
    UIViewController *vc = self;
    if ([self presentedViewController]) {
        vc = [[self presentedViewController] as_topViewController];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBar = (UITabBarController *)vc;
        vc = [tabBar.selectedViewController as_topViewController];
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)vc;
        vc = [[nav visibleViewController] as_topViewController];
    }
    return vc;
}

@end
