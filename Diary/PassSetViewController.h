//
//  PassSetViewController.h
//  Diary
//
//  Created by 清水 翔太郎 on 2014/06/13.
//  Copyright (c) 2014年 清水 翔太郎. All rights reserved.
//

#import "ViewController.h"

@interface PassSetViewController : UIViewController{
    int number;
    int first;
    int second;
    int third;
    int forth;
    int amount;
    int amount2;
    int amount3;
    int number2;
    int ok;
    IBOutlet UILabel *a;
    IBOutlet UILabel *b;
    IBOutlet UILabel *c;
    IBOutlet UILabel *d;
    IBOutlet UILabel *miss;
}

-(IBAction)one;
-(IBAction)two;
-(IBAction)three;
-(IBAction)four;
-(IBAction)five;
-(IBAction)six;
-(IBAction)seven;
-(IBAction)eight;
-(IBAction)nine;
-(IBAction)zero;
-(IBAction)back;
-(IBAction)cancel;

-(void)process;
-(void)oorr;

@end
