//
//  CSsearchserviceprovider.h
//  carservice
//
//  Created by admin on 3/31/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSaddressScreen.h"
@interface CSsearchserviceprovider : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtfieldstate;
@property (strong, nonatomic) IBOutlet UITextField *txtfieldcity;
@property (strong, nonatomic) IBOutlet UITextField *txtserviceprovider;
@property (strong, nonatomic) IBOutlet UIPickerView *Pickerselectinfo;
- (IBAction)btnDoneAction:(id)sender;
- (IBAction)btnCancelAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *viewforPicker;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSString *jobID;

- (IBAction)btn_submit:(id)sender;

@end
