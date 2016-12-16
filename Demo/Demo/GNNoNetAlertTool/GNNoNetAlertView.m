//
//  GNNoNetAlertView.m
//  NoNetWorkTest
//
//  Created by ccd on 16/9/13.
//  Copyright © 2016年 com.checaiduo. All rights reserved.
//

#import "GNNoNetAlertView.h"
#import <objc/runtime.h>
#import <objc/message.h>

#define GNMsgSend(...) ((void (*)(void *, SEL, UIView *))objc_msgSend)(__VA_ARGS__)
#define GNMsgTarget(target) (__bridge void *)(target)


static const char *ccd_noNetAlertViewKey = "ccd_noNetAlertViewKey";

@interface GNNoNetAlertView ()

/**< 文字说明 */
@property (nonatomic, strong) UILabel *txtLabel;

/**< 点击的按钮 */
@property (nonatomic, strong) UIButton *button;

/** 回调对象 */
@property (weak, nonatomic) id target;
/** 回调方法 */
@property (assign, nonatomic) SEL action;

@end


@implementation GNNoNetAlertView
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.txtLabel];
        [self addSubview:self.button];
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120);
    }
    return self;
}

- (UILabel *)txtLabel
{
    if (!_txtLabel) {
        _txtLabel = [[UILabel alloc] init];
        _txtLabel.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 38);
        _txtLabel.backgroundColor = [UIColor clearColor];
        _txtLabel.textColor = [UIColor lightGrayColor];
        _txtLabel.text = GNNoNetDescText;
        _txtLabel.textAlignment = NSTextAlignmentCenter;
        _txtLabel.font = [UIFont systemFontOfSize:15];
    }
    return _txtLabel;
}

- (UIButton *)button
{
    if (!_button) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width * 0.6;
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0, width, 38);
        [_button setTitle:GNNoNetButtontitle forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        UIImage *normalImage = [UIImage imageNamed:@"GNNoNetAlertView.bundle/noNet"];
        normalImage = [normalImage stretchableImageWithLeftCapWidth:normalImage.size.width * 0.5 topCapHeight:normalImage.size.height * 0.5];
        
        UIImage *highlightedImage = [UIImage imageNamed:@"GNNoNetAlertView.bundle/noNetHL"];
        highlightedImage = [highlightedImage stretchableImageWithLeftCapWidth:highlightedImage.size.width * 0.5 topCapHeight:highlightedImage.size.height * 0.5];
        
        [_button setBackgroundImage:normalImage forState:UIControlStateNormal];
        [_button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
        _button.titleLabel.font = [UIFont systemFontOfSize:18];
        [_button addTarget:self
                    action:@selector(btnClick:)
          forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat contentHeight = self.txtLabel.frame.size.height + 10 + self.button.frame.size.height;
    
    //view在屏幕的位置(距离顶部位置)
    CGFloat topMargin = (self.bounds.size.height-contentHeight)/2 - 10;
    
    self.txtLabel.frame = CGRectMake((self.bounds.size.width-self.txtLabel.frame.size.width)/2, topMargin, self.txtLabel.frame.size.width, self.txtLabel.frame.size.height);
    self.button.frame = CGRectMake((self.bounds.size.width-self.button.frame.size.width)/2, self.txtLabel.frame.origin.y + self.txtLabel.frame.size.height+10, self.button.frame.size.width, self.button.frame.size.height);
}

- (void)btnClick:(UIButton *)sender
{
    if ([self.target respondsToSelector:self.action]) {
        GNMsgSend(GNMsgTarget(self.target), self.action, self);
    }
}

@end


@implementation UIView (GNNetworkError)

- (void)showNoNetAlertViewWithTarget:(id)target action:(SEL)action{

    CGPoint center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    [self showNoNetAlertViewWithBackgroundColor:[UIColor clearColor] WithPoint:center WithTarget:target action:action];
}
- (void)showNoNetAlertViewWithBackgroundColor:(UIColor *)backgroundColor WithPoint:(CGPoint)center WithTarget:(id)target action:(SEL)action
{
    GNNoNetAlertView *alertView = (GNNoNetAlertView *)[self getNoNetAlertView];
    alertView.center = center;
    alertView.backgroundColor = backgroundColor?backgroundColor:[UIColor clearColor];
    alertView.target = target;
    alertView.action = action;
    [self addSubview:alertView];
}

- (void)hideNoNetAlertView
{
    UIView *alertView = objc_getAssociatedObject(self, ccd_noNetAlertViewKey);
    if (alertView) {
        [alertView removeFromSuperview];
        alertView = nil;
        objc_setAssociatedObject(self, ccd_noNetAlertViewKey, nil, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (UIView *)getNoNetAlertView{
    UIView *alertView = objc_getAssociatedObject(self, ccd_noNetAlertViewKey);
    if (!alertView) {
        GNNoNetAlertView *view = [[GNNoNetAlertView alloc]init];
        objc_setAssociatedObject(self, ccd_noNetAlertViewKey, view, OBJC_ASSOCIATION_ASSIGN);
        alertView = view;
    }
    return alertView;
}

@end


