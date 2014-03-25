//
//  ToDoListTableViewCell.m
//  Assignment 8
//
//  Created by Anthony Klose on 3/25/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "ToDoListTableViewCell.h"

@implementation ToDoListTableViewCell

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
