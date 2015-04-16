//
//  CustomRequestedCell.m
//  CarServiceProject
//
//  Created by NetSet on 4/7/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "CustomRequestedCell.h"

@implementation CustomRequestedCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    _imgRequest.layer.cornerRadius =_imgRequest.frame.size.width / 2;
    _imgRequest.clipsToBounds=YES;
    _imgRequest.layer.masksToBounds = YES;
    
    _vw_Requested.layer.cornerRadius = 5;
    _vw_Requested.clipsToBounds = YES;

    
}

@end
