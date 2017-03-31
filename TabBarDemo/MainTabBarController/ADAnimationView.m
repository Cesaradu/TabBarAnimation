//
//  ADAnimationView.m
//  TabBarDemo
//
//  Created by hztuen on 17/3/21.
//  Copyright © 2017年 cesar. All rights reserved.
//

#import "ADAnimationView.h"
#import "UIColor+ColorHelper.h"
#import "pop.h"
#import "SDiPhoneVersion.h"

#define SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)

// 屏幕判定
#define IS_IPHONE35INCH  ([SDiPhoneVersion deviceSize] == iPhone35inch ? YES : NO)//4, 4S
#define IS_IPHONE4INCH  ([SDiPhoneVersion deviceSize] == iPhone4inch ? YES : NO)//5, 5C, 5S, SE
#define IS_IPHONE47INCH  ([SDiPhoneVersion deviceSize] == iPhone47inch ? YES : NO)//6, 6S, 7
#define IS_IPHONE55INCH ([SDiPhoneVersion deviceSize] == iPhone55inch ? YES : NO)//6P, 6SP, 7P

// 屏幕适配比例（屏宽比例）
#define Suit55Inch           1.104
#define Suit4Inch            1.171875

@implementation ADAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.bgBtn];
        [self.bgBtn addSubview:self.cancelBtn];
        
        for(UIButton *buttonObj in @[self.button1, self.button2, self.button3, self.button4])
        {
            buttonObj.layer.cornerRadius = [self Suit:41.5]/2;
            buttonObj.layer.masksToBounds = YES;
            
            [self addSubview:buttonObj];
        }
    }
    return self;
}

- (UIButton *)bgBtn
{
    if (!_bgBtn)
    {
        _bgBtn = [[UIButton alloc] initWithFrame:self.bounds];
        _bgBtn.enabled = NO;
        _bgBtn.backgroundColor = [UIColor colorWithHexString:@"ffffff" alpha:0.7];
        [_bgBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bgBtn;
}

- (UIButton *)button1
{
    if(!_button1)
    {
        _button1 =[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-[self Suit:41.5])/2,SCREEN_HEIGHT, [self Suit:41.5], [self Suit:41.5])];
        _button1.enabled = NO;
        _button1.adjustsImageWhenDisabled = NO;
        _button1.adjustsImageWhenHighlighted = NO;
        _button1.tag = 10001;
        [_button1 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_button1 setImage:[UIImage imageNamed:@"heart_icon"] forState:UIControlStateNormal];
        
    }
    return _button1;
}

- (UIButton *)button2
{
    if(!_button2)
    {
        _button2 =[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-[self Suit:41.5])/2,SCREEN_HEIGHT, [self Suit:41.5], [self Suit:41.5])];
        _button2.enabled = NO;
        _button2.adjustsImageWhenDisabled = NO;
        _button2.adjustsImageWhenHighlighted = NO;
        _button2.tag = 10002;
        [_button2 setImage:[UIImage imageNamed:@"heart_icon"] forState:UIControlStateNormal];
        [_button2 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}

- (UIButton *)button3
{
    if (!_button3)
    {
        _button3 =[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-[self Suit:41.5])/2,SCREEN_HEIGHT, [self Suit:41.5], [self Suit:41.5])];
        _button3.enabled = NO;
        _button3.adjustsImageWhenDisabled = NO;
        _button3.adjustsImageWhenHighlighted = NO;
        _button3.tag = 10003;
        [_button3 setImage:[UIImage imageNamed:@"heart_icon"] forState:UIControlStateNormal];
        [_button3 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button3;
}

- (UIButton *)button4
{
    if (!_button4)
    {
        _button4 =[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-[self Suit:41.5])/2,SCREEN_HEIGHT, [self Suit:41.5], [self Suit:41.5])];
        _button4.enabled = NO;
        _button4.adjustsImageWhenDisabled = NO;
        _button4.adjustsImageWhenHighlighted = NO;
        _button4.tag = 10004;
        [_button4 setImage:[UIImage imageNamed:@"heart_icon"] forState:UIControlStateNormal];
        [_button4 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button4;
}

