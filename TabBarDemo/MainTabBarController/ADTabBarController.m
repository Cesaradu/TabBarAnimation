//
//  ADTabBarController.m
//  TabBarDemo
//
//  Created by hztuen on 17/3/21.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import "ADTabBarController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "DynamicViewController.h"
#import "MessageViewController.h"
#import "UIColor+ColorHelper.h"
#import "ADTabBar.h"
#import "ADAnimationView.h"

#define SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)

@interface ADTabBarController () <ADTabBarDelegate>

@end

@implementation ADTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTabBar];
}

- (void)createTabBar {

    self.tabBar.tintColor = [UIColor whiteColor];
    
    //更换系统自带的tabbar
    ADTabBar *tabBar = [[ADTabBar alloc]init];
    tabBar.backgroundColor = [UIColor whiteColor];
    
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [tabBar setBackgroundImage:img];
    
    [tabBar setShadowImage:img];
    
    tabBar.adDelegate = self;
    //使用kvc，将自定义的tabbar替换掉系统的tabbar
    [self setValue:tabBar forKey:@"tabBar"];
    
    //tabbar加阴影
    [self dropShadowWithOffset:CGSizeMake(0, -1) radius:1 color:[UIColor grayColor] opacity:0.3];
    
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    DynamicViewController *dynamicVC = [[DynamicViewController alloc] init];
    MessageViewController *msgVC = [[MessageViewController alloc] init];
    MineViewController *mineVC = [[MineViewController alloc] init];
    
    NSMutableArray *controllerArray = [NSMutableArray arrayWithObjects:homeVC, dynamicVC, msgVC, mineVC, nil];
    
    NSArray *normalImageArray = @[@"tab-home_icon nor", @"tab-news_icon nor", @"tab-message_icon nor", @"tab-mine_icon nor"];
    NSArray *selectedImageArray = @[@"tab-home_icon sel", @"tab-news_icon sel", @"tab-message_icon sel", @"tab-mine_icon sel"];
    NSArray *titleArray = @[@"首页", @"动态", @"信息", @"我的"];
    for (int  i = 0; i < controllerArray.count; i++)
    {
        // 分别找到每个视图控制器
        UIViewController *vc        = controllerArray[i];
        // 添加标题
        vc.title                    = titleArray[i];
        // 转化成导航控制器
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
        // 将数组array中的视图控制器替换成导航控制器
        [controllerArray replaceObjectAtIndex:i withObject:navi];
        
        // 渲染模式
        UIImage *normalImage = [UIImage imageNamed:normalImageArray[i]];
        UIImage *selectImage = [UIImage imageNamed:selectedImageArray[i]];
        
        navi.tabBarItem.image         = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navi.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        //tabbar文字字体颜色
        [navi.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"474747" alpha:1.0]} forState:UIControlStateSelected];
        
        //文字位置
        [navi.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
        
    }
    self.viewControllers = controllerArray;
}

//tabbar加阴影
- (void)dropShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color opacity:(CGFloat)opacity
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.tabBar.bounds);
    self.tabBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.tabBar.layer.shadowColor = color.CGColor;
    self.tabBar.layer.shadowOffset = offset;
    self.tabBar.layer.shadowRadius = radius;
    self.tabBar.layer.shadowOpacity = opacity;
    
    self.tabBar.clipsToBounds = NO;
}


#pragma mark - ADTabBarDelegate
- (void)tabBarDidClickCenterButton:(ADTabBar *)tabBar
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    ADAnimationView *adView = [[ADAnimationView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [window addSubview:adView];
    [adView showButtonAnimation];
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
