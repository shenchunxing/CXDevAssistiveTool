//
//  CXAssistiveMacro.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/21.
//

#import <Foundation/Foundation.h>
#import "CXAssistiveDefine.h"



@interface CXAssistiveMacro : NSObject

+ (BOOL)debug;
+ (void)debugExecute:(void(^)(void))debugExecute elseExecute:(void(^)(void))elseExecute;

@end

