//
//  ContainerViewController.m
//  BulgariaNews_iOS
//
//  Created by Makros on 3/3/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import "ContainerViewController.h"
#import "HomeViewController.h"
#import "CategoriesViewController.h"
#import "WebsiteViewController.h"
#import "HelpViewController.h"
#import "AboutViewController.h"


#define SegueIdentifierHome @"embedHome"
#define SegueIdentifierCategories @"embedCategories"
#define SegueIdentifierWebsite @"embedWebsite"
#define SegueIdentifierHelp @"embedHelp"
#define SegueIdentifierAbout @"embedAbout"

@interface ContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) NSString *nextSegueIdentifier;
@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) CategoriesViewController *categoriesViewController;
@property (strong, nonatomic) WebsiteViewController *websiteViewController;
@property (strong, nonatomic) HelpViewController *helpViewController;
@property (strong, nonatomic) AboutViewController *aboutViewController;
@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation ContainerViewController

@synthesize check;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.transitionInProgress = NO;
    self.currentSegueIdentifier = SegueIdentifierHome;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"ASD : %d", check);
    
    if ([segue.identifier isEqualToString:SegueIdentifierHome]) {
        self.homeViewController = segue.destinationViewController;
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.homeViewController];
        }
        else {
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    if ([segue.identifier isEqualToString:SegueIdentifierCategories]) {
        self.categoriesViewController = segue.destinationViewController;
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.categoriesViewController];
    }
    if ([segue.identifier isEqualToString:SegueIdentifierWebsite]) {
        self.websiteViewController = segue.destinationViewController;
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.websiteViewController];
    }
    if ([segue.identifier isEqualToString:SegueIdentifierHelp]) {
        self.helpViewController = segue.destinationViewController;
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.helpViewController];
    }
    if ([segue.identifier isEqualToString:SegueIdentifierAbout]) {
        self.aboutViewController = segue.destinationViewController;
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.aboutViewController];
    }
    
    self.currentSegueIdentifier = self.nextSegueIdentifier;
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (void)swapViewControllers
{
    if (self.transitionInProgress) {
        return;
    }
    
    self.transitionInProgress = YES;
    if (check == 1) {
        self.currentSegueIdentifier = SegueIdentifierHome;
    } else if (check == 2) {
        self.currentSegueIdentifier = SegueIdentifierCategories;
    } else if (check == 3) {
        self.currentSegueIdentifier = SegueIdentifierWebsite;
    } else if (check == 4) {
        self.currentSegueIdentifier = SegueIdentifierHelp;
    } else if (check == 5) {
        self.currentSegueIdentifier = SegueIdentifierAbout;
    }
    
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

@end