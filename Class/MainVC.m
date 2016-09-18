//
//  MainVC.m
//  XHTabBar-Demo
//
//  Created by xiaohui on 16/2/26.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "MainVC.h"
#import "MsgVC.h"
@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
     self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self initUI];
    
    // Do any additional setup after loading the view.
}
-(void)initUI
{
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.backgroundColor = [UIColor orangeColor];
    [pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    pushBtn.frame = CGRectMake(self.view.frame.size.width/2.0-40.0, self.view.frame.size.height/2.0-20.0, 80.0, 40.0);
    [pushBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}
-(void)push
{
    MsgVC *VC = [[MsgVC alloc] init];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
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
