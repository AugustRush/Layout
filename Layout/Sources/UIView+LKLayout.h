//
//  UIView+LKLayout.h
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKLayoutable.h"

NS_ASSUME_NONNULL_BEGIN
@class LKLayout;
@class LKStackLayout;
@interface UIView (LKLayout)<LKLayoutable>

@property (nonatomic, readonly) LKLayout *lk;
@property (nonatomic, assign) NSInteger lk_layoutState;

@end

void LKBindingLayout(LKStackLayout *layout, UIView *view, NSInteger state);

NS_ASSUME_NONNULL_END
