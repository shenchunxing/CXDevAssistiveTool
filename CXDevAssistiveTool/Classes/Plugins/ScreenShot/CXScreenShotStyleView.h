//
//  CXScreenShotStyleView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CXScreenShotStyleModel;
@interface CXScreenShotStyleView : UIView


- (CXScreenShotStyleModel *)currentStyleModel;

- (void)resetStyleView;

@end

NS_ASSUME_NONNULL_END
