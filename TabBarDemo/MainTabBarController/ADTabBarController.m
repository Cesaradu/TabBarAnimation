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
#import "SecondViewController.h"
#import "AnimationFactory.h"
#import "ADTabBarItem.h"
#import "ADTabBarSource.h"

#define SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)

@interface ADTabBarController () <ADTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *chiledViewControllers;
@property (nonatomic, strong) NSMutableArray *barImageArr;
@property (nonatomic, strong) NSMutableArray *barTitleArr;
@property (nonatomic, strong) ADTabBar *adTabBar;

@end

@implementation ADTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self createTabBar];
}

- (void)initData {
    self.adTabBar = [[ADTabBar alloc] init];
    self.chiledViewControllers = [NSMutableArray new];
    self.barImageArr = [NSMutableArray new];
    self.barTitleArr = [NSMutableArray new];
}

- (void)createTabBar {

    self.tabBar.tintColor = [UIColor whiteColor];
    
    //更换系统自带的tabbar
    self.adTabBar.backgroundColor = [UIColor whiteColor];
    
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.adTabBar setBackgroundImage:img];
    
    [self.adTabBar setShadowImage:img];
    
    self.adTabBar.adDelegate = self;
    //使用kvc，将自定义的tabbar替换掉系统的tabbar
    [self setValue:self.adTabBar forKey:@"tabBar"];
    
    //tabbar加阴影
    [self dropShadowWithOffset:CGSizeMake(0, -1) radius:1 color:[UIColor grayColor] opacity:0.3];
    
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    DynamicViewController *dynamicVC = [[DynamicViewController alloc] init];
    MessageViewController *msgVC = [[MessageViewController alloc] init];
    MineViewController *mineVC = [[MineViewController alloc] init];
    
    NSMutableArray *controllerArray = [NSMutableArray arrayWithObjects:homeVC, dynamicVC, msgVC, mineVC, nil];
    NSMutableArray *normalImageArray = [NSMutableArray arrayWithArray:@[@"tab-home_icon nor", @"tab-news_icon nor", @"tab-message_icon nor", @"tab-mine_icon nor"]];
    NSMutableArray *selectedImageArray = [NSMutableArray arrayWithArray:@[@"tab-home_icon sel", @"tab-news_icon sel", @"tab-message_icon sel", @"tab-mine_icon sel"]];
    NSMutableArray *titleArray = [NSMutableArray arrayWithArray:@[@"首页", @"动态", @"信息", @"我的"]];
    for (int  i = 0; i < controllerArray.count; i++)
    {
        // 分别找到每个视图控制器
        UIViewController *vc        = controllerArray[i];
        // 添加标题
        vc.title                    = titleArray[i];
        
        // 渲染模式
        UIImage *normalImage = [UIImage imageNamed:normalImageArray[i]];
        UIImage *selectImage = [UIImage imageNamed:selectedImageArray[i]];
        
        vc.tabBarItem.image         = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        //tabbar文字字体颜色
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"474747" alpha:1.0]} forState:UIControlStateSelected];
        
        //文字位置
        [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
        
    }
    self.viewControllers = controllerArray;
    
    ADTabBarSource *dataSource = [[ADTabBarSource alloc]init];
    dataSource.titleArr = titleArray;
    dataSource.viewControllers = controllerArray;
    dataSource.normalImageArr = normalImageArray;
    dataSource.selectImageArr = selectedImageArray;
    [self tabBarSetDataSource:dataSource];
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

/**
 给Tabbar赋值：image、title、viewController
 
 @param dataSoucre 数据源
 */
- (void)tabBarSetDataSource:(ADTabBarSource *)dataSoucre {
    for (int  i = 0; i < dataSoucre.viewControllers.count; i++) {
        NSString *title = dataSoucre.titleArr[i];
        UIImage *normalImage = [UIImage imageNamed:dataSoucre.normalImageArr[i]];
        UIImage *selectImage = [UIImage imageNamed:dataSoucre.selectImageArr[i]];
        UIViewController *viewController = dataSoucre.viewControllers[i];
        viewController.title = dataSoucre.titleArr[i];
        [self setupOnChildViewController:viewController title:title normalImage:normalImage selectImage:selectImage tag:i];
    }
    self.viewControllers = self.chiledViewControllers;
    self.adTabBar.dataSource = self.viewControllers;
    [self.adTabBar setNeedsLayout];
    for (UIControl *tabbarButton in self.adTabBar.subviews) {
        if ([tabbarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIView *barSubView in tabbarButton.subviews) {
                if ([barSubView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [self.barImageArr addObject:barSubView];
                }
                if ([barSubView isKindOfClass:[UILabel class]]) {
                    [self.barTitleArr addObject:barSubView];
                }
            }
        }
    }
}

/**
 修改TabBarItem 属性 以及给TabBarItem赋数据 添加tabbar动画效果
 
 @param chiledVC 子视图
 @param title title
 @param normalImage 默认图
 @param selectImage 选中图
 */
- (void)setupOnChildViewController:(UIViewController *)chiledVC title:(NSString *)title normalImage:(UIImage *)normalImage selectImage:(UIImage *)selectImage tag:(NSInteger)tag {
    ADTabBarItem *barItem = [[ADTabBarItem alloc]init];
    barItem.title = title;
    barItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    barItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    barItem.tag = tag;
    barItem.tabBarAnimation = [AnimationFactory animationWithType:JelloAnima];
    [barItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateSelected];
    chiledVC.tabBarItem = barItem;
    [self.chiledViewControllers addObject:chiledVC];
}

/**
 点击TabBarItem代理
 
 @param tabBar tabBar
 @param item 当前点击Item
 */
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    ADTabBarItem *nowItem = (ADTabBarItem *)item;
    if (nowItem.tag != self.adTabBar.seleItem.tag) {
        [nowItem playAnimation:[self.barImageArr objectAtIndex:nowItem.tag] textLabel:[self.barTitleArr objectAtIndex:nowItem.tag]];
        [self.adTabBar.seleItem deselectAnimation:[self.barImageArr objectAtIndex:self.adTabBar.seleItem.tag] textLabel:[self.barTitleArr objectAtIndex:self.adTabBar.seleItem.tag]];
        self.adTabBar.seleItem = nowItem;
    }else{
        [nowItem selectedState:[self.barImageArr objectAtIndex:nowItem.tag] textLabel:[self.barTitleArr objectAtIndex:nowItem.tag]];
    }
}

/**
 通过self.selectIndex改变tabbar当前controller时调用
 
 @param index 想要选择某个controller
 */
- (void)changeSelectIndex:(NSInteger)index{
    self.selectedIndex = index;
    ADTabBarItem *barItem = (ADTabBarItem *)[self.adTabBar.items objectAtIndex:index];
    [self tabBar:self.adTabBar didSelectItem:barItem];
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
