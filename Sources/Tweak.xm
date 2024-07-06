#import "Tweak.h"


%group main
%hook XYMHomeViewController
- (void)xy_viewDidLoad {
    %orig;
    NSLog(@"bhackel: XYMHomeViewController xy_viewDidLoad");
    // Switch to the Follow page (index 0) when the page is loaded
    XYMHomeNaviBar *homeNaviBar = self.naviBarView;
    [self homeNaviBar:homeNaviBar willSelectSegmentAtIndex:0];
}
%end

%hook XYSegmentControl
- (void)layoutSubviews {
    %orig;
    NSLog(@"bhackel: XYSegmentControl layoutSubviews");
    NSArray<UIButton *> *buttons = self.buttons;
    // Check if we already removed it
    if (buttons.count < 3) {
        return;
    }
    // Remove the explore button
    UIButton *exploreButton = buttons[1];
    exploreButton.hidden = YES;
    exploreButton.userInteractionEnabled = NO;
    [exploreButton removeFromSuperview];
}
%end
%end


# pragma mark - ctor
%ctor {
    %init;
    %init(main);
}
