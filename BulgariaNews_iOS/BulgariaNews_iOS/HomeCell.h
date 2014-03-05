//
//  HomeCell.h
//  BulgariaNews_iOS
//
//  Created by Makros on 3/5/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UICollectionViewCell

@property (weak) IBOutlet UIImageView *newsImage;
@property (strong, nonatomic) IBOutlet UILabel *title;

@end
