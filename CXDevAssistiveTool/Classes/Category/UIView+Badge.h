//
//  UIView+Badge.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/2.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CXBadgeStyle) {
    CXBadgeStyleDot,        //红点标记
    CXBadgeStyleNumber,     //数值
    CXBadgeStyleNew,        //new
};

typedef NS_ENUM(NSUInteger, CXBadgeAnimType) {
    CXBadgeAnimTypeNone,        //无动画
    CXBadgeAnimTypeScale,       //缩放动画
    CXBadgeAnimTypeShake,       //摇动动画
    CXBadgeAnimTypeBounce,      //反弹动画
    CXBadgeAnimTypeBreathe      //呼吸动画
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Badge)

//标记
@property (nonatomic, strong) UILabel *badge;
//标记字体大小
@property (nonatomic, strong) UIFont *badgeFont;
//标记背景色
@property (nonatomic, strong) UIColor *badgeBgColor;
//标记文本颜色
@property (nonatomic, strong) UIColor *badgeTextColor;
//badge 位置
@property (nonatomic, assign) CGRect badgeFrame;
//badge 中心位置
@property (nonatomic, assign) CGPoint badgeCenterOffset;
//动画
@property (nonatomic, assign) CXBadgeAnimType animType;
//最大显示数字
@property (nonatomic, assign) NSInteger badgeMaximumBadgeNumber;
//red dot 圆角大小
@property (nonatomic, assign) CGFloat badgeRadius;

- (void)CX_showDotBadge;
- (void)CX_showDotBadgeWithAnimTyoe:(CXBadgeAnimType)animType;

- (void)CX_showNumberBadgeWithValue:(NSInteger)value;
- (void)CX_showNumberBadgeWithValue:(NSInteger)value animType:(CXBadgeAnimType)animType;

- (void)CX_showNewBadge;
- (void)CX_showNewBadgeWithAnimType:(CXBadgeAnimType)animType;

- (void)CX_removeBadge;
@end

NS_ASSUME_NONNULL_END
