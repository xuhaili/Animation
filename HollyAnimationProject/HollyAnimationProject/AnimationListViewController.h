//
//  AnimationListViewController.h
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/27.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import <UIKit/UIKit.h>
//MARK: - 枚举
typedef NS_ENUM(NSUInteger, ListVCType) {
    ListVCTypeUIView,//UIView动画
    ListVCTypeLayer,//layer动画
};
@interface AnimationListViewController : UIViewController
@property (nonatomic, assign) ListVCType vcType;
@property (nonatomic, copy) NSString *vcTitle;

@end
