//
//  HMCustomCell.m
//  HMTableViewCellAccessory
//
//  Created by Himal Madhushan on 1/29/15.
//  Copyright (c) 2015 MacKa. All rights reserved.
//

#import "HMCustomCell.h"

@implementation HMCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
