//
//  CXAssistiveFunctionCell.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CXAssistiveFunctionViewModel;
@interface CXAssistiveFunctionCell : UITableViewCell

- (void)bindFunctionModel:(CXAssistiveFunctionViewModel *)model;

+ (CGFloat)heightForCell:(CXAssistiveFunctionViewModel *)model;
@end

NS_ASSUME_NONNULL_END
