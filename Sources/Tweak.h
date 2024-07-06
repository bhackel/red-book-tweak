#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <CaptainHook/CaptainHook.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <sys/utsname.h>
#import <substrate.h>
#import <rootless.h>

@interface XYMHomeNaviBar : UIView
@end

@interface XYMHomeViewController : UIViewController
@property (nonatomic, strong) XYMHomeNaviBar *naviBarView;
- (void)homeNaviBar:(id)naviBar willSelectSegmentAtIndex:(NSInteger)index;
@end

@interface XYSegmentControl : UIControl
@property (nonatomic, strong) XYMHomeNaviBar *delegate;
@property (nonatomic, strong) NSArray<UIButton *> *buttons;
@end