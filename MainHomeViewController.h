//
//  MainHomeViewController.h
//  CarServiceProject
//
//  Created by NetSet on 4/6/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainHomeViewController : UIViewController

- (IBAction)btnConsumer:(id)sender;

- (IBAction)btnService:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lblContinue;

@property (strong, nonatomic) IBOutlet UIButton *btnConsOutlet;
@property (strong, nonatomic) IBOutlet UIButton *btnSpOutlet;

@property (strong, nonatomic) IBOutlet UIImageView *imgMain;

@end
