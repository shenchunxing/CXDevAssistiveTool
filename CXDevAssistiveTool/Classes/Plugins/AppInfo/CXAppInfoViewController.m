//
//  CXAppInfoViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/24.
//

#import "CXAppInfoViewController.h"
#import <Masonry/Masonry.h>
#import "CXAssistiveDefine.h"
#import "UIViewController+AssistiveUtil.h"
#import "CXAssistiveAppInfoCell.h"
#import "CXAppInfoUtil.h"

@interface CXAppInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation CXAppInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self as_setNavigationBarTitle:@"App Info"];
    [self as_setLeftBarItemTitle:@"关闭"];
    [self initializeUI];
    [self initData];
}

- (void)initializeUI {
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)initData {
    
    self.dataSource = [[NSMutableArray alloc] init];
    
    CXAppInfoModel *nameModel = [CXAppInfoModel modelWithName:@"Device Name" value:[CXAppInfoUtil iphoneName]];
    CXAppInfoModel *typeModel = [CXAppInfoModel modelWithName:@"Device Mode" value:[CXAppInfoUtil iphoneType]];
    CXAppInfoModel *systemModel = [CXAppInfoModel modelWithName:@"System Version" value:[CXAppInfoUtil iphoneSystemVersion]];
    CXAppInfoModel *screenModel = [CXAppInfoModel modelWithName:@"Screen Resolution" value:[CXAppInfoUtil screenResolution]];
    CXAppInfoModel *languageModel = [CXAppInfoModel modelWithName:@"Language" value:[CXAppInfoUtil languageCode]];
    CXAppInfoModel *batteryModel = [CXAppInfoModel modelWithName:@"Battery Level" value:[CXAppInfoUtil batteryLevel]];
    CXAppInfoModel *cpuModel = [CXAppInfoModel modelWithName:@"CPU Type" value:[CXAppInfoUtil cpuType]];
    [self.dataSource addObject:@{@"title":@"Device Info",@"info":@[nameModel,typeModel,systemModel,screenModel,languageModel,batteryModel,cpuModel]}];
    
    CXAppInfoModel *appNameModel = [CXAppInfoModel modelWithName:@"App Name" value:[CXAppInfoUtil appName]];
    CXAppInfoModel *bundleModel = [CXAppInfoModel modelWithName:@"Bundle ID" value:[CXAppInfoUtil bundleIdentifier]];
    CXAppInfoModel *bundleVersionModel = [CXAppInfoModel modelWithName:@"Version" value:[CXAppInfoUtil bundleVersion]];
    CXAppInfoModel *versionModel = [CXAppInfoModel modelWithName:@"Short Version" value:[CXAppInfoUtil bundleShortVersionString]];
    [self.dataSource addObject:@{@"title":@"APP Info",@"info":@[appNameModel,bundleModel,bundleVersionModel,versionModel]}];
    
    CXAppInfoModel *locationModel = [CXAppInfoModel modelWithName:@"定位权限" value:[CXAppInfoUtil locationAuthority]];
    CXAppInfoModel *cameraModel = [CXAppInfoModel modelWithName:@"相机权限" value:[CXAppInfoUtil cameraAuthority]];
    CXAppInfoModel *photoModel = [CXAppInfoModel modelWithName:@"相册权限" value:[CXAppInfoUtil photoAuthority]];
    CXAppInfoModel *pushModel = [CXAppInfoModel modelWithName:@"推送权限" value:[CXAppInfoUtil pushAuthority]];
    [self.dataSource addObject:@{@"title":@"权限信息",@"info":@[locationModel,cameraModel,photoModel,pushModel]}];
    
    [self.tableView reloadData];
    
}

- (void)as_viewControllerDidTriggerLeftClick:(UIViewController *)viewController  {
    
    [self pluginWindowDidClosed];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = self.dataSource[section];
    return [dic[@"info"] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 52.0;
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CXAssistiveAppInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CXAssistiveAppInfoCell"];
    if (!cell) {
        cell = [[CXAssistiveAppInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CXAssistiveAppInfoCell"];
    }
    NSDictionary *dic = self.dataSource[indexPath.section];
    CXAppInfoModel *model = dic[@"info"][indexPath.row];
    [cell renderUIWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSDictionary *dic = self.dataSource[section];
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AS_ScreenWidth, 40)];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, AS_ScreenWidth-20, 40)];
    lbl.textColor = [UIColor whiteColor];
    lbl.font = [UIFont boldSystemFontOfSize:15.0];
    lbl.textAlignment = NSTextAlignmentLeft;
    lbl.text = dic[@"title"];
    [sectionView addSubview:lbl];
    return sectionView;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.01)];
    }
    return _tableView;
}

@end
