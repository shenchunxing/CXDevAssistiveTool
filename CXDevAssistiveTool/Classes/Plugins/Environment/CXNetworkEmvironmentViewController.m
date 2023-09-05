//
//  CXNetworkEmvironmentViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/6/25.
//

#import "CXNetworkEmvironmentViewController.h"
#import "CXNetworkConfigur.h"
#import "CXNetworkConfigurItem.h"
#import "CXNetworkConfigStorage.h"
#import "CXNetworkEnvironmentEditViewController.h"
#import "CXNetworkEnvironment.h"
#import "CXAssistiveMacro.h"
#import "CXNetworkEnvironmentCell.h"
#import "CXNetworkEnvironment.h"
#import "UIViewController+AssistiveUtil.h"

@interface CXNetworkEmvironmentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) NSArray <CXNetworkConfigurItem *> *configurItems;

@property (nonatomic, strong) CXNetworkConfigStorage *storage;

@end

@implementation CXNetworkEmvironmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self as_setNavigationBarTitle:@"测试环境配置"];
    [self as_setLeftBarItemTitle:@"关闭"];
    [self as_setRightBarItemTitle:@"确定"];
    
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
    [self setupItemConfigursMap];
}

- (void)as_viewControllerDidTriggerLeftClick:(UIViewController *)viewController {
    [self pluginWindowDidClosed];
}

- (void)setupItemConfigursMap {

    self.configurItems  = @[[CXNetworkConfigurItem configurItemWithTitle:@"测试环境配置" identifier:kAppEnvironmentApiKey]];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.configurItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CXNetworkEnvironmentCell heightFoNetworkCell];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CXNetworkEnvironmentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CXNetworkEnvironmentCell"];
    if (!cell) {
        cell = [[CXNetworkEnvironmentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CXNetworkEnvironmentCell"];
    }
    CXNetworkConfigurItem *item = self.configurItems[indexPath.row];
    cell.titleLbl.text = item.title;
    cell.detailLbl.text = item.displayText;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CXNetworkConfigurItem *item = self.configurItems[indexPath.row];
    CXNetworkEnvironmentEditViewController *detailVC = [[CXNetworkEnvironmentEditViewController alloc] initWithIdentifier:item.identifier configurs:item.configurs];
    detailVC.navigationItem.title = item.title;
    [detailVC setSelectHandler:^(NSMutableArray<CXNetworkConfigur *> *configs) {
        [self exchangeConfigBySelected:configs];
        item.configurs = configs;
    }];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)exchangeConfigBySelected:(NSMutableArray<CXNetworkConfigur *> *)configs {
    
    __block NSInteger index = 0;
    [configs enumerateObjectsUsingBlock:^(CXNetworkConfigur * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isSelected) {
            index = idx;
            *stop = YES;
        }
    }];
    if (index > 0) {
        CXNetworkConfigur *config = configs[index];
        [configs removeObjectAtIndex:index];
        [configs insertObject:config atIndex:0];
    }
    [self.tableView reloadData];
}

#pragma mark - 导航栏事件
- (void)as_viewControllerDidTriggerRightClick:(UIViewController *)viewController {
    
    [self.configurItems enumerateObjectsUsingBlock:^(CXNetworkConfigurItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.storage setConfigurs:obj.configurs forKey:obj.identifier];
        [[CXNetworkEnvironment sharedInstance] switchEnvironmentForKey:obj.identifier];
    }];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginOut" object:nil];
    [self pluginWindowDidClosed];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 0.01)];
        _tableView.backgroundColor = [UIColor clearColor];
    }
    
    return _tableView;
}

- (CXNetworkConfigStorage *)storage {
    
    return [CXNetworkConfigStorage sharedInstance];
}

@end
