//
//  CXDevAssistiveFactory.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/10/11.
//

#import "CXDevAssistiveFactory.h"
#import "CXNetworkEnvironmentPlugin.h"
#import "CXURLPlugin.h"
#import "CXAppInfoPlugin.h"
#import "CXCrashPlugin.h"
#import "CXLoggerPlugin.h"
#import "CXMemoryLeaksPlugin.h"
#import "CXAssistiveFPSPlugin.h"
#import "CXAssistiveCPUPlugin.h"
#import "CXAssistiveMemoryPlugin.h"
#import "CXColorSnapPlugin.h"
#import "CXLargeImagePlugin.h"
#import "CXSandBoxPlugin.h"
#import "CXAssistiveDebuggerPlugin.h"
#import "CXViewHierarchyPlugin.h"
#import "CXScreenShotPlugin.h"
#import "CXAssistiveSettingPlugin.h"

@implementation CXDevAssistiveFactory

+ (NSMutableArray<CXAssistiveFunctionViewModel *> *)homeFunctions {
    
    NSMutableArray *funtions = [[NSMutableArray alloc] init];
    [funtions addObject:[self commonlyUsedFunctions]];
    [funtions addObject:[self performanceDetectionFunctions]];
    [funtions addObject:[self visualSenseFunctions]];
    return funtions;
}

+ (NSArray<CXDevAssistiveItem *> *)pluginItems {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    //截图
    CXDevAssistiveItem *screenshotItem = [CXDevAssistiveItem pluginItemWithImageName:@"icon_button_screenshot"];
    screenshotItem.plugin = [[CXScreenShotPlugin alloc] init];
    [items addObject:screenshotItem];
    
    //环境切换
    CXDevAssistiveItem *switcherItem = [CXDevAssistiveItem pluginItemWithImageName:@"icon_button_switcher"];
    switcherItem.plugin = [[CXNetworkEnvironmentPlugin alloc] init];
    [items addObject:switcherItem];
    
    //网络
    CXDevAssistiveItem *networkItem = [CXDevAssistiveItem pluginItemWithImageName:@"icon_button_network"];
    networkItem.plugin = [[CXURLPlugin alloc] init];
    [items addObject:networkItem];
    
    //定位当前视图VC
    CXDevAssistiveItem *findVCItem = [CXDevAssistiveItem pluginItemWithImageName:@"icon_button_findVC"];
    findVCItem.plugin = [[CXAssistiveDebuggerPlugin alloc] init];
    [items addObject:findVCItem];
    
    //设置
    CXDevAssistiveItem *settingItem = [CXDevAssistiveItem pluginItemWithImageName:@"icon_button_setting"];
    settingItem.plugin = [[CXAssistiveSettingPlugin alloc] init];
    [items addObject:settingItem];
    return items.copy;
}

+ (CXAssistiveFunctionViewModel *)commonlyUsedFunctions {
    
    CXAssistiveFunctionModel *switcher = [CXAssistiveFunctionModel functionModelWithName:@"环境切换" imageName:@"icon_home_switcher" des:@"App内环境地址切换"];
    switcher.plugin = [[CXNetworkEnvironmentPlugin alloc] init];
    
    CXAssistiveFunctionModel *http = [CXAssistiveFunctionModel functionModelWithName:@"网络监测" imageName:@"icon_home_http" des:@"监测网络请求"];
    http.plugin = [[CXURLPlugin alloc] init];
    
    CXAssistiveFunctionModel *logger = [CXAssistiveFunctionModel functionModelWithName:@"用户日志" imageName:@"icon_home_logger" des:@"调试日志记录"];
    logger.plugin = [[CXLoggerPlugin alloc] init];
    
    CXAssistiveFunctionModel *crash = [CXAssistiveFunctionModel functionModelWithName:@"崩溃记录" imageName:@"icon_home_crash" des:@"崩溃日志记录"];
    crash.plugin = [[CXCrashPlugin alloc] init];
    
    CXAssistiveFunctionModel *appInfo = [CXAssistiveFunctionModel functionModelWithName:@"app信息" imageName:@"icon_home_appinfo" des:@""];
    appInfo.plugin = [[CXAppInfoPlugin alloc] init];
    
    CXAssistiveFunctionModel *sandBox = [CXAssistiveFunctionModel functionModelWithName:@"沙盒浏览" imageName:@"icon_home_sandbox" des:@""];
    sandBox.plugin = [[CXSandBoxPlugin alloc] init];
    
    CXAssistiveFunctionViewModel *viewModel = [CXAssistiveFunctionViewModel viewModelWithTitle:@"常用功能" models:@[switcher,http,logger,crash,appInfo,sandBox]];
    return viewModel;
}

+ (CXAssistiveFunctionViewModel *)performanceDetectionFunctions {
    
    CXAssistiveFunctionModel *performance = [CXAssistiveFunctionModel functionModelWithName:@"帧率检测" imageName:@"icon_home_ framerate" des:@""];
    performance.plugin = [[CXAssistiveFPSPlugin alloc] init];
    
    CXAssistiveFunctionModel *cpu = [CXAssistiveFunctionModel functionModelWithName:@"cpu检测" imageName:@"icon_home_cpu" des:@""];
    cpu.plugin = [[CXAssistiveCPUPlugin alloc] init];
    
    CXAssistiveFunctionModel *memory = [CXAssistiveFunctionModel functionModelWithName:@"内存检测" imageName:@"icon_home_memory" des:@""];
    memory.plugin = [[CXAssistiveMemoryPlugin alloc] init];
    
    CXAssistiveFunctionModel *leak = [CXAssistiveFunctionModel functionModelWithName:@"泄漏检测" imageName:@"icon_home_leak" des:@""];
    leak.plugin = [[CXMemoryLeaksPlugin alloc] init];
    
    CXAssistiveFunctionModel *datu = [CXAssistiveFunctionModel functionModelWithName:@"大图检测" imageName:@"icon_home_datu" des:@""];
    datu.plugin = [[CXLargeImagePlugin alloc] init];
    
    CXAssistiveFunctionViewModel *viewModel = [CXAssistiveFunctionViewModel viewModelWithTitle:@"性能检测" models:@[performance,cpu,memory,leak,datu]];
    return viewModel;
}

+ (CXAssistiveFunctionViewModel *)visualSenseFunctions {
    
    CXAssistiveFunctionModel *color = [CXAssistiveFunctionModel functionModelWithName:@"拾色器" imageName:@"icon_home_colorsucker" des:@""];
    color.plugin = [[CXColorSnapPlugin alloc] init];
    
    CXAssistiveFunctionModel *hierarchy = [CXAssistiveFunctionModel functionModelWithName:@"视图层级" imageName:@"icon_home_hierarchy" des:@""];
    hierarchy.plugin = [[CXViewHierarchyPlugin alloc] init];
    
    CXAssistiveFunctionModel *locationView = [CXAssistiveFunctionModel functionModelWithName:@"视图定位" imageName:@"icon_home_findVC" des:@""];
    locationView.plugin = [[CXAssistiveDebuggerPlugin alloc] init];
    
    CXAssistiveFunctionViewModel *viewModel = [CXAssistiveFunctionViewModel viewModelWithTitle:@"视图工具" models:@[color,hierarchy,locationView]];
    return viewModel;
}


@end
