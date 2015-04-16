//
//  SidePanel.m
//  CarServiceProject
//
//  Created by NetSet on 3/30/15.
//  Copyright (c) 2015 NetSet. All rights reserved.
//

#import "SidePanel.h"
#import "SWRevealViewController.h"
#import "HistoryViewController.h"
#import "MainHomeViewController.h"
#import "ServiceHomeViewController.h"
#import "ViewController.h"
#import "SettingViewController.h"

@interface SidePanel ()

@end

@implementation SidePanel
{
    

 NSArray *menuItems;
    NSArray *menuItems1;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imgView.layer.cornerRadius =_imgView.frame.size.width / 2;
    _imgView.clipsToBounds=YES;
    _imgView.layer.masksToBounds = YES;
    
    
   //_tableISideView.allowsSelection=NO;
    // _tableISideView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"side_bg.png"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    if ([ [NSUserDefaults standardUserDefaults] boolForKey:@"consumerVIEW"] == YES) {
         menuItems1 = nil;
        menuItems=@[@"home",@"profile",@"history",@"newrequest",@"settings",@"logout"];
    }
    if ([ [NSUserDefaults standardUserDefaults] boolForKey:@"serviceVIEW"] == YES)
    {
        menuItems = nil;
        menuItems1=@[@"home",@"profile",@"history",@"settings",@"logout"];
    }
    [_tableISideView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if ([ [NSUserDefaults standardUserDefaults] boolForKey:@"consumerVIEW"] == YES) {
       
    return [menuItems count];
    }
    if ([ [NSUserDefaults standardUserDefaults] boolForKey:@"serviceVIEW"] == YES)
    {
        
        return [menuItems1 count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     UITableViewCell *cell ;
    if ([ [NSUserDefaults standardUserDefaults] boolForKey:@"consumerVIEW"] == YES) {
        
      NSString * CellIdentifier = [menuItems objectAtIndex:indexPath.row];
   cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    }
    if ([ [NSUserDefaults standardUserDefaults] boolForKey:@"serviceVIEW"] == YES)
    {
        if (!menuItems1.count<=indexPath.row) {
    
       NSString *  CellIdentifier1 = [menuItems1 objectAtIndex:indexPath.row];
           cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1 forIndexPath:indexPath];

        }
    }
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([ [NSUserDefaults standardUserDefaults] boolForKey:@"consumerVIEW"] == YES)
    {
        if(indexPath.row == 0)
        {
            ViewController * consumerHomeView  = [self.storyboard instantiateViewControllerWithIdentifier:@"viewHome"];
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[consumerHomeView] animated: NO ];
            
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
            
        }
        
        if(indexPath.row == 2)
        {
            HistoryViewController * historyView  = [self.storyboard instantiateViewControllerWithIdentifier:@"history_Vw"];
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[historyView] animated: NO ];
            
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
            
        }
        
        if(indexPath.row == 4)
        {
            SettingViewController * settingView  = [self.storyboard instantiateViewControllerWithIdentifier:@"setting_View"];
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[settingView] animated: NO ];
            
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        }
        
        if(indexPath.row ==5)
        {
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"consumerVIEW"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            MainHomeViewController * mainHomeView  = [self.storyboard instantiateViewControllerWithIdentifier:@"mainHomeVw"];
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[mainHomeView] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        }
    }
    if ([ [NSUserDefaults standardUserDefaults] boolForKey:@"serviceVIEW"] == YES)
    {
        if(indexPath.row == 0)
        {
            ServiceHomeViewController * serviceHomeView  = [self.storyboard instantiateViewControllerWithIdentifier:@"serviceView"];
                     UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
        [navController setViewControllers: @[serviceHomeView] animated: NO ];
            
           [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];

        }
        if(indexPath.row ==4)
        {
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"serviceVIEW"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            MainHomeViewController * mainHomeView  = [self.storyboard instantiateViewControllerWithIdentifier:@"mainHomeVw"];
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[mainHomeView] animated: NO ];
            
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];

        }
            
    }
}



- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{ if ([ [NSUserDefaults standardUserDefaults] boolForKey:@"consumerVIEW"] == YES)
{
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableISideView  indexPathForSelectedRow];
   UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
   destViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    //if ([segue.identifier isEqualToString:@"history"])
    //{
     //   HistoryViewController *historyController = (HistoryViewController*)segue.destinationViewController;

      // }
}
}



@end
