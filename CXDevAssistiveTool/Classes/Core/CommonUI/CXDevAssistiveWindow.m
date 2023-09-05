//
//  CXDevAssistiveWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXDevAssistiveWindow.h"
#import "CXAssistiveManager.h"

@implementation CXDevAssistiveWindow

- (CXAssistiveNavigationController *)navigationController:(UIViewController *)vc {
    CXAssistiveNavigationController *nav = [[CXAssistiveNavigationController alloc] initWithRootViewController:vc];
    return nav;
}

- (CXAssistiveNavigationController *)navigationControllerByClass:(Class)cls {
    UIViewController *vc = [[cls alloc] init];
    return [self navigationController:vc];
}

- (void)pluginWindowDidClosed {
    
    [[CXAssistiveManager sharedManager] showAssistive];
}

@end
