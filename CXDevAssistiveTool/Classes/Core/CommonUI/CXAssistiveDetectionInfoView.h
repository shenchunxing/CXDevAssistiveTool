//
//  CXAssistiveDetectionInfoView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/27.
//

#import "CXAssistiveMoveView.h"
#import "CXAssisticeDetectionView.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^DetectionCloseBlock)(void);
@interface CXAssistiveDetectionInfoView : CXAssistiveMoveView

@property (nonatomic, strong) CXAssisticeDetectionView *detectionView;

@property (nonatomic, copy) DetectionCloseBlock closeBlock;

- (void)setDetectionInfoViewTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
