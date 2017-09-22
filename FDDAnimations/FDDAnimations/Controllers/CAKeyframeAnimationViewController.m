//
//  CAKeyframeAnimationViewController.m
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/20.
//  Copyright © 2017年 方冬冬. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "CAKeyframeAnimationViewController.h"

@interface CAKeyframeAnimationViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *moveView;

@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self init_views];
}

- (void)init_views{
    self.navigationItem.title = @"CAKeyframeAnimation";
    UIImage *image = [UIImage imageNamed:@"user.png"];
    self.moveView.layer.contents = (id) image.CGImage;
    self.moveView.layer.backgroundColor = [UIColor clearColor].CGColor;
}

- (IBAction)positionAnimationClick:(id)sender {
//    UIView *keyPathAnimationView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 10, 10)];
//    keyPathAnimationView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:keyPathAnimationView];
//    //以position属性关键字作为keyPath
//    CAKeyframeAnimation *keyAimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    //creat keyPath values设置不起作用了
//    CGMutablePathRef path = CGPathCreateMutable();
//    //开始的点
//    CGPathMoveToPoint(path,nil, 200, 200);
//    //    CGPathAddCurveToPoint(path, nil, 20, 40,
//    //                                     60, 110,
//    //                                     200, 360);
//    //在路劲中得路线
//    CGPathAddArcToPoint(path, nil, 60, 60, 100, 100, 50);
//    //给帧动画赋予路劲
//    keyAimation.path = path;
//    //动画时间
//    keyAimation.duration = 5;
//    //动画均匀进行kCAAnimationPaced
//    keyAimation.calculationMode = kCAAnimationCubicPaced;
//    //重复次数
//    keyAimation.repeatCount = MAXFLOAT;
//    //在动画过程中旋转的样式
//    keyAimation.rotationMode = kCAAnimationRotateAuto;
//    //动画的方式 淡入淡出,kCAMediaTimingFunctionLinear等
//    keyAimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    [keyPathAnimationView.layer addAnimation:keyAimation forKey:nil];
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-40)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+40)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+40)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-40)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-40)];
    anima.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    anima.duration = 2.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//设置动画的节奏
    anima.delegate = self;//设置代理，可以检测动画的开始和结束
    [self.moveView.layer addAnimation:anima forKey:@"keyFrameAnimation"];

}

-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"start");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"end");
}

- (IBAction)shakeAnimationClick:(id)sender {
    
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];//在这里@"transform.rotation"==@"transform.rotation.z"
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    anima.values = @[value1,value2,value3];
    anima.repeatCount = MAXFLOAT;
    
    [self.moveView.layer addAnimation:anima forKey:@"shakeAnimation"];
    
    
}

- (IBAction)groupAnimationClick:(id)sender {
    
    
    //创建路径
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGAffineTransform  transform = CGAffineTransformIdentity;
    CGPathMoveToPoint(path, &transform, 200, 199);
    CGPathAddArc(path, &transform, 150, 199, 50, 0, M_PI*2, NO);
    CGContextAddPath(contextRef, path);
    [[UIColor redColor]setStroke];
    CGContextSetLineWidth(contextRef, 3);
    CGContextDrawPath(contextRef, kCGPathStroke);
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:imageView];
    
    UIGraphicsEndImageContext();
    
    
    //初始化positionLayer
    CALayer * positionLayer = [[CALayer alloc]init];
    positionLayer.backgroundColor = [UIColor blueColor].CGColor;
    positionLayer.frame = CGRectMake(0, 100, 10, 10);
    positionLayer.cornerRadius = 3;
    [self.view.layer addSublayer:positionLayer];
    
    CAKeyframeAnimation * keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.removedOnCompletion = NO;
    keyFrameAnimation.fillMode = kCAFillModeForwards;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    keyFrameAnimation.autoreverses = NO;
    keyFrameAnimation.duration = 2;
    keyFrameAnimation.repeatCount = MAXFLOAT;
    keyFrameAnimation.path = path;
    [positionLayer addAnimation:keyFrameAnimation forKey:nil];
    
    
    CGPathRelease(path);
}
- (IBAction)pathAnimationClick:(id)sender {
    
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-100, 200, 200)];
    anima.path = path.CGPath;
    anima.duration = 2.0f;
    anima.calculationMode = kCAAnimationCubicPaced;
    //如果calculationMode设置为kCAAnimationPaced或者kCAAnimationCubicPaced失效
    anima.timingFunctions = @[kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionLinear,kCAMediaTimingFunctionEaseOut];
    anima.delegate = self;//设置代理，可以检测动画的开始和结束
    [self.moveView.layer addAnimation:anima forKey:@"pathAnimation"];
    
//    UIView *keyPathAnimationView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
//    keyPathAnimationView.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:keyPathAnimationView];
//    //以position属性关键字作为keyPath
//    CAKeyframeAnimation *keyAimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    //设置动画改变的坐标值 如果calculationMode设置为kCAAnimationPaced或者kCAAnimationCubicPaced失效
//    keyAimation.values = @[[NSValue valueWithCGPoint:CGPointMake(20, 20)],[NSValue valueWithCGPoint:CGPointMake(60, 100)],[NSValue valueWithCGPoint:CGPointMake(300, 200)]];
//    //设置改变坐标值对应的时间
//    keyAimation.keyTimes = @[@(0.3),@(0.7),@(0.9)];
//    //设置计算动画的模式,有四种  默认值表示关键帧为坐标点时候直线相连kCAAnimationLinear、按照顺序kCAAnimationDiscrete 、动画均匀进行kCAAnimationPaced，keyTimes和timingFunctions不起作用、kCAAnimationCubic以坐标值为关键帧进行圆滑曲线相连，可以通过设置tension, continuity, and bias values的值调整定义。kCAAnimationCubicPaced在kCAAnimationPaced基础上圆滑动画
//    keyAimation.calculationMode = kCAAnimationCubicPaced;
//    //如果calculationMode设置为kCAAnimationPaced或者kCAAnimationCubicPaced失效
//    keyAimation.timingFunctions = @[kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionLinear,kCAMediaTimingFunctionEaseOut];
//    //动画时间
//    keyAimation.duration = 8;
//    //重复次数
//    keyAimation.repeatCount = MAXFLOAT;
//    [keyPathAnimationView.layer addAnimation:keyAimation forKey:nil];
}

@end
