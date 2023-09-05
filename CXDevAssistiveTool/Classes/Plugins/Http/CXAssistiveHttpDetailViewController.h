//
//  CXAssistiveHttpDetailViewController.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/8.
//

#import <UIKit/UIKit.h>
#import "CXAssistiveBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN
@class CXAssistiveHttpModel;
@interface CXAssistiveHttpDetailViewController : CXAssistiveBaseViewController

/* 已读 */
@property (nonatomic, copy) void(^readHttpBlock)(void);

- (instancetype)initWithHttpModel:(CXAssistiveHttpModel *)model;
@end

NS_ASSUME_NONNULL_END
