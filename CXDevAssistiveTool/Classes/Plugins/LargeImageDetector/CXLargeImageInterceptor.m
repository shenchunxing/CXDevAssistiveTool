//
//  CXLargeImageInterceptor.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import "CXLargeImageInterceptor.h"
#import "CXNetworkInterceptor.h"
#import "CXAssistiveURLUtil.h"

@interface CXLargeImageInterceptor ()<CXNetworkInterceptorDelegate>
{
    dispatch_semaphore_t semaphore;
}
@end

@implementation CXLargeImageInterceptor

+ (instancetype)shareInterceptor {
    
    static CXLargeImageInterceptor *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[CXLargeImageInterceptor alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        self.images = [[NSMutableArray alloc] init];
        self.minimumSize = 200 * 1024;
        self.canIntercept = NO;
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

- (void)addImageModel:(CXLargeImageModel *)imageModel {
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    if (![self.images containsObject:imageModel]) {
        [self.images insertObject:imageModel atIndex:0];
    }
    dispatch_semaphore_signal(semaphore);
}

- (void)removeAllImages {
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    [self.images removeAllObjects];
    dispatch_semaphore_signal(semaphore);
}

#pragma mark - CXNetworkInterceptorDelegate
- (BOOL)shouldInterceptor {
    return _canIntercept;
}

- (void)interceptorDidReceiveData:(NSData *)responseData task:(NSURLSessionDataTask *)task startTime:(NSTimeInterval)startTime {
    
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    if (![response.MIMEType hasPrefix:@"image/"]) {
        return;
    }
    NSInteger byte = [CXAssistiveURLUtil getResponseLength:response data:responseData];
    if (byte < self.minimumSize) {
        return;
    }
    NSURLRequest *request = task.originalRequest?:task.currentRequest;
    CXLargeImageModel *model = [[CXLargeImageModel alloc] init];
    model.url = request.URL;
    model.imageData = responseData;
    model.size = [NSByteCountFormatter stringFromByteCount:byte countStyle: NSByteCountFormatterCountStyleBinary];
    [self addImageModel:model];
}

@end
