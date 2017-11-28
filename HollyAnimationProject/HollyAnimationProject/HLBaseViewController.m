//
//  HLBaseViewController.m
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/28.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import "HLBaseViewController.h"

@interface HLBaseViewController ()

@property (nonatomic , strong) NSArray *operateTitleArray;

@end

@implementation HLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

-(void)initData{
    _operateTitleArray = [self operateTitleArray];
}

-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    if(_operateTitleArray&&_operateTitleArray.count>0){
        NSUInteger row = _operateTitleArray.count%2==0 ? _operateTitleArray.count/2 : _operateTitleArray.count/2+1;
        UIView *operateView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-(row*50+20), SCREEN_WIDTH, row*50+20)];
        [self.view addSubview:operateView];
        for (int i=0; i<_operateTitleArray.count; i++) {
            HLTitleBtn *btn = [[HLTitleBtn alloc] initWithFrame:[self rectForBtnAtIndex:i totalNum:_operateTitleArray.count] withTitle:[_operateTitleArray objectAtIndex:i]];
            btn.tag = i;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [operateView addSubview:btn];
        }
    }
}

/**
 *  获得每个操作按钮的frame
 *
 *  @param index    当前按钮的位置,从0开始
 *  @param totleNum 所有按钮的总数
 *
 *  @return 按钮的frame
 */
-(CGRect)rectForBtnAtIndex : (NSUInteger)index totalNum : (NSUInteger)totleNum{
    //每一行最多显示4个
    NSUInteger maxColumnNum = 2;
    //每个按钮的列间距
    CGFloat columnMargin = 20;
    //每个按钮的行间距
    CGFloat rowMargin = 20;
    //行数
    // NSUInteger row = totleNum/maxColumnNum;
    //每个按钮的宽度
    CGFloat width = (SCREEN_WIDTH - columnMargin*5)/2;
    //每个按钮的高度
    CGFloat height = 30;
    
    //每个按钮的偏移
    CGFloat offsetX = columnMargin+(index%maxColumnNum)*(width+columnMargin);
    CGFloat offsetY = rowMargin+(index/maxColumnNum)*(height+rowMargin);
    
    return CGRectMake(offsetX, offsetY, width, height);
}

-(void)clickBtn : (UIButton *)btn{
    
}

@end
