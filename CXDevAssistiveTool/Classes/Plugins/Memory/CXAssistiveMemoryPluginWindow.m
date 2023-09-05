//
//  CXAssistiveMemoryPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/27.
//

#import "CXAssistiveMemoryPluginWindow.h"
#import "CXAssistiveMemoryViewController.h"
@implementation CXAssistiveMemoryPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [[CXAssistiveMemoryViewController alloc] init];
    }
    return self;
}

- (BOOL)cx_canBecomeKeyWindow {
    return NO;
}

@end
