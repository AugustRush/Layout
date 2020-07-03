//
//  LKStackLayout.h
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface LKStackLayout : LKLayout

- (void)addChild:(LKLayout *)child;
- (void)removeChild:(LKLayout *)child;
- (LKLayout *)childAtIndex:(NSUInteger)index;

- (void)applyLayoutWithOrigin:(CGPoint)origin size:(CGSize)size;

@end

@interface LKVStackLayout : LKStackLayout

@end

@interface LKHStackLayout : LKStackLayout

@end

@interface LKZStackLayout : LKStackLayout

@end

NS_ASSUME_NONNULL_END
