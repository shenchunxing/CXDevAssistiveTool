//
//  CXScreenShotWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXScreenShotWindow.h"
#import "CXScreenShotPreviewViewController.h"
#import "CXAssistiveManager.h"

@implementation CXScreenShotWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initial];
    }
    return self;
}

- (void)initial {
    
    if (!self.rootViewController) {
        self.rootViewController = [[CXScreenShotPreviewViewController alloc] init];
    }
}

@end
