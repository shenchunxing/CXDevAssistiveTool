//
//  CXNetworkConfig+Initialize.m
//  CXDevAssistiveTool_Example
//
//  Created by 沈春兴 on 2023/9/5.
//  Copyright © 2023 shenchunxing. All rights reserved.
//

#import "CXNetworkConfig+Initialize.h"

@implementation CXNetworkConfig (Initialize)

/// 配置项如服务器地址、端口名
- (void)initConfig {
    self.projectAPIRoot = @"https://www.baidu.com";
    self.system = @"before-inparts-app";
    self.portName = @"inparts/api";
}

@end
