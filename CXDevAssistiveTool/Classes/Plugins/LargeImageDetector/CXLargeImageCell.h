//
//  CXLargeImageCell.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CXLargeImageModel;
@interface CXLargeImageCell : UITableViewCell

+ (CGFloat)largeImageCellHeight;

- (void)renderUIWithModel:(CXLargeImageModel *)model;
@end

NS_ASSUME_NONNULL_END
