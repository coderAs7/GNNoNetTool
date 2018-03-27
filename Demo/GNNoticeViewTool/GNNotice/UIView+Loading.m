//
//  UIView+Loading.m
//  ShangXiaApp
//
//  Created by mac on 2018/3/21.
//  Copyright © 2018年 ShangXiaWang. All rights reserved.
//

#import "UIView+Loading.h"

@implementation UIView (Loading)
- (void)showLoadingNoticeView{
    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.5);
    [self showLoadingNoticeViewWithCenter:center];
}
- (void)showLoadingNoticeViewWithCenter:(CGPoint)center{
    // 修改这里,自定义你自己的展示view
    UIView *view = [self createLoadingView];
    view.center = center;
    [self gn_showView:view];
}

- (UIView *)createLoadingView{
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, 60, 50);
    
    view.backgroundColor = self.backgroundColor;
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]init];
    activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    activity.center = CGPointMake(30, 10);
    
    [view addSubview:activity];
    [activity startAnimating];
    
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:13];
    label.text = @"加载中...";
    [label sizeToFit];
    label.center = CGPointMake(30, 40);
    [view addSubview:label];
    return view;
}
@end
