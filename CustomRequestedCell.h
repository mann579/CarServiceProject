//
//  CustomRequestedCell.h
//  CarServiceProject
//
//  Created by NetSet on 4/7/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomRequestedCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblOrder;
@property (strong, nonatomic) IBOutlet UILabel *lblName;

@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblStype;
@property (strong, nonatomic) IBOutlet UIImageView *imgRequest;
@property (strong, nonatomic) IBOutlet UIView *vw_Requested;


@end
