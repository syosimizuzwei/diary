//
//  NewTableViewController.m
//  Diary
//
//  Created by 清水 翔太郎 on 2014/07/18.
//  Copyright (c) 2014年 清水 翔太郎. All rights reserved.
//

#import "NewTableViewController.h"

@interface NewTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *topData;
    IBOutlet UITableView *tableView;
    IBOutlet UILabel *titleLabel;
}


@end

@implementation NewTableViewController

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
    topData = [NSArray arrayWithObjects:@"dfdf",@"sfsdf",nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //cell.textLabel.text = [topData objectAtIndex:indexPath.row];
    //cell.textLabel.text = @"dfb";
    UIImageView  *samuneiru =(UIImageView *)[cell viewWithTag:3];
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
    NSUserDefaults *defolts=[NSUserDefaults standardUserDefaults];
    NSString *  test = [defolts objectForKey : @"title"];
    NSData *imageData = [[NSUserDefaults standardUserDefaults]objectForKey:@"photo"];
    if(imageData){
        UIImage * image =[UIImage imageWithData:imageData];
        cell.imageView.image = image;
    }
    titleLabel.text = test;
    
    return cell;
}

/*-(IBAction)userDefault{
 NSString * samune = imageView;
 NSUserDefaults * defoults = [NSUserDefaults standardUserDefaults];
 [defoults setObject:photo forKey:@"samune"];
 }
 
 */

@end
