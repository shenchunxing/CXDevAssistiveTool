//
//  CXColorSnapWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXColorSnapWindow.h"
#import "CXAssistiveColorSnapViewController.h"
@implementation CXColorSnapWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [[CXAssistiveColorSnapViewController alloc] init];
    }
    return self;
}

- (BOOL)cx_canBecomeKeyWindow {
    return NO;
}

@end
