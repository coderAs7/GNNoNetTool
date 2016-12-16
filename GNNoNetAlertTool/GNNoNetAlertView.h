//
//  GNNoNetAlertView.h
//  NoNetWorkTest
//
//  Created by ccd on 16/9/13.
//  Copyright © 2016年 com.checaiduo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GNNoNetDescText  @"当前网络环境较差,请重新加载!"
#define GNNoNetButtontitle  @"重新加载!"

typedef void (^NetTipBlock)(void);



@interface GNNoNetAlertView : UIView


/**< 点击按钮的回调 */
@property (nonatomic,copy) NetTipBlock toDoBlock;

@end



@interface UIView (GNNetworkError)
- (void)showNoNetAlertViewWithTarget:(id)target action:(SEL)action;
- (void)showNoNetAlertViewWithBackgroundColor:(UIColor *)backgroundColor WithPoint:(CGPoint)center WithTarget:(id)target action:(SEL)action;
- (void)hideNoNetAlertView;

@end
