//
//  LGYPopMenuView.h
//  XLCD
//
//  Created by 高岩 on 2016/10/17.
//  Copyright © 2016年 高岩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^dismissBlock)();

@interface LGYPopMenuView : NSObject


/**
 *  显示菜单
 *
 *  @param fromView 需要指向控件
 *  @param content  需要显示的控件
 */
+ (void)popFrom:(UIView *)fromView content:(UIView *)content dismiss:(dismissBlock)dismiss;

+ (void)popFrom:(CGRect)fromRect inView:(UIView *)inView content:(UIView *)content dismiss:(dismissBlock)dismiss;


+ (void)popFrom:(UIView *)fromView contentVC:(UIViewController *)contentVC dismiss:(dismissBlock)dismiss;




@end
