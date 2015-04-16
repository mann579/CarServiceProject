//
//  ViewController.h
//  CarServiceProject
//
//  Created by NetSet on 3/30/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@property (strong, nonatomic) IBOutlet UITableView *tableCustomView;

- (IBAction)priceAction:(id)sender;

- (IBAction)btnCRequest:(id)sender;


@end

