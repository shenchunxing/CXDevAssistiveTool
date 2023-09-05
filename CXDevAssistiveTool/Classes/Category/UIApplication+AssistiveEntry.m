//
//  UIApplication+AssistiveEntry.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/25.
//

#import "UIApplication+AssistiveEntry.h"
#import "CXAssistiveDefine.h"
#import "CXAssistiveManager.h"

@implementation UIApplication (AssistiveEntry)
#if DEBUG
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CXSwizzleInstanceMethod([self class], @selector(motionBegan:withEvent:), @selector(CX_at_entry_motionBegan:withEvent:));
    });
}

- (void)CX_at_entry_motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    [self CX_at_entry_motionBegan:motion withEvent:event];
    if ([CXAssistiveManager sharedManager].assistiveWindow.hidden) {
        [[CXAssistiveManager sharedManager] showAssistive];
    }else {
        [[CXAssistiveManager sharedManager] hideAssistive];
    }
}
#endif
@end
