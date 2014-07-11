//
//  PassSetViewController.m
//  Diary
//
//  Created by 清水 翔太郎 on 2014/06/13.
//  Copyright (c) 2014年 清水 翔太郎. All rights reserved.
//

#import "PassSetViewController.h"

@interface PassSetViewController ()

@end

@implementation PassSetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)one{
    number2 = 1;
    [self process];
}

-(IBAction)two{
    number2 = 2;
    [self process];
}

-(IBAction)three{
    number2 = 3;
    [self process];
}

-(IBAction)four{
    number2 = 4;
    [self process];
}

-(IBAction)five{
    number2 = 5;
    [self process];
}

-(IBAction)six{
    number2 = 6;
    [self process];
}

-(IBAction)seven{
    number2 = 7;
    [self process];
}

-(IBAction)eight{
    number2 = 8;
    [self process];
}

-(IBAction)nine{
    number2 = 9;
    [self process];
}

-(IBAction)zero{
    number2 = 0;
    [self process];
}

-(IBAction)back{
    if(number>=1){
        number = number-1;
        if(number == 2){
            c.backgroundColor = [UIColor whiteColor];
        }
        else if(number == 1){
            b.backgroundColor = [UIColor whiteColor];
        }
        else{
            a.backgroundColor = [UIColor whiteColor];
        }
    }
}

-(IBAction)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)process{
    miss.text = [NSString stringWithFormat:@""];
    if(number == 3){
        d.backgroundColor = [UIColor grayColor];
        forth = number2;
        number = 0;
        [self performSelector:@selector(oorr) withObject:nil afterDelay:0.2];
    }
    else if(number == 2){
        number = 3;
        third = number2;
        c.backgroundColor = [UIColor grayColor];
    }
    else if(number == 1){
        number = 2;
        second = number2;
        b.backgroundColor = [UIColor grayColor];
    }
    else{
        number = 1;
        first = number2;
        a.backgroundColor = [UIColor grayColor];
    }
}

-(void)oorr{
    if(ok == 1){
        amount2 = 1000*first + 100*second + 10*third +forth;
        if (amount ==amount2){
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setInteger:amount2 forKey:@"pass"];
            [userDefaults synchronize];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else{
            miss.text =[NSString stringWithFormat:@"パスコードが違います"];
            ok = 0;
            a.backgroundColor = b.backgroundColor = c.backgroundColor = d.backgroundColor = [UIColor whiteColor];
        }
    }
    else{
        amount = 1000*first + 100*second + 10*third +forth;
        ok = 1;
        miss.text =[NSString stringWithFormat:@"もう一度入力してください"];
        a.backgroundColor = b.backgroundColor = c.backgroundColor = d.backgroundColor = [UIColor whiteColor];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    amount3 = [userDefaults integerForKey:@"pass"];
    if (amount3 != 0){
        miss.text = [NSString stringWithFormat:@"新しいパスコードを入力してください"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
