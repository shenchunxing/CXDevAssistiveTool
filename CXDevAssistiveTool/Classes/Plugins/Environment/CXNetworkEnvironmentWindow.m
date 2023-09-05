//
//  CXNetworkEnvironmentWindow.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/19.
//

#import "CXNetworkEnvironmentWindow.h"
#import "CXNetworkEmvironmentViewController.h"

@implementation CXNetworkEnvironmentWindow

- (instancetype)initWithFrame:(CGRect)frame  {
    
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [self navigationController:[[CXNetworkEmvironmentViewController alloc] init]];
    }
    return self;
}

@end
