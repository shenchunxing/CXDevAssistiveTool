//
//  CXAssistiveSettingPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/11.
//

#import "CXAssistiveSettingPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"
@implementation CXAssistiveSettingPlugin

- (void)pluginDidLoad {
    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory settingPluginWindow]];
}

@end
