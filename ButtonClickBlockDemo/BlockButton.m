//
//  BlockButton.m
//  ButtonClickBlockDemo
//
//  Created by 李晓璐 on 2018/2/5.
//  Copyright © 2018年 onmmc. All rights reserved.
//

#import "BlockButton.h"

@implementation BlockButton

-(void)addTapBlock:(void(^)(UIButton*))block{
    self.block= block;
    [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)click:(UIButton*)btn{
    if(self.block) {
        self.block(btn);
    }
}


@end
