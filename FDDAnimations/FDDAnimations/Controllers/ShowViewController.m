//
//  ShowViewController.m
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/20.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ShowViewController.h"
#import "FDDFireworksButton.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface ShowViewController ()
@property(nonatomic,strong)FDDFireworksButton *fireworksBut;
@property (nonatomic , assign) BOOL selected;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"实战演练";
    
    _fireworksBut = [[FDDFireworksButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-25, 50, 50)];
    _fireworksBut.particleScale = 0.05;
    _fireworksBut.particleScaleRange = 0.02;
    [_fireworksBut setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    
    [_fireworksBut addTarget:self action:@selector(handleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_fireworksBut];
}


- (void)handleButtonPress:(id)sender {
    _selected = !_selected;
    if(_selected) {
        _fireworksBut.particleImageName = [UIImage imageNamed:@"Sparkle"];
        [_fireworksBut touchOutsideWithDuration:0.5];
        [_fireworksBut setImage:[UIImage imageNamed:@"Like-Blue"] forState:UIControlStateNormal];
        [_fireworksBut startAnimate];
    }else {
        [_fireworksBut touchInsideWithDuration:0.4];
        [_fireworksBut setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    }
}

@end
