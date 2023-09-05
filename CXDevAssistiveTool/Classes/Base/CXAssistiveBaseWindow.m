//
//  CXAssistiveBaseWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXAssistiveBaseWindow.h"
#import "UIWindow+AssistiveEntry.h"
#import "UIViewController+AssistiveUtil.h"

@implementation CXAssistiveBaseWindow

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.windowLevel = UIWindowLevelStatusBar + 119;
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIViewController *vc = [self cx_currentShowingViewController];
    return [vc pointInside:point withEvent:event];
}

- (BOOL)cx_canBecomeKeyWindow {
    return YES;
}

@end
