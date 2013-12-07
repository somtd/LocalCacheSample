//
//  OdenCell.m
//  LocalCacheSample
//
//  Created by SOMTD on 2013/12/07.
//  Copyright (c) 2013年 SOMTD. All rights reserved.
//

#import "OdenCell.h"

@implementation OdenCell
@synthesize imageView;
@synthesize nameLabel;
@synthesize detailView;

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
