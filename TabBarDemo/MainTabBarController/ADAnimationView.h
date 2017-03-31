//
//  ADAnimationView.h
//  TabBarDemo
//
//  Created by hztuen on 17/3/21.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADAnimationView : UIView

@property (nonatomic, strong) UIButton *bgBtn; //透明背景

@property (nonatomic, strong) UIButton *button1;

@property (nonatomic, strong) UIButton *button2;

@property (nonatomic, strong) UIButton *button3;

@property (nonatomic, strong) UIButton *button4;

@property (nonatomic, strong) UIButton *cancelBtn; //取消按钮

-(void)showButtonAnimation;  //底部弹出button动画
-(void)hideMoreButtonAnmation;  //隐藏动画

@end
