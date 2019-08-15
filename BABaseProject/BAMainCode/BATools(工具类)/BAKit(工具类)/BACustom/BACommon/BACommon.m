//
//  BACommon.m
//  博爱微信
//
//  Created by 博爱 on 2016/10/24.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BACommon.h"
#import "AppDelegate.h"

@implementation BACommon

/*!
 *  将图片保存到应用程序沙盒中去,imageNameString的格式为 @"upLoad.png"
 *
 *  @param image           image description
 *  @param imageNameString imageNameString description
 */
+ (void)ba_saveImagetoLocal:(UIImage*)image imageName:(NSString *)imageNameString
{
    if (image == nil || imageNameString.length == 0) {
        return;
    }
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    NSString *saveImagePath=[documentsDirectory stringByAppendingPathComponent:imageNameString];
    NSData *imageDataJPG=UIImageJPEGRepresentation(image, 0);//将图片大小进行压缩
    //    NSData *imageData=UIImagePNGRepresentation(image);
    [imageDataJPG writeToFile:saveImagePath atomically:YES];
}

/*!
 *  与服务端连接已断开,请检查您的网络连接是否正常.
 */
+ (void)ba_showNoReachabileTips
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"与服务端连接已断开,请检查您的网络连接是否正常."
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"确定", nil];
    [alertView show];
}

#pragma mark - 系统的加载菊花 Only ActivityView
/*!
 *  添加系统的加载菊花 Only ActivityView
 *
 *  @param viewToLoadData viewToLoadData description
 *  @param aStyle         aStyle description
 *  @param color          color description
 */
+ (void)ba_addLoadingViewInView:(UIView *)viewToLoadData
     activityIndicatorViewStyle:(UIActivityIndicatorViewStyle)aStyle
                     usingColor:(UIColor *)color
{
    UIActivityIndicatorView *breakingLoadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:aStyle];
    breakingLoadingView.tag                      = 99;
    breakingLoadingView.center                   = CGPointMake((viewToLoadData.frame.size.width-40)/2+20, (viewToLoadData.frame.size.height-40)/2+20);
    breakingLoadingView.color                    = color;
    [breakingLoadingView startAnimating];
    [viewToLoadData addSubview:breakingLoadingView];
}

/*!
 *  移除已添加的系统菊花
 *
 *  @param viewToLoadData viewToLoadData description
 */
+ (void)ba_removeLoadingViewInView:(UIView *)viewToLoadData
{
    UIActivityIndicatorView *breakingLoadingView = (UIActivityIndicatorView* )[viewToLoadData  viewWithTag:99];
    [breakingLoadingView stopAnimating];
    [breakingLoadingView removeFromSuperview];
}

/*!
 *  从 Bundle 读取 plist 文件
 *
 *  @param fileName 文件名（如：city.plist）
 *  @param typeName 类型（前面写了后面可不写）
 *
 *  @return return value description
 */
+ (NSDictionary *)ba_dictFromBundleWithName:(NSString*)fileName withType:(NSString*)typeName
{
    NSDictionary *dict = nil;
    NSString *infoPlist = [[NSBundle mainBundle] pathForResource:fileName ofType:typeName];
    
    if ([[NSFileManager defaultManager] isReadableFileAtPath:infoPlist]) {
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:infoPlist];
        return dict;
    }
    return dict;
}

/*! 判断是否打开定位 */
+ (BOOL)ba_isLocationOpen
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

#pragma mark - ***** 判断字典是否为空
+ (BOOL)ba_isNSDictionaryNULL:(id)obj
{
    if(obj == nil) return YES;
    
    if(![obj isKindOfClass:[NSDictionary class]])
        return YES;
    
    //if([obj count] <= 0) return YES;
    return NO;
}

