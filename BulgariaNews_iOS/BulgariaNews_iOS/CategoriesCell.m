//
//  CategoriesCell.m
//  BulgariaNews_iOS
//
//  Created by Makros on 3/3/14.
//  Copyright (c) 2014 MartinZanov. All rights reserved.
//

#import "CategoriesCell.h"

@implementation CategoriesCell

@synthesize cellDescription, cellTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
