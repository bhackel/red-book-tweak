#import "uYouPlus.h"


%group main
%hook XYSegmentControl
- (void)xy_viewDidLoad {
    %orig;
    // Switch to the Follow page (index 0) when the page is loaded
    XYMHomeNaviBar *homeNaviBar = self.delegate;
    XYMHomeViewController *homeVC = homeNaviBar.delegate;
    [homeVC homeNaviBar:homeNaviBar didSelectSegmentAtIndex:0];
}
%end
- (void)layoutSubviews {
    %orig;
    // Hide the Explore button
    UIScrollView *scrollView = (UIScrollView *)self.subviews.firstObject;
    // Check if we already removed it
    if (scrollView.subviews.count < 7) {
        return;
    }
    // Remove it
    UIButton *exploreButton = scrollView.subviews[4];
    exploreButton.hidden = YES;
    exploreButton.userInteractionEnabled = NO;
    [exploreButton removeFromSuperview];
}

end


# pragma mark - ctor
%ctor {
    %init;
    %init(main);
}
