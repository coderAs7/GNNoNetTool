//
//  UIView+GNNotice.m
//  ShangXiaApp
//
//  Created by mac on 2018/2/2.
//  Copyright © 2018年 ShangXiaWang. All rights reserved.
//

#import "UIView+GNNotice.h"
#import <objc/runtime.h>
static const char *gn_noticeViewKey = "gn_noticeViewKey";

@implementation UIView (GNNotice)

- (void)gn_showView:(UIView *)view{
    [self gn_hideView];
    objc_setAssociatedObject(self, gn_noticeViewKey, view, OBJC_ASSOCIATION_ASSIGN);
    [self addSubview:view];
}

- (void)gn_hideView{
    UIView *view = objc_getAssociatedObject(self, gn_noticeViewKey);
    if (view) {
        [view removeFromSuperview];
        view = nil;
        objc_setAssociatedObject(self, gn_noticeViewKey, nil, OBJC_ASSOCIATION_ASSIGN);
    }
}
- (void)hideNoticeView{
    [self gn_hideView];
}
@end
