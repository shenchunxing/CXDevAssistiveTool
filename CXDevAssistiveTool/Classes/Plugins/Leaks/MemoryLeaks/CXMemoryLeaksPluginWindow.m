//
//  CXMemoryLeaksPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/20.
//

#import "CXMemoryLeaksPluginWindow.h"
#import "CXAssistiveMemoryLeakViewController.h"

@implementation CXMemoryLeaksPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [self navigationController:[[CXAssistiveMemoryLeakViewController alloc] init]];
    }
    return self;
}

@end
