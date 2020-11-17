//
//  UIScrollView+Helpers.m
//  TLYShyNavBarDemo
//
//  Created by Mazyad Alabduljaleel on 11/13/15.
//  Copyright © 2015 Telly, Inc. All rights reserved.
//

#import "UIScrollView+Helpers.h"

@implementation UIScrollView (Helpers)

// Returns the actual `contentInset`
- (UIEdgeInsets)tly_contentInset
{
	if (@available(iOS 11.0, *)) {
		return self.adjustedContentInset;
	} else {
		return self.contentInset;
	}
}

// Modify contentInset and scrollIndicatorInsets
- (void)tly_setInsets:(UIEdgeInsets)contentInsets
{
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
}

@end
