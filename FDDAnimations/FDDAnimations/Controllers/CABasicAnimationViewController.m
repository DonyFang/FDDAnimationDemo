//
//  CABasicAnimationViewController.m
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/19.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "CABasicAnimationViewController.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface CABasicAnimationViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *moveView;

@property (weak, nonatomic) IBOutlet UISlider *durationSlider;

@property (weak, nonatomic) IBOutlet UISlider *speedSlider;

@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self init_views];
}

- (void)init_views{
    self.navigationItem.title = @"CABasicAnimation";
    UIImage *image = [UIImage imageNamed:@"user.png"];
    self.moveView.layer.contents = (id) image.CGImage;
    self.moveView.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    
    self.speedSlider.minimumValue = 9;// 设置最小值
    self.speedSlider.maximumValue = 11;// 设置最大值
    self.speedSlider.value = (self.speedSlider.minimumValue + self.speedSlider.maximumValue) / 2;// 设置初始值
    self.speedSlider.continuous = YES;// 设置可连续变化
    //    slider.minimumTrackTintColor = [UIColor greenColor]; //滑轮左边颜色，如果设置了左边的图片就不会显示
    //    slider.maximumTrackTintColor = [UIColor redColor]; //滑轮右边颜色，如果设置了右边的图片就不会显示
    //    slider.thumbTintColor = [UIColor redColor];//设置了滑轮的颜色，如果设置了滑轮的样式图片就不会显示
    [self.speedSlider addTarget:self action:@selector(speedSliderValueChanged:) forControlEvents:UIControlEventValueChanged];// 针对值变化添加响应方法
    
    
    self.durationSlider.minimumValue = 0.1;
    
    self.durationSlider.maximumValue = 2.0;
    
    
    [self.durationSlider addTarget:self action:@selector(durationSliderValueChanged:) forControlEvents:UIControlEventValueChanged];// 针对值变化添加响应方法


}

- (void)speedSliderValueChanged:(UISlider *)slider{

//        slider.value =
}


- (void)durationSliderValueChanged:(UISlider *)slider{

    

}



- (IBAction)positionAnimationClick:(id)sender {
    
    // 指定position属性
    CABasicAnimation *animation =
    [CABasicAnimation animationWithKeyPath:@"position"];
    animation.delegate = self; // 指定委托对象

    animation.duration = self.durationSlider.value; // 动画持续时间
    animation.repeatCount = 1; // 不重复
    animation.beginTime = CACurrentMediaTime() + 2; // 2秒后执行
    animation.autoreverses = YES; // 动画结束时是否执行逆动画
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-75)];
    // 动画先加速后减速
    animation.timingFunction =
    [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    
    // 动画终了后不返回初始状态(removedOnCompletion,fillMode两个属性必须同时设置)
//    animation.removedOnCompletion = YES;
//    animation.fillMode = kCAFillModeForwards;
    
    //为Layer添加设置完成的动画，可以给Key指定任意名字。
    [self.moveView.layer addAnimation:animation forKey:@"positionAnimation"];
}


- (IBAction)scaleAnimationClick:(id)sender {
    
    // 设定为缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.delegate = self; // 指定委托对象

    // 动画选项设定
    animation.duration = 2.5; // 动画持续时间
    animation.repeatCount = 1; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:2.0]; // 结束时的倍率
    
    // 添加动画
    [self.moveView.layer addAnimation:animation forKey:@"scale-layer"];
    
    
    
}

//改变透明度
- (IBAction)opacityAnimationClick:(id)sender {
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue = [NSNumber numberWithFloat:0.2f];
    anima.delegate = self; // 指定委托对象

    anima.duration = 1.0f;
    [self.moveView.layer addAnimation:anima forKey:@"opacityAniamtion"];
    
}



- (IBAction)rotateAnimationClick:(id)sender {
    
    /* 旋转  方法一 */
    
    // 对Y轴进行旋转（指定Z轴的话，就和UIView的动画一样绕中心旋转）
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    // 设定动画选项
    animation.duration = self.durationSlider.value; // 持续时间
    animation.repeatCount = 1; // 重复次数
    animation.delegate = self; // 指定委托对象

    // 设定旋转角度
    animation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
    animation.toValue = [NSNumber numberWithFloat:22 * M_PI]; // 终止角度
    
    // 添加动画
    [self.moveView.layer addAnimation:animation forKey:@"rotate-layer"];
    
    
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
//    anima.toValue = [NSNumber numberWithFloat:M_PI];
//    anima.duration = 1.0f;
//    [self.moveView.layer addAnimation:anima forKey:@"rotateAnimation"];
//
    
    
        /* 旋转  方法二 */

        //valueWithCATransform3D作用与layer
//        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
//        anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];//绕着矢量（x,y,z）旋转
//        anima.duration = 1.0f;
//        //anima.repeatCount = MAXFLOAT;
//        [self.moveView.layer addAnimation:anima forKey:@"rotateAnimation"];
//    
//        //CGAffineTransform作用与View
//        self.moveView.transform = CGAffineTransformMakeRotation(0);
//        [UIView animateWithDuration:1.0f animations:^{
//            self.moveView.transform = CGAffineTransformMakeRotation(M_PI);
//        } completion:^(BOOL finished) {
//            
//        }];
    
}

- (IBAction)backGroundAnimationClick:(id)sender {
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue =(id) [UIColor redColor].CGColor;
    anima.duration = 1.0f;
    anima.delegate = self; // 指定委托对象

    [self.view.layer addAnimation:anima forKey:@"backgroundAnimation"];
}

- (IBAction)groupAnimationClick:(id)sender {
    
    /* 动画1（在X轴方向移动） */
    CABasicAnimation *animation1 =
    [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    // 终点设定
    animation1.toValue = [NSNumber numberWithFloat:80];; // 終点
    
    
    /* 动画2（绕Z轴中心旋转） */
    CABasicAnimation *animation2 =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    // 设定旋转角度
    animation2.fromValue = [NSNumber numberWithFloat:0.0]; // 开始时的角度
    animation2.toValue = [NSNumber numberWithFloat:44 * M_PI]; // 结束时的角度
    
    
    /* 动画组 */
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    // 动画选项设定
    group.duration = 3.0;
    group.repeatCount = 1;
    
    // 添加动画
    group.animations = [NSArray arrayWithObjects:animation1, animation2, nil,nil];
    [self.moveView.layer addAnimation:group forKey:@"move-rotate-layer"];
    
    
}



- (IBAction)durationSlider:(id)sender {
    
    
}

/**
 * 动画开始时
 */
- (void)animationDidStart:(CAAnimation *)theAnimation
{
    NSLog(@"begin");
}

/**
 * 动画结束时
 */
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    NSLog(@"end");
}

@end
