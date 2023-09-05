//
//  CXDevAssistiveHomeViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/18.
//

#import "CXDevAssistiveHomeViewController.h"
#import "CXAssistiveFunctionCell.h"
#import "UIImage+AssistiveBundle.h"
#import "UIViewController+AssistiveUtil.h"
#import "CXDevAssistiveFactory.h"

@interface CXDevAssistiveHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<CXAssistiveFunctionViewModel *> *functions;

@end

@implementation CXDevAssistiveHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self as_setNavigationBarTitle:@"测试辅助工具"];
    [self as_setLeftBarItemTitle:@"关闭"];
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    [self.tableView reloadData];
}

- (void)as_viewControllerDidTriggerLeftClick:(UIViewController *)viewController {
    
    [self pluginWindowDidClosed];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.functions.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CXAssistiveFunctionCell heightForCell:self.functions[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CXAssistiveFunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CXAssistiveFunctionCell"];
    CXAssistiveFunctionViewModel *viewModel = self.functions[indexPath.row];
    [cell bindFunctionModel:viewModel];
    return cell;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 100.0;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[CXAssistiveFunctionCell class] forCellReuseIdentifier:@"CXAssistiveFunctionCell"];
    }
    return _tableView;
}

- (NSMutableArray<CXAssistiveFunctionViewModel *> *)functions {
    
    if (_functions == nil) {
        _functions = [CXDevAssistiveFactory homeFunctions];
    }
    return _functions;
}

@end
