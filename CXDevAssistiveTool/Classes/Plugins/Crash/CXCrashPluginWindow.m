//
//  CXCrashPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/20.
//

#import "CXCrashPluginWindow.h"
#import "CXAssistiveCrashViewController.h"
@implementation CXCrashPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [self navigationController:[[CXAssistiveCrashViewController alloc] init]];
    }
    return self;
}

@end
