//
//  HLUIViewVC.m
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/28.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import "HLUIViewVC.h"

@interface HLUIViewVC ()

@property (nonatomic , strong) UIView *demoView;

@end

@implementation HLUIViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.demoView];
    // Do any additional setup after loading the view.
}

-(void)setVcType:(HLUIViewVCType)vcType{
    _vcType = vcType;
    
}
-(void)setVcTitle:(NSString *)vcTitle{
    self.title = vcTitle;
}

//UI开发技巧，重写setter方法和Code Block Evaluation C Extension语法
- (UIView *)demoView{
    if (!_demoView) {
        _demoView = ({
            UIView *demoView = [[UIView alloc] initWithFrame:({
                CGRect rect = CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-100,100 ,100 );
                rect;
            })];
            demoView.backgroundColor = [UIColor redColor];
            demoView;
        });
    }
    return _demoView;
}

-(NSArray *)operateTitleArray{
    if (_vcType == HLUIViewVCTypeCommon) {
        return [NSArray arrayWithObjects:@"位移",@"缩放",nil];
    }
    else if (_vcType==HLUIViewVCTypeBlock){
        return [NSArray arrayWithObjects:@"方法一",@"方法二",@"方法三",@"四-Spring Animationring Animation",@"五-关键帧动画",nil];
    }
    return nil;
}

