//
//  HomeViewController.h
//  BulgariaNews_iOS
//
//  Created by Makros on 3/4/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMXMLParser.h"

@interface HomeViewController : UICollectionViewController <KMXMLParserDelegate> {
    int check;
}

@property (strong, nonatomic) NSMutableArray *parseResults;

@property (nonatomic) int check;

@end
