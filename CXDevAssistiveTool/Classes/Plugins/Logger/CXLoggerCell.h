//
//  CXLoggerCell.h
//  CXLogger
//
//  Created by shenchunxing on 2021/8/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXLoggerCell : UITableViewCell
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UIImageView *nextImgView;
@end

NS_ASSUME_NONNULL_END
