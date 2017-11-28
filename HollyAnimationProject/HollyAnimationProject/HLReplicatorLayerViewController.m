//
//  HLReplicatorLayerViewController.m
//  HollyAnimationProject
//
//  Created by Holly on 2017/11/28.
//  Copyright © 2017年 Holly. All rights reserved.
//

#import "HLReplicatorLayerViewController.h"
#import "WHAnimation.h"

#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度

@interface HLReplicatorLayerViewController ()
@property (nonatomic, strong) CAReplicatorLayer *loveLayer;
@property (nonatomic, strong) CAReplicatorLayer *musicLayer;

@end

@implementation HLReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CAReplicatorLayer";
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      //透明度动画加载
//    [self drawOpacityMyPoint];
    //水波纹
//    [self drawRepicatirLayer];
    //圆圈
//    [self drawRepicatirLayer1];
    //圆圈且大小变化
//    [self drawRepicatirLayer2];
    //各种点动画
//     [self drawWHAnimation];
    //心形路径
//    [self loveReplicatorLayer];
    //音乐播放
    [self musicReplicatorLayer];
}
- (void)loveReplicatorLayer
{
    // love路径
    UIBezierPath *tPath = [UIBezierPath bezierPath];
    [tPath moveToPoint:CGPointMake(SCREEN_WIDTH/2.0, 200)];
    [tPath addQuadCurveToPoint:CGPointMake(SCREEN_WIDTH/2.0, 400) controlPoint:CGPointMake(SCREEN_WIDTH/2.0 + 200, 20)];
    [tPath addQuadCurveToPoint:CGPointMake(SCREEN_WIDTH/2.0, 200) controlPoint:CGPointMake(SCREEN_WIDTH/2.0 - 200, 20)];
    [tPath closePath];
    
    // 具体的layer
    UIView *tView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    tView.center = CGPointMake(SCREEN_WIDTH/2.0, 200);
    tView.layer.cornerRadius = 5;
    tView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    // 动作效果
    CAKeyframeAnimation *loveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    loveAnimation.path = tPath.CGPath;
    loveAnimation.duration = 8;
    loveAnimation.repeatCount = MAXFLOAT;
    [tView.layer addAnimation:loveAnimation forKey:@"loveAnimation"];
    
    _loveLayer = [CAReplicatorLayer layer];
    _loveLayer.instanceCount = 40;                // 40个layer
    _loveLayer.instanceDelay = 0.2;               // 每隔0.2出现一个layer
    _loveLayer.instanceColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
    _loveLayer.instanceGreenOffset = -0.03;       // 颜色值递减。
    _loveLayer.instanceRedOffset = -0.02;         // 颜色值递减。
    _loveLayer.instanceBlueOffset = -0.01;        // 颜色值递减。
    [_loveLayer addSublayer:tView.layer];
    [self.view.layer addSublayer:_loveLayer];
}

