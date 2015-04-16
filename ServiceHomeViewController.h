//
//  ServiceHomeViewController.h
//  CarServiceProject
//
//  Created by NetSet on 4/6/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceHomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationItem *barBtnService;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;

- (IBAction)btnRequestedList:(id)sender;
- (IBAction)btnActiveList:(id)sender;
- (IBAction)btnInQueueList:(id)sender;
- (IBAction)btnCompletedList:(id)sender;


@end
