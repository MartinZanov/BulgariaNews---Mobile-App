//
//  HomeViewController.m
//  BulgariaNews_iOS
//
//  Created by Makros on 3/4/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "DetailViewController.h"

@interface HomeViewController ()

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

@implementation HomeViewController

@synthesize parseResults = _parseResults, check;
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
    
    KMXMLParser *parser = [[KMXMLParser alloc] initWithURL:@"http://tony.tara-soft.net/rss" delegate:self];
    _parseResults = [parser posts];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)reloadFeed {
    KMXMLParser *parser = [[KMXMLParser alloc] initWithURL:@"http://tony.tara-soft.net/rss" delegate:self];
    _parseResults = [parser posts];
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"HomeCell";
    
    
    HomeCell *homeCell = (HomeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //int i = indexPath.row%10;
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        int a=10;
        NSData * data = [[NSData alloc] init];
        //for (int b = 0; b <=[GalleryLinkMenu count];b++){
        
        NSString * picString;
        picString = [[self.parseResults objectAtIndex:indexPath.row] objectForKey:@"link"];
        
        NSString *string = picString;
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
        NSLog(@"Picture : %@", string);
        
        data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[ NSString stringWithFormat:@"%@",string]]];
        a--;
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            homeCell.newsImage.image = [UIImage imageWithData: data];
            homeCell.title.text = [[self.parseResults objectAtIndex:indexPath.row] objectForKey:@"title"];
            homeCell.title.numberOfLines = 2;
        });
        
    });
    return homeCell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"homeToDetail"]){
        HomeCell *cell = (HomeCell *)sender;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        check = indexPath.row;
        NSLog(@"MUCH CHECK : %d", check);
        DetailViewController* detail =
        (DetailViewController*)[segue destinationViewController];
        detail.check = check;
        NSLog(@"ASD CHECK : %d", check);
    }
}

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

@end
