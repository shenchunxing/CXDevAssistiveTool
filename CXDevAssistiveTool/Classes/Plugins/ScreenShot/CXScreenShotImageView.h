//
//  CXScreenShotImageView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/11.
//

#import <UIKit/UIKit.h>
#import "CXScreenShotOperation.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXScreenShotImageView : UIView

@property (nonatomic, strong) UIImage *shotImage;

@property (nonatomic, strong, nullable) CXScreenShotOperation *currentOperation;

@property (nonatomic, assign) CXScreenShotAction currentAction;

@property (nonatomic, strong) CXScreenShotStyleModel *styleModel;

- (void)removeLastOperation;
@end

NS_ASSUME_NONNULL_END
