//
//  LGYPopMenuView.m
//  XLCD
//
//  Created by 高岩 on 2016/10/17.
//  Copyright © 2016年 高岩. All rights reserved.
//

#import "LGYPopMenuView.h"
#import "UIView+Extension.h"
@implementation LGYPopMenuView

static UIWindow *_window;
static dismissBlock _dismiss;
static UIViewController *_contentVC;
//static int num = 10;

/**
 *  弹出菜单
 *
 *  @param fromView 菜单需要指向的控件
 *  @param content  菜单需要显示的控件
 */
+ (void)popFrom:(UIView *)fromView content:(UIView *)content dismiss:(dismissBlock)dismiss
{
    [self popFrom:fromView.frame inView:fromView.superview content:content dismiss:dismiss];
}

+ (void)popFrom:(CGRect)fromRect inView:(UIView *)inView content:(UIView *)content dismiss:(dismissBlock)dismiss
{
    
    
    _dismiss = [dismiss copy];
    
    // 1.创建window
    _window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.hidden = NO;
    _window.windowLevel = UIWindowLevelAlert;
    
    // 2.创建蒙版
    UIButton *cover = [[UIButton alloc] init];
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor colorWithRed:255 green:45 blue:45 alpha:0];
    [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
    //将蒙版添加到window上
    [_window addSubview:cover];
    
    // 3.创建菜单
    UIImageView *menuView = [[UIImageView alloc] init];
    menuView.userInteractionEnabled = YES;
    UIImage *image = [UIImage imageNamed:@"kuang"];
    menuView.image = image;
    // 将菜单添加到蒙版上
    [cover addSubview:menuView];
    
    // 4.添加内容到菜单上
    // 设置内容的X和Y值(间隙)
    content.x = 2;
    content.y = 2;
    [menuView addSubview:content];
    
    // 5.设置菜单容器的frame
    CGFloat menuViewW = CGRectGetMaxX(content.frame) + content.x;
    CGFloat menuViewH = CGRectGetMaxY(content.frame) + content.y;
    menuView.frame = CGRectMake(0, 0, menuViewW, menuViewH);
    
    // 获取需要指向控件的frame, 并且是转换为和蒙版同一个坐标系的frame
    // 将fromView.frame的坐标系 从 fromView.superview  转换为 _window
    CGRect resultFrame = [_window convertRect:fromRect fromView:inView];
    
    // 设置菜单的Y的值
    menuView.y = CGRectGetMaxY(resultFrame)-1;
    menuView.centerX = resultFrame.origin.x + (resultFrame.size.width * 0.5);
    
    // 6.显示菜单
    _window.hidden = NO;
    
}

+ (void)popFrom:(UIView *)fromView contentVC:(UIViewController *)contentVC dismiss:(dismissBlock)dismiss
{
    // 保命
    _contentVC = contentVC;
    
    // 显示
    [self popFrom:fromView content:_contentVC.view dismiss:dismiss];
}


+ (void)coverClick:(UIButton *)btn
{
    _window = nil;
    _contentVC = nil;
    
    // 通知调用者
    if (_dismiss != nil) {
        _dismiss();
    }
}

@end
