#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <CaptainHook/CaptainHook.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <sys/utsname.h>
#import <substrate.h>
#import <rootless.h>

@interface XYMHomeViewController : UIViewController
- (void)homeNaviBar:(id)naviBar didSelectSegmentAtIndex:(NSInteger)index;
@end

@interface XYMHomeNaviBar : UIView
@property (nonatomic, strong) XYMHomeViewController *delegate;
@end

@interface XYSegmentControl : UIControl
@property (nonatomic, strong) XYMHomeNaviBar *delegate;
@end