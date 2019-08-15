
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#ifndef BADefin_h
#define BADefin_h


#pragma mark - ***** AppDelegate

/*! 友盟统计 SDK */
#define BA_UMengAnalyticskey     @"58199af182b635155d0028cd"

/*! 百度地图 AppKey  */
#define BA_BaiDuMapAppKey   @"qhqlttbTzqPdGilGTVoaH7fYGenIxNK5"

/*! 字体 */
#define BA_FontSize(fontSize) [UIFont systemFontOfSize:fontSize]

/*! Loading */
#define BA_Loading @"Loading..."

/*! 用safari打开URL */
#define BA_OpenUrl(urlStr) [BASharedApplication openURL:[NSURL URLWithString:urlStr]]

/*! 复制文字内容 */
#define BA_CopyContent(content) [[UIPasteboard generalPasteboard] setString:content]

/*! 随机数据 */
#define BA_RandomData arc4random_uniform(5)

/*! weakSelf */
#define BA_WEAKSELF typeof(self) __weak weakSelf = self
#define BA_WeakSelf(type)  __weak typeof(type) weak##type = type;

/*! strongSelf */
#define BA_StrongSelf(type)  __strong typeof(type) type = weak##type;

/*! 通知 */
#define BA_NotiCenter [NSNotificationCenter defaultCenter]

#define BA_UserDefault [NSUserDefaults standardUserDefaults]

/*! 图片 */
#define BA_ImageName(imageName) [UIImage imageNamed:imageName]

/*! 获取图片资源 */
#define BA_GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

/*! 定义 UIImage 对象 */
#define BA_ImageFromBundle(fileName) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

/*! 获取当前语言 */
#define BA_CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])



#pragma mark - 通知类
#define BANotioKey_LoginFinish   @"BANotioKey_LoginFinish"



/*! 其他 */
#pragma mark - ***** 应用内相关设置
#define BA_placeHolder_Image @"placeHolder"


/*! 警告框-一个按钮【VC】 */
#define BA_SHOW_ALERT(title, msg)  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title  message:msg preferredStyle:UIAlertControllerStyleAlert];\
[alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {\
BALog(@"你点击了确定按钮！");\
}]];\
[self presentViewController:alert animated:YES completion:nil];\

/*! 警告框-一个按钮【View】 */
#define BA_AlertAtView(msg) [[[UIAlertView alloc] initWithTitle:@"温馨提示：" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil] show];





#endif /* BADefin_h */
