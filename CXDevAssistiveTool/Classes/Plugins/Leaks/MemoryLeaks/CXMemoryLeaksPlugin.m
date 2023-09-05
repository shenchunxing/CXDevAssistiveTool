//
//  CXMemoryLeaksPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/20.
//

#import "CXMemoryLeaksPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"

@implementation CXMemoryLeaksPlugin

- (void)pluginDidLoad {
    
    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory leaksPluginWindow]];
}

@end
