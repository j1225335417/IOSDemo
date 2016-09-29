
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NJBHint : NSObject

#pragma mark - Alert
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message;
+ (void)showAlertWithMessage:(NSString *)message;

//#pragma mark - Toast
//+ (void)showToastOnBottomWithMessage:(NSString *)message;
//+ (void)showToastOnCenterWithMessage:(NSString *)message;
//+ (void)showToastOnTopWithMessage:(NSString *)message;

//#pragma mark - Progress
//+ (void)showProgressHudInView:(UIView *)aView;
//+ (void)dismissProgressHudInView:(UIView *)aView;

//#pragma mark - 常用
// 网络连接失败
//+ (void)showHintConnectNetworkFail;

//#pragma mark 获取数据是否成功
//void ShowDataStatus(UIView* superView,BOOL status);

//#pragma mark 加载数据失败
//void ShowLoadFail(UIView* superView);

#pragma mark 修改SVProgressHUD

+ (void)showSuccessWithStatus:(NSString*)string;
+ (void)showErrorWithStatus:(NSString *)string;
+ (void)showInfoWithStatus:(NSString*)status;


+ (void)showStatus:(NSString*)status;

+ (void)dissmissHUD;

@end
