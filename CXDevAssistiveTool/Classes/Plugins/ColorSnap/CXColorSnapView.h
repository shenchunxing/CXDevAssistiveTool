//
//  CXAssistiveColorSnapView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/18.
//

#import <UIKit/UIKit.h>
#import "CXAssistiveMoveView.h"
NS_ASSUME_NONNULL_BEGIN

@class CXColorSnapView;
@protocol CXAssistiveColorSnapViewDelegate <NSObject>

- (void)colorSnapView:(CXColorSnapView *)colorSnapView colorHex:(NSString *)colorHex atPosition:(CGPoint)point;

@end

@interface CXColorSnapView : CXAssistiveMoveView

@property (nonatomic, weak) id<CXAssistiveColorSnapViewDelegate> delegate;

- (void)pointInSuperView:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
