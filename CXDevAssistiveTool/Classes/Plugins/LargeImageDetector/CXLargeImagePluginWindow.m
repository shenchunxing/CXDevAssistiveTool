//
//  CXLargeImagePluginWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import "CXLargeImagePluginWindow.h"
#import "CXLargeImageViewController.h"
@implementation CXLargeImagePluginWindow

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [self navigationController:[[CXLargeImageViewController alloc] init]];
    }
    return self;
}


@end
