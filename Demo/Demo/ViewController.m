//
//  ViewController.m
//  Demo
//
//  Created by ccd on 16/12/16.
//  Copyright © 2016年 ccd. All rights reserved.
//

#import "ViewController.h"
#import "GNNoNetAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showNoNet:(id)sender {
    [self.view showNoNetAlertViewWithTarget:self action:@selector(loadNewData)];
}
- (IBAction)hideNoNet:(id)sender {
    [self.view hideNoNetAlertView];
}
- (void)loadNewData{
    NSLog(@"loadNewData");
}
@end
