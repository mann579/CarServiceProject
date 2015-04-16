//
//  RequestedListVC.h
//  CarServiceProject
//
//  Created by NetSet on 4/7/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestedListVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tblVw_Request;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideReqBtn;
- (IBAction)sideRequestBtn:(id)sender;


@end
