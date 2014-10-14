//
//  ANNavigationController.m
//  Antrix
//
//  Created by Sergey Demchenko on 10/4/13.
//  Copyright (c) 2014 antrix1989@gmai.com. All rights reserved.
//

#import "ANNavigationController.h"

@interface ANNavigationController () <UINavigationControllerDelegate>

@property (assign, nonatomic) BOOL allowNextAction;

@end

@implementation ANNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _allowNextAction = YES;
    
    self.delegate = self;
    
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)setAllowNextAction:(BOOL)allowNextPop
{
    _allowNextAction = allowNextPop;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (!self.allowNextAction && animated) {
        return;
    }
    
    self.allowNextAction = NO;
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (!self.allowNextAction && animated) {
        return nil;
    }
    
    self.allowNextAction = NO;
    UIViewController *popedViewController = [super popViewControllerAnimated:animated];
    
    return popedViewController;
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    if (!self.allowNextAction && animated) {
        return nil;
    }
    
    NSArray* result = [super popToRootViewControllerAnimated:animated];
    
    return result;
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *result = [super popToViewController:viewController animated:animated];
    
    return result;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.allowNextAction = YES;
}

@end
