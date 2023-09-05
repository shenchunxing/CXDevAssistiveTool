//
//  CXAssistiveSettingCell.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/19.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
NS_ASSUME_NONNULL_BEGIN
@class CXAssistiveSettingModel;
@interface CXAssistiveSettingCell : UITableViewCell

- (void)bindSettingModel:(CXAssistiveSettingModel *)model;

@property (nonatomic, strong) RACSubject *switchSignal;
@end

NS_ASSUME_NONNULL_END
