//
//  MainHomeViewController.m
//  CarServiceProject
//
//  Created by NetSet on 4/6/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "MainHomeViewController.h"
#import "SWRevealViewController.h"
#import "ViewController.h"
#import "ServiceHomeViewController.h"
@interface MainHomeViewController ()

@end

@implementation MainHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     // To Hide navigation bar
    self.navigationController.navigationBarHidden=YES ;
    // To round image
    _imgMain.layer.cornerRadius =_imgMain.frame.size.width / 2;
    _imgMain.clipsToBounds=YES;
    _imgMain.layer.masksToBounds = YES;
     // to Format label
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:@"Continue As"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,8)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(8,3)];
    
    _lblContinue.attributedText = string;
    
    _btnConsOutlet .layer.cornerRadius = 4;
    _btnConsOutlet.clipsToBounds = YES;
    _btnSpOutlet .layer.cornerRadius = 4;
    _btnSpOutlet.clipsToBounds = YES;
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

- (IBAction)btnConsumer:(id)sender {
    
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"consumerVIEW"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"serviceVIEW"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    ViewController * viewCon = [self.storyboard instantiateViewControllerWithIdentifier:@"viewHome"];
    [self.navigationController pushViewController:viewCon  animated:NO];
}

- (IBAction)btnService:(id)sender {
    
    
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"serviceVIEW"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"consumerVIEW"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    ServiceHomeViewController * viewCon = [self.storyboard instantiateViewControllerWithIdentifier:@"serviceView"];
    [self.navigationController pushViewController:viewCon  animated:NO];


    
}
@end
