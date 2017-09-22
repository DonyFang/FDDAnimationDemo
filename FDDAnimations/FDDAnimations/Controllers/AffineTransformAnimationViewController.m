//
//  AffineTransformAnimationViewController.m
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/20.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "AffineTransformAnimationViewController.h"

@interface AffineTransformAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *moveView;

@end

@implementation AffineTransformAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


}

- (IBAction)positionClick:(id)sender {
    self.moveView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        self.moveView.transform = CGAffineTransformMakeTranslation(100, 100);
    }];
}

- (IBAction)scaleClick:(id)sender {
    self.moveView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        self.moveView.transform = CGAffineTransformMakeScale(2, 2);
    }];
}


- (IBAction)rotateClick:(id)sender {
    
    self.moveView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        self.moveView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}


- (IBAction)groupeClick:(id)sender {
    
    //仿射变换的组合使用
    self.moveView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform transform2 = CGAffineTransformScale(transform1, 0.5, 0.5);
        self.moveView.transform = CGAffineTransformTranslate(transform2, 100, 100);
    }];
}


- (IBAction)invertClick:(id)sender {
    self.moveView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        //矩阵反转
        self.moveView.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(2, 2));
    }];
}


@end