- (UIButton *)cancelBtn
{
    if (!_cancelBtn)
    {
        _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-51)/2, SCREEN_HEIGHT, 51, 51)];
        self.cancelBtn.enabled = NO;
        self.cancelBtn.adjustsImageWhenDisabled = NO;
        self.cancelBtn.adjustsImageWhenHighlighted = NO;
        [_cancelBtn setImage:[UIImage imageNamed:@"cancel_icon"] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

- (void)clickButton:(UIButton *)button {
    
    switch (button.tag-10000)
    {
        case 1:
        {
            //缩放动画
            POPSpringAnimation *scaleAnim1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleAnim1.beginTime = CACurrentMediaTime();
            scaleAnim1.toValue = [NSValue valueWithCGPoint:CGPointMake(1.3, 1.3)];
            scaleAnim1.springSpeed = 20;
            scaleAnim1.springBounciness = 16;
            [self.button1.layer pop_addAnimation:scaleAnim1 forKey:@"scaleAnim1"];
            POPSpringAnimation *scaleAnim11 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleAnim11.beginTime = CACurrentMediaTime()+0.1;
            scaleAnim11.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
            scaleAnim11.springSpeed = 20;
            scaleAnim11.springBounciness = 16;
            [self.button1.layer pop_addAnimation:scaleAnim11 forKey:@"scaleAnim11"];
        }
            break;
            
        case 2:
        {
            POPSpringAnimation *scaleAnim2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleAnim2.beginTime = CACurrentMediaTime();
            scaleAnim2.toValue = [NSValue valueWithCGPoint:CGPointMake(1.3, 1.3)];
            scaleAnim2.springSpeed = 20;
            scaleAnim2.springBounciness = 16;
            [self.button2.layer pop_addAnimation:scaleAnim2 forKey:@"scaleAnim2"];
            POPSpringAnimation *scaleAnim22 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleAnim22.beginTime = CACurrentMediaTime()+0.1;
            scaleAnim22.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
            scaleAnim22.springSpeed = 20;
            scaleAnim22.springBounciness = 16;
            [self.button2.layer pop_addAnimation:scaleAnim22 forKey:@"scaleAnim22"];
        }
            
            break;
            
        case 3:
        {
            POPSpringAnimation *scaleAnim3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleAnim3.beginTime = CACurrentMediaTime();
            scaleAnim3.toValue = [NSValue valueWithCGPoint:CGPointMake(1.3, 1.3)];
            scaleAnim3.springSpeed = 20;
            scaleAnim3.springBounciness = 16;
            [self.button3.layer pop_addAnimation:scaleAnim3 forKey:@"scaleAnim3"];
            POPSpringAnimation *scaleAnim33 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleAnim33.beginTime = CACurrentMediaTime()+0.1;
            scaleAnim33.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
            scaleAnim33.springSpeed = 20;
            scaleAnim33.springBounciness = 16;
            [self.button3.layer pop_addAnimation:scaleAnim33 forKey:@"scaleAnim33"];
        }
            
            break;
            
        case 4:
        {
            POPSpringAnimation *scaleAnim4 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleAnim4.beginTime = CACurrentMediaTime();
            scaleAnim4.toValue = [NSValue valueWithCGPoint:CGPointMake(1.3, 1.3)];
            scaleAnim4.springSpeed = 20;
            scaleAnim4.springBounciness = 16;
            [self.button4.layer pop_addAnimation:scaleAnim4 forKey:@"scaleAnim4"];
            POPSpringAnimation *scaleAnim44 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleAnim44.beginTime = CACurrentMediaTime()+0.1;
            scaleAnim44.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
            scaleAnim44.springSpeed = 20;
            scaleAnim44.springBounciness = 16;
            [self.button4.layer pop_addAnimation:scaleAnim44 forKey:@"scaleAnim44"];
        }
            
            break;

    }
    
}

- (void)cancelClick {
    [self hideMoreButtonAnmation];
}

- (void)showButtonAnimation
{
    //弹出效果
    POPSpringAnimation *buttton1Anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    buttton1Anim.beginTime = CACurrentMediaTime();
    buttton1Anim.toValue = [NSValue valueWithCGPoint:CGPointMake([self Suit:84.5]+[self Suit:41.5]/2, SCREEN_HEIGHT-[self Suit:65]-[self Suit:41.5]/2)];
    buttton1Anim.springSpeed = 20;
    buttton1Anim.springBounciness = 8;
    [self.button1 pop_addAnimation:buttton1Anim forKey:@"button1"];
    
    //旋转效果
    POPSpringAnimation *anim1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    anim1.beginTime = CACurrentMediaTime();
    anim1.toValue = @(M_PI*2);
    anim1.springSpeed = 20;
    anim1.springBounciness = 14;
    [self.button1.layer pop_addAnimation:anim1 forKey:@"anim1"];
    
    POPSpringAnimation *button2Anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    button2Anim.beginTime = CACurrentMediaTime();
    button2Anim.toValue = [NSValue valueWithCGPoint:CGPointMake([self Suit:130.5]+[self Suit:41.5]/2, SCREEN_HEIGHT-[self Suit:113]-[self Suit:41.5]/2)];
    button2Anim.springSpeed = 20;
    button2Anim.springBounciness = 8;
    [self.button2 pop_addAnimation:button2Anim forKey:@"button2"];
    
    POPSpringAnimation *anim2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    anim2.beginTime = CACurrentMediaTime();
    anim2.toValue = @(M_PI*2);
    anim2.springSpeed = 20;
    anim2.springBounciness = 14;
    [self.button2.layer pop_addAnimation:anim2 forKey:@"anim2"];

    POPSpringAnimation *button3Anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    button3Anim.beginTime = CACurrentMediaTime();
    button3Anim.toValue = [NSValue valueWithCGPoint:CGPointMake([self Suit:202.5]+[self Suit:41.5]/2, SCREEN_HEIGHT-[self Suit:113]-[self Suit:41.5]/2)];
    button3Anim.springSpeed = 20;
    button3Anim.springBounciness = 8;
    [self.button3 pop_addAnimation:button3Anim forKey:@"button3"];
    
    POPSpringAnimation *anim3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    anim3.beginTime = CACurrentMediaTime();
    anim3.toValue = @(M_PI*2);
    anim3.springSpeed = 20;
    anim3.springBounciness = 14;
    [self.button3.layer pop_addAnimation:anim3 forKey:@"anim3"];
    
    POPSpringAnimation *button4Anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    button4Anim.beginTime = CACurrentMediaTime();
    button4Anim.toValue = [NSValue valueWithCGPoint:CGPointMake([self Suit:250]+[self Suit:41.5]/2, SCREEN_HEIGHT-[self Suit:65]-[self Suit:41.5]/2)];
    button4Anim.springSpeed = 20;
    button4Anim.springBounciness = 8;
    [self.button4 pop_addAnimation:button4Anim forKey:@"button4"];
    
    POPSpringAnimation *anim4 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    anim4.beginTime = CACurrentMediaTime();
    anim4.toValue = @(M_PI*2);
    anim4.springSpeed = 20;
    anim4.springBounciness = 14;
    [self.button4.layer pop_addAnimation:anim4 forKey:@"anim4"];
    
    POPSpringAnimation *cancelAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    cancelAnim.beginTime= CACurrentMediaTime()+0.1;
    cancelAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT-(51/2+5))];
    cancelAnim.springSpeed = 20;
    cancelAnim.springBounciness = 0;
    [self.cancelBtn pop_addAnimation:cancelAnim forKey:@"cancelAnim"];
    cancelAnim.completionBlock = ^(POPAnimation *animation, BOOL finished) {
        //动画完成才能点击，避免快速点击造成误点
        self.button1.enabled = YES;
        self.button2.enabled = YES;
        self.button3.enabled = YES;
        self.button4.enabled = YES;
        self.bgBtn.enabled = YES;
        self.cancelBtn.enabled = YES;
    };

}

