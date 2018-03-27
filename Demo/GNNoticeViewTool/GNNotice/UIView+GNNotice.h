//
//  UIView+GNNotice.h
//  ShangXiaApp
//
//  Created by mac on 2018/2/2.
//  Copyright © 2018年 ShangXiaWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GNNotice)
- (void)gn_showView:(UIView *)view;
- (void)gn_hideView;
// 简单封装下 让外界使用简便
- (void)hideNoticeView;
@end
