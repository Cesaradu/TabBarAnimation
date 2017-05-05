//
//  SecondViewController.m
//  TabBarDemo
//
//  Created by hztuen on 2017/5/5.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, 44, 44)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setBackgroundColor:[UIColor grayColor]];
    [backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

- (void)clickBackBtn {
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
