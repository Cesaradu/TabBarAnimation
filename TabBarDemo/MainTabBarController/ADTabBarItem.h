//
//  ADTabBarItem.h
//  TabBarDemo
//
//  Created by hztuen on 2017/5/8.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADTabBarAnimationProtocol.h"
#import "TabBarItemAnimation.h"

@interface ADTabBarItem : UITabBarItem <ADTabBarAnimationProtocol>

@property (nonatomic, strong) TabBarItemAnimation *tabBarAnimation;

@end
