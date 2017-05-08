//
//  AnimationFactory.m
//  TabBarDemo
//
//  Created by hztuen on 2017/5/8.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import "AnimationFactory.h"
#import "JelloAnimation.h"

@implementation AnimationFactory

+ (TabBarItemAnimation *)animationWithType:(AnimationType)type {
    switch (type) {
        case JelloAnima:
            return [JelloAnimation new];
            break;
            
        default:
            break;
    }
    
    return nil;
}
@end
