//
//  CXAssistiveManager.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/25.
//

#import <Foundation/Foundation.h>
#import "CXAssistiveWindow.h"
#import "CXScreenShotWindow.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXAssistiveManager : NSObject

/* 原window */
@property (nonatomic, strong, readonly) UIWindow *originWindow;
/* 辅助window */
@property (nonatomic, strong, readonly) CXAssistiveWindow *assistiveWindow;

+ (instancetype)sharedManager;

- (void)installPlugins;

- (void)showPluginWindow:(CXAssistiveBaseWindow *)window;

- (void)showPluginWindow:(CXAssistiveBaseWindow *)window completion:(void(^_Nullable)(void))completion;

- (void)showHomeWindow;

- (void)showAssistive;

- (void)hideAssistive;




@end

NS_ASSUME_NONNULL_END
