//
//  CXLargeImageViewController.m
//  CXDevAssistive
//
//  Created by shenchunxing on 2021/9/26.
//

#import "CXLargeImageViewController.h"
#import "CXLargeImageInterceptor.h"
#import "CXLargeImageCell.h"
#import "UIViewController+AssistiveUtil.h"
#import <Masonry/Masonry.h>

@interface CXLargeImageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CXLargeImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self as_setNavigationBarTitle:@"大图检测"];
    [self as_setLeftBarItemTitle:@"关闭"];
    [self as_setRightBarItemTitle:@"清空"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.tableView reloadData];
}

- (void)as_viewControllerDidTriggerLeftClick:(UIViewController *)viewController {
    
    [self pluginWindowDidClosed];
}

- (void)as_viewControllerDidTriggerRightClick:(UIViewController *)viewController {
    [[CXLargeImageInterceptor shareInterceptor] removeAllImages];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CXLargeImageInterceptor shareInterceptor].images.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CXLargeImageCell largeImageCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CXLargeImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CXLargeImageCell"];
    if (!cell) {
        cell = [[CXLargeImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CXLargeImageCell"];
    }
    CXLargeImageModel *model = [CXLargeImageInterceptor shareInterceptor].images[indexPath.row];
    [cell renderUIWithModel:model];
    return cell;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
