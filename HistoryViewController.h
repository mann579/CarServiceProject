//
//  HistoryViewController.h
//  CarServiceProject
//
//  Created by NetSet on 4/1/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tblHistoryView;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideButtonHistory;


@end
