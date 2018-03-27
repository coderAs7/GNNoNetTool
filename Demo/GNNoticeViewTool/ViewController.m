//
//  ViewController.m
//  GNNoticeViewTool
//
//  Created by mac on 2018/3/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "GNNotice.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)showNoNet:(id)sender {
    [self.view showNoNetNoticeViewWithCenter:self action:@selector(showLoading:)];
}
- (IBAction)showNoData:(id)sender {
    [self.view showNodataNoticeView];
}
- (IBAction)hideNoticeView:(id)sender {
    [self.view hideNoticeView];
}
- (IBAction)showLoading:(id)sender {
    [self.view showLoadingNoticeView];
}


@end
