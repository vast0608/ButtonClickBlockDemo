//
//  ViewController.m
//  ButtonClickBlockDemo
//
//  Created by 李晓璐 on 2018/2/5.
//  Copyright © 2018年 onmmc. All rights reserved.
//

#import "ViewController.h"
#import "BlockButton.h"//继承
#import "UIButton+Block.h"//分类
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //测试1
    BlockButton *button0 = [[BlockButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button0.backgroundColor = [UIColor redColor];
    [button0 setTitle:@"测试1" forState:0];
    [self.view addSubview:button0];
    [button0 addTapBlock:^(UIButton *btn) {
        //在这里调用所需要执行的方法
        [self buttonClick];
    }];
    
    //测试2
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    button1.backgroundColor = [UIColor blueColor];
    button1.tag = 1001;
    [button1 setTitle:@"测试2" forState:0];
    [self.view addSubview:button1];
    
    __block UIButton *blockSelf = button1;
    [button1 addTapBlock:^(UIButton *btn) {
        //在这里调用所需要执行的方法
        [self button:blockSelf callBack:^(NSInteger selectIndex, NSString *title) {
            NSLog(@"tag:%ld    title:%@",(long)selectIndex,title);
        }];
    }];
}
-(void)buttonClick{
    NSLog(@"点击方法");
}

-(void)button:(UIButton *)button callBack:(void (^)(NSInteger selectIndex ,NSString *title))callBack{
    
    callBack(button.tag,button.currentTitle);
    
}

@end
