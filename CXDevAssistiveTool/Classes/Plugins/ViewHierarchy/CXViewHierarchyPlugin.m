//
//  CXViewHierarchyPlugin.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/10.
//

#import "CXViewHierarchyPlugin.h"
#import "CXAssitiveWindowFactory.h"
#import "CXAssistiveManager.h"
@implementation CXViewHierarchyPlugin

- (void)pluginDidLoad {
    
    [[CXAssistiveManager sharedManager] showPluginWindow:[CXAssitiveWindowFactory viewHierarchyPluginWindow]];
}

@end
