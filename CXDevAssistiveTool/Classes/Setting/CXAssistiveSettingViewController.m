//
//  CXAssistiveSettingViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/19.
//

#import "CXAssistiveSettingViewController.h"
#import <Masonry/Masonry.h>
#import "CXAssistiveMacro.h"
#import "CXAssistiveSettingCell.h"
#import "CXAssistiveSettingModel.h"
#import "CXAssistiveLeaksManager.h"
#import "CXAssistiveCache.h"
#import "CXLargeImageInterceptor.h"
#import "CXViewFrameManager.h"
#import "UIViewController+AssistiveUtil.h"
#import <CXLogger/CXLogger.h>

@interface CXAssistiveSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *settings;

@end

@implementation CXAssistiveSettingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [self setupSettings];
    [self as_setNavigationBarTitle:@"设置"];
    [self as_setLeftBarItemTitle:@"关闭"];
}

- (void)as_viewControllerDidTriggerLeftClick:(UIViewController *)viewController {
    
    [self pluginWindowDidClosed];
}

- (void)setupSettings {
    
    CXAssistiveSettingModel *leakModel = [CXAssistiveSettingModel settingModelWithTitle:@"是否开启内存检测" detail:@"默认关闭；开启内存检测，若出现内存泄漏，会弹框提示，同时记录泄漏信息，在【泄漏检测】可查看。"];
    leakModel.isOn = [[CXAssistiveCache shareInstance] leakDetectionSwitch];
    [leakModel.switchSignal subscribeNext:^(id  _Nullable x) {
        [CXAssistiveLeaksManager shareManager].enableLeaks = [x boolValue];
        [[CXAssistiveCache shareInstance] saveLeakDetectionSwitch:[x boolValue]];
    }];
    
    CXAssistiveSettingModel *largeImageModel = [CXAssistiveSettingModel settingModelWithTitle:@"是否开启大图检测" detail:@"默认关闭；开启大图检测，若图片超过指定大小会被标记，同时记录图片，在【大图检测】可查看。"];
    largeImageModel.isOn = [[CXAssistiveCache shareInstance] largeImageDetectionSwitch];
    [largeImageModel.switchSignal subscribeNext:^(id  _Nullable x) {
        [[CXLargeImageInterceptor shareInterceptor] setCanIntercept:[x boolValue]];
        [[CXAssistiveCache shareInstance] saveLargeImageDetectionSwitch:[x boolValue]];
    }];
    
    CXAssistiveSettingModel *viewFrameModel = [CXAssistiveSettingModel settingModelWithTitle:@"是否展示视图边框" detail:@" 默认关闭；开启视图边框，可绘制UI组件的边框。"];
    viewFrameModel.isOn = [[CXAssistiveCache shareInstance] viewFrameSwitch];
    [viewFrameModel.switchSignal subscribeNext:^(id  _Nullable x) {
        [[CXViewFrameManager defaultManager] setEnable:[x boolValue]];
        [[CXAssistiveCache shareInstance] saveViewFrameSwitch:[x boolValue]];
    }];
    
    CXAssistiveSettingModel *apiLoggerModel = [CXAssistiveSettingModel settingModelWithTitle:@"是否打印网络请求日志" detail:@"默认关闭；开启后可在控制台查看网络日志"];
    apiLoggerModel.isOn = [[CXAssistiveCache shareInstance] APILoggerSwitch];
    [apiLoggerModel.switchSignal subscribeNext:^(id  _Nullable x) {
        CXAPILoggerEnabled = [x boolValue];
        [[CXAssistiveCache shareInstance] saveAPILoggerSwitch:[x boolValue]];
    }];
    self.settings = @[leakModel,largeImageModel,viewFrameModel,apiLoggerModel];

    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.settings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CXAssistiveSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CXAssistiveSettingCell"];
    if (!cell) {
        cell = [[CXAssistiveSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CXAssistiveSettingCell"];
    }
    CXAssistiveSettingModel *model = self.settings[indexPath.row];
    [cell bindSettingModel:model];
    return cell;
}

#pragma mark - getter
- (UITableView *)tableView {
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 60;
    }
    return _tableView;
}

@end
