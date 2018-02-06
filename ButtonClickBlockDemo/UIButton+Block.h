//
//  UIButton+Block.h
//  ButtonClickBlockDemo
//
//  Created by 李晓璐 on 2018/2/5.
//  Copyright © 2018年 onmmc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Block)

@property(nonatomic ,copy)void(^block)(UIButton*);

-(void)addTapBlock:(void(^)(UIButton*btn))block;

@end
