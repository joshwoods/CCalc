//
//  UIViewController+RRAdditions.m
//  RRFramework
//
//  Created by Patrick Hefner on 3/7/14.
//  Copyright (c) 2014 Rabble+Rouser. All rights reserved.
//

#import "UIViewController+RRAdditions.h"

@implementation UIViewController (RRAdditions)

+ (void)addChildViewController:(UIViewController *)childViewController toParentViewController:(UIViewController *)parentViewController andAddToView:(UIView *)subView keepPreviousChildren:(NSArray *)childrenToKeep andRemoveAllOtherChildren:(BOOL)shouldRemoveChildren withAutoLayout:(BOOL)useAutoLayout {
    
    // double check to make sure the view controller isn't already loaded
    BOOL viewControllerLoaded = NO;
    for (int i = 0; i < parentViewController.childViewControllers.count; i++)
    {
        if ([parentViewController.childViewControllers objectAtIndex:i] == childViewController)
        {
            viewControllerLoaded = YES;
            break;
        }
    }
    
    // add new child view controller if it isn't already present
    if (!viewControllerLoaded)
    {
        [parentViewController addChildViewController:childViewController];
        [childViewController didMoveToParentViewController:parentViewController];
    }
    
    // check to make sure section root view controller's view isn't already a subview
    if (childViewController.view.superview == nil)
    {
        if (useAutoLayout)
        {
            [childViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
            [subView insertSubview:childViewController.view atIndex:0];
            
            // Width constraint
            [subView addConstraint:[NSLayoutConstraint constraintWithItem:childViewController.view
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:subView
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:0]];
            
            // Height constraint
//            [subView addConstraint:[NSLayoutConstraint constraintWithItem:childViewController.view
//                                                                attribute:NSLayoutAttributeHeight
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:subView
//                                                                attribute:NSLayoutAttributeHeight
//                                                               multiplier:1.0
//                                                                 constant:0]];
            
            // Leading Constraint
            [subView addConstraint:[NSLayoutConstraint constraintWithItem:childViewController.view
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:subView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:0.0]];
            
            // Trailing Constraint
            [subView addConstraint:[NSLayoutConstraint constraintWithItem:childViewController.view
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:subView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0.0]];
            // Top Constraint
            [subView addConstraint:[NSLayoutConstraint constraintWithItem:childViewController.view
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:subView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:0.0]];
            
            [subView addConstraint:[NSLayoutConstraint constraintWithItem:childViewController.view
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:subView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:0.0]];
            
            
            //        // Center horizontally
            //        [subView addConstraint:[NSLayoutConstraint constraintWithItem:childViewController.view
            //                                                              attribute:NSLayoutAttributeCenterX
            //                                                              relatedBy:NSLayoutRelationEqual
            //                                                                 toItem:subView
            //                                                              attribute:NSLayoutAttributeCenterX
            //                                                             multiplier:1.0
            //                                                               constant:0.0]];
            //
            //        // Center vertically
            //        [subView addConstraint:[NSLayoutConstraint constraintWithItem:childViewController.view
            //                                                              attribute:NSLayoutAttributeCenterY
            //                                                              relatedBy:NSLayoutRelationEqual
            //                                                                 toItem:subView
            //                                                              attribute:NSLayoutAttributeCenterY
            //                                                             multiplier:1.0
            //                                                               constant:0.0]];
            
            [subView.superview layoutIfNeeded];
        }
        else
        {
            CGRect childFrame = childViewController.view.frame;
            childFrame.origin.y = 0.0;
            childFrame.origin.x = 0.0;
            childFrame.size.width = subView.frame.size.width;
            childFrame.size.height = subView.frame.size.height;
            childViewController.view.frame = childFrame;
            [subView insertSubview:childViewController.view atIndex:0];
        }
        
    }
    
    if (shouldRemoveChildren)
    {
        // remove all other child controllers
        for (int i = 0; i < parentViewController.childViewControllers.count; i++)
        {
            // unload all child view controllers, except the one we are moving to and any in the keep array
            if ([parentViewController.childViewControllers objectAtIndex:i] != childViewController)
            {
                BOOL shouldRemove = YES;
                
                for (UIViewController *viewController in childrenToKeep)
                {
                    if (viewController == [parentViewController.childViewControllers objectAtIndex:i])
                    {
                        shouldRemove = NO;
                        break;
                    }
                }
                
                if (shouldRemove)
                {
                    UIView *viewToRemove = (UIView *)[[parentViewController.childViewControllers objectAtIndex:i] view];
                    [viewToRemove removeFromSuperview];
                    [[parentViewController.childViewControllers objectAtIndex:i] removeFromParentViewController];
                }
            }
        }
    }
}

@end
