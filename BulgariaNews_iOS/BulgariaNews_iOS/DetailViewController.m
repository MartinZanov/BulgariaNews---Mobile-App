//
//  DetailViewController.m
//  BulgariaNews_iOS
//
//  Created by Makros on 3/4/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation NSString (mycategory)

- (NSString *)stringByStrippingHTML
{
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end

@implementation DetailViewController

@synthesize parseResults = _parseResults;
@synthesize detailDateEntered, detailImage, detailNews, detailTitle, check, img, scrollView;

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
    
    scrollView.delegate = self;
    self.scrollView.contentMode = UIViewContentModeScaleToFill;
    scrollView.clipsToBounds = YES;

    
    KMXMLParser *parser = [[KMXMLParser alloc] initWithURL:@"http://tony.tara-soft.net/rss" delegate:self];
    _parseResults = [parser posts];
    
    [self stripHTMLFromSummary];

    NSLog(@"ASD CHECK PLS %d", check);
    
    detailTitle.text = [[self.parseResults objectAtIndex:check] objectForKey:@"title"];
    detailTitle.numberOfLines = 2;
    NSString *stringNews = [[self.parseResults objectAtIndex:check ] objectForKey:@"newsDescription"];
                            
    [detailNews loadHTMLString:stringNews baseURL:nil];
    detailDateEntered.text = [[self.parseResults objectAtIndex:check] objectForKey:@"date"];
    
    NSString * picString;
    picString = [[self.parseResults objectAtIndex:check] objectForKey:@"link"];
    
    NSString *string = picString;
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
        NSLog(@"Picture : %@", string);
    NSData * data = [[NSData alloc] init];
    data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[ NSString stringWithFormat:@"%@",string]]];
    img = [UIImage imageWithData: data];
    self.detailImage.image = img;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)stripHTMLFromSummary {
    int i = 0;
    int count = self.parseResults.count;
    //cycles through each 'summary' element stripping HTML
    while (i < count) {
        NSString *tempString = [[self.parseResults objectAtIndex:i] objectForKey:@"summary"];
        NSString *string = tempString;
        string = [string stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
        NSString *strippedString = [string stringByStrippingHTML];
        NSMutableDictionary *dict = [self.parseResults objectAtIndex:i];
        [dict setObject:strippedString forKey:@"summary"];
        [self.parseResults replaceObjectAtIndex:i withObject:dict];
        i++;
    }
}

- (void)reloadFeed {
    KMXMLParser *parser = [[KMXMLParser alloc] initWithURL:@"http://tony.tara-soft.net/rss" delegate:self];
    _parseResults = [parser posts];
    
    [self stripHTMLFromSummary];
    //[self.view reloadData];
}

#pragma mark - KMXMLParser Delegate

- (void)parserDidFailWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Could not parse feed. Check your network connection." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [alert show];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)parserCompletedSuccessfully {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)parserDidBegin {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
