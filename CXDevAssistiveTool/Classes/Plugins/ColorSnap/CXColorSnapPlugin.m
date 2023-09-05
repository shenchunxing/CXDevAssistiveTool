//
//  CXColorSnapPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXColorSnapPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"
@implementation CXColorSnapPlugin

- (void)pluginDidLoad {

    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory colorSnapWindow]];
}

@end
