//
//  CXScreenShotActionView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import <UIKit/UIKit.h>
#import "CXScreenShotDefine.h"

NS_ASSUME_NONNULL_BEGIN
@class CXScreenShotActionView;
@protocol CXScreenShotActionViewDelegate <NSObject>

@optional
- (void)screenShotActionView:(CXScreenShotActionView *)view didSelectedAction:(CXScreenShotAction)action isSelected:(BOOL)isSelected atPosition:(CGFloat)position;

@end

@interface CXScreenShotActionView : UIView

@property (nonatomic, weak) id<CXScreenShotActionViewDelegate> actionDelegate;

@end

NS_ASSUME_NONNULL_END
