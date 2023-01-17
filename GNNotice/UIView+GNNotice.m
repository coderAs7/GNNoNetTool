//
//  UIView+GNNotice.m
//  XXXXXXXXXX
//
//  Created by mac on 2018/2/2.
//  Copyright © 2018年 XXXXXXXXXX. All rights reserved.
//

#import "UIView+GNNotice.h"
#import <objc/runtime.h>
static const char *gn_noticeViewKey = "gn_noticeViewKey";
static const char *gn_lastShowingTipsViewKey = "gn_lastShowingTipsViewKey";
@implementation UIView (GNNotice)

- (void)gn_showView:(UIView *)view{
    [self gn_hideView];
    objc_setAssociatedObject(self, gn_noticeViewKey, view, OBJC_ASSOCIATION_ASSIGN);
    [self addSubview:view];
}

// -1 默认加到最顶层
- (void)gn_showView:(UIView *)view atIndex:(NSInteger)index{
    [self gn_hideView];
    objc_setAssociatedObject(self, gn_noticeViewKey, view, OBJC_ASSOCIATION_ASSIGN);
    if (index< 0) {
        [self addSubview:view];
    }else{
        [self insertSubview:view atIndex:index];
    }
    
}

- (void)gn_hideView{
    UIView *view = objc_getAssociatedObject(self, gn_noticeViewKey);
    if (view) {
        [view removeFromSuperview];
        view = nil;
        objc_setAssociatedObject(self, gn_noticeViewKey, nil, OBJC_ASSOCIATION_ASSIGN);
    }
}
- (void)gn_hideNoticeView{
    [self gn_hideView];
}


- (void)setGn_lastShowingTipsView:(UIView *)gn_lastShowingTipsView{
    objc_setAssociatedObject(self, gn_lastShowingTipsViewKey, gn_lastShowingTipsView, OBJC_ASSOCIATION_ASSIGN);
}

- (UIView *)gn_lastShowingTipsView{
    UIView *view = objc_getAssociatedObject(self, gn_lastShowingTipsViewKey);
    return view;
}
@end
