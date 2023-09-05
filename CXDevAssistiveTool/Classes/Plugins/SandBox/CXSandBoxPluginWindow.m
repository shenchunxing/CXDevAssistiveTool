//
//  CXSandBoxPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/8.
//

#import "CXSandBoxPluginWindow.h"
#import "CXSandBoxViewController.h"
@implementation CXSandBoxPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [self navigationControllerByClass:CXSandBoxViewController.class];
    }
    return self;
}

@end
