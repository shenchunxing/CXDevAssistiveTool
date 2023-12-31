//
//  CXAssistiveWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/25.
//

#import "CXAssistiveWindow.h"
#import "CXDevAssistiveViewController.h"

@implementation CXAssistiveWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel = UIWindowLevelStatusBar + 100;
        [self initializeRootVC];
    }
    return self;
}

- (void)initializeRootVC {
    
    self.backgroundColor = [UIColor clearColor];
    if (!self.rootViewController) {
        self.rootViewController = [[CXDevAssistiveViewController alloc] init];
    }
}

//不能让该View成为keyWindow，每一次它要成为keyWindow的时候，都要将appDelegate的window指为keyWindow
- (void)becomeKeyWindow{
    UIWindow *appWindow = [[UIApplication sharedApplication].delegate window];
    [appWindow makeKeyWindow];
}

@end
