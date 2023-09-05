//
//  CXCrashPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/20.
//

#import "CXCrashPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"

@implementation CXCrashPlugin

- (void)pluginDidLoad {
    
    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory crashPluginWindow]];
}

@end
