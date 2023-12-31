//
//  CXNetworkEnvironmentCell.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXNetworkEnvironmentCell : UITableViewCell
/* <#mark#> */
@property (nonatomic, strong) UIView *containerView;
/* <#mark#> */
@property (nonatomic, strong) UIImageView *iconImg;
/* <#mark#> */
@property (nonatomic, strong) UIImageView *nextImg;
/* <#mark#> */
@property (nonatomic, strong) UILabel *titleLbl;
/* <#mark#> */
@property (nonatomic, strong) UILabel *detailLbl;

+ (CGFloat)heightFoNetworkCell;
@end

NS_ASSUME_NONNULL_END
