//
//  BACommon.h
//  博爱微信
//
//  Created by 博爱 on 2016/10/24.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/NSObject.h>
#import <CoreLocation/CoreLocation.h>


@interface BACommon : NSObject

/*!
 *  将图片保存到应用程序沙盒中去,imageNameString的格式为 @"upLoad.png"
 *
 *  @param image           image description
 *  @param imageNameString imageNameString description
 */
+ (void)ba_saveImagetoLocal:(UIImage*)image imageName:(NSString *)imageNameString;

/*!
 *  与服务端连接已断开,请检查您的网络连接是否正常.
 */
+ (void)ba_showNoReachabileTips;

/*!
 *  添加系统的加载菊花 Only ActivityView
 *
 *  @param viewToLoadData viewToLoadData description
 *  @param aStyle         aStyle description
 *  @param color          color description
 */
+ (void)ba_addLoadingViewInView:(UIView *)viewToLoadData
     activityIndicatorViewStyle:(UIActivityIndicatorViewStyle)aStyle
                     usingColor:(UIColor *)color;

/*!
 *  移除已添加的系统菊花
 *
 *  @param viewToLoadData viewToLoadData description
 */
+ (void)ba_removeLoadingViewInView:(UIView *)viewToLoadData;

/*!
 *  从 Bundle 读取 plist 文件
 *
 *  @param fileName 文件名（如：city.plist）
 *  @param typeName 类型（前面写了后面可不写）
 *
 *  @return return value description
 */
+ (NSDictionary *)ba_dictFromBundleWithName:(NSString*)fileName withType:(NSString*)typeName;

/*!
 *  判断是否打开定位
 *
 *  @return YES / NO
 */
+ (BOOL)ba_isLocationOpen;

/*!
 *  判断字典是否为空
 *
 *  @param obj 传进来的字典
 *
 *  @return YES：为空，NO：不为空
 */
+ (BOOL)ba_isNSDictionaryNULL:(id)obj;

/*!
 *  判断字符串判断是否为空
 *
 *  @param stirng 传进来的字符
 *
 *  @return YES：为空，NO：不为空
 */
+ (BOOL)ba_isNSStringNULL:(NSString *)stirng;

/*!
 *  判断字符串为空和只为空格
 *
 *  @param string 传进来的字符
 *
 *  @return YES：为空，NO：不为空
 */
+ (BOOL)ba_isBlankString:(NSString *)string;

/*!
 *  拨打电话
 *
 *  @param phoneNumber 电话号码
 */
+ (void)ba_telWithPhoneNumber:(NSString *)phoneNumber;




@end
