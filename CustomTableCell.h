//
//  CustomTableCell.h
//  CarServiceProject
//
//  Created by NetSet on 3/31/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell



@property (strong, nonatomic) IBOutlet UILabel *lblOrder;


@property (strong, nonatomic) IBOutlet UILabel *lblSpname;

@property (strong, nonatomic) IBOutlet UILabel *lblDate;

@property (strong, nonatomic) IBOutlet UITextField *txtDate;


@property (strong, nonatomic) IBOutlet UITextField *txtSpname;

@property (strong, nonatomic) IBOutlet UITextField *txtOrder;

@property (strong, nonatomic) IBOutlet UITextField *txtSp;

@end
