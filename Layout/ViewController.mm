//
//  ViewController.m
//  Layout
//
//  Created by august on 2020/6/30.
//  Copyright © 2020 august. All rights reserved.
//

#import "ViewController.h"
#import "LayoutKit.h"

@interface ExampleView : UILabel

@end

@implementation ExampleView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:28];
        self.backgroundColor =  [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:0.5];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(100, 100);
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    ExampleView *view1 = [ExampleView new];
    view1.text = @"1";
    [self.view addSubview:view1];
        
    ExampleView *view2 = [ExampleView new];
    view2.text = @"2";
    [self.view addSubview:view2];
    
    ExampleView *view3 = [ExampleView new];
    view3.text = @"3";
    [self.view addSubview:view3];
    
    ExampleView *view4 = [ExampleView new];
    view4.text = @"4";
    [self.view addSubview:view4];
    
    ExampleView *view5 = [ExampleView new];
    view5.text = @"5";
    [self.view addSubview:view5];
    
    ExampleView *view6 = [ExampleView new];
    view6.text = @"6";
    [self.view addSubview:view6];
    
    
    Layout::AxisZ(self.view, 414, 800, {
        Layout::AxisX({
            Layout::AxisZ(100,100,{
                view1,
                view2.lk.width(30).height(30).right(-1).bottom(-1)
            }),
            Layout::Spacer(10),
            Layout::AxisY({
                view3.lk.height(50).width(200),
                Layout::AxisX({
                    view4.lk.height(50).width(50),
                    Layout::Spacer(),
                    view5.lk.width(50).height(50),
                    Layout::Spacer(),
                    view6.lk.width(50).height(50),
                })
                .widthPercent(100)
            }),
        })
    });
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
