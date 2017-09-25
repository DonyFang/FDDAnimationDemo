//
//  ViewController.m
//  FDDAnimations
//
//  Created by 方冬冬 on 2017/9/19.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ViewController.h"
#import "CABasicAnimationViewController.h"
#import "CAKeyframeAnimationViewController.h"
#import "CATransitionViewController.h"
#import "AffineTransformAnimationViewController.h"
#import "ShowViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTable;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self init_views];
    
}

- (void)init_views{
    self.navigationItem.title = @"动画集合";
    self.mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.mainTable];
    self.mainTable.delegate = self;
    
    self.mainTable.dataSource = self;
}

#pragma mark----tableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"CABasicAnimation";
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"CAKeyframeAnimationViewController";
        
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"CATransitionViewController";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"AffineTransformAnimationViewController";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"动画实例";
        
    }
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        CABasicAnimationViewController *basicVC = [[CABasicAnimationViewController alloc] init];
        [self.navigationController pushViewController:basicVC animated:YES];
    }else if (indexPath.row == 1){
        
        CAKeyframeAnimationViewController *animaVC = [[CAKeyframeAnimationViewController alloc] init];
        [self.navigationController pushViewController:animaVC animated:YES];

    }else if (indexPath.row == 2){
        
        CATransitionViewController *animaVC = [[CATransitionViewController alloc] init];
        [self.navigationController pushViewController:animaVC animated:YES];
        
    }else if (indexPath.row == 3){
    
        AffineTransformAnimationViewController *affineVC = [[AffineTransformAnimationViewController alloc] init];
        [self.navigationController pushViewController:affineVC animated:YES];
        
    }else if (indexPath.row == 4){
        ShowViewController *showVC = [[ShowViewController alloc] init];
        [self.navigationController pushViewController:showVC animated:YES];
    
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}


@end
