//
//  WebsiteViewController.h
//  BulgariaNews_iOS
//
//  Created by Makros on 3/3/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebsiteViewController : UIViewController
{
    UIWebView *websiteView;
}

@property (retain, nonatomic) IBOutlet UIWebView *websiteView;

@end
