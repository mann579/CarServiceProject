//
//  ServiceHomeViewController.m
//  CarServiceProject
//
//  Created by NetSet on 4/6/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "ServiceHomeViewController.h"
#import "SWRevealViewController.h"
#import "RequestedListVC.h"
@interface ServiceHomeViewController ()

@end

@implementation ServiceHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _menuBarButton.target = self.revealViewController;
    _menuBarButton.action = @selector(revealToggle:);
    _menuBarButton.tintColor=[UIColor blackColor];
    
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
// Do any additional setup after loading the view.
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

- (IBAction)btnRequestedList:(id)sender {
    
    RequestedListVC * reqView =[self.storyboard instantiateViewControllerWithIdentifier:@"reqView"];
    [self.navigationController pushViewController:reqView animated:NO];
    
     }

- (IBAction)btnActiveList:(id)sender {
}

- (IBAction)btnInQueueList:(id)sender {
}

- (IBAction)btnCompletedList:(id)sender {
}
@end
