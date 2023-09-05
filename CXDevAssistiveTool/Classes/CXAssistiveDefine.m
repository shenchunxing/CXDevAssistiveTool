//
//  CXAssistiveDefine.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import "CXAssistiveDefine.h"
#import <objc/runtime.h>

void CXSwizzleInstanceMethod(Class cls, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

NSString *const kAppEnvironmentApiKey = @"kAppEnvironmentApiKey";

NSString *const kCXAssistiveMemoryLeakKey = @"MemoryLeak";
NSString *const kCXAssistiveRetainCycleKey = @"RetainCycle";
