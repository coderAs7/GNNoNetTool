//
//  UIView+Loading.m
//  ShangXiaApp
//
//  Created by mac on 2018/3/21.
//  Copyright © 2018年 ShangXiaWang. All rights reserved.
//

#import "UIView+Loading.h"

@implementation UIView (Loading)
- (UIView *)gn_createLoadingView{
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

/// 展示在中间,内部使用了约束布局,内部使用addSubView
- (void)gn_showLoadingNoticeView{
    [self gn_showLoadingNoticeViewWithCenterOffset:CGPointZero atIndex:-1];
}
/// 展示在中间,内部使用了约束布局,传入-1时候,内部使用addSubView
- (void)gn_showLoadingNoticeViewAtIndex:(NSInteger)index{
    [self gn_showLoadingNoticeViewWithCenterOffset:CGPointZero atIndex:index];
}
/// 展示在自定义的位置,相对于父控件的中心位置进行偏移,内部使用了约束,内部使用addSubView
- (void)gn_showLoadingNoticeViewWithCenterOffset:(CGPoint)offset{
    [self gn_showLoadingNoticeViewWithCenterOffset:offset atIndex:-1];
}
/// 展示在自定义的位置,相对于父控件的中心位置进行偏移,指定层级,内部使用了约束,内部使用addSubView
- (void)gn_showLoadingNoticeViewWithCenterOffset:(CGPoint)offset atIndex:(NSInteger)index{
    // 修改这里,自定义你自己的展示view
    UIView *imageView = [self gn_createLoadingView];
    [self gn_showView:imageView atIndex:index];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:offset.x].active = YES;
    [imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:offset.y].active = YES;
    [imageView.widthAnchor constraintEqualToConstant:imageView.frame.size.width].active  = YES;
    [imageView.heightAnchor constraintEqualToConstant:imageView.frame.size.height].active  = YES;
}

@end
