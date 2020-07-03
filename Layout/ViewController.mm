//
//  ViewController.m
//  Layout
//
//  Created by august on 2020/6/30.
//  Copyright © 2020 august. All rights reserved.
//

#import "ViewController.h"
#import "LayoutKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label1 = [UILabel new];
    label1.text = @"texxt1";
    label1.backgroundColor = [self randomColor];
    [self.view addSubview:label1];
    
    UILabel *label2 = [UILabel new];
    label2.text = @"this is text 222";
    label2.backgroundColor = [self randomColor];
    [self.view addSubview:label2];
    
    UILabel *label3 = [UILabel new];
    label3.text = @"texxt3";
    label3.backgroundColor = [self randomColor];
    [self.view addSubview:label3];
    
    UILabel *label4 = [UILabel new];
    label4.text = @"texxt4";
    label4.backgroundColor = [self randomColor];
    [self.view addSubview:label4];
    
    UILabel *label5 = [UILabel new];
    label5.text = @"texxt5";
    label5.backgroundColor = [self randomColor];
    [self.view addSubview:label5];
    
    UILabel *label6 = [UILabel new];
    label6.text = @"texxt6";
    label6.backgroundColor = [self randomColor];
    [self.view addSubview:label6];
        
    lk::layoutX(self.view, {
        label1.lk.width(100).height(80),
        lk::layoutY({
            label2.lk,
            label5.lk,
        }),
        lk::layoutZ(101,101,{
            label3.lk,
            label4.lk
        })
    });
}


- (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1.0];
}

@end
