//
//  UIWindow+AssistiveEntry.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (AssistiveEntry)

/**
 Current visiable viewController.
 
 @return UIViewController.
 */
- (UIViewController *)cx_currentShowingViewController;

@end

NS_ASSUME_NONNULL_END
