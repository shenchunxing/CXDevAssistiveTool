//
//  CXAssistiveFPSPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/27.
//

#import "CXAssistiveFPSPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"
@implementation CXAssistiveFPSPlugin

- (void)pluginDidLoad {
    
    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory fpsPluginWindow]];
}
@end
