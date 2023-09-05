//
//  CXAssisticeDetectionView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXAssistivePoint : NSObject

@property (nonatomic, assign) CGFloat pointX;
@property (nonatomic, assign) CGFloat pointY;

+ (instancetype)pointWithX:(CGFloat)x y:(CGFloat)y;

@end

@interface CXAssisticeDetectionView : UIScrollView

@property (nonatomic, assign) NSInteger numberOfPoints;

- (void)addValue:(NSString *)value atHeight:(CGFloat)pointHeight;

- (void)resetDetectionView;

@end

NS_ASSUME_NONNULL_END
