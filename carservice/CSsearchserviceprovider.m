//
//  CSsearchserviceprovider.m
//  carservice
//
//  Created by admin on 3/31/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "CSsearchserviceprovider.h"
#import "AFNetworking.h"
@interface CSsearchserviceprovider ()
{
    NSDictionary *stateDic;
    NSDictionary *cityDic;
        NSInteger load;
    NSString *stateId;
    CSaddressScreen *add;
    
}
@end

@implementation CSsearchserviceprovider

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
    
    add=[[CSaddressScreen alloc]init];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"https://www.whizapi.com/api/v2/util/ui/in/indian-states-list?appkey=b8rtl2mofsubvggowuzgn24c" parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             stateDic=[[NSDictionary alloc] initWithDictionary:responseObject];
             [_tableView reloadData];
             
             
             NSLog(@"JSON: %@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];

    _viewforPicker.frame=CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, _viewforPicker.bounds.size.height);
    
    _txtfieldstate.inputView=_viewforPicker;
     _txtfieldcity.inputView=_viewforPicker;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
      if (textField.tag==1) {
          _txtfieldcity.text=@"";
    }
    
    
    load=textField.tag;
          [_tableView reloadData];
    
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDoneAction:(id)sender {
    [self.view endEditing:YES];

    [self WebserviceTogetCity];
}

- (void)WebserviceTogetCity
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *strUrl=[NSString stringWithFormat:@"https://www.whizapi.com/api/v2/util/ui/in/indian-city-by-state?AppKey=b8rtl2mofsubvggowuzgn24c&stateid=%@",stateId];
    
    [manager GET:strUrl parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             cityDic=[[NSDictionary alloc] initWithDictionary:responseObject];
       [_tableView reloadData];
             
             
             NSLog(@"JSON: %@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];

}
- (IBAction)btnCancelAction:(id)sender {
[self.view endEditing:YES];
}


#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    if (load==1) {
        return [[stateDic valueForKeyPath:@"Data.Name"] count];
    }
    else{
        return [[cityDic valueForKeyPath:@"Data.city"] count];
        
    }}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    if (load==1) {
        cell.textLabel.text=[[stateDic valueForKeyPath:@"Data.Name"] objectAtIndex:indexPath.row];
    }
    else{
     cell.textLabel.text= [[cityDic valueForKeyPath:@"Data.city"] objectAtIndex:indexPath.row];
        
    }
 
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
 stateId=[[stateDic valueForKeyPath:@"Data.ID"] objectAtIndex:indexPath.row];
    if (load==1) {
        _txtfieldstate.text=[[stateDic valueForKeyPath:@"Data.Name"] objectAtIndex:indexPath.row];

    }
    else{
        _txtfieldcity.text=[[cityDic valueForKeyPath:@"Data.city"] objectAtIndex:indexPath.row];

    }
}



- (IBAction)btn_submit:(id)sender {
    
    [self performSegueWithIdentifier:@"pop" sender:sender];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"pop"]) {
        
        // Get destination view
        add = [segue destinationViewController];
        
        add.jobId=_jobID;
        
    }
    
}
@end
