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


/// add conform to LKLayoutSpecified object to this stack
/// @param child id<LKLayoutSpecified> , real object type LKLayout
- (void)addChild:(id<LKLayoutSpecified>)child;

/// remove LKLayoutSpecified object in this stack
/// @param child child id<LKLayoutSpecified> , real object type LKLayout
- (void)removeChild:(id<LKLayoutSpecified>)child;

/// get the LKLayoutSpecified object in this stack
/// @param index the object index
- (id<LKLayoutSpecified>)childAtIndex:(NSUInteger)index;

- (void)applyLayoutWithOrigin:(CGPoint)origin size:(CGSize)size;

@end

@interface LKVStackLayout : LKStackLayout

@end

@interface LKHStackLayout : LKStackLayout

@end

@interface LKZStackLayout : LKStackLayout

@end

NS_ASSUME_NONNULL_END
