//
//  CXViewHierarchyPickerView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/10.
//

#import "CXAssistiveMoveView.h"

NS_ASSUME_NONNULL_BEGIN

@class CXViewHierarchyPickerView;
@protocol CXViewHierarchyPickerViewDelegate <NSObject>

- (void)hierarchyPickerView:(CXViewHierarchyPickerView *)pickerView didPickView:(NSArray<UIView *> *)targetViews;

@end

@interface CXViewHierarchyPickerView : CXAssistiveMoveView

@property (nonatomic, weak) id<CXViewHierarchyPickerViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
