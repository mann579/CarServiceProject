//
//  CSservice_detail.h
//  carservice
//
//  Created by admin on 4/7/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CSservice_detail : UIViewController

@property(strong,nonatomic)NSString *jobID;


@property (strong, nonatomic) IBOutlet UITextField *textfieldstatus;


@property (strong, nonatomic) IBOutlet UITextField *textfieldcar_make;
@property (strong, nonatomic) IBOutlet UITextField *textfieldcar_model;
@property (strong, nonatomic) IBOutlet UIImageView *textfiled_servicetype;
@property (strong, nonatomic) IBOutlet UITextField *textfiledpickadd;
@property (strong, nonatomic) IBOutlet UITextField *textfielddropadd;

@end
