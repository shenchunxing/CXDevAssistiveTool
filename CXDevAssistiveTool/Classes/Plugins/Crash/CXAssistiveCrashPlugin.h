//
//  CXAssistiveCrashPlugin.h
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CXAssistiveCrashSituationLevel) {
    CXAssistiveCrashSituationLevelSimple,
    CXAssistiveCrashSituationLevelMedium,
    CXAssistiveCrashSituationLevelDifficult
};

extern NSString *const kAssitiveCrashSignalException;
extern NSString *const kAssitiveCrashException;

@interface CXAssistiveCrashPlugin : NSObject

+ (instancetype)sharedPlugin;

- (void)install;

- (void)saveSignal:(int)signal;
- (void)saveException:(NSException*)exception;

/**
 crash日志总表

 @return 日志key
 */
- (NSArray* )crashPlist;

/**
 所有crash日志

 @return 日志
 */
- (NSArray* )crashLogs;

/* 读取对应key的crash log */
- (NSDictionary* )crashForKey:(NSString *)key;
/* 替换对应key的crash log */
- (void)replaceCrashLogToFileByKey:(NSString *)key withDict:(NSDictionary *)dict;
/* 删除某key对应的crash */
- (void)deleteCrashLogFromDateKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