-(void)clickBtn: (UIButton *)btn{
    if (_vcType==HLUIViewVCTypeCommon) {
        switch (btn.tag) {
            case 0:
                [self positionAnimation];
                break;
            case 1:
                [self scaleAnimation];
                break;
            default:
                break;
        }
    }
    else{
        switch (btn.tag) {
            case 0:
            {
                [UIView animateWithDuration:2.0 // 动画时长
                                 animations:^{
                                     // code
                                     CGPoint point = _demoView.center;
                                     point.y += 150;
                                     [_demoView setCenter:point];
                                 }];
            }
                
                break;
            case 1:
            {
                
                [UIView animateWithDuration:2.0 // 动画时长
                                 animations:^{
                                     // code...
                                     CGPoint point = _demoView.center;
                                     point.y += 150;
                                     [_demoView setCenter:point];
                                 }
                                 completion:^(BOOL finished) {
                                     // 动画完成后执行
                                     // code...
                                     _demoView.backgroundColor = [UIColor yellowColor];
                                 }];
            }
                break;
            case 2:
            {
                [UIView animateWithDuration:2.0 // 动画时长
                                      delay:2.0 // 动画延迟
                                    options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
                                 animations:^{
                                     // code...
                                     CGPoint point = _demoView.center;
                                     point.y += 150;
                                     [_demoView setCenter:point];
                                 }
                                 completion:^(BOOL finished) {
                                     // 动画完成后执行
                                     // code...
                                     _demoView.backgroundColor = [UIColor blueColor];
                                 }];
            }
                
                break;
            case 3:
            {
              /*在IOS7开始，系统动画效果广泛应用Spring Animation ：
               usingSpringWithDamping：它的范围为 0.0f 到 1.0f ，数值越小「弹簧」的振动效果越明显。
               
               initialSpringVelocity：初始的速度，数值越大一开始移动越快。值得注意的是，初始速度取值较高而时间较短时，也会出现反弹情况。
               
               转：Spring Animation 是线性动画或 ease-out 动画的理想替代品。由于 iOS 本身大量使用的就是 Spring Animation，用户已经习惯了这种动画效果，因此使用它能使 App 让人感觉更加自然，用 Apple 的话说就是「instantly familiar」。此外，Spring Animation 不只能对位置使用，它适用于所有可被添加动画效果的属性。
               */
                [UIView animateWithDuration:4.0 // 动画时长
                                      delay:0.0 // 动画延迟
                     usingSpringWithDamping:0.4 // 类似弹簧振动效果 0~1
                      initialSpringVelocity:5.0 // 初始速度
                                    options:UIViewAnimationOptionCurveEaseInOut // 动画过渡效果
                                 animations:^{
                                     // code...
                                     CGPoint point = _demoView.center;
                                     point.y += 100;
                                     [_demoView setCenter:point];
                                 } completion:^(BOOL finished) {
                                     // 动画完成后执行
                                     // code...
                                     _demoView.backgroundColor = [UIColor blueColor];
                                 }];
            }
                break;
            case 4:
                /*
                 UIView动画已经具备高级的方法来创建动画，而且可以更好地理解和构建动画。IOS7以后苹果新加了一个animateKeyframesWithDuration的方法，我们可以使用它来创建更多更复杂更酷炫的动画效果，而不需要去使用到核心动画（CoreAnimatino）。
                 */
//                 创建关键帧方法：
                
                 /**
                 *  添加关键帧方法
                 *
                 *  @param duration   动画时长
                 *  @param delay      动画延迟
                 *  @param options    动画效果选项
                 *  @param animations 动画执行代码
                 *  @param completion 动画结束执行代码
                 */
//                + (void)animateKeyframesWithDuration:(NSTimeInterval)duration
//            delay:(NSTimeInterval)delay
//            options:(UIViewKeyframeAnimationOptions)options
//            animations:(void (^)(void))animations
//            completion:(void (^)(BOOL finished))completion;
//                添加关键帧方法：
                
                /**
                 *  添加关键帧
                 *
                 *  @param frameStartTime 动画相对开始时间
                 *  @param frameDuration  动画相对持续时间
                 *  @param animations     动画执行代码
                 */
//                + (void)addKeyframeWithRelativeStartTime:(double)frameStartTime
//            relativeDuration:(double)frameDuration
//            animations:(void (^)(void))animations;
//                以上说的相对时间，也就是说：“它们自身会根据动画总持续时长自动匹配其运行时长”。
                
                
            {
                void (^keyFrameBlock)(void) = ^(){
                    // 创建颜色数组
                    NSArray *arrayColors = @[[UIColor orangeColor],
                                             [UIColor yellowColor],
                                             [UIColor greenColor],
                                             [UIColor blueColor],
                                             [UIColor purpleColor],
                                             [UIColor redColor]];
                    NSUInteger colorCount = [arrayColors count];
                    // 循环添加关键帧
                    for (NSUInteger i = 0; i < colorCount; i++) {
                        [UIView addKeyframeWithRelativeStartTime:i / (CGFloat)colorCount
                                                relativeDuration:1 / (CGFloat)colorCount
                                                      animations:^{
                                                          [_demoView setBackgroundColor:arrayColors[i]];
                                                      }];
                    }
                };
                [UIView animateKeyframesWithDuration:4.0
                                               delay:0.0
                                             options:UIViewKeyframeAnimationOptionCalculationModeCubic | UIViewAnimationOptionCurveLinear
                                          animations:keyFrameBlock
                                          completion:^(BOOL finished) {
                                              // 动画完成后执行
                                              // code...
                                              _demoView.backgroundColor = [UIColor blueColor];
                                          }];
            }
                break;
            
            default:
                break;
        }
    }
   
}

-(void)positionAnimation{
    
    [UIView beginAnimations:nil context:nil]; // 开始动画
    [UIView setAnimationDuration:2.0]; // 动画时长
    
    /**
     *  图像向下移动
     */
    CGPoint point = _demoView.center;
    point.y += 150;
    [_demoView setCenter:point];
    
    [UIView commitAnimations]; // 提交动画

}

-(void)scaleAnimation{
   
    [UIView beginAnimations:nil context:nil]; // 开始动画
    [UIView setAnimationDuration:2.0]; // 动画时长
    
    /**
     *  图像放大两倍
     */
    CGRect rect = _demoView.frame;
    rect.size.width =rect.size.width*2;
    rect.size.height =rect.size.height*2;
    
    [_demoView setFrame:rect];
    
    [UIView commitAnimations]; // 提交动画
   
}

@end
