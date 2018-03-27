//
//  UIView+Nodata.m
//  ShangXiaApp
//
//  Created by mac on 2018/2/2.
//  Copyright © 2018年 ShangXiaWang. All rights reserved.
//

#import "UIView+Nodata.h"


@implementation UIView (Nodata)

- (void)showNodataNoticeView{
    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.5);
    [self showNodataNoticeViewWithCenter:center];
}

- (void)showNodataNoticeViewWithCenter:(CGPoint)center{
    // 修改这里,自定义你自己的展示view
    UIView *imageView = [self createNodataView];
    imageView.center = center;
    [self gn_showView:imageView];
}


- (UIView *)createNodataView{
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"GNNotice.bundle/noData"];
    imageView.frame = CGRectMake(0, 0, 155, 163);
    imageView.backgroundColor = self.backgroundColor;
    return imageView;
}
@end
