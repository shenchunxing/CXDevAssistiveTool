//
//  CXAssistiveNetworkManager.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/25.
//

#import "CXAssistiveNetworkManager.h"
#import "CXNetworkInterceptor.h"
@interface CXAssistiveNetworkManager ()<CXNetworkInterceptorDelegate>
{
    dispatch_semaphore_t semaphore;
}
@property (nonatomic, strong, readwrite) NSMutableArray<CXAssistiveHttpModel *> *httpModels;
@end

@implementation CXAssistiveNetworkManager


+ (instancetype)shareManager {
    
    static CXAssistiveNetworkManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[CXAssistiveNetworkManager alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        self.httpModels = [[NSMutableArray alloc] init];
        semaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)setCanIntercept:(BOOL)canIntercept {
    
    _canIntercept = canIntercept;
    if (canIntercept) {
        [[CXNetworkInterceptor shareInterceptor] addInterceptor:self];
    }else {
        [[CXNetworkInterceptor shareInterceptor] removeInterceptor:self];
    }
}

- (void)clearAll {
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    [self.httpModels removeAllObjects];
    dispatch_semaphore_signal(semaphore);
}

#pragma mark - CXNetworkInterceptorDelegate
- (BOOL)shouldInterceptor {
    return _canIntercept;
}

- (void)interceptorDidReceiveData:(NSData *)responseData task:(NSURLSessionDataTask *)task startTime:(NSTimeInterval)startTime {
    
    NSURLRequest *request = task.originalRequest?:task.currentRequest;
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    CXAssistiveHttpModel *model = [CXAssistiveHttpModel httpModelWithResponseData:responseData response:response request:request];
    model.httpIndentifier = @(task.taskIdentifier).stringValue;
    model.startTime = [NSString stringWithFormat:@"%fs",startTime];
    model.totalDuration = [NSString stringWithFormat:@"%fs",[[NSDate date] timeIntervalSince1970] - startTime];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    [self.httpModels insertObject:model atIndex:0];
    dispatch_semaphore_signal(semaphore);
}



@end
