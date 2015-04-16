//
//  CSViewController.h
//  carservice
//
//  Created by admin on 3/31/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CSViewController : UIViewController<UINavigationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>


@property (strong, nonatomic) IBOutlet UITextField *textfieldcarmodel;
@property (strong, nonatomic) IBOutlet UITextField *textfiledreg_vehicleno;
@property (strong, nonatomic) IBOutlet UIView *servicerequset_view;

- (IBAction)btn_done:(UIButton *)sender;
- (IBAction)btn_imges:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_images;
- (IBAction)btn_next:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UITextField *textfieldcarmake;
@property (strong, nonatomic) IBOutlet UITextField *textfield_description;
@property (strong, nonatomic) IBOutlet UITextField *textfielddate_time;
@property (strong, nonatomic) IBOutlet UIPickerView *picker_view;

@property (strong, nonatomic) IBOutlet UIDatePicker *date_picker;

@property (strong, nonatomic) IBOutlet UIButton *btn_next;

@property (strong, nonatomic) IBOutlet UITextField *textfield_servicetype;

- (IBAction)action_date_picker:(UIDatePicker *)sender;
- (IBAction)btn_checkbox:(UIButton *)sender;

- (IBAction)btn_cancel:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_checkbox;






@end
