//
//  CSInQueueList.m
//  carservice
//
//  Created by admin on 4/8/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "CSInQueueList.h"

@interface CSInQueueList ()

@end

@implementation CSInQueueList

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Pcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [(UIView*)[cell viewWithTag:10] layer].cornerRadius=10.0;
    
    [(UIImageView*)[cell viewWithTag:1] setImage:[UIImage imageNamed:@"car_pic"]];
    [(UILabel*)[cell viewWithTag:2] setText:@"AUDI"];
    [(UILabel*)[cell viewWithTag:3] setText:@"asd"];
    [(UILabel*)[cell viewWithTag:4] setText:@"asd"];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    
    
}

@end
