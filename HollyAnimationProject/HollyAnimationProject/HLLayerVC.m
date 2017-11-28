//
//  HLLayerVC.m
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/28.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import "HLLayerVC.h"
#import "HLAnimationsViewController.h"
#import "HLReplicatorLayerViewController.h"

@interface HLLayerVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSArray *menuArray;
@property (nonatomic, strong) CALayer *selfLayer;

@end

@implementation HLLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)setVcTitle:(NSString *)vcTitle{
    self.title = vcTitle;
}
-(void)setVcType:(HLLayerVCType)vcType{
    _vcType = vcType;
    if (vcType == HLLayerVCTypeExplicit) {
        [self initData];
        [self initExplicitView];
    }
    else{
        _selfLayer = [CALayer layer];
        _selfLayer.backgroundColor = [UIColor greenColor].CGColor;
        _selfLayer.frame = CGRectMake(0, 100, 100, 100);
        [self.view.layer addSublayer:_selfLayer];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"隐式动画" forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 300, 100, 30);
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(implicitAnimation) forControlEvents:UIControlEventTouchUpInside];
        

    }
}
-(void)implicitAnimation{
    
    _selfLayer.frame = CGRectOffset(_selfLayer.frame, 100, 0);
    
}
-(void)initData{
    _menuArray = [NSArray arrayWithObjects:@"CABasicAnimation 基础动画",@"CAKeyframeAnimation 关键帧动画",@"CAAnimationGroup 动画组",@"CATransition 过渡动画",@"CAReplicatorLayer复制自己子层的layer", nil];
}

-(void)initExplicitView{
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
    if (indexPath.row==4) {
        HLReplicatorLayerViewController *repVC = [[HLReplicatorLayerViewController alloc] init];
        [self.navigationController pushViewController:repVC animated:YES];
    }
    else{
        HLAnimationsViewController *aniVC = [[HLAnimationsViewController alloc] init];
        aniVC.vcTitle = _menuArray[indexPath.row];
        switch (indexPath.row) {
            case 0:
                aniVC.animationType = HLAnimationsTypeCABasicAnimation;
                break;
            case 1:
                aniVC.animationType = HLAnimationsTypeCAKeyframeAnimation;
                break;
            case 2:
                aniVC.animationType = HLAnimationsTypeCAAnimationGroup;
                break;
            case 3:
                aniVC.animationType = HLAnimationsTypeCATransition;
                break;
                
            default:
                break;
        }
        [self.navigationController pushViewController:aniVC animated:YES];
    }
   
}

@end
