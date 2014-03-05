//
//  CategoriesViewController.h
//  BulgariaNews_iOS
//
//  Created by Makros on 3/3/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMXMLParser.h"

@interface CategoriesViewController : UITableViewController <KMXMLParserDelegate> {
    int check;
}

@property (strong, nonatomic) NSMutableArray *parseResults;

@property (nonatomic) int check;

@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *description;

@end
