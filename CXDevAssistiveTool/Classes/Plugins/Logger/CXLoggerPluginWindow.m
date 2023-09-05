//
//  CXLoggerPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/20.
//

#import "CXLoggerPluginWindow.h"
#import "CXConsoleLoggerViewController.h"

@implementation CXLoggerPluginWindow

- (instancetype)initWithFrame:(CGRect)frame  {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [self navigationController:[[CXConsoleLoggerViewController alloc] init]];
    }
    return self;
}

@end
