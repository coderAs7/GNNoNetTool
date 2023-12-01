//
//  UIView+NoNet.m
//  GNNoticeViewTool
//
//  Created by mac on 2018/3/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIView+NoNet.h"

@implementation UIView (NoNet)
//- (void)showNoNetNoticeViewWithCenter:(id)target action:(SEL)action{
//    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.5);
//    [self showNoNetNoticeViewWithCenter:center target:target action:action];
//}
//- (void)showNoNetNoticeViewWithCenter:(CGPoint)center target:(id)target action:(SEL)action{
//    // 修改这里,自定义你自己的展示view
//    UIView *view = [self createViewWithCenter:target action:action];
//    view.center = center;
//    [self gn_showView:view];
//}


- (UIView *)gn_createViewWithCenter:(id)target action:(SEL)action{
    CGFloat width = [UIScreen mainScreen].bounds.size.width * 0.6;
    CGFloat height = 100;
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, width, height);

    view.backgroundColor = self.backgroundColor;
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]init];
    activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    activity.center = CGPointMake(30, 10);
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, width, 38);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor lightGrayColor];
    label.text = @"当前网络环境较差,请重新加载!";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, height - 38, width, 38);
    [btn setTitle:@"重新加载!" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor colorWithRed:209 / 255.0 green:109 / 255.0 blue:104 / 255.0 alpha:1]];
    btn.layer.cornerRadius = 3;
    btn.layer.masksToBounds = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:label];
    [view addSubview:btn];
    return view;
}

// al开头的方法内部使用了约束布局
/// 展示在中间,内部使用了约束布局,内部使用addSubView
- (void)gn_showNoNetNoticeViewWithTarget:(id)target action:(SEL)action{
    [self gn_showNoNetNoticeViewWithCenterOffset:CGPointZero target:target action:action atIndex:-1];
}
/// 展示在中间,内部使用了约束布局,传入-1时候,内部使用addSubView
- (void)gn_showNoNetNoticeViewWithTarget:(id)target action:(SEL)action atIndex:(NSInteger)index{
    [self gn_showNoNetNoticeViewWithCenterOffset:CGPointZero target:target action:action atIndex:index];
}
/// 展示在自定义的位置,相对于父控件的中心位置进行偏移,内部使用了约束,内部使用addSubView
- (void)gn_showNoNetNoticeViewWithCenterOffset:(CGPoint)offset target:(id)target action:(SEL)action{
    [self gn_showNoNetNoticeViewWithCenterOffset:offset target:target action:action atIndex:-1];
}
/// 展示在自定义的位置,相对于父控件的中心位置进行偏移,指定层级,内部使用了约束,内部使用addSubView
- (void)gn_showNoNetNoticeViewWithCenterOffset:(CGPoint)offset target:(id)target action:(SEL)action atIndex:(NSInteger)index{
    // 修改这里,自定义你自己的展示view
    UIView *view = [self gn_createViewWithCenter:target action:action];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self gn_showView:view atIndex:index];
    
    [view.widthAnchor constraintEqualToConstant:view.frame.size.width].active = YES;
    [view.heightAnchor constraintEqualToConstant:view.frame.size.height].active = YES;
    [view.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:offset.x].active = YES;
    [view.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:offset.y].active = YES;
}

@end
