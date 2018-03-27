//
//  UIView+NoNet.h
//  GNNoticeViewTool
//
//  Created by mac on 2018/3/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+GNNotice.h"
/*
 你可以查看.m文件中的实现方式
 然后自定义自己的展示视图
 */
@interface UIView (NoNet)
- (void)showNoNetNoticeViewWithCenter:(CGPoint)center target:(id)target action:(SEL)action;
- (void)showNoNetNoticeViewWithCenter:(id)target action:(SEL)action;
@end
