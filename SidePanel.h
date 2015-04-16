//
//  SidePanel.h
//  CarServiceProject
//
//  Created by NetSet on 3/30/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SidePanel : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableISideView;

@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@end
