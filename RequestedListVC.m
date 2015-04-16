//
//  RequestedListVC.m
//  CarServiceProject
//
//  Created by NetSet on 4/7/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "RequestedListVC.h"
#import "CustomRequestedCell.h"
#import "SWRevealViewController.h"
#import "ServiceHomeViewController.h"

@interface RequestedListVC ()

@end

@implementation RequestedListVC
{
    NSArray *arrImages;
    NSArray *arrCName;
    NSArray *arrDate;
    NSArray *arrSType;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // arrOrder=@[@"1",@"2",@"3",@"4"];
    arrCName=@[@"Ajay",@"Akshay",@"Aditya",@"Arjun"];
    arrDate=@[@"11Jan",@"13Feb",@"21Jan",@"29Feb"];
    arrSType=@[@"Car Washing",@"Wheel Alignment",@"Wheel Balancing",@"HandBrake"];
    
      arrImages=@[@"black-laye.png",@"map.png",@"pick-address-tab.png",@"submit.png",@"bg.png"];
   //  _tblVw_Request.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    _sideReqBtn.tintColor=[UIColor blackColor];
    
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -Tabledatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return arrCName.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    
    CustomRequestedCell *cell = (CustomRequestedCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomRequestedCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.backgroundColor=[UIColor clearColor];
 
   
    
    cell.lblName.text = [NSString stringWithFormat:@"%@ %@",@"Customer Name:",  [arrCName objectAtIndex:indexPath.row]];
    cell.lblDate.text = [NSString stringWithFormat:@"%@ %@",@"Date/Time",  [arrDate objectAtIndex:indexPath.row]];
    cell.lblStype.text = [NSString stringWithFormat:@"%@ %@",@"Service Type",  [arrSType objectAtIndex:indexPath.row]];
    cell.imgRequest.image=[UIImage imageNamed:[arrImages objectAtIndex:indexPath.row]];
    return cell;
}


- (IBAction)sideRequestBtn:(id)sender {
    
    ServiceHomeViewController *serviceHVw =[self.storyboard instantiateViewControllerWithIdentifier:@"serviceView"];
    [self.navigationController pushViewController:serviceHVw  animated:NO];
    
    
}
@end
