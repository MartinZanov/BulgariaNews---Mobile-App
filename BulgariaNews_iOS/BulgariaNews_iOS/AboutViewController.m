//
//  AboutViewController.m
//  BulgariaNews_iOS
//
//  Created by Makros on 3/3/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

@synthesize aboutWebView;

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
	// Do any additional setup after loading the view.
    NSString *pic1;
    pic1 = @"http://tony.tara-soft.net/img/A.Mitkov.png";
    NSString *pic2;
    pic2 = @"http://tony.tara-soft.net/img/M.Zanov.png";
    NSString * embedHTML;
    embedHTML = [NSString stringWithFormat:@"<h>ЗА НАС</h><p>Сайтът и мобилното приложение са разработени от Антон Митков и Мартин Занов. Ученици в Технологично училище електронни системи към ТУ - град София. С помощта предоставена ни от Тара Софт ЕООД те успяват да изградят този проект като Антон отговря за уеб часта, а Мартин изгражда iOS приложението.</p><img src=\"%@\" height=\"120\" width=\"80\"><img src=\"%@\" height=\"120\" width=\"80\">",pic1, pic2];
    
    [aboutWebView loadHTMLString:embedHTML baseURL:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
