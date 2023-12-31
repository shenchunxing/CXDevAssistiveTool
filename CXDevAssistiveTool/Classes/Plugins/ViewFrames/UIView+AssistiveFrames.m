//
//  UIView+AssistiveFrames.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/11.
//

#import "UIView+AssistiveFrames.h"
#import <objc/runtime.h>
#import "CXAssistiveDefine.h"
#import "UIColor+AssistiveColor.h"
#import "CXViewFrameManager.h"
#import "UIView+AssistiveUtils.h"

@interface UIView ()

@property (nonatomic, strong) CALayer *frameLayer;

@end

@implementation UIView (AssistiveFrames)

#if DEBUG
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CXSwizzleInstanceMethod([self class], @selector(layoutSubviews), @selector(as_layoutSubViews));
    });
}
#endif

- (void)as_layoutSubViews {
    
    [self as_layoutSubViews];
    [self as_viewFrameEnable:[CXViewFrameManager defaultManager].enable];
}

- (void)as_viewFrameEnable:(BOOL)enable {
    
    UIWindow *statusBarWindow = [[UIApplication sharedApplication] valueForKey:@"_statusBarWindow"];
    if (statusBarWindow && [self isDescendantOfView:statusBarWindow]) {
        return;
    }
    for (UIView *subView in self.subviews) {
        [subView as_viewFrameEnable:enable];
    }
    if (enable) {
        if (!self.frameLayer) {
            self.frameLayer = [[CALayer alloc] init];
            self.frameLayer.borderWidth = 1.0;
            self.frameLayer.borderColor = self.as_hashColor.CGColor;
            [self.layer addSublayer:self.frameLayer];
        }
        self.frameLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.frameLayer.hidden = NO;
    }else {
        if (self.frameLayer) {
            self.frameLayer.hidden = YES;
            [self.frameLayer removeFromSuperlayer];
            self.frameLayer = nil;
        }
    }
}

- (void)setFrameLayer:(CALayer *)frameLayer {
    
    objc_setAssociatedObject(self, @selector(frameLayer), frameLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CALayer *)frameLayer {
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
