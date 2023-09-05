//
//  CXAssistiveSettingPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/11.
//

#import "CXAssistiveSettingPluginWindow.h"

@implementation CXAssistiveSettingPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.rootViewController = [self navigationControllerByClass:NSClassFromString(@"CXAssistiveSettingViewController")];
    }
    return self;
}

@end
