//
//  CXAssistiveFPSPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/27.
//

#import "CXAssistiveFPSPluginWindow.h"
#import "CXAssistiveFPSViewController.h"

@implementation CXAssistiveFPSPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.rootViewController = [[CXAssistiveFPSViewController alloc] init];
    }
    return self;
}

- (BOOL)cx_canBecomeKeyWindow {
    return NO;
}
@end
