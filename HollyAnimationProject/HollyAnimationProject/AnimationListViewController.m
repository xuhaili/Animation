//
//  AnimationListViewController.m
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/27.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import "AnimationListViewController.h"
#import "HLUIViewVC.h"
#import "HLLayerVC.h"
#import "HLAffineTransformController.h"

@interface AnimationListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSArray *UIViewArray;
@property (nonatomic , strong) NSArray *LayerArray;

@end

@implementation AnimationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initView];
}
-(void)initData{
    _UIViewArray = [NSArray arrayWithObjects:@"一般方式",@"Block",@"仿射变换", nil];
    _LayerArray = [NSArray arrayWithObjects:@"隐式动画",@"显示动画", nil];
}
-(void)setVcType:(ListVCType)vcType{
    _vcType = vcType;
    [_tableView reloadData];
}
-(void)setVcTitle:(NSString *)vcTitle{
    _vcTitle = vcTitle;
    self.title = vcTitle;
}
-(void)initView{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_vcType==ListVCTypeUIView) {
        return _UIViewArray.count;
    }
    else{
        return _LayerArray.count;

    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TABLE_VIEW_ID = @"table_view_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_VIEW_ID];
    }
    if (_vcType==ListVCTypeUIView) {
         cell.textLabel.text = [_UIViewArray objectAtIndex:indexPath.row];
    }
    else{
        cell.textLabel.text = [_LayerArray objectAtIndex:indexPath.row];
    }
   
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_vcType==ListVCTypeUIView) {
        if (indexPath.row==2) {
       
            HLAffineTransformController *vc = [[HLAffineTransformController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
           
        }
        else{
            HLUIViewVC *vc = [[HLUIViewVC alloc] init];
            if (indexPath.row ==0) {
                vc.vcType = HLUIViewVCTypeCommon;
            }
            else{
                vc.vcType = HLUIViewVCTypeBlock;
            }
            vc.vcTitle = [_UIViewArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    else{
        HLLayerVC *vc = [[HLLayerVC alloc] init];
        if (indexPath.row ==0) {
            vc.vcType = HLLayerVCTypeImplicit;
        }
        else{
            vc.vcType = HLLayerVCTypeExplicit;
        }
        vc.vcTitle = [_LayerArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
