//
//  TableViewController.h
//  Diary
//
//  Created by 清水 翔太郎 on 2014/07/10.
//  Copyright (c) 2014年 清水 翔太郎. All rights reserved.
//最優先

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UIAccelerometerDelegate>
@property(weak,nonatomic)IBOutlet UILabel *textLabel;
@property(weak,nonatomic)IBOutlet UIImageView *samuneiru;
@end

