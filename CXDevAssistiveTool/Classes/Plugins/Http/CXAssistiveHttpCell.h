//
//  CXAssistiveHttpCell.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CXAssistiveHttpModel;
@interface CXAssistiveHttpCell : UITableViewCell

/* host */
@property (nonatomic, strong) UILabel *titleLbl;
/* 地址 */
@property (nonatomic, strong) UILabel *detailLbl;

+ (CGFloat)heightForHttpCell;

- (void)bindHttpModel:(CXAssistiveHttpModel *)model;

@end

NS_ASSUME_NONNULL_END
