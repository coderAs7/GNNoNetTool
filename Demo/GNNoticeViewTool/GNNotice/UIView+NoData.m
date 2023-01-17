//
//  UIView+NoData.m
//  ShangXiaApp
//
//  Created by mac on 2018/2/2.
//  Copyright © 2018年 ShangXiaWang. All rights reserved.
//

#import "UIView+NoData.h"


@implementation UIView (NoData)

- (UIView *)gn_createNoDataView{
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"GNNotice.bundle/noData"];
    imageView.frame = CGRectMake(0, 0, 155, 163);
    imageView.backgroundColor = self.backgroundColor;
    return imageView;
}

/// 展示在中间,内部使用了约束布局
- (void)gn_showNoDataNoticeView{
    [self gn_showNoDataNoticeViewWithCenterOffset:CGPointZero atIndex:-1];
}
- (void)gn_showNoDataNoticeViewAtIndex:(NSInteger)index{
    [self gn_showNoDataNoticeViewWithCenterOffset:CGPointZero atIndex:index];
}
/// 展示在自定义的位置,相对于父控件的中心位置进行偏移,内部使用了约束,内部使用addSubView
- (void)gn_showNoDataNoticeViewWithCenterOffset:(CGPoint)offset{
    [self gn_showNoDataNoticeViewWithCenterOffset:offset atIndex:-1];
}
/// 展示在自定义的位置,相对于父控件的中心位置进行偏移,指定层级,内部使用了约束,内部使用addSubView
- (void)gn_showNoDataNoticeViewWithCenterOffset:(CGPoint)offset atIndex:(NSInteger)index{
    // 修改这里,自定义你自己的展示view
    UIView *imageView = [self gn_createNoDataView];
    [self gn_showView:imageView atIndex:index];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:offset.x].active = YES;
    [imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:offset.y].active = YES;
    [imageView.widthAnchor constraintEqualToConstant:imageView.frame.size.width].active = YES;
    [imageView.heightAnchor constraintEqualToConstant:imageView.frame.size.height].active = YES;
}

@end
