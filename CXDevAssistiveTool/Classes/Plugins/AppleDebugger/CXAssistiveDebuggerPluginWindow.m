//
//  CXAssistiveDebuggerPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import "CXAssistiveDebuggerPluginWindow.h"
#import "CXDisplayNameViewController.h"
@implementation CXAssistiveDebuggerPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.rootViewController = [[CXDisplayNameViewController alloc] init];
    }
    return self;
}

- (BOOL)cx_canBecomeKeyWindow {
    return NO;
}

@end
