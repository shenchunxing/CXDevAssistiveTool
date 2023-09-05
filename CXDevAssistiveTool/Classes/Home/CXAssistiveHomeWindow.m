//
//  CXAssistiveHomeWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXAssistiveHomeWindow.h"
#import "CXAssistiveManager.h"
#import "CXAssistiveNavigationController.h"
#import "CXDevAssistiveHomeViewController.h"

@implementation CXAssistiveHomeWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initial];
        self.windowLevel = UIWindowLevelStatusBar + 200;
    }
    return self;
}

- (void)initial {
    
    if (!self.rootViewController) {
        CXDevAssistiveHomeViewController *homeVC = [[CXDevAssistiveHomeViewController alloc] init];
        CXAssistiveNavigationController *nav = [[CXAssistiveNavigationController alloc] initWithRootViewController:homeVC];
        self.rootViewController = nav;
    }
}

@end
