//
//  CXAssistiveMemoryPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/27.
//

#import "CXAssistiveMemoryPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"
@implementation CXAssistiveMemoryPlugin

- (void)pluginDidLoad {
    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory memoryPluginWindow]];
}
@end
