//
//  CXAssistiveMeomryLeakModel.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/18.
//

#import "CXAssistiveMeomryLeakModel.h"

@implementation CXAssistiveMeomryLeakModel

- (NSString *)displayText {

    if (self.isRetainCycle) {
        return [self.retainCycle componentsJoinedByString:@""];
    }
    return [self.viewStack componentsJoinedByString:@" -> "];
}

@end
