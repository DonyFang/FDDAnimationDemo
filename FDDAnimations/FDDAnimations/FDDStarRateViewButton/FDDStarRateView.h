//
//  FDDStarRateView.h
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/25.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FDDStarRateView;

typedef NS_ENUM(NSInteger, StarStyle)
{
    WholeStar = 0, //只能整星评论
    HalfStar = 1,  //允许半星评论
    IncompleteStar = 2  //允许不完整星评论
};

@protocol FDDStarRateViewDelegate <NSObject>
@optional
- (void)starRateView:(FDDStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent;
@end

@interface FDDStarRateView : UIView
@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0--1，默认为1
@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画，默认为NO

/**
 星星的类型
 */
@property(nonatomic,assign)StarStyle starStyle;


@property (nonatomic, weak) id<FDDStarRateViewDelegate>delegate;

/**
 
 init
 @param frame frame
 @param numberOfStars numberOfStars
 @param style style
 @return instance
 */
- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars starStyle:(StarStyle)style;

@end
