//
//  HLAnimationsViewController.h
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/28.
//  Copyright © 2017年 Holly. All rights reserved.
//  核心动画

#import "HLBaseViewController.h"
//MARK: - 枚举
typedef NS_ENUM(NSUInteger,HLAnimationsType) {
    HLAnimationsTypeCABasicAnimation,//基础动画
    HLAnimationsTypeCAKeyframeAnimation,//关键帧动画
    HLAnimationsTypeCAAnimationGroup,//动画组
    HLAnimationsTypeCATransition,//过渡动画
};
@interface HLAnimationsViewController : HLBaseViewController

@property (nonatomic, assign) HLAnimationsType animationType;
@property (nonatomic, copy) NSString *vcTitle;

@end
