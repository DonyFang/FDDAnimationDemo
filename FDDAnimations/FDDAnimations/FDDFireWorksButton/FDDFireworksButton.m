//
//  FDDFireworksButton.m
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/20.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "FDDFireworksButton.h"
#import "FDDFireWorksView.h"
@interface FDDFireworksButton()

@property(nonatomic,strong)FDDFireWorksView *fireWorksView;

@end

@implementation FDDFireworksButton


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.fireWorksView.frame = self.bounds;

    [self insertSubview:self.fireWorksView atIndex:0];

}

- (void)startAnimate{
    [self.fireWorksView startAnimate];
}


- (void)setUp{
    self.clipsToBounds = NO;
    self.fireWorksView = [[FDDFireWorksView alloc] init];

    [self insertSubview:self.fireWorksView atIndex:0];
    
    [self.fireWorksView startAnimate];
    
}
- (void)touchInsideWithDuration:(NSTimeInterval)time{
    
    __weak typeof(self) weakSelf = self;
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:time delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 2.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/2.0 relativeDuration:1/2.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:nil];
}

- (void)touchOutsideWithDuration:(NSTimeInterval)time{
    __weak typeof(self) weakSelf = self;
    self.transform = CGAffineTransformIdentity;
    //frameStartTime:当前帧动画开始的时间 = 第几个帧/动画的总时长。
    //    relativeDuration一帧的时长 = 总帧数 / 总时长。
    [UIView animateKeyframesWithDuration:time delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:nil];
}


- (void)setParticleImageName:(UIImage *)particleImageName{
    self.fireWorksView.particleImageName =particleImageName;
}


- (UIImage *)particleImageName{
    return self.fireWorksView.particleImageName;
}

- (void)setParticleScaleRange:(CGFloat)particleScaleRange{

    self.fireWorksView.particleScaleRange = particleScaleRange;
}

- (CGFloat)particleScaleRange{
    return self.fireWorksView.particleScaleRange;
}

- (void)setParticleScale:(CGFloat)particleScale{
    self.fireWorksView.particleScale = particleScale;
}

- (CGFloat)particleScale{
    return self.fireWorksView.particleScale;
}
@end
