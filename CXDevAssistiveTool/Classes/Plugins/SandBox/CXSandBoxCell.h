//
//  CXSandBoxCell.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CXSandBoxModel;
@interface CXSandBoxCell : UITableViewCell
+ (CGFloat)heightForCell;
- (void)renderUIWithModel:(CXSandBoxModel *)model;
@end

NS_ASSUME_NONNULL_END
