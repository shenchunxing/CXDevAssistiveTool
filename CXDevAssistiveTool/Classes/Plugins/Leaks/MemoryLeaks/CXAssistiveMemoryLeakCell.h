//
//  CXAssistiveMemoryLeakCell.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CXAssistiveMeomryLeakModel;
@interface CXAssistiveMemoryLeakCell : UITableViewCell

- (void)bindModel:(CXAssistiveMeomryLeakModel *)model;
@end

NS_ASSUME_NONNULL_END
