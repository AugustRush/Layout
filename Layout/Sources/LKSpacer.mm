//
//  LKSpacer.m
//  Layout
//
//  Created by august on 2020/7/6.
//  Copyright © 2020 august. All rights reserved.
//

#import "LKSpacer.h"
#import "LKLayout+Private.h"

@implementation LKSpacer {
    float _value;
}

- (instancetype)init {
    return [self initWithValue:NAN];
}

- (instancetype)initWithValue:(float)value {
    self = [super initWithItem:nil];
    if (self) {
        _value = value;
        float felxShrinkGrowValue = isnan(value) ? std::numeric_limits<int>::max() : 0;
        YGNodeStyleSetFlexShrink(self.node, felxShrinkGrowValue);
        YGNodeStyleSetFlexGrow(self.node, felxShrinkGrowValue);
        YGNodeSetContext(self.node, (__bridge void *)self);
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize finalSize = CGSizeZero;
    YGNodeRef parent = YGNodeGetParent(self.node);
    if (parent != NULL && !isnan(_value)) {
        YGFlexDirection flexDirection = YGNodeStyleGetFlexDirection(parent);
        if (flexDirection == YGFlexDirectionRow || flexDirection == YGFlexDirectionRowReverse) {
            finalSize = CGSizeMake(_value, 0);
        } else if (flexDirection == YGFlexDirectionColumn || flexDirection == YGFlexDirectionColumnReverse) {
            finalSize = CGSizeMake(0, _value);
        }
    }
    return finalSize;
}

@end
