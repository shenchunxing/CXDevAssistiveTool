//
//  CXDevAssistiveButton.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXDevAssistiveButton : UIButton

- (instancetype)initWithSize:(CGSize)size image:(UIImage *)image target:(id)target action:(SEL)action;

+ (instancetype)pluginButtonWithSize:(CGSize)size image:(UIImage *)image target:(id)target action:(SEL)action;

-(void)itemShowWithAngle:(CGFloat)angle;
-(void)itemHide;
@end

NS_ASSUME_NONNULL_END
