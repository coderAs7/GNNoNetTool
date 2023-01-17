//
//  UIView+NoData.h
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
@interface UIView (NoData)
/// 展示在中间,内部使用了约束布局,内部使用addSubView
- (void)gn_showNoDataNoticeView;
/// 展示在中间,内部使用了约束布局,传入-1时候,内部使用addSubView
- (void)gn_showNoDataNoticeViewAtIndex:(NSInteger)index;
/// 展示在自定义的位置,相对于父控件的中心位置进行偏移,内部使用了约束,内部使用addSubView
- (void)gn_showNoDataNoticeViewWithCenterOffset:(CGPoint)offset;
/// 展示在自定义的位置,相对于父控件的中心位置进行偏移,指定层级,内部使用了约束,内部使用addSubView
- (void)gn_showNoDataNoticeViewWithCenterOffset:(CGPoint)offset atIndex:(NSInteger)index;
@end
