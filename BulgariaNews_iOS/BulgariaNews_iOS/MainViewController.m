//
//  HomeViewController.m
//  BulgariaNews_iOS
//
//  Created by Makros on 3/3/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import "MainViewController.h"
#import "ContainerViewController.h"

@interface MainViewController ()

@property (nonatomic, weak) ContainerViewController *containerViewController;

- (IBAction)homeButtonPressed:(id)sender;
- (IBAction)categoriesButtonPressed:(id)sender;
- (IBAction)websiteButtonPressed:(id)sender;
- (IBAction)helpButtonPressed:(id)sender;
- (IBAction)aboutButtonPressed:(id)sender;

@end

@implementation MainViewController

@synthesize check;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"-> Main");
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
}

- (IBAction)homeButtonPressed:(id)sender
{
    check = 1;
    self.containerViewController.check = check;
    [self.containerViewController swapViewControllers];
}

- (IBAction)categoriesButtonPressed:(id)sender
{
    check = 2;
    self.containerViewController.check = check;
    [self.containerViewController swapViewControllers];
}

- (IBAction)websiteButtonPressed:(id)sender
{
    check = 3;
    self.containerViewController.check = check;
    [self.containerViewController swapViewControllers];
}

- (IBAction)helpButtonPressed:(id)sender
{
    check = 4;
    self.containerViewController.check = check;
    [self.containerViewController swapViewControllers];
}

- (IBAction)aboutButtonPressed:(id)sender
{
    check = 5;
    self.containerViewController.check = check;
    [self.containerViewController swapViewControllers];
}

@end
