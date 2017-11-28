//
//  HLTitleBtn.h
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/28.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLTitleBtn : UIButton

/**
 *  初始化按钮
 *
 *  @param frame frame
 *  @param title 标题
 *
 *  @return 按钮对象
 */
-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title;
@end
