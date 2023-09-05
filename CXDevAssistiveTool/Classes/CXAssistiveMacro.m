//
//  CXAssistiveMacro.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import "CXAssistiveMacro.h"


@implementation CXAssistiveMacro

+ (BOOL)debug {
    
#if DEBUG
    return YES;
#else
    return NO;
#endif
    
}

+ (void)debugExecute:(void(^)(void))debugExecute elseExecute:(void(^)(void))elseExecute {
    
    if ([self debug]) {
        !debugExecute ? : debugExecute();
    }else {
        !elseExecute ? : elseExecute();
    }
}
@end
