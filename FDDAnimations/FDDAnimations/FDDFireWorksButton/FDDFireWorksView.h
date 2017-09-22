//
//  FDDFireWorksView.h
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/20.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDDFireWorksView : UIView

/**
 开始执行动画
 */
- (void)startAnimate;

/**
 发射粒子的比例
 */
@property(nonatomic,assign)CGFloat particleScale;


/**
 粒子显示的范围
 */
@property(nonatomic,assign)CGFloat particleScaleRange;

/**
 粒子图片名称
 */
@property(nonatomic,strong)UIImage *particleImageName;
@end
