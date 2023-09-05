//
//  CXLargeImagePlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import "CXLargeImagePlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"

@implementation CXLargeImagePlugin

- (void)pluginDidLoad {

    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory largeImagePluginWindow]];
}

@end
