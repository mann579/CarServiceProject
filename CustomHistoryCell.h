//
//  CustomHistoryCell.h
//  CarServiceProject
//
//  Created by NetSet on 4/1/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHistoryCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgHistory;
@property (strong, nonatomic) IBOutlet UILabel *lblVehicle;
@property (strong, nonatomic) IBOutlet UILabel *lblCarMake;

@property (strong, nonatomic) IBOutlet UILabel *lblCarModel;


@property (strong, nonatomic) IBOutlet UIView *VwHistory;

@end
