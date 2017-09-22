//
//  CATransitionViewController.m
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/20.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()
@property (weak, nonatomic) IBOutlet UIView *moveView;
@property (nonatomic , assign) NSInteger index;

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _index = 0;
//    self.navigationItem.title = @"CATransitionAnimation";
//    UIImage *image = [UIImage imageNamed:@"beauty.png"];
//    self.moveView.layer.contents = (id) image.CGImage;
    
    [self changeViewColor:YES];
}

- (IBAction)rippleClick:(id)sender {
    
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"rippleEffect";//设置动画的类型
    anima.subtype = kCATransitionFromBottom; //设置动画的方向
    anima.duration = 1.0f;
    
    [self.moveView.layer addAnimation:anima forKey:@"rippleEffectAnimation"];
}


- (IBAction)fadeAnimationClick:(id)sender {
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.startProgress = 0.3;//设置动画起点
    anima.endProgress = 0.8;//设置动画终点
    anima.duration = 1.0f;
    
    [self.moveView.layer addAnimation:anima forKey:@"fadeAnimation"];
}
- (IBAction)cubeAnimationClick:(id)sender {
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [self.moveView.layer addAnimation:anima forKey:@"revealAnimation"];
    
    
}

- (IBAction)uncurlAnimationClick:(id)sender {
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageUnCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [self.moveView.layer addAnimation:anima forKey:@"pageUnCurlAnimation"];

}

- (IBAction)curlClick:(id)sender {
    
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [self.moveView.layer addAnimation:anima forKey:@"pageCurlAnimation"];
}


- (IBAction)caopenClick:(id)sender {
    
    
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowOpen";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self.moveView.layer addAnimation:anima forKey:@"cameraIrisHollowOpenAnimation"];
}


- (IBAction)caCloseClick:(id)sender {
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowClose";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [self.moveView.layer addAnimation:anima forKey:@"cameraIrisHollowCloseAnimation"];
}

- (IBAction)moveinClick:(id)sender {
    
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionMoveIn;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [self.moveView.layer addAnimation:anima forKey:@"moveInAnimation"];
}

- (IBAction)revealClick:(id)sender {
    
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionReveal;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [self.moveView.layer addAnimation:anima forKey:@"revealAnimation"];
}

- (IBAction)oglflipClick:(id)sender {
    
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"oglFlip";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self.moveView.layer addAnimation:anima forKey:@"oglFlipAnimation"];
}

- (IBAction)suckClick:(id)sender {
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"suckEffect";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [self.moveView.layer addAnimation:anima forKey:@"suckEffectAnimation"];
    
}


- (IBAction)pushClick:(id)sender {
    
    [self changeViewColor:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionPush;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self.moveView.layer addAnimation:anima forKey:@"pushAnimation"];
}


/**
 *   设置view的值
 */
-(void)changeViewColor : (BOOL)isUp{
    if (_index>3) {
        _index = 0;
    }
    if (_index<0) {
        _index = 3;
    }
    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor], nil];
    self.moveView.backgroundColor = [colors objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
}

@end
