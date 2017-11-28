//
//  HLUIViewVC.h
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/28.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import "HLBaseViewController.h"

//MARK: - 枚举
typedef NS_ENUM(NSUInteger, HLUIViewVCType) {
    HLUIViewVCTypeCommon,//一般方式
    HLUIViewVCTypeBlock,//block
};
@interface HLUIViewVC : HLBaseViewController

@property (nonatomic, assign) HLUIViewVCType vcType;
@property (nonatomic, copy) NSString *vcTitle;

@end
