//
//  CXLoggerPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/20.
//

#import "CXLoggerPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"
@implementation CXLoggerPlugin

- (void)pluginDidLoad {

    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory loggerPluginWindow]];
}

@end
