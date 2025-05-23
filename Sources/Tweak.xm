#import "Tweak.h"


%group main

# pragma mark - Change default page to the Follow page
%hook XYMHomeViewController
// do the same thing for viewDidLoad
- (void)viewDidLoad {
    %orig;
    NSLog(@"bhackel: XYMHomeViewController viewDidLoad");
    // Switch to the Follow page (index 0) when the page is loaded
    XYMHomeNaviBar *homeNaviBar = self.naviBarView;
    [self homeNaviBar:homeNaviBar willSelectSegmentAtIndex:0];
}
%end

# pragma mark - Remove Explore button
%hook XYSegmentControl
- (void)layoutSubviews {
    %orig;
    NSLog(@"bhackel: XYSegmentControl layoutSubviews");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray<UIButton *> *buttons = self.buttons;
        // Remove the explore button
        UIButton *exploreButton = buttons[1];
        exploreButton.hidden = YES;
        exploreButton.userInteractionEnabled = NO;
    });
}
%end


# pragma mark - Remove swipe between pages
%hook XYPageScrollView
- (void)layoutSubviews {
    %orig;
    NSLog(@"bhackel: XYPageScrollView layoutSubviews");
    // Delete the pan gesture to swipe between pages
    if ([self valueForKey:@"_pan"]) {
        [self removeGestureRecognizer:[self valueForKey:@"_pan"]];
    }
}
%end

%end


# pragma mark - ctor
%ctor {
    %init;
    %init(main);
}
