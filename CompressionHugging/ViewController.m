//
//  ViewController.m
//  CompressionHugging
//
//  Created by ppzc on 16/8/10.
//  Copyright © 2016年 ppzc. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

#define SCREEN_WIDHT [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITextFieldDelegate>
{
    UILabel *_label1;
    UILabel *_label2;
    UITextField *text1;
    UITextField *text2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *subLayer = [CALayer new];
    subLayer.borderColor = [UIColor redColor].CGColor;
    subLayer.borderWidth = 1.f;
    subLayer.cornerRadius = 5.f;

     text1 = [UITextField new];
    [self.view addSubview:text1];
    [text1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(48);
    }];
    
    subLayer.frame = CGRectInset(CGRectMake(0, 0, SCREEN_WIDHT, 48), 0, 0);
    [text1.layer addSublayer:subLayer];
    
    text2 = [UITextField new];
    [self.view addSubview:text2];
    
    [text2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(text1.mas_bottom);
        make.height.mas_equalTo(48);
    }];
    CALayer *subLayer2 = [CALayer new];
    subLayer2.borderColor = [UIColor redColor].CGColor;
    subLayer2.borderWidth = 1.f;
    subLayer2.cornerRadius = 5.f;
    subLayer2.frame = CGRectInset(CGRectMake(0, 0, SCREEN_WIDHT, 48), 0, 0);
    [text2.layer addSublayer:subLayer2];
    
    _label1 = [UILabel new];
    [self.view addSubview:_label1];
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(text2.mas_bottom);
        make.left.equalTo(self.view);
    }];
    
    _label2 = [UILabel new];
    [self.view addSubview:_label2];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(text2.mas_bottom);
        make.right.equalTo(self.view);
        make.left.equalTo(_label1.mas_right);
    }];
    
    [_label1.layer setBorderColor:[UIColor grayColor].CGColor];
    [_label1.layer setBorderWidth:1.f];
    
    [_label2.layer setBorderColor:[UIColor grayColor].CGColor];
    [_label2.layer setBorderWidth:1.f];
    
    [_label2 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_label2 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    [_label1 setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [_label1 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
//    [text1 addObserver:self
//              forKeyPath:@"text"
//                 options:NSKeyValueObservingOptionNew
//                 context:nil
//     ];
//    
//    [text2 addObserver:self
//              forKeyPath:@"text"
//                 options:NSKeyValueObservingOptionNew
//                 context:nil
//     ];
    [text1 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventAllEditingEvents];
    [text2 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventAllEditingEvents];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)valueChanged:(UITextField *)sender{
    if ([sender isEqual:text1]) {
        [_label1 setText:text1.text];
    }
    
    if ([sender isEqual:text2]) {
        [_label2 setText:text2.text];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if([object isEqual:text1]){
        [_label1 setText:[change objectForKey:@"new"]];
    }
    
    if ([object isEqual:text2]) {
        [_label2 setText:[change objectForKey:@"new"]];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSString *temp = textField.text;
    textField.text = temp;}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSString *temp = textField.text;
    textField.text = temp;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *temp = textField.text;
    textField.text = temp;
    
    return YES;
}

@end
