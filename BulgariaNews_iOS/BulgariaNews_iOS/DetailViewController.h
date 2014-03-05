//
//  DetailViewController.h
//  BulgariaNews_iOS
//
//  Created by Makros on 3/4/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMXMLParser.h"

@interface DetailViewController : UIViewController <KMXMLParserDelegate, UIScrollViewDelegate> {
    
    IBOutlet UIScrollView *scrollView;
    int check;
    
}

@property (nonatomic, retain) UIScrollView *scrollView;

@property (strong, nonatomic) NSMutableArray *parseResults;

@property (nonatomic) int check;

@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (nonatomic) UIImage *img;
@property (weak, nonatomic) IBOutlet UIWebView *detailNews;
@property (weak, nonatomic) IBOutlet UILabel *detailDateEntered;

@end
