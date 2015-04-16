//
//  CSservice_detail.m
//  carservice
//
//  Created by admin on 4/7/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "CSservice_detail.h"

@interface CSservice_detail ()

@end

@implementation CSservice_detail

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFQuery *query = [PFQuery queryWithClassName:@"jobs"];
  
    [query getObjectInBackgroundWithId:_jobID block:^(PFObject *jobs, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        _textfieldcar_make.text=jobs[@"car_make"];
    
        
        _textfieldcar_model.text=jobs[@"car_model"];
        _textfielddropadd.text=jobs[@"drop_address"];
        _textfiledpickadd.text=jobs[@"pick_address"];
        
        
    }];
                                                                                                 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
