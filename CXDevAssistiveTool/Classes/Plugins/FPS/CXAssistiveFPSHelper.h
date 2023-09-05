//
//  CXAssistiveFPSHelper.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FPSBlock)(NSInteger fps);
@interface CXAssistiveFPSHelper : NSObject

- (void)startFPS;
- (void)endFPS;

+ (instancetype)fpsWithBlock:(FPSBlock)block;

@end

NS_ASSUME_NONNULL_END
