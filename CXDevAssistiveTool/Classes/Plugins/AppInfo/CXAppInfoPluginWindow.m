//
//  CXAppInfoPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import "CXAppInfoPluginWindow.h"
#import "CXAppInfoViewController.h"

@implementation CXAppInfoPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [self navigationController:[[CXAppInfoViewController alloc] init]];
    }
    return self;
}

@end
