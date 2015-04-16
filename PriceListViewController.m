//
//  PriceListViewController.m
//  CarServiceProject
//
//  Created by NetSet on 3/31/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "PriceListViewController.h"
#import "ViewController.h"
#import "SWRevealViewController.h"
@interface PriceListViewController ()

@end

@implementation PriceListViewController
{
    NSArray *arrStype;
    NSInteger PriceIndex;
    
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[[self navigationController] navigationBar] setBarStyle:UIBarStyleBlackTranslucent];
    PFQuery *query = [PFQuery queryWithClassName:@"Service_Detail"];
    // [query whereKey:@"Service_Type" equalTo:@"Wheel Balancing"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            //            _txtPrice.text=[objects valueForKey:@"price"]
            
            arrStype=[[NSArray alloc] initWithArray:objects];
            [_pckrStype reloadAllComponents];
            
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
   // _sidePriceBtn.target = self.revealViewController;
   // _sidePriceBtn.action = @selector(revealToggle:);
    
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    _pckrStype.hidden=YES;
    _vwStype.hidden=YES;
    
//    arrStype=@[@"Wheel Alignment",@"Wheel Balancing",@"Cooling Systems",@"Brakes",@"Clutch and Auto transmission",@"Auto Electrical",@"Suspensions and shocks",@"Exhaust Systems",@"Engine Service",@"Oil Change",@"Wash-Outer only",@"Wash-Outer+Inner",@"Waxing",@"Denting and Painting"];
//  
     //self.navigationController.navigationBarHidden = YES;
  
    // Do any additional setup after loading the view.
}

/*- (void)addBackButtonWithTitle:(NSString *)title
{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonPressed)];
    self.navigationItem.leftBarButtonItem = backButton;
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark ------------------- UIPickerDataSource -------------------------
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
        return [[arrStype valueForKey:@"Service_Type"] count];
    
}


#pragma mark ------------------- UIPickerDelegate -------------------------

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
        
        return [[arrStype valueForKey:@"Service_Type"]objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
  _txtStype.text = [NSString stringWithFormat:@"%@",[[arrStype valueForKey:@"Service_Type"]objectAtIndex:row]] ;
    
   // _txtStype.text = [NSString stringWithFormat:@"%@",[arrStype objectAtIndex:row]] ;
  
   //row = [_pckrStype selectedRowInComponent:0];
    }



- (IBAction)btnStype:(id)sender {
    
    _pckrStype.hidden= NO;
    _vwStype.hidden=NO;
}


- (IBAction)btnDone:(id)sender
{
    if (_txtStype.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please choose the service type first" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }
    else
    {
       PriceIndex= [[arrStype valueForKey:@"Service_Type"] indexOfObject:_txtStype.text];
        
        
        _txtPrice.text=[[arrStype valueForKey:@"price"]objectAtIndex:PriceIndex];
        
    }
    
//     row = [_pckrStype selectedRowInComponent:0];
//    _txtStype.text =  [NSString stringWithFormat:@"%@",[arrStype objectAtIndex:row]];
    
    _pckrStype.hidden=YES;
    _vwStype.hidden=YES;
    
    
    
}

    - (IBAction)btnCanel:(id)sender{
        
        _pckrStype.hidden=YES;
        _vwStype.hidden=YES;
}
    
- (IBAction)barAction:(id)sender {
    
    
   ViewController * viewCntrl = [self.storyboard instantiateViewControllerWithIdentifier:@"viewHome"];

  // [self.revealViewController pushFrontViewController:viewCntrl animated:NO];
   [self.navigationController pushViewController:viewCntrl  animated:NO];

   }
@end
