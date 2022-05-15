//
//  ViewController.m
//  HotSpot
//
//  Created by 何青 on 2022/5/14.
//

#import "ViewController.h"
#import "DataLoader.h"
#import "TableViewCell.h"
#import "HotSearchItem.h"
#import "WebViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<HotSearchItem *> *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [DataLoader loadDataWithCompletion:^(NSArray *resultArray) {
        self.dataArray = resultArray;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
    }
    HotSearchItem *item = [self.dataArray objectAtIndex:indexPath.row];
    [(TableViewCell*)cell configureWithModel:item];
    return cell;
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HotSearchItem *model = [self.dataArray objectAtIndex:indexPath.row];
    WebViewController *webVC = [[WebViewController alloc] initWithFrame:self.view.bounds model:model];
    [self.navigationController pushViewController:webVC animated:YES];
}


@end
