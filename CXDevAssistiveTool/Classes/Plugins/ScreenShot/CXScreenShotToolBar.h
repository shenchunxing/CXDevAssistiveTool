//
//  CXScreenShotToolBar.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/10.
//

#import <UIKit/UIKit.h>
#import "CXScreenShotDefine.h"
#import "CXScreenShotStyleModel.h"

NS_ASSUME_NONNULL_BEGIN
@class CXScreenShotToolBar;
@protocol CXScreenShotToolBarDelegate <NSObject>


- (void)screenShotToolBar:(CXScreenShotToolBar *)bar didSeletAction:(CXScreenShotAction)action styleModel:(CXScreenShotStyleModel *)styleModel;


@end

@interface CXScreenShotToolBar : UIView

@property (nonatomic, weak) id<CXScreenShotToolBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