#pragma mark - ***** 判断字符串是否为空
+ (BOOL)ba_isNSStringNULL:(NSString *)stirng
{
    if([stirng isKindOfClass:[NSNull class]]) return YES;
    if(![stirng isKindOfClass:[NSString class]]) return YES;
    
    if(stirng == nil) return YES;
    
    NSString * string1 = [stirng stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSUInteger len=[string1 length];
    if (len <= 0) return YES;
    return NO;
}

#pragma mark - ***** 判断字符串为空和只为空格
+ (BOOL)ba_isBlankString:(NSString *)string
{
    if (string == nil)
    {
        return YES;
    }
    
    if (string == NULL)
    {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    
    if (string.length==0)
    {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0)
    {
        return YES;
    }
    
    return NO;
}

/*!
 *  拨打电话
 *
 *  @param phoneNumber 电话号码
 */
+ (void)ba_telWithPhoneNumber:(NSString *)phoneNumber
{
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel:" stringByAppendingString: phoneNumber]]];
    //打电话
    UIWebView *webView=[[UIWebView alloc] init];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]]];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window.rootViewController.view addSubview:webView];
    
    /*!
     
     拨打电话 的几种常用方法
     
     1，这种方法，拨打完电话回不到原来的应用，会停留在通讯录里，而且是直接拨打，不弹出提示
     NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"186xxxx6979"];
     //            NSLog(@"str======%@",str);
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
     
     2，这种方法，打完电话后还会回到原来的程序，也会弹出提示，推荐这种
     NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"186xxxx6979"];
     UIWebView * callWebview = [[UIWebView alloc] init];
     [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
     [self.view addSubview:callWebview];
     [callWebview release];
     [str release];
     
     3,这种方法也会回去到原来的程序里（注意这里的telprompt），也会弹出提示
     NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"186xxxx6979"];
     //            NSLog(@"str======%@",str);
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]]
     
     */
}









//+ (void)showTipsWithHUD:(NSString *)labelText showTime:(CGFloat)time
//{
//    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:[[[UIApplication sharedApplication] delegate] window]] ;
//    hud.mode = MBProgressHUDModeText;
//    hud.labelText = labelText;
//    hud.labelFont = [UIFont systemFontOfSize:15.0];
//    hud.removeFromSuperViewOnHide = YES;
//    [hud show:YES];
//    [[[[UIApplication sharedApplication] delegate] window] addSubview:hud];
//    
//    [hud hide:YES afterDelay:time];
//}

//+ (void)showTipsWithView:(UIView *)uiview labelText:(NSString *)labelText showTime:(CGFloat)time
//{
//    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:uiview] ;
//    hud.mode = MBProgressHUDModeText;
//    hud.detailsLabelText = labelText;
//    hud.detailsLabelFont = [UIFont systemFontOfSize:15.0];
//    hud.removeFromSuperViewOnHide = YES;
//    [hud show:YES];
//    [uiview addSubview:hud];
//    
//    [hud hide:YES afterDelay:time];
//}
//+ (void)showProgessInView:(UIView *)view withExtBlock:(void (^)())exBlock withComBlock:(void (^)())comBlock
//{
//    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:view];
//    hud.color = [UIColor colorWithWhite:0.8 alpha:0.6];
//    //    hud.dimBackground = NO;
//    [view addSubview:hud];
//    hud.labelText = @"正在加载...";
//    if (exBlock) {
//        [hud showAnimated:YES whileExecutingBlock:exBlock completionBlock:^{
//            if (comBlock) {
//                comBlock();
//            }
//            [hud removeFromSuperview];
//        }];
//        
//    }else
//        [hud showAnimated:YES whileExecutingBlock:exBlock completionBlock:^{
//            [hud removeFromSuperview];
//        }];
//}
//
//+ (void) showHudMessage:(NSString*) msg hideAfterDelay:(NSInteger) sec uiview:(UIView *)uiview
//{
//    MBProgressHUD* hud2 = [MBProgressHUD showHUDAddedTo:uiview animated:YES];
//    hud2.mode = MBProgressHUDModeText;
//    hud2.labelText = msg;
//    hud2.margin = 12.0f;
//    hud2.yOffset = 20.0f;
//    hud2.removeFromSuperViewOnHide = YES;
//    [hud2 hide:YES afterDelay:sec];
//}

@end
