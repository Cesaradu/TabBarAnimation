//
//  ADTabBarItem.m
//  TabBarDemo
//
//  Created by hztuen on 2017/5/8.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import "ADTabBarItem.h"

#define TabBarButtonImageRatio 0.6

@implementation ADTabBarItem

-(void)playAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle {
    assert(self.tabBarAnimation != nil);
    [self.tabBarAnimation playAnimation:barIcon textLabel:barTitle];
}
-(void)selectedState:(UIImageView *)barIcon textLabel:(UILabel *)barTitle {
    assert(self.tabBarAnimation != nil);
    [self.tabBarAnimation selectedState:barIcon textLabel:barTitle];
}
-(void)deselectAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle {
    assert(self.tabBarAnimation != nil);
    [self.tabBarAnimation deselectAnimation:barIcon textLabel:barTitle];
}

@end