- (void)hideMoreButtonAnmation
{
    
    [UIView animateWithDuration:0.2 animations:^{
        
        _button1.frame = CGRectMake((SCREEN_WIDTH-[self Suit:41.5])/2,SCREEN_HEIGHT, [self Suit:41.5], [self Suit:41.5]);
        
        _button2.frame = CGRectMake((SCREEN_WIDTH-[self Suit:41.5])/2,SCREEN_HEIGHT, [self Suit:41.5], [self Suit:41.5]);
        
        _button3.frame = CGRectMake((SCREEN_WIDTH-[self Suit:41.5])/2,SCREEN_HEIGHT, [self Suit:41.5], [self Suit:41.5]);

        _button4.frame = CGRectMake((SCREEN_WIDTH-[self Suit:41.5])/2,SCREEN_HEIGHT, [self Suit:41.5], [self Suit:41.5]);
        
        _cancelBtn.frame = CGRectMake((SCREEN_WIDTH-51)/2, SCREEN_HEIGHT, 51, 51);
        
    }completion:^(BOOL finished)
     {
         [self removeFromSuperview];
     }];
    
}

/**
 适配 给定4.7寸屏尺寸，适配4和5.5寸屏尺寸
 */
- (float)Suit:(float)MySuit
{
    (IS_IPHONE4INCH||IS_IPHONE35INCH)?(MySuit=MySuit/Suit4Inch):((IS_IPHONE55INCH)?(MySuit=MySuit*Suit55Inch):MySuit);
    return MySuit;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
