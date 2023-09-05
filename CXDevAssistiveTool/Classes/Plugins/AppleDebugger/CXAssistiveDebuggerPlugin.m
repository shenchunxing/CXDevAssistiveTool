//
//  CXAssistiveDebuggerPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import "CXAssistiveDebuggerPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"
@implementation CXAssistiveDebuggerPlugin

- (void)pluginDidLoad {
    
    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory debuggerPluginWindow]];
}
@end
