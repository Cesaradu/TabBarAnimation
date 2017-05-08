//
//  TabBarItemAnimation.h
//  TabBarDemo
//
//  Created by hztuen on 2017/5/8.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADTabBarAnimationProtocol.h"

@interface TabBarItemAnimation : NSObject <ADTabBarAnimationProtocol>

@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, strong) UIColor *textSelectedColor;
@property (nonatomic, strong) UIColor *iconSelectedColor;
@property (nonatomic, strong) UIColor *defaultTextColor;

@end
