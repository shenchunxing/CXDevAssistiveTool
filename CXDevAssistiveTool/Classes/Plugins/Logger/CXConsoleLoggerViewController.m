//
//  CXConsoleLoggerViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/8/26.
//

#import "CXConsoleLoggerViewController.h"
#import <Masonry/Masonry.h>
#import <CXLogger/CXLogger.h>
#import "CXConsoleLoggerCell.h"
#import "UIViewController+AssistiveUtil.h"
#import "CXAssistiveSearchView.h"
#import "CXAssistiveDefine.h"

@interface CXConsoleLoggerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *logs;

@end

@implementation CXConsoleLoggerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self as_setRightBarItemTitle:@"清空"];
    [self as_setNavigationBarTitle:@"用户日志"];
    [self as_setLeftBarItemTitle:@"关闭"];
    [self initialUI];
}

- (void)initialUI {
    
    CXAssistiveSearchView *searchView = [[CXAssistiveSearchView alloc] initWithFrame:CGRectMake(0, 0, AS_ScreenWidth, 44)];
    weak(self);
    [searchView setSearchBlock:^(NSString * _Nonnull text) {
        strong(self);
        [self searchLogsByKey:text];
    }];
    [self.view addSubview:searchView];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(44);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottomMargin);
    }];
    [self.tableView reloadData];
}

- (void)searchLogsByKey:(NSString *)key {
    
    NSMutableArray *logs = [[NSMutableArray alloc] init];
    [[CXLoggerManager shareManager].loggers enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if ([obj.lowercaseString containsString:key.lowercaseString] || key.length == 0) {
            [logs addObject:obj];
        }
    }];
    self.logs = logs;
    [self.tableView reloadData];
}

- (void)as_viewControllerDidTriggerRightClick:(UIViewController *)viewController {
    
    [[CXLoggerManager shareManager] removeAllConsoleLoggers];
    [self.tableView reloadData];
}

- (void)as_viewControllerDidTriggerLeftClick:(UIViewController *)viewController  {
    
    [self pluginWindowDidClosed];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.logs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CXConsoleLoggerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CXConsoleLoggerCell"];
    if (!cell) {
        cell = [[CXConsoleLoggerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CXConsoleLoggerCell"];
    }
    [cell bindDescribeValue:self.logs[indexPath.row]];
    return cell;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 60;
    }
    return _tableView;
}

- (NSMutableArray *)logs {
    
    if (!_logs) {
        _logs = [NSMutableArray arrayWithArray:[CXLoggerManager shareManager].loggers];
    }
    return _logs;
}
@end
