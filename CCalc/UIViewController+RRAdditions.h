//
//  UIViewController+RRAdditions.h
//  RRFramework
//
//  Created by Patrick Hefner on 3/7/14.
//  Copyright (c) 2014 Rabble+Rouser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RRAdditions)

/**
 * Adds a child view controller to the provided view controller
 * and ensures both the view controller and view are not already in the heirarchy.
 *
 * @param childViewController UIViewController to add as child view controller
 * @param parentViewController UIViewController parent view controller
 * @param subView UIView to insert the child view controller's view
 * @param childrenToKeep NSArray of UIViewControllers to keep
 * @param shouldRemoveChildren BOOL saying if all other child view controllers should be removed
 * @param useAutoLayout BOOL for configuring the view with autolayout
 */
+ (void)addChildViewController:(UIViewController *)childViewController toParentViewController:(UIViewController *)parentViewController andAddToView:(UIView *)subView keepPreviousChildren:(NSArray *)childrenToKeep andRemoveAllOtherChildren:(BOOL)shouldRemoveChildren withAutoLayout:(BOOL)useAutoLayout;

@end
