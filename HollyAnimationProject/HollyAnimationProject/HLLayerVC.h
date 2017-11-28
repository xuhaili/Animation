//
//  HLLayerVC.h
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/28.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import "HLBaseViewController.h"
//MARK: - 枚举
typedef NS_ENUM(NSUInteger, HLLayerVCType) {
    HLLayerVCTypeImplicit,//隐式动画
    HLLayerVCTypeExplicit,//显式动画
};
@interface HLLayerVC : HLBaseViewController

@property (nonatomic, assign) HLLayerVCType vcType;
@property (nonatomic, copy) NSString *vcTitle;

@end
