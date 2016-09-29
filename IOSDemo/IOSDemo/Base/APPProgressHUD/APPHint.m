
#import "APPHint.h"
//#import "iToast.h"
//#import "MBProgressHUD.h"
#import "NJBProgressContentView.h"
//#import "NJBReachability.h"
#import "SVProgressHUD.h"
@implementation NJBHint

#pragma mark - Alert View
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

+ (void)showAlertWithMessage:(NSString *)message
{
    [self showAlertWithTitle:@"" message:message];
}

#pragma mark 修改SVProgressHUD

+ (void)showSuccessWithStatus:(NSString*)string{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD showSuccessWithStatus:string];
    [SVProgressHUD setMinimumDismissTimeInterval:0.5];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
//    [SVProgressHUD dismissWithDelay:1.0];
}
+ (void)showErrorWithStatus:(NSString *)string{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD showErrorWithStatus:string];
    [SVProgressHUD setMinimumDismissTimeInterval:0.5];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
//    [SVProgressHUD dismissWithDelay:1.0];
}
+ (void)showInfoWithStatus:(NSString*)status{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD showInfoWithStatus:status];
    [SVProgressHUD setMinimumDismissTimeInterval:0.5];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
//    [SVProgressHUD dismissWithDelay:1.0];
}

+ (void)showStatus:(NSString*)status{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD showWithStatus:status];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
}

+(void)dissmissHUD{
    [SVProgressHUD dismiss];
}

@end
