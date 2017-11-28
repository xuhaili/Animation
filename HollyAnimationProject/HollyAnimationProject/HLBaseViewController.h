//
//  HLBaseViewController.h
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/28.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLTitleBtn.h"

@interface HLBaseViewController : UIViewController
/**
 *  初始化View
 */
-(void)initView;

/**
 *  按钮操作区的数组元素
 *
 *  @return 数组
 */
-(NSArray *)operateTitleArray;

/**
 *  每个按钮的点击时间
 *
 *  @param btn
 */
-(void)clickBtn : (UIButton *)btn;
@end
