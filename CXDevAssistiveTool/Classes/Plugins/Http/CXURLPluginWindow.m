//
//  CXURLPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/20.
//

#import "CXURLPluginWindow.h"
#import "CXAssistiveNetworkMainViewController.h"
@implementation CXURLPluginWindow

- (instancetype)initWithFrame:(CGRect)frame  {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [[CXAssistiveNetworkMainViewController alloc] init];
    }
    return self;
}

@end
