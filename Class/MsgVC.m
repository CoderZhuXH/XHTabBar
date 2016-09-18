//
//  MsgVC.m
//  XHTabBar-Demo
//
//  Created by xiaohui on 16/2/26.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "MsgVC.h"
#import "XHTabBar.h"
@interface MsgVC ()

@end

@implementation MsgVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
