//
//  CXAppInfoCell.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXAppInfoModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *value;

+ (instancetype)modelWithName:(NSString *)name value:(NSString *)value;

- (NSString  *)infoValue;

@end

@interface CXAssistiveAppInfoCell : UITableViewCell

- (void)renderUIWithModel:(CXAppInfoModel *)model;

@end

NS_ASSUME_NONNULL_END
