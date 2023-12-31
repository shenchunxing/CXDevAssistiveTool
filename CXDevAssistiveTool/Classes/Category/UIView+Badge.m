//
//  UIView+Badge.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/2.
//

#import "UIView+Badge.h"
#import <objc/runtime.h>
#import "CAAnimation+BadgeAnimation.h"
#import "UIColor+AssistiveColor.h"

static const NSInteger kCXBadgeMaximumBadgeNumber = 99;
static const CGFloat kCXBadgeDefaultRedDotRadius = 4.f;

static NSString *const  Animation_breathe = @"breathe";
static NSString *const  Animation_scale   = @"scale";
static NSString *const  Animation_shake   = @"shake";
static NSString *const  Animation_rotate  = @"rotate";
static NSString *const  Animation_bounce  = @"bounce";

@implementation UIView (Badge)

#pragma mark - public
- (void)CX_showDotBadge {
    [self showRedDotBadge];
}

- (void)CX_showDotBadgeWithAnimTyoe:(CXBadgeAnimType)animType {
    
    self.animType = animType;
    [self showRedDotBadge];
    if (animType != CXBadgeAnimTypeNone) {
        [self beginBadgeAnimation];
    }
}

- (void)CX_showNumberBadgeWithValue:(NSInteger)value {
    
    if (value < 0) {
        return;
    }
    [self badgeInit];
    self.badge.hidden = (value == 0);
    self.badge.tag = CXBadgeStyleNumber;
    self.badge.font = self.badgeFont;
    self.badge.text = (value > self.badgeMaximumBadgeNumber)?[NSString stringWithFormat:@"%@+",@(self.badgeMaximumBadgeNumber)]:[NSString stringWithFormat:@"%@",@(value)];
    [self adjustLabelWidth:self.badge];
    CGRect frame = self.badge.frame;
    frame.size.width += 4;
    frame.size.height += 4;
    if (CGRectGetWidth(frame) < CGRectGetHeight(frame)) {
        frame.size.width = CGRectGetHeight(frame);
    }
    self.badge.frame = frame;
    self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + self.badgeCenterOffset.x, self.badgeCenterOffset.y);
    self.badge.layer.cornerRadius = CGRectGetHeight(self.badge.frame) / 2;
}

- (void)CX_showNumberBadgeWithValue:(NSInteger)value animType:(CXBadgeAnimType)animType {
    
    self.animType = animType;
    [self CX_showNumberBadgeWithValue:value];
    if (animType != CXBadgeAnimTypeNone) {
        [self beginBadgeAnimation];
    }
}

- (void)CX_showNewBadge {
    [self showNewBadge];
}

- (void)CX_showNewBadgeWithAnimType:(CXBadgeAnimType)animType {
    
    self.animType = animType;
    [self showNewBadge];
    if (animType != CXBadgeAnimTypeNone) {
        [self  beginBadgeAnimation];
    }
}

#pragma mark - private
- (void)showRedDotBadge {
    
    [self badgeInit];
    if (self.badge.tag != CXBadgeStyleDot) {
        self.badge.text = @"";
        self.badge.tag = CXBadgeStyleDot;
        [self resetBadgeForRedDot];
        self.badge.layer.cornerRadius = CGRectGetWidth(self.badge.frame) / 2;
    }
    self.badge.hidden = NO;
}

- (void)resetBadgeForRedDot {
    
    if (self.badgeRadius > 0) {
        self.badge.frame = CGRectMake(self.badge.center.x - self.badgeRadius, self.badge.center.y + self.badgeRadius, self.badgeRadius*2, self.badgeRadius*2);
    }
}

- (void)showNewBadge  {
    
    [self badgeInit];
    if (self.badge.tag != CXBadgeStyleNew) {
        self.badge.text = @"new";
        self.badge.tag = CXBadgeStyleNew;
        CGRect frame = self.badge.frame;
        frame.size.width = 22;
        frame.size.height = 13;
        self.badge.frame = frame;
        
        self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + self.badgeCenterOffset.x, self.badgeCenterOffset.y);
        self.badge.font = [UIFont systemFontOfSize:9.0];
        self.badge.layer.cornerRadius = CGRectGetHeight(self.badge.frame) / 2;
    }
}

- (void)badgeInit {
    
    if (self.badgeBgColor == nil) {
        self.badgeBgColor = [UIColor as_redColor];
    }
    if (self.badgeTextColor == nil) {
        self.badgeTextColor = [UIColor whiteColor];
    }
    if (self.badge == nil) {
        CGFloat redDotWidth = kCXBadgeDefaultRedDotRadius * 2;
        CGRect frame = CGRectMake(CGRectGetWidth(self.frame)-kCXBadgeDefaultRedDotRadius, -kCXBadgeDefaultRedDotRadius, redDotWidth, redDotWidth);
        self.badge = [[UILabel alloc] initWithFrame:frame];
        self.badge.textAlignment = NSTextAlignmentCenter;
        self.badge.textColor = self.badgeTextColor;
        self.badge.backgroundColor = self.badgeBgColor;
        self.badge.text = @"";
        
        //默认红点标记
        self.badge.tag = CXBadgeStyleDot;
        self.badge.layer.cornerRadius = kCXBadgeDefaultRedDotRadius;
        self.badge.layer.masksToBounds = YES;
        self.badge.hidden = NO;
        [self addSubview:self.badge];
        [self bringSubviewToFront:self.badge];
    }
}

//TODO:label的宽度适应内容变化
- (void)adjustLabelWidth:(UILabel *)label {
    
    [label setNumberOfLines:0];
    NSString *string = label.text;
    UIFont *font = label.font;
    CGSize size = CGSizeMake(320, 2000);
    CGSize labelSize;
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    labelSize = [string boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil].size;
    CGRect frame = label.frame;
    frame.size = CGSizeMake(ceilf(labelSize.width), ceilf(labelSize.height));
    [label setFrame:frame];
}

