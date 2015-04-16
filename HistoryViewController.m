//
//  HistoryViewController.m
//  CarServiceProject
//
//  Created by NetSet on 4/1/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "HistoryViewController.h"
#import "CustomHistoryCell.h"
#import "SWRevealViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController
{
    NSArray *arrCarMake;
    NSArray *arrCarModel;
    NSArray *arrImages;
    NSArray *arrVehicle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    arrCarMake=@[@"chevrolet",@"Fiat",@"Force",@"Ford",@"Honda"];
    arrCarModel=@[@"2000",@"2001",@"2005",@"2008",@"2009"];
    arrVehicle=@[@"7100",@"1974",@"4100",@"5647",@"1669"];
    arrImages=@[@"black-laye.png",@"map.png",@"pick-address-tab.png",@"submit.png",@"bg.png"];
    // _tblHistoryView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    // Change button color
       _sideButtonHistory.tintColor = [UIColor blackColor];

    _sideButtonHistory.target = self.revealViewController;
    _sideButtonHistory.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    

}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return arrCarMake.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    
    CustomHistoryCell *cell = (CustomHistoryCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomHistoryCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
  
    cell.backgroundColor=[UIColor clearColor];
  //  cell.lblCarMake.text = [arrCarModel objectAtIndex:indexPath.row];
    
  // cell.lblCarModel.text = [ arrCarModel objectAtIndex:indexPath.row];
    
// cell.lblVehicle.text =[arrVehicle objectAtIndex:indexPath.row];
   cell.imgHistory.image=[UIImage imageNamed:[arrImages objectAtIndex:indexPath.row]];
    
cell.lblVehicle.text = [NSString stringWithFormat:@"%@ %@",@"VehicleNo.:",  [arrVehicle objectAtIndex:indexPath.row]];
    cell.lblCarMake.text = [NSString stringWithFormat:@"%@ %@",@"CarMake:",  [arrCarMake objectAtIndex:indexPath.row]];
    cell.lblCarModel.text = [NSString stringWithFormat:@"%@ %@",@"CarModel:",  [arrCarModel objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        [self performSegueWithIdentifier:@"push_detail" sender:self];
    
}

@end
