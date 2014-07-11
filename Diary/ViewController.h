//
//  ViewController.h
//  Diary
//
//  Created by 清水 翔太郎 on 2014/06/06.
//  Copyright (c) 2014年 清水 翔太郎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UIPickerViewDataSource, UITextFieldDelegate,UITextViewDelegate,UIAccelerometerDelegate>
{
    int index;
    IBOutlet UITextField *text;
}
@property(weak,nonatomic)IBOutlet UIImageView *imageview;
@property(weak,nonatomic)IBOutlet UITextView *textview;
//-textView:shouldChangeTextInRange:replacementText;
-(void)textViewDidChange: (UITextView*) textView ;
//-(IBAction)button:(id)sender;
- (IBAction)tapCameraButton:(id)sender;
-(IBAction)userDefaultDone:(id)sender;




@end
