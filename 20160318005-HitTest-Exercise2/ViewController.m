//
//  ViewController.m
//  20160318005-HitTest-Exercise2
//
//  Created by Rainer on 16/3/18.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "PopButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 *  弹出框按钮点击事件处理
 */
- (IBAction)popButtonClickAction:(PopButton *)sender {
    // 1.创建一个自定义按钮作为弹出框，并设置图片
    UIButton *chartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [chartButton setImage:[UIImage imageNamed:@"对话框"] forState:UIControlStateNormal];
    [chartButton setImage:[UIImage imageNamed:@"小孩"] forState:UIControlStateHighlighted];
    
    // 2.设置弹出框的大小和显示的位置（位置一般为大小的一半，这样弹出框会在按钮的中间显示）
    chartButton.bounds = CGRectMake(0, 0, 200, 200);
    chartButton.center = CGPointMake(100, -100);
    
    // 3.给弹出框按钮传递属性，共探出框按钮做一系列判断
    sender.chartButton = chartButton;
    
    // 4.将弹出框添加到弹出框按钮上
    [sender addSubview:chartButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
