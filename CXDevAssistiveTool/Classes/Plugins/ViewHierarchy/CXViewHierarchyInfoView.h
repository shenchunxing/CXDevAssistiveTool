//
//  CXViewHierarchyInfoView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/10.
//

#import "CXAssistiveDisplayView.h"

NS_ASSUME_NONNULL_BEGIN
@class CXViewHierarchyInfoView;
@protocol CXViewHierarchyInfoViewDelegate <NSObject>

- (void)closeHierarchyInfoView:(CXViewHierarchyInfoView *)infoView;

@end
@interface CXViewHierarchyInfoView : CXAssistiveDisplayView

@property (nonatomic, weak) id<CXViewHierarchyInfoViewDelegate> delegate;

- (void)updateViewInfo:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
