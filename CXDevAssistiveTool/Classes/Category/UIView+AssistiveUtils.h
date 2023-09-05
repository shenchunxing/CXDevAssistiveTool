//
//  UIView+AssistiveUtils.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AssistiveUtils)

- (CGFloat)as_width;

- (CGFloat)as_height;

- (CGFloat)as_right;

- (CGFloat)as_left;

- (CGFloat)as_top;

- (CGFloat)as_bottom;

- (UIImage *)as_convertViewToImage;

- (UIColor *)as_hashColor;

@end

NS_ASSUME_NONNULL_END
