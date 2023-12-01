//
//  UIView+GNNotice.h
//  XXXXXXXXXX
//
//  Created by mac on 2018/2/2.
//  Copyright © 2018年 XXXXXXXXXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GNNotice)
//- (void)gn_showView:(UIView *)view;

// 负数 默认加到最顶层
- (void)gn_showView:(UIView *)view atIndex:(NSInteger)index;

- (void)gn_hideView;

// 简单封装下 让外界使用简便
- (void)gn_hideNoticeView;

@property (weak, nonatomic) UIView *gn_lastShowingTipsView;
@end
