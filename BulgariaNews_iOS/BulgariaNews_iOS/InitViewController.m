//
//  ViewController.m
//  BulgariaNews_iOS
//
//  Created by Makros on 3/3/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import "InitViewController.h"
#import "MainViewController.h"

@interface InitViewController ()

@end

@implementation InitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"-> Init");
	// Do any additional setup after loading the view, typically from a nib.
    [self startScreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startScreen {
    [UIView animateWithDuration:2.0 animations:^{
        self.view.alpha = 1;
    } completion:^(BOOL finished) {
        MainViewController *mainView =[self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
        self.topViewController = mainView;
    }];
}

@end
