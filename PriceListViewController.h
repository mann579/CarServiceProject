//
//  PriceListViewController.h
//  CarServiceProject
//
//  Created by NetSet on 3/31/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PriceListViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>


@property (strong, nonatomic) IBOutlet UITextField *txtStype;
@property (strong, nonatomic) IBOutlet UIPickerView *pckrStype;

- (IBAction)btnStype:(id)sender;

- (IBAction)btnDone:(id)sender;

- (IBAction)btnCanel:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *vwStype;

- (IBAction)barAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtPrice;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidePriceBtn;


@end
