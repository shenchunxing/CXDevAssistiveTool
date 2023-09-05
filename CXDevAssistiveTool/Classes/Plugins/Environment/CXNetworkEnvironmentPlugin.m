//
//  CXNetworkEnvironmentPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXNetworkEnvironmentPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"

@implementation CXNetworkEnvironmentPlugin

- (void)pluginDidLoad {
    
    [[CXAssistiveManager sharedManager]showPluginWindow:[CXAssitiveWindowFactory networkEnvironmentWindow]];
}

@end
