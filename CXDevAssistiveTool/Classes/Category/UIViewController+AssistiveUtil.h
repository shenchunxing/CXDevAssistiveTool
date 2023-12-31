//
//  UIViewController+AssistiveUtil.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (AssistiveUtil)

- (void)pluginWindowDidClosed;

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;

- (UIViewController *)as_topViewController;

@end

NS_ASSUME_NONNULL_END
