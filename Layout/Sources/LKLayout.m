//
//  LKLayout.m
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import "LKLayout.h"
#import <yoga/Yoga.h>
#import "LKLayout+Private.h"

@interface LKLayout ()

@property (nonatomic, weak) LKStackLayout *parent;
@property (nonatomic) YGNodeRef node;
@property (nonatomic, weak) id<LKLayoutable> item;

@end

@implementation LKLayout {
    CGRect _frame;
}

#pragma mark - life cycle methods

- (instancetype)initWithItem:(id<LKLayoutable>)item {
    self = [super init];
    if (self) {
        _item = item;
        _node = YGNodeNew();
        YGNodeSetContext(_node, (__bridge void *)(item));
        YGNodeStyleSetAlignItems(_node, YGAlignFlexStart);
        YGNodeStyleSetJustifyContent(_node, YGJustifyFlexStart);
        YGNodeStyleSetFlexShrink(_node, 0);
        YGNodeStyleSetFlexGrow(_node, 0);
    }
    return self;
}

- (void)dealloc {
    YGNodeFree(_node);
}

#pragma mark - private methods

- (void)applyMeasureFunc:(YGMeasureFunc)func positionType:(YGPositionType)type {
    YGNodeSetMeasureFunc(_node, func);
    YGNodeStyleSetPositionType(_node, type);
}

#pragma mark - LKLayoutable methods

- (CGSize)sizeThatFits:(CGSize)size {
    return [_item sizeThatFits:size];
}

- (void)setFrame:(CGRect)frame {
    _frame = frame;
    [_item setFrame:frame];
}

- (CGRect)frame {
    return _frame;
}

#pragma mark - LKLayoutSpecified

- (LKLayout *)specifiedLayout {
    return self;
}

#pragma mark - public methods

#define LK_STYLE_SET_METHOD(method,name,type) \
- (LKLayout *  _Nonnull (^)(type))name {\
    return ^(type v) {\
        YGNodeStyleSet##method(self.node, v);\
        return self;\
    };\
}

#define LK_PADDING_SET_METHOD(method,name,type,edge) \
- (LKLayout *  _Nonnull (^)(type))name {\
    return ^(type v) {\
        YGNodeStyleSetPadding(self.node, edge, v);\
        return self;\
    };\
}


/**/
LK_STYLE_SET_METHOD(Width, width, float)
LK_STYLE_SET_METHOD(Height, height, float)
LK_STYLE_SET_METHOD(WidthPercent, widthPercent, float)
LK_STYLE_SET_METHOD(HeightPercent, heightPercent, float)
LK_STYLE_SET_METHOD(MinWidth, minWidth, float)
LK_STYLE_SET_METHOD(MinHeight, minHeight, float)
LK_STYLE_SET_METHOD(MaxWidth, maxWidth, float)
LK_STYLE_SET_METHOD(MaxHeight, maxHeight, float)
LK_STYLE_SET_METHOD(MinWidthPercent, minWidthPercent, float)
LK_STYLE_SET_METHOD(MinHeightPercent, minHeightPercent, float)
LK_STYLE_SET_METHOD(MaxWidthPercent, maxWidthPercent, float)
LK_STYLE_SET_METHOD(MaxHeightPercent, maxHeightPercent, float)
LK_STYLE_SET_METHOD(AspectRatio, aspectRatio, float)
LK_PADDING_SET_METHOD(PaddingLeft, paddingLeft, float, YGEdgeLeft)
LK_PADDING_SET_METHOD(PaddingRight, paddingRight, float, YGEdgeRight)
LK_PADDING_SET_METHOD(PaddingTop, paddingTop, float, YGEdgeTop)
LK_PADDING_SET_METHOD(PaddingStart, paddingStart, float, YGEdgeStart)
LK_PADDING_SET_METHOD(PaddingEnd, paddingEnd, float, YGEdgeEnd)
LK_PADDING_SET_METHOD(PaddingHorizontal, paddingHorizontal, float, YGEdgeHorizontal)
LK_PADDING_SET_METHOD(PaddingVertical, paddingVertical, float, YGEdgeVertical)
LK_PADDING_SET_METHOD(Padding, padding, float, YGEdgeAll)

- (void)asdas {

}

@end
