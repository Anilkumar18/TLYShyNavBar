//
//  TLYShyStatusBarController.m
//  TLYShyNavBarDemo
//
//  Created by Mazyad Alabduljaleel on 11/13/15.
//  Copyright © 2015 Telly, Inc. All rights reserved.
//

#import "TLYShyStatusBarController.h"

// Returns the default status bar height
static inline CGFloat AACDefaultStatusBarHeight()
{
	CGSize statusBarSize = [UIApplication sharedApplication].statusBarFrame.size;
	return MIN(statusBarSize.width, statusBarSize.height);
}

// Thanks to SO user, MattDiPasquale
// http://stackoverflow.com/questions/12991935/how-to-programmatically-get-ios-status-bar-height/16598350#16598350

static inline CGFloat AACStatusBarHeight(UIViewController *viewController)
{
    if ([UIApplication sharedApplication].statusBarHidden)
    {
        return 0.f;
    }

    UIView *view = viewController.view;
    CGRect frame = [view.superview convertRect:view.frame toView:view.window];
	CGFloat defaultStatusBarHeight = AACDefaultStatusBarHeight();

    if (!(frame.origin.y < defaultStatusBarHeight))
    {
        return 0.f;
    }
    
    return defaultStatusBarHeight;
}

@implementation TLYShyStatusBarController

- (CGFloat)_statusBarHeight
{
    CGFloat statusBarHeight = AACStatusBarHeight(self.viewController);
	CGFloat defaultStatusBarHeight = AACDefaultStatusBarHeight();
	if (statusBarHeight > defaultStatusBarHeight)
    {
		statusBarHeight -= defaultStatusBarHeight;
    }
    return statusBarHeight;
}

- (CGFloat)maxYRelativeToView:(UIView *)superview
{
    return [self _statusBarHeight];
}

- (CGFloat)calculateTotalHeightRecursively
{
    return [self _statusBarHeight];
}

@end
