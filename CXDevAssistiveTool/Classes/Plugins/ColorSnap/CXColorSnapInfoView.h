//
//  CXColorSnapInfoView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/18.
//

#import "CXAssistiveDisplayView.h"

NS_ASSUME_NONNULL_BEGIN
@class CXColorSnapInfoView;
@protocol CXColorSnapInfoViewDelegate <NSObject>

- (void)colorSnapInfoViewDidClose:(CXColorSnapInfoView *)infoView;

@end

@interface CXColorSnapInfoView : CXAssistiveDisplayView

@property (nonatomic, weak) id<CXColorSnapInfoViewDelegate> delegate;

- (void)updateColor:(NSString *)hexColor atPoint:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
