//
//  CXAssistiveDefine.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import <Foundation/Foundation.h>

//宏定义
#define weak(object) __weak __typeof(object)weak = object;
#define strong(object) __weak __typeof(object)object = weak;

#define AS_ScreenWidth      [UIScreen mainScreen].bounds.size.width
#define AS_ScreenHeight     [UIScreen mainScreen].bounds.size.height

#define CXMethodNotImplemented() \
@throw [NSException exceptionWithName:NSInternalInconsistencyException \
reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
userInfo:nil]

CF_EXPORT void CXSwizzleInstanceMethod(Class cls, SEL originalSelector, SEL swizzledSelector);

extern NSString *const kAppEnvironmentApiKey;

//常量定义
extern NSString *const kCXAssistiveMemoryLeakKey;
extern NSString *const kCXAssistiveRetainCycleKey;
