//
//  CXViewFrameManager.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/11.
//

#import "CXViewFrameManager.h"
#import "UIView+AssistiveFrames.h"
#import "UIColor+AssistiveColor.h"
#import "CXAssistiveCache.h"

@implementation CXViewFrameManager

+ (instancetype)defaultManager {
    
    static CXViewFrameManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CXViewFrameManager alloc] init];
    });
    return instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        self.enable = [[CXAssistiveCache shareInstance] viewFrameSwitch];
    }
    return self;
}

- (void)setEnable:(BOOL)enable {
    
    _enable = enable;
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        [window as_viewFrameEnable:enable];
    }
}

@end
