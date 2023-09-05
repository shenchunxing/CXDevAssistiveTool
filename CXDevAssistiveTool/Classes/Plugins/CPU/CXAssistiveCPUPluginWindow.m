//
//  CXAssistiveCPUPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/27.
//

#import "CXAssistiveCPUPluginWindow.h"
#import "CXAssistiveCPUViewController.h"

@implementation CXAssistiveCPUPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.rootViewController = [[CXAssistiveCPUViewController alloc] init];
    }
    return self;
}

- (BOOL)cx_canBecomeKeyWindow {
    return NO;
}

@end
