//
//  AnimationFactory.h
//  TabBarDemo
//
//  Created by hztuen on 2017/5/8.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationType.h"

@class TabBarItemAnimation;
@interface AnimationFactory : NSObject

+ (TabBarItemAnimation *)animationWithType:(AnimationType)type;

@end
