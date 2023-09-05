//
//  CXAssistiveDebuggerView.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import "CXAssistiveDisplayView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXAssistiveDebuggerView : CXAssistiveDisplayView

@property (nonatomic, copy) void(^closeHandler)(void);

@end

NS_ASSUME_NONNULL_END
