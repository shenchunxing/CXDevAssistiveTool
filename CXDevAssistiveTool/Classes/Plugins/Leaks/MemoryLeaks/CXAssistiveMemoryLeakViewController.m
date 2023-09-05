//
//  CXAssistiveMemoryLeakViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/7/17.
//

#import "CXAssistiveMemoryLeakViewController.h"
#import <Masonry/Masonry.h>
#import "CXAssistiveLeaksManager.h"
#import "CXAssistiveMemoryLeakCell.h"
#import "UIViewController+AssistiveUtil.h"

@interface CXAssistiveMemoryLeakViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CXAssistiveMemoryLeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self as_setNavigationBarTitle:@"内存泄漏"];
    [self as_setLeftBarItemTitle:@"关闭"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottomMargin);
    }];
    [self.tableView reloadData];
}

- (void)as_viewControllerDidTriggerLeftClick:(UIViewController *)viewController {
    [self pluginWindowDidClosed];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CXAssistiveMemoryLeakCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CXAssistiveMemoryLeakCell"];
    if (!cell) {
        cell = [[CXAssistiveMemoryLeakCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CXAssistiveMemoryLeakCell"];
    }
    [cell bindModel:self.datas[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
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
        _tableView.estimatedRowHeight = 60.0;
    }
    return _tableView;
}
- (NSMutableArray *)datas {
    
    if (_datas == nil) {
        _datas = [CXAssistiveLeaksManager shareManager].leakObjects;
        
    }
    return _datas;
}
@end
