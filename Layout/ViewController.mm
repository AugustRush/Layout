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
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage systemImageNamed:@"book"];
    imageView.backgroundColor = [self randomColor];
    [self.view addSubview:imageView];
        
    UILabel *label2 = [UILabel new];
    label2.text = @"this is text 222";
    label2.backgroundColor = [self randomColor];
    [self.view addSubview:label2];
    
    UILabel *label3 = [UILabel new];
    label3.text = @"texxt33333";
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
        
    Layout::AxisX(self.view, {
        imageView.lk.width(100).height(80),
        label6.lk.width(100).height(30),
        Layout::AxisY({
            label2,
            label5,
        }),
        Layout::AxisZ(80,80,{
            label3.lk,
            label4.lk
        })
    });
    
    Layout::AxisY(self.view, 1, {
        imageView,
        label2,
        Layout::AxisX({
            label3,
            label4,
            Layout::AxisZ(100, 100, {
                label5,
                label6
            })
        })
    });
    
    Layout::AxisY(self.view, 2, {
        Layout::AxisX({
            Layout::AxisZ(80,80,{
                imageView.lk.width(70).height(70),
                label2.lk.right(0).bottom(0),
            })
            .margin(10),
            Layout::AxisY({
                label3,
                label4,
            })
            .padding(10),
        }),
        Layout::AxisX({
            label5,
            label6
        })
    });
}


- (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1.0];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    self.view.lk_layoutState = (self.view.lk_layoutState + 1) % 3;
    [self.view setNeedsLayout];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.1 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
       [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

@end
