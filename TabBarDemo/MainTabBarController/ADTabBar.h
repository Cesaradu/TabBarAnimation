//
//  ADTabBar.h
//  TabBarDemo
//
//  Created by hztuen on 17/3/21.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADTabBar;

//因为ADTabBar继承自UITabBar
//所以成为ADTabBar的代理，也必须实现UITabBar的代理协议
@protocol ADTabBarDelegate <UITabBarDelegate>

- (void)tabBarDidClickCenterButton:(ADTabBar *)tabBar;

@end


@interface ADTabBar : UITabBar

@property (nonatomic, weak) id<ADTabBarDelegate> adDelegate;

@end
