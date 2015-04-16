//
//  CustomHistoryCell.m
//  CarServiceProject
//
//  Created by NetSet on 4/1/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "CustomHistoryCell.h"

@implementation CustomHistoryCell

- (void)awakeFromNib {
    // Initialization code
   
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    _imgHistory.layer.cornerRadius =_imgHistory.frame.size.width / 2;
  _imgHistory.clipsToBounds=YES;
    _imgHistory.layer.masksToBounds = YES;
    _VwHistory.layer.cornerRadius=5.0;
    _VwHistory.clipsToBounds=YES;

    // Configure the view for the selected state
}

@end
