//
//  CXAssistiveTouch.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import <UIKit/UIKit.h>

@class RACSubject,CXDevAssistiveItem;

static CGFloat kAssistiveTouchW = 40.0;
@interface CXAssistiveTouch : UIView

/* 点击信号 */
@property (nonatomic, strong) RACSubject *tapSubject;
@property (nonatomic, strong) RACSubject *longPressSubject;

/* 左侧 */
@property (nonatomic, assign) BOOL isLocationAtLeftSide;
/* 是否展开 */
@property (nonatomic, assign) BOOL isShow;

- (instancetype)initWithPluginItems:(NSArray<CXDevAssistiveItem *> *)pluginItems;

- (void)showItems;
- (void)hideItems;

@end


