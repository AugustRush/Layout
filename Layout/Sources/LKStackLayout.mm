//
//  LKStackLayout.m
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import "LKStackLayout.h"
#import <yoga/Yoga.h>
#import "LKLayout+Private.h"

@implementation LKStackLayout {
    @public
    NSMutableArray<id<LKLayoutSpecified>> *_children;
}

#pragma mark - life cycle methods

- (instancetype)initWithItem:(id<LKLayoutable>)item {
    self = [super initWithItem:item];
    if (self) {
        _children = [NSMutableArray array];
    }
    return self;
}

#pragma mark - override methods

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self applyChildrenFrameWithOrigin:frame.origin];
}

- (CGSize)sizeThatFits:(CGSize)size {
    //
    [self applyMeasureFunc:YGMeasureView positionType:YGPositionTypeRelative];
    //
    const YGNodeRef node = self.node;
    YGNodeCalculateLayout(node, size.width, size.height, YGNodeStyleGetDirection(node));
    return (CGSize){
        .width = YGNodeLayoutGetWidth(node),
        .height = YGNodeLayoutGetHeight(node),
    };
}

#pragma mark - public methods

- (void)addChild:(id<LKLayoutSpecified>)child {
    LKLayout *childLayout = [child specifiedLayout];
    YGNodeInsertChild(self.node, childLayout.node, (uint32_t)_children.count);
    [_children addObject:childLayout];
    [childLayout setParent:self];
}

- (void)removeChild:(id<LKLayoutSpecified>)child {
    LKLayout *childLayout = [child specifiedLayout];
    YGNodeRemoveChild(self.node, childLayout.node);
    [_children removeObject:childLayout];
    [childLayout setParent:nil];
}

- (id<LKLayoutSpecified>)childAtIndex:(NSUInteger)index {
    if (index < _children.count) {
        return _children[index];
    }
    return nil;
}

- (void)applyLayoutWithOrigin:(CGPoint)origin size:(CGSize)size {
    [self sizeThatFits:size];
    [self applyChildrenFrameWithOrigin:origin];
}

#pragma mark - private methods

- (void)applyMeasureFunc:(YGMeasureFunc)func positionType:(YGPositionType)type {
    [super applyMeasureFunc:nullptr positionType:type];
    for (LKLayout *child in _children) {
        [child applyMeasureFunc:func positionType:type];
    }
}

- (void)applyChildrenFrameWithOrigin:(CGPoint)preservedOrigin {
    for (LKLayout *child in _children) {
        YGNodeRef node = child.node;
        const CGPoint topLeft = {
            YGNodeLayoutGetLeft(node),
            YGNodeLayoutGetTop(node),
        };

        const CGPoint bottomRight = {
            topLeft.x + YGNodeLayoutGetWidth(node),
            topLeft.y + YGNodeLayoutGetHeight(node),
        };

        const CGPoint origin = preservedOrigin;
        [child setFrame:(CGRect){
            .origin =
                {
                    .x = YGRoundPixelValue(topLeft.x + origin.x),
                    .y = YGRoundPixelValue(topLeft.y + origin.y),
                },
            .size =
                {
                    .width = YGRoundPixelValue(bottomRight.x) -
                        YGRoundPixelValue(topLeft.x),
                    .height = YGRoundPixelValue(bottomRight.y) -
                        YGRoundPixelValue(topLeft.y),
                },
        }];
    }
}

@end

/*
 /////////////////////////////
 */

@implementation LKVStackLayout

- (instancetype)initWithItem:(id<LKLayoutable>)item {
    self = [super initWithItem:item];
    if (self) {
        YGNodeStyleSetFlexDirection(self.node, YGFlexDirectionColumn);
    }
    return self;
}

@end

/*
/////////////////////////////
*/

@implementation LKHStackLayout

- (instancetype)initWithItem:(id<LKLayoutable>)item {
    self = [super initWithItem:item];
    if (self) {
        YGNodeStyleSetFlexDirection(self.node, YGFlexDirectionRow);
    }
    return self;
}

@end

/*
/////////////////////////////
*/

@implementation LKZStackLayout

//- (instancetype)initWithItem:(id<LKLayoutable>)item {
//    self = [super initWithItem:item];
//    if (self) {
//        CGSize itemSize = [item sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
//        YGNodeStyleSetWidth(self.node, itemSize.width);
//        YGNodeStyleSetHeight(self.node, itemSize.height);
//        YGNodeStyleSetFlexShrink(self.node, 0);
//    }
//    return self;
//}

- (CGSize)sizeThatFits:(CGSize)size {
    //
    [self applyMeasureFunc:YGMeasureView positionType:YGPositionTypeAbsolute];
    //
    const YGNodeRef node = self.node;
    YGNodeCalculateLayout(node, size.width, size.height, YGNodeStyleGetDirection(node));
    return (CGSize){
        .width = YGNodeLayoutGetWidth(node),
        .height = YGNodeLayoutGetHeight(node),
    };
}

- (void)applyMeasureFunc:(YGMeasureFunc)func positionType:(YGPositionType)type {
    [super applyMeasureFunc:nullptr positionType:type];
    for (LKLayout *child in _children) {
        [child applyMeasureFunc:func positionType:YGPositionTypeAbsolute];
    }
}

@end
