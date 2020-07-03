//
//  LKLayoutable.h
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LKLayoutable <NSObject>

@property (nonatomic, assign) CGRect frame;

- (CGSize)sizeThatFits:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
