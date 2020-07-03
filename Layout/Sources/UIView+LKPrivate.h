//
//  UIView+LKPrivate.h
//  Layout
//
//  Created by august on 2020/7/2.
//  Copyright © 2020 august. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LKStackLayout;
@interface UIView (LKPrivate)

@property (nonatomic, readonly) NSMutableDictionary *lk_layoutContext;

@end

NS_ASSUME_NONNULL_END
