//
//  Tools.m
//  NiuHome
//
//  Created by 王云鹏 on 15/6/24.
//  Copyright (c) 2015年 niuhome.com. All rights reserved.
//

#import "Tools.h"
//#import "MyControl.h"
@implementation Tools

/**
 *
 *  设置导航栏
 *  @param item      导航栏item
 *  @param imageName 图片名
 *  @param target    调用者
 *  @param action    方法
 */
+ (void)setNavigationBar:(UINavigationItem *)item withImage:(NSString *)imageName withPressImage:(NSString *)pressImageName withIsLeft:(BOOL)isLeft withTarget:(id)target withSel:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *image =[UIImage imageNamed:imageName];
    btn.frame = CGRectMake(0, 0, image.size.width,image.size.height);
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:pressImageName] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    if (isLeft) {
        item.leftBarButtonItem = barItem;
        //FIXME:左侧的差不多都是返回按钮,所以针对提供的图片不标准的情况，这样处理下，慎用左侧的按钮，注意大小
        // btn.frame = CGRectMake(0, 0, 13, 13);
    }else{
        item.rightBarButtonItem = barItem;
    }
}

//+ (void)setNavigationBar:(UINavigationItem *)item withImage:(NSString *)imageName withTitle:(NSString *)title withIsLeft:(BOOL)isLeft withTarget:(id)target withSel:(SEL)action{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 45, 22)];
//    UILabel *label = [MyControl creatLabelWithFrame:CGRectMake(0, 0, 50, 22) text:title fontSize:14];
//    label.textAlignment = NSTextAlignmentLeft;
//    label.textColor = [UIColor whiteColor];
//    CGSize size = [label boundingRectWithSize:CGSizeMake(50, 22)];
//    label.frame = CGRectMake(0, 0, size.width, 22);
//    UIImageView *imageView = [MyControl creatImageViewWithFrame:CGRectMake(CGRectGetMaxX(label.frame), 0,10,10) imageName:imageName];
//    imageView.center = CGPointMake(imageView.center.x, label.center.y);
//    [view addSubview:label];
//    [view addSubview:imageView];
//    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:view];
//    if (isLeft) {
//        item.leftBarButtonItem = barItem;
//    }else{
//        item.rightBarButtonItem = barItem;
//    }
//    
//    //增加点击手势
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
//    [view addGestureRecognizer:tap];
//}


+ (void)setNavigationBar:(UINavigationItem *)item withImage:(NSString *)imageName withIsLeft:(BOOL)isLeft withTarget:(id)target withSel:(SEL)action{
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:target action:action];
    if (isLeft) {
        item.leftBarButtonItem = bar;
    }else{
        item.rightBarButtonItem = bar;
    }
}
+ (void)setNavigationBarWithValue:(UINavigationItem *)item withImage:(NSString *)imageName withIsLeft:(BOOL)isLeft withTarget:(id)target withSel:(SEL)action value:(NSString*)v{
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:target action:action];
    bar.title = v;
    if (isLeft) {
        item.leftBarButtonItem = bar;
    }else{
        item.rightBarButtonItem = bar;
    }
}



+ (void)setNavigationBar:(UINavigationItem *)item withTitle:(NSString *)title withIsLeft:(BOOL)isLeft withTarget:(id)target withSel:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0,60,30);
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    if (isLeft) {
        item.leftBarButtonItem = barItem;
    }else{
        item.rightBarButtonItem = barItem;
    }
}


/**
 *  切成圆
 */
+ (void)setCornerToCircleWith:(UIView *)clipedView{
    clipedView.layer.masksToBounds = YES;
    clipedView.layer.cornerRadius = clipedView.frame.size.height/2.0;
}

/**
 *  切圆润  按钮
 */
+ (void)setCorner:(UIView *)clipedView{
    clipedView.layer.masksToBounds = YES;
    clipedView.layer.cornerRadius = 4.f;
}

+ (void)setViewCorner:(UIView *)view{
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 6.f;
}



/**
 *  设置边界
 */
+ (void)setBorderWithView:(UIView *)view{
    view.layer.borderWidth = 0.5;
    view.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

+ (void)setBorderWithColor:(UIColor *)color withView:(UIView *)view{
    view.layer.borderWidth = 0.5;
    view.layer.borderColor = color.CGColor;
}

+ (void)setBorderWithColor:(UIColor *)color withBorderWidth:(float)borderWidth withView:(UIView *)view{
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = color.CGColor;
}

+ (BOOL)checkPhoneNumber:(NSString *)mobileNum{
    NSString *MOBILE = @"^1[34578]\\d{9}$";
    NSPredicate *regexTestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILE];
    if ([regexTestMobile evaluateWithObject:mobileNum]) {
        return YES;
    }else {
        return NO;
    }
}
+ (void)showAlertView:(NSString *)title withMessage:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
    [alert show];
}

+ (void)showAlertView:(NSString *)title withMessage:(NSString *)message withDelegate:(id)object{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:object cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
    [alert show];
}


+ (void)addTopLineView:(UIView *)view{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 1)];
    [view addSubview:label];
}
//+ (void)setNavigationBar:(UINavigationItem *)item withImage:(NSString *)imageName withTitle:(NSString *)title withIsLeft:(BOOL)isLeft withTarget:(id)target withSel:(SEL)action{
////    item.topItem.title=@"";
////    self.navigationController.navigationBar.tintColor=[UIColorblackColor];
//    UIBarButtonItem*backButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleBorderedtarget:self action:@selector(action)];
//    
//    
//    item.leftBarButtonItem= backButton;
//    
//    
//}


@end


