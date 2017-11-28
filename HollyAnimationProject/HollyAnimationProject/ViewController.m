//
//  ViewController.m
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/27.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import "ViewController.h"
#import "AnimationListViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSArray *menuArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画";
    [self initData];
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)initData{
    _menuArray = [NSArray arrayWithObjects:@"UIView",@"Layer 核心动画", nil];
}

-(void)initView{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _menuArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TABLE_VIEW_ID = @"table_view_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_VIEW_ID];
    }
    cell.textLabel.text = [_menuArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AnimationListViewController *aniVC = [[AnimationListViewController alloc] init];
    if (indexPath.row==0) {
        aniVC.vcType = ListVCTypeUIView;
    }
    else{
        aniVC.vcType = ListVCTypeLayer;
    }
    aniVC.vcTitle = [_menuArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:aniVC animated:YES];
}

@end
