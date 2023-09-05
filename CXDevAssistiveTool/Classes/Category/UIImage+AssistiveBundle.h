//
//  UIImage+AssistiveBundle.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (AssistiveBundle)
+ (UIImage *)as_imageWithName:(NSString *)imageName;

/**
 获取图片某一位置上的hex值

 @param point 位置
 @return hex色值
 */
- (NSString *)as_hexColorAt:(CGPoint)point;
@end

NS_ASSUME_NONNULL_END
