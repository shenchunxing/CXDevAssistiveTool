//
//  CXViewHierarchyPluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/10.
//

#import "CXViewHierarchyPluginWindow.h"
#import "CXViewHierarchyViewController.h"

@implementation CXViewHierarchyPluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.rootViewController = [[CXViewHierarchyViewController alloc] init];
    }
    return self;
}

- (BOOL)cx_canBecomeKeyWindow {
    return NO;
}
@end
