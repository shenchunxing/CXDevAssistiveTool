//
//  CXScreenShotAction.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import <Foundation/Foundation.h>
#import "CXScreenShotDefine.h"
#import "CXScreenShotStyleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CXScreenShotOperation : NSObject

@property (nonatomic, assign) CXScreenShotAction action;
@property (nonatomic, assign) CXScreenShotStyle size;
@property (nonatomic, assign) CXScreenShotStyle color;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

- (instancetype)initWithStyle:(CXScreenShotStyleModel *)styleModel action:(CXScreenShotAction)action;

- (void)drawImageView:(CGRect)rect;

- (CGRect)rectWithPoint:(CGPoint)point otherPoint:(CGPoint)otherPoint;

@end

@interface CXScreenShotDoubleOperation : CXScreenShotOperation

/* 起点 */
@property (nonatomic, strong) NSValue *startValue;
/* 终点 */
@property (nonatomic, strong) NSValue *endValue;

@end

@interface CXScreenShotRectOperation : CXScreenShotDoubleOperation

@end

@interface CXScreenShotRoundOperation : CXScreenShotDoubleOperation

@end

@interface CXScreenShotLineOperation : CXScreenShotDoubleOperation

@end

@interface CXScreenShotDrawOperation : CXScreenShotOperation

/**
 CGPoint value. add operation point.
 */
- (void)addValue:(NSValue *)value;

@end

@interface CXScreenShotTextOperation : CXScreenShotOperation<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;

@end

NS_ASSUME_NONNULL_END
