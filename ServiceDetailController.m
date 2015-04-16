//
//  ServiceDetailController.m
//  CarServiceProject
//
//  Created by NetSet on 4/2/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "ServiceDetailController.h"
#import "ViewController.h"

@interface ServiceDetailController ()

@end

@implementation ServiceDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
  
    
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

- (IBAction)sideServiceBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:NO];
//    ViewController *homeVw =[self.storyboard instantiateViewControllerWithIdentifier:@"viewHome"];
//        [self.navigationController pushViewController:homeVw animated:NO];
}
@end