- (void)musicReplicatorLayer
{
    _musicLayer = [CAReplicatorLayer layer];
    _musicLayer.frame = CGRectMake(0, 100, 60, 100);
    _musicLayer.position = self.view.center;
    _musicLayer.instanceCount = 3;
    _musicLayer.instanceTransform = CATransform3DMakeTranslation(15, 0, 0);     //每个layer的间距。
    _musicLayer.instanceDelay = 0.2;
    _musicLayer.backgroundColor = [UIColor greenColor].CGColor;
    _musicLayer.masksToBounds = YES;
    [self.view.layer addSublayer:_musicLayer];
    
    CALayer *tLayer = [CALayer layer];
    tLayer.frame = CGRectMake(10, 100, 10, 30);
    tLayer.backgroundColor = [UIColor redColor].CGColor;
    [_musicLayer addSublayer:tLayer];
    
    CABasicAnimation *musicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    musicAnimation.duration = 0.35;
    musicAnimation.fromValue = @(100);
    musicAnimation.toValue = @(85);
    musicAnimation.autoreverses = YES;
    musicAnimation.repeatCount = MAXFLOAT;
    
    [tLayer addAnimation:musicAnimation forKey:@"musicAnimation"];
}
-(void)drawWHAnimation{
    NSMutableArray *arrSublayer = [NSMutableArray arrayWithCapacity:5];
    [arrSublayer addObject:[WHAnimation replicatorLayer_Circle]];
    [arrSublayer addObject:[WHAnimation replicatorLayer_Wave]];
    [arrSublayer addObject:[WHAnimation replicatorLayer_Triangle]];
    [arrSublayer addObject:[WHAnimation replicatorLayer_Grid]];
    
    CGFloat radius = 500/2.0;
    for (NSInteger loop = 0; loop<arrSublayer.count; loop++) {
        NSInteger col = loop%2;
        NSInteger row = loop/2;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(radius*col, radius*row+64, radius, radius)];
        view.backgroundColor = [UIColor whiteColor];
        [view.layer addSublayer:[arrSublayer objectAtIndex:loop]];
        [self.view addSubview:view];
    }
}
//透明度动画加载
-(void)drawOpacityMyPoint{
    UIView *animationView = [[UIView alloc] init];
    animationView.frame = CGRectMake(0, 64, 100, 100);
    animationView.backgroundColor = [UIColor lightGrayColor];
    animationView.clipsToBounds = YES;
    [self.view addSubview:animationView];
    
    CAShapeLayer *animationLayer = [CAShapeLayer layer];
    animationLayer.backgroundColor = [UIColor redColor].CGColor;
    animationLayer.bounds = CGRectMake(0, 0, 20, 20);
    animationLayer.cornerRadius  = 10;
    animationLayer.position = CGPointMake(10, 50);

    CABasicAnimation *alphAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphAni.fromValue = @(1.0);
    alphAni.toValue = @(0.0);
    alphAni.duration = 1;
    alphAni.repeatCount = HUGE;
    alphAni.removedOnCompletion = NO;
    [animationLayer addAnimation:alphAni forKey:nil];


    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.instanceCount = 3;
    layer.instanceDelay = 0.3;
    [layer addSublayer:animationLayer];
    layer.instanceTransform = CATransform3DTranslate(CATransform3DIdentity, 20+5, 0, 0);
    [animationView.layer addSublayer:layer];
}
//水波纹
-(void)drawRepicatirLayer{
    
    UIView *animationView = [[UIView alloc] init];
    animationView.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    animationView.center = self.view.center;
    animationView.backgroundColor = [UIColor lightGrayColor];
    animationView.clipsToBounds = YES;
    [self.view addSubview:animationView];
    
    CAShapeLayer *animationLayer = [CAShapeLayer layer];
    animationLayer.backgroundColor = [UIColor redColor].CGColor;
    animationLayer.bounds = CGRectMake(0, 0, 20, 20);
    animationLayer.cornerRadius  = 10;
    animationLayer.position = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, 100);
    
    CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0.0)];
    transformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 10.0, 10.0, 0.0)];
    transformAnim.duration = 2.0;
    
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnim.fromValue = @(1.0);
    alphaAnim.toValue = @(0.0);
    alphaAnim.duration = 2;
    
    CAAnimationGroup *animGroup = [[CAAnimationGroup alloc] init];
    animGroup.animations = @[transformAnim,alphaAnim];
    animGroup.duration = 2;
    animGroup.repeatCount = MAXFLOAT;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.removedOnCompletion = NO;
    animGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [animationLayer addAnimation:animGroup forKey:@"groupAni"];
    //    [animationLayer addAnimation:animGroup forKey:nil];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    [replicatorLayer addSublayer:animationLayer];
    replicatorLayer.instanceCount = 5;
    replicatorLayer.instanceDelay = 0.3;
    [animationView.layer addSublayer:replicatorLayer];
    
}
//圆圈
-(void)drawRepicatirLayer1{
    UIView *animationView = [[UIView alloc] init];
    animationView.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    animationView.center = self.view.center;
    animationView.backgroundColor = [UIColor lightGrayColor];
    animationView.clipsToBounds = YES;
    [self.view addSubview:animationView];
    
    CAShapeLayer *animationLayer = [CAShapeLayer layer];
    animationLayer.backgroundColor = [UIColor redColor].CGColor;
    animationLayer.bounds = CGRectMake(0, 0, 20, 20);
    animationLayer.cornerRadius  = 10;
    animationLayer.position = CGPointMake(0, animationView.center.y);
    animationLayer.anchorPoint = CGPointMake(0.5, 0.5);
    
    CGMutablePathRef path =  CGPathCreateMutable();
    CGPathAddEllipseInRect(path, nil, CGRectMake((animationView.bounds.size.width-160)/2, (animationView.bounds.size.height-160)/2, 160, 160));
    
    CAKeyframeAnimation *transformAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    transformAnim.duration = 4;
    transformAnim.repeatCount = HUGE;
    transformAnim.path = path;
    [animationLayer addAnimation:transformAnim forKey:nil];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    [replicatorLayer addSublayer:animationLayer];
    replicatorLayer.instanceCount = 20;
    replicatorLayer.instanceDelay = 0.2;
    replicatorLayer.repeatCount = HUGE;
    replicatorLayer.instanceAlphaOffset = -0.05; // 透明度递减
    
    [animationView.layer addSublayer:replicatorLayer];
}
//圆圈大小变化
-(void)drawRepicatirLayer2{
    UIView *animationView = [[UIView alloc] init];
    animationView.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    animationView.center = self.view.center;
    animationView.backgroundColor = [UIColor lightGrayColor];
    animationView.clipsToBounds = YES;
    [self.view addSubview:animationView];
    
    CAShapeLayer *animationLayer = [CAShapeLayer layer];
    animationLayer.backgroundColor = [UIColor redColor].CGColor;
    animationLayer.bounds = CGRectMake(0, 0, 20, 20);
    animationLayer.cornerRadius  = 10;
    animationLayer.position = CGPointMake(self.view.bounds.size.width/2, 50);
    animationLayer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
    
    CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnim.duration = 2;
    transformAnim.repeatCount = HUGE;
    transformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    transformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.1)];
    transformAnim.duration = 2.0;
    [animationLayer addAnimation:transformAnim forKey:nil];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
    [replicatorLayer addSublayer:animationLayer];
    replicatorLayer.instanceCount = 20;
    replicatorLayer.instanceDelay = 0.1;
    CGFloat angle = (2*M_PI)/20;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1.0);
    [animationView.layer addSublayer:replicatorLayer];
}

@end
