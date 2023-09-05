//
//  CXAssistiveLeaksManager.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/16.
//

#import <Foundation/Foundation.h>

@class CXAssistiveMeomryLeakModel;
@interface CXAssistiveLeaksManager : NSObject

/* 是否检测内存泄漏,默认YES */
@property (nonatomic, assign) BOOL enableLeaks;

@property (nonatomic, strong, readonly) NSMutableArray *leakObjects;

+ (instancetype)shareManager;

- (void)addLeakObject:(CXAssistiveMeomryLeakModel *)leakObj;

@end

