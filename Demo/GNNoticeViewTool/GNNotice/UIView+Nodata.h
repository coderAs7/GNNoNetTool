//
//  UIView+Nodata.h
//  ShangXiaApp
//
//  Created by mac on 2018/2/2.
//  Copyright © 2018年 ShangXiaWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+GNNotice.h"
/*
 你可以查看.m文件中的实现方式
 然后自定义自己的展示视图
 */
@interface UIView (Nodata)
- (void)showNodataNoticeView;
- (void)showNodataNoticeViewWithCenter:(CGPoint)center;
@end
