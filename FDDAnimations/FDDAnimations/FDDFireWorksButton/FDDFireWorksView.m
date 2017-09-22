//
//  FDDFireWorksView.m
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/20.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "FDDFireWorksView.h"

@interface FDDFireWorksView ()
@property(nonatomic,strong)CAEmitterLayer *explosionLayer;

@property (strong, nonatomic) NSArray *emitterCells;

@end

@implementation FDDFireWorksView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    self.clipsToBounds = NO;

    self.userInteractionEnabled = NO;

    CAEmitterCell *emittercells = [CAEmitterCell emitterCell];
    
    emittercells.name = @"explosion";//name： 这个是当Cell存在caeEmitter 的emitterCells中用来辨认的。用到setValue forKeyPath比较有用；
    emittercells.alphaRange = 0.20;
    emittercells.alphaSpeed = -1.0;
    //contents：和CALayer一样，只是用来设置图片
    emittercells.lifetime = 0.7;//表示Cell的生命周期
    emittercells.lifetimeRange = 0.3;//生命周期范围
    emittercells.birthRate = 0;//1.birthRate:出生率，顾名思义没有这个也就没有CAEmitterCell，这个必须要设置，具体含义是每秒某个点产生的Cell数量；
    emittercells.velocity = 40.00;//速度；
    emittercells.velocityRange = 10.00;//速度范围；
    
    
     self.explosionLayer = [CAEmitterLayer layer];
    _explosionLayer.name = @"emitterLayer";
    _explosionLayer.emitterShape = kCAEmitterLayerSphere;//emitterShape是粒子从什么形状发射出来，它并不是表示粒子自己的形状,
    _explosionLayer.emitterMode = kCAEmitterLayerOutline;//emitterMode 决定了粒子的发射模式。
    _explosionLayer.emitterSize = CGSizeMake(25, 0);//emitterSize则决定了粒子发射形状的大小
    _explosionLayer.renderMode = kCAEmitterLayerOldestFirst;
    _explosionLayer.emitterCells = @[emittercells];
    _explosionLayer.masksToBounds = NO;
    _explosionLayer.seed = 11111;
    [self.layer addSublayer:_explosionLayer];

    self.emitterCells = @[emittercells];

}

- (void)startAnimate{
    [self performSelector:@selector(explode) withObject:nil afterDelay:0.2];
}
#pragma mark---- privateMethod
- (void)explode {
    self.explosionLayer.beginTime = CACurrentMediaTime();
    [self.explosionLayer setValue:@500 forKeyPath:@"emitterCells.explosion.birthRate"];
    [self performSelector:@selector(stop) withObject:nil afterDelay:0.1];
}

- (void)stop {
    [self.explosionLayer setValue:@0 forKeyPath:@"emitterCells.explosion.birthRate"];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    self.explosionLayer.emitterPosition = center;
    
}

#pragma mark---- setMethod
- (void)setParticleScale:(CGFloat)particleScale{
    _particleScale = particleScale;
    for (CAEmitterCell *cell in self.emitterCells) {
        cell.scale = particleScale;
    }

}

- (void)setParticleScaleRange:(CGFloat)particleScaleRange{
    _particleScaleRange = particleScaleRange;
    for (CAEmitterCell *cell in self.emitterCells) {
        cell.scaleRange = particleScaleRange;
    }
}

- (void)setParticleImageName:(UIImage *)particleImageName{
    _particleImageName = particleImageName;
    for (CAEmitterCell *cell in self.emitterCells) {
        cell.contents = (id)[particleImageName CGImage];
    }
}

@end
