//
//  ADTabBar.m
//  TabBarDemo
//
//  Created by hztuen on 17/3/21.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import "ADTabBar.h"

@interface ADTabBar ()

@property (nonatomic, strong) UIButton *centerBtn;

@end

@implementation ADTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //添加一个按钮到tabBar中
        self.centerBtn = [[UIButton alloc] init];
        self.centerBtn.adjustsImageWhenHighlighted = NO;//取消按钮的选中阴影效果
        [self.centerBtn setBackgroundImage:[UIImage imageNamed:@"tab-logo_icon"] forState:UIControlStateNormal];
        CGRect frame = CGRectZero;
        frame.size = self.centerBtn.currentBackgroundImage.size;
        self.centerBtn.frame = CGRectMake(0, 0, 55, 63);
        
        //为按钮添加点击事件
        [self.centerBtn addTarget:self action:@selector(centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.centerBtn];
    }
    return self;
}

//重写方法，调整tabbar中包含的5个按钮的位置
- (void)layoutSubviews
{
    //一定要调用父类原有的布局方法，在这个基础上
    //再来调整5个按钮的位置
    [super layoutSubviews];
    
    //1.设置中间按钮的位置
    CGPoint center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5-7);
    self.centerBtn.center = center;
    
    //2.设置其他tabBarItem的位置和尺寸
    CGFloat tabBarButtonW = self.bounds.size.width / 5;
    
    CGFloat buttonIndex = 0;
    //遍历tabBar中的所有子视图
    //只有当遍历到的子视图的类型是UITabBarButton
    //时，才代表找到的其他按钮，调整位置即可
    for (UIView *child in self.subviews) {
        //获取UITabBarButton的类型描述信息
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            CGRect frame = child.frame;
            //设置宽度
            frame.size.width = tabBarButtonW;
            //设置横向x
            frame.origin.x = tabBarButtonW * buttonIndex;
            
            child.frame = frame;
            
            buttonIndex++;
            if (buttonIndex==2) {
                buttonIndex++;
            }
        }
    }
    
}

//点击中间按钮的响应
-(void)centerButtonClick
{
    [self.adDelegate tabBarDidClickCenterButton:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
