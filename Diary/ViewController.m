//
//  ViewController.m
//  Diary
//
//  Created by 清水 翔太郎 on 2014/06/06.
//  Copyright (c) 2014年 清水 翔太郎. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface SecondViewController ()

@end

@implementation SecondViewController{
    NSString *assetsUrl;
    ALAssetsLibrary *library;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.textview.delegate = self;
    // [「改行（Return）」キーの設定]
    self.textview.returnKeyType = UIReturnKeyDone;
    _textview.layer.borderWidth = 1 ;
    _textview.layer.borderColor = [[UIColor blackColor] CGColor];
    text.delegate=self;
    index=0;
    library = [[ALAssetsLibrary alloc]init];
    _textview.text =[NSString stringWithFormat:@"sumple"];1
    
    ;
    
}
- (void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *defoults=[NSUserDefaults standardUserDefaults];
    NSString *  test = [defoults objectForKey : @"title"];
    text.text=[NSString stringWithFormat:test];
    NSString * textViewtext = [defoults objectForKey : @"bunsyou"];
    _textview.text = textViewtext;
    UIImage *image = self.imageview.image;
    NSData *imageData = UIImagePNGRepresentation(image);
    [[NSUserDefaults standardUserDefaults]setObject:imageData forKey:@"photo"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//assetsから取得した画像を表示する
-(void)showPhoto:(NSString *)url
{
    //URLからALAssetを取得
    [library assetForURL:[NSURL URLWithString:url]
             resultBlock:^(ALAsset *asset) {
                 
                 //画像があればYES、無ければNOを返す
                 if(asset){
                     NSLog(@"データがあります");
                     //ALAssetRepresentationクラスのインスタンスの作成
                     ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
                     
                     //ALAssetRepresentationを使用して、フルスクリーン用の画像をUIImageに変換
                     //fullScreenImageで元画像と同じ解像度の写真を取得する。
                     UIImage *fullscreenImage = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage]];
                     self.imageview.image = fullscreenImage; //イメージをセット
                 }else{
                     NSLog(@"データがありません");
                 }
                 
             } failureBlock: nil];
}
//撮影終了後に「use」を押すと呼び出されるメソッド。
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //カメラライブラリから選んだ写真のURLを取得。
    assetsUrl = [(NSURL *)[info objectForKey:@"UIImagePickerControllerReferenceURL"] absoluteString];
    [self showPhoto:assetsUrl];
    
    [picker dismissViewControllerAnimated:YES completion:nil];  //元の画面に戻る
}

- (IBAction)tapCameraButton:(id)sender {
    //イメージピッカーカメラを生成
    UIImagePickerController *picker =
    [[UIImagePickerController alloc] init];
    picker.delegate = (id)self;
    
    picker.allowsEditing = NO;  //撮影後に編集可能にするかの設定
    
    // 画像の取得先をカメラに設定
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    //pickerViewに遷移させる
    [self presentViewController:picker animated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [
     textField resignFirstResponder];
    return YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
    // YES if the old text should be replaced by the new text;
    // NO if the replacement operation should be aborted. (Apple's Reference より)
}

-(IBAction)userDefaultDone:(id)sender{
    NSString * test = text.text;
    UIImage *image = self.imageview.image;
    NSData *imageData = UIImagePNGRepresentation(image);
    NSUserDefaults * defoults = [NSUserDefaults standardUserDefaults];
    [defoults setObject:test forKey:@"title"];
    [[NSUserDefaults standardUserDefaults]setObject:imageData forKey:@"photo"];
    NSString * bunnsyou = _textview.text;
    [defoults setObject:bunnsyou forKey:@"bunsyou"];
}
@end
