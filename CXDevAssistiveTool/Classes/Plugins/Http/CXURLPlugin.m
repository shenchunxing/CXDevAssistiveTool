//
//  CXURLPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXURLPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"

@implementation CXURLPlugin

- (void)pluginDidLoad {

    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory urlPluginWindow]];
}

@end
