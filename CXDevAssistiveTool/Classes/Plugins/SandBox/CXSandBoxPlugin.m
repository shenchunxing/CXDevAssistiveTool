//
//  CXSandBoxPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/8.
//

#import "CXSandBoxPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"

@implementation CXSandBoxPlugin

- (void)pluginDidLoad {
    
    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory sandBoxPluginWindow]];
}

@end
