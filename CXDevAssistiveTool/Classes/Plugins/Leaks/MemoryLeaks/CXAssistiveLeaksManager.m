//
//  CXAssistiveLeaksManager.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/16.
//

#import "CXAssistiveLeaksManager.h"
#import "CXAssistiveMeomryLeakModel.h"
#import "CXAssistiveMacro.h"

@interface CXAssistiveLeaksManager ()
/* 内存泄漏对象 */
@property (nonatomic, strong, readwrite) NSMutableArray *leakObjects;
@end
@implementation CXAssistiveLeaksManager

+ (instancetype)shareManager {

    static CXAssistiveLeaksManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[CXAssistiveLeaksManager alloc] init];
        _instance.leakObjects = [[NSMutableArray alloc] init];
    });
    return _instance;
}

- (void)addLeakObject:(CXAssistiveMeomryLeakModel *)leakObj {
    [self.leakObjects addObject:leakObj];
}

@end

