//
//  ViewController.m
//  CarServiceProject
//
//  Created by NetSet on 3/30/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "CustomTableCell.h"
#import "PriceListViewController.h"
#import "ServiceViewController.h"
#import "ServiceDetailController.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *tableOrder;
    NSArray *tableSpname;
    NSArray *tableDate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     // Change button color
 //   _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
  
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    // To hide the table
    self.tableCustomView.hidden=YES;
    
    tableOrder = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    tableSpname = [NSArray arrayWithObjects:@"Ram", @"Risotto", @"Fullst", @"Hamurger", @"Ham",  nil];
    
    tableDate= [NSArray arrayWithObjects:@"11 Jan", @"12 Feb", @"13 Aug", @"12 Jan", @"21 Jan",  nil];
   // _tableCustomView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
   
}

-(void) viewWillAppear:(BOOL)animated
{
      self.navigationController.navigationBarHidden = YES;
}
- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marks......tablesource and delegate....

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return tableOrder.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    CustomTableCell *cell = (CustomTableCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    //  cell.lblOrder.layer.cornerRadius=8.0;
    cell.backgroundColor=[UIColor clearColor];
    cell.txtOrder.text = [tableOrder objectAtIndex:indexPath.row];
   // cell.lblSpname.layer.cornerRadius=8.0;
    cell.txtSp.text = [tableSpname objectAtIndex:indexPath.row];
   // cell.lblDate.layer.cornerRadius=8.0;
    //cell.lblDate.backgroundColor= [UIColor colorWithRed:0 green: 0 blue:0 alpha:1];
    cell.txtDate.text =[tableDate objectAtIndex:indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ServiceDetailController *serviceVW = [self.storyboard instantiateViewControllerWithIdentifier:@"ServiceDetailView"];
    serviceVW.serviceString =@"homeView";
    [self.navigationController pushViewController:serviceVW animated:NO];

    
   // [self performSegueWithIdentifier:@"push_service" sender:self];
    
}

#pragma marks........preformEditing...
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
    }
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

#pragma marks .........Segue to priceview......
- (IBAction)priceAction:(id)sender {
    
    PriceListViewController * viewCntrl = [self.storyboard instantiateViewControllerWithIdentifier:@"priceView"];
   [self.navigationController pushViewController:viewCntrl animated:NO];
   // [self.revealViewController pushFrontViewController:viewCntrl animated:NO];

}

- (IBAction)btnCRequest:(id)sender {
    
    ServiceViewController *serviceVW = [self.storyboard instantiateViewControllerWithIdentifier:@"service_Vw"];

    [self.navigationController pushViewController:serviceVW animated:NO];

}
@end
