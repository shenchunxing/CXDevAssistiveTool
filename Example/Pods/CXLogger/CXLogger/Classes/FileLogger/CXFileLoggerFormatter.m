//
//  CXFileLoggerFormatter.m
//  CXLogger
//
//  Created by shenchunxing on 2021/8/21.
//

#import "CXFileLoggerFormatter.h"
#import "CXLoggerMacor.h"

@interface CXFileLoggerFormatter ()
{
    NSDateFormatter *_dateFormatter;
    NSString *_appInfo;
}

@end

@implementation CXFileLoggerFormatter

- (instancetype)init {
    
    if (self = [super init]) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
        _appInfo = [self infoOfApp];
    }
    return self;
}

- (NSString *)infoOfApp {
    
    static NSString *appInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSString *name = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
        NSString *shortVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
        NSString *device = [UIDevice currentDevice].model;
        NSString *system = [NSString stringWithFormat:@"%@ %@",[UIDevice currentDevice].systemName,[UIDevice currentDevice].systemVersion];
        appInfo = [NSString stringWithFormat:@"(%@%@(%@)_%@_%@)", name, shortVersion, version, device, system];
    });
    return appInfo;
}

#pragma mark - DDLogFormatter
- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    
    NSString *logLevel = nil;
    switch (logMessage->_flag) {
            case LOG_FLAG_NOTICE:
                logLevel = @"Notice -> ";
                break;
            case LOG_FLAG_WARN:
                logLevel = @"Warning -> ";
                break;
            case LOG_FLAG_ERROR:
                logLevel = @"Error -> ";
                break;
            default:
                logLevel = @"Info -> ";
                break;
    }
    NSString *dateTime = [_dateFormatter stringFromDate:logMessage->_timestamp];
    long lineNum = logMessage->_line;
    NSString *name = logMessage->_fileName;
    NSString *func = logMessage->_function;
    NSString *logMsg = logMessage->_message;
    
    NSString *log = [NSString stringWithFormat:@"[%@%@]%@ file:%@ func:%@ line:%ld msg:%@\n",logLevel,dateTime,_appInfo,name,func,lineNum,logMsg];
    return log;
}

@end
