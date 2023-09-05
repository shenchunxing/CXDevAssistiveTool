//
//  UIWindow+AssistiveEntry.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/25.
//

#import "UIWindow+AssistiveEntry.h"
#import "UIViewController+AssistiveUtil.h"

@implementation UIWindow (AssistiveEntry)

- (UIViewController *)cx_currentShowingViewController {
    
    UIViewController *vc = [self.rootViewController as_topViewController];
    if (vc) {
        return vc;
    }
    return self.rootViewController;
}

@end
