//
//  CXAppInfoPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import "CXAppInfoPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"

@implementation CXAppInfoPlugin

- (void)pluginDidLoad {

    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory appInfoPluginWindow]];
}

@end