- (void)beginBadgeAnimation {
    
    switch (self.animType) {
        case CXBadgeAnimTypeNone:
            
            break;
        case CXBadgeAnimTypeScale:
            [self.badge.layer addAnimation:[CAAnimation scale_Animation:1.4 toScale:0.6 durTime:1 rep:MAXFLOAT] forKey:Animation_scale];
            break;
        case CXBadgeAnimTypeShake:
            [self.badge.layer addAnimation:[CAAnimation shake_AnimationRepratTimes:MAXFLOAT durTime:1.5 forObj:self.badge.layer] forKey:Animation_shake];
            break;
        case CXBadgeAnimTypeBounce:
            [self.badge.layer addAnimation:[CAAnimation bounce_AnimationRepratTimes:MAXFLOAT durTime:1.5 forObj:self.badge.layer] forKey:Animation_bounce];
            break;
        case CXBadgeAnimTypeBreathe:
            [self.badge.layer addAnimation:[CAAnimation breatheForever_Animation:1.4] forKey:Animation_breathe];
            break;
        default:
            break;
    }
}

//TODO:移除动画
- (void)removeBadgeAnimation {
    if(self.badge){
        [self.badge.layer removeAllAnimations];
    }
}

- (void)CX_removeBadge {
    
    if (self.badge) {
        [self.badge removeFromSuperview];
    }
}

#pragma mark - setter / getter
- (void)setBadge:(UILabel *)badge {
    objc_setAssociatedObject(self, @selector(badge), badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UILabel *)badge {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBadgeFont:(UIFont *)badgeFont {
    objc_setAssociatedObject(self, @selector(badgeFont), badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge == nil) {
        [self badgeInit];
    }
    self.badge.font = badgeFont;
}

- (UIFont *)badgeFont {
    
    UIFont *font = objc_getAssociatedObject(self, _cmd);
    return font == nil ? [UIFont systemFontOfSize:9.0] : font;
}

- (void)setBadgeBgColor:(UIColor *)badgeBgColor {
    objc_setAssociatedObject(self, @selector(badgeBgColor), badgeBgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge == nil) {
        [self badgeInit];
    }
    self.badge.backgroundColor = badgeBgColor;
}

- (UIColor *)badgeBgColor {
  return  objc_getAssociatedObject(self, _cmd);
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor {
    objc_setAssociatedObject(self, @selector(badgeTextColor), badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge == nil) {
        [self badgeInit];
    }
    self.badge.textColor = badgeTextColor;
}

- (UIColor *)badgeTextColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAnimType:(CXBadgeAnimType)animType {
    
    NSNumber *numObj = @(animType);
    objc_setAssociatedObject(self, @selector(animType), numObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(!self.badge){
        [self badgeInit];
    }
    [self removeBadgeAnimation];
    [self beginBadgeAnimation];
}

- (CXBadgeAnimType)animType {
    
    id obj = objc_getAssociatedObject(self, _cmd);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]]){
        return [obj integerValue];
    }
    return CXBadgeAnimTypeNone;
}

- (void)setBadgeFrame:(CGRect)badgeFrame {
    
    NSDictionary *frameInfo = @{@"x" : @(badgeFrame.origin.x), @"y" : @(badgeFrame.origin.y),
                                @"width" : @(badgeFrame.size.width), @"height" : @(badgeFrame.size.height)};
    objc_setAssociatedObject(self, @selector(badgeFrame), frameInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.frame = badgeFrame;
}

- (CGRect)badgeFrame {
    
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj != nil && [obj isKindOfClass:[NSDictionary class]] && [obj count] == 4) {
        CGFloat x = [obj[@"x"] floatValue];
        CGFloat y = [obj[@"y"] floatValue];
        CGFloat width = [obj[@"width"] floatValue];
        CGFloat height = [obj[@"height"] floatValue];
        return  CGRectMake(x, y, width, height);
    }
    return CGRectZero;
}

- (void)setBadgeCenterOffset:(CGPoint)badgeCenterOffset {
    
    NSDictionary *cenerInfo = @{@"x" : @(badgeCenterOffset.x), @"y" : @(badgeCenterOffset.y)};
    objc_setAssociatedObject(self, @selector(badgeCenterOffset), cenerInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + badgeCenterOffset.x, badgeCenterOffset.y);
}

- (CGPoint)badgeCenterOffset {
    
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj != nil && [obj isKindOfClass:[NSDictionary class]] && [obj count] == 2) {
        CGFloat x = [obj[@"x"] floatValue];
        CGFloat y = [obj[@"y"] floatValue];
        return CGPointMake(x, y);
    }
    return CGPointZero;
}

- (void)setBadgeRadius:(CGFloat)badgeRadius {
    
    objc_setAssociatedObject(self, @selector(badgeRadius), @(badgeRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (!self.badge) {
        [self badgeInit];
    }
}

- (CGFloat)badgeRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setBadgeMaximumBadgeNumber:(NSInteger)badgeMaximumBadgeNumber {
    
    objc_setAssociatedObject(self, @selector(badgeMaximumBadgeNumber), @(badgeMaximumBadgeNumber), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (!self.badge) {
        [self badgeInit];
    }
}

- (NSInteger)badgeMaximumBadgeNumber {
    
    id obj = objc_getAssociatedObject(self, _cmd);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]]){
        return [obj integerValue];
    }
    return kCXBadgeMaximumBadgeNumber;
}

@end
