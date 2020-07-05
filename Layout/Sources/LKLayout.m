//
//  LKLayout.m
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import "LKLayout.h"
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
        YGNodeStyleSetPosition(_node, YGEdgeAll, NAN);
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

#define LK_STYLE_SET_METHOD2(method,name,type,edge) \
- (LKLayout *  _Nonnull (^)(type))name {\
    return ^(type v) {\
        YGNodeStyleSet##method(self.node, edge, v);\
        return self;\
    };\
}


/**/
LK_STYLE_SET_METHOD(Flex, flex, float)
LK_STYLE_SET_METHOD(PositionType, positionType, YGPositionType)
LK_STYLE_SET_METHOD(FlexGrow, flexGrow, float)
LK_STYLE_SET_METHOD(FlexShrink, flexShrink, float)
LK_STYLE_SET_METHOD(FlexBasis, flexBasis, float)
LK_STYLE_SET_METHOD(JustifyContent, justifyContent, YGJustify)
LK_STYLE_SET_METHOD(AlignContent, alignContent, YGAlign)
LK_STYLE_SET_METHOD(AlignItems, alignItems, YGAlign)
LK_STYLE_SET_METHOD(AlignSelf, alignSelf, YGAlign)
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

LK_STYLE_SET_METHOD2(Padding, paddingLeft, float, YGEdgeLeft)
LK_STYLE_SET_METHOD2(Padding, paddingRight, float, YGEdgeRight)
LK_STYLE_SET_METHOD2(Padding, paddingTop, float, YGEdgeTop)
LK_STYLE_SET_METHOD2(Padding, paddingBottom, float, YGEdgeBottom)
LK_STYLE_SET_METHOD2(Padding, paddingStart, float, YGEdgeStart)
LK_STYLE_SET_METHOD2(Padding, paddingEnd, float, YGEdgeEnd)
LK_STYLE_SET_METHOD2(Padding, paddingHorizontal, float, YGEdgeHorizontal)
LK_STYLE_SET_METHOD2(Padding, paddingVertical, float, YGEdgeVertical)
LK_STYLE_SET_METHOD2(Padding, padding, float, YGEdgeAll)
LK_STYLE_SET_METHOD2(PaddingPercent, paddingLeftPercent, float, YGEdgeLeft)
LK_STYLE_SET_METHOD2(PaddingPercent, paddingRightPercent, float, YGEdgeRight)
LK_STYLE_SET_METHOD2(PaddingPercent, paddingTopPercent, float, YGEdgeTop)
LK_STYLE_SET_METHOD2(PaddingPercent, paddingBottomPercent, float, YGEdgeBottom)
LK_STYLE_SET_METHOD2(PaddingPercent, paddingStartPercent, float, YGEdgeStart)
LK_STYLE_SET_METHOD2(PaddingPercent, paddingEndPercent, float, YGEdgeEnd)
LK_STYLE_SET_METHOD2(PaddingPercent, paddingHorizontalPercent, float, YGEdgeHorizontal)
LK_STYLE_SET_METHOD2(PaddingPercent, paddingVerticalPercent, float, YGEdgeVertical)
LK_STYLE_SET_METHOD2(PaddingPercent, paddingPercent, float, YGEdgeAll)

LK_STYLE_SET_METHOD2(Margin, marginLeft, float, YGEdgeLeft)
LK_STYLE_SET_METHOD2(Margin, marginRight, float, YGEdgeRight)
LK_STYLE_SET_METHOD2(Margin, marginTop, float, YGEdgeTop)
LK_STYLE_SET_METHOD2(Margin, marginBottom, float, YGEdgeBottom)
LK_STYLE_SET_METHOD2(Margin, marginStart, float, YGEdgeStart)
LK_STYLE_SET_METHOD2(Margin, marginEnd, float, YGEdgeEnd)
LK_STYLE_SET_METHOD2(Margin, marginHorizontal, float, YGEdgeHorizontal)
LK_STYLE_SET_METHOD2(Margin, marginVertical, float, YGEdgeVertical)
LK_STYLE_SET_METHOD2(Margin, margin, float, YGEdgeAll)
LK_STYLE_SET_METHOD2(MarginPercent, marginLeftPercent, float, YGEdgeLeft)
LK_STYLE_SET_METHOD2(MarginPercent, marginRightPercent, float, YGEdgeRight)
LK_STYLE_SET_METHOD2(MarginPercent, marginTopPercent, float, YGEdgeTop)
LK_STYLE_SET_METHOD2(MarginPercent, marginBottomPercent, float, YGEdgeBottom)
LK_STYLE_SET_METHOD2(MarginPercent, marginStartPercent, float, YGEdgeStart)
LK_STYLE_SET_METHOD2(MarginPercent, marginEndPercent, float, YGEdgeEnd)
LK_STYLE_SET_METHOD2(MarginPercent, marginHorizontalPercent, float, YGEdgeHorizontal)
LK_STYLE_SET_METHOD2(MarginPercent, marginVerticalPercent, float, YGEdgeVertical)
LK_STYLE_SET_METHOD2(MarginPercent, marginPercent, float, YGEdgeAll)

LK_STYLE_SET_METHOD2(Position, left, float, YGEdgeLeft)
LK_STYLE_SET_METHOD2(Position, right, float, YGEdgeRight)
LK_STYLE_SET_METHOD2(Position, top, float, YGEdgeTop)
LK_STYLE_SET_METHOD2(Position, bottom, float, YGEdgeBottom)
LK_STYLE_SET_METHOD2(Position, start, float, YGEdgeStart)
LK_STYLE_SET_METHOD2(Position, end, float, YGEdgeEnd)
LK_STYLE_SET_METHOD2(PositionPercent, leftPercent, float, YGEdgeLeft)
LK_STYLE_SET_METHOD2(PositionPercent, rightPercent, float, YGEdgeRight)
LK_STYLE_SET_METHOD2(PositionPercent, topPercent, float, YGEdgeTop)
LK_STYLE_SET_METHOD2(PositionPercent, bottomPercent, float, YGEdgeBottom)
LK_STYLE_SET_METHOD2(PositionPercent, startPercent, float, YGEdgeStart)
LK_STYLE_SET_METHOD2(PositionPercent, endPercent, float, YGEdgeEnd)

LK_STYLE_SET_METHOD2(Border, borderLeft, float, YGEdgeLeft)
LK_STYLE_SET_METHOD2(Border, borderRight, float, YGEdgeRight)
LK_STYLE_SET_METHOD2(Border, borderTop, float, YGEdgeTop)
LK_STYLE_SET_METHOD2(Border, borderBottom, float, YGEdgeBottom)
LK_STYLE_SET_METHOD2(Border, borderStart, float, YGEdgeStart)
LK_STYLE_SET_METHOD2(Border, borderEnd, float, YGEdgeEnd)
LK_STYLE_SET_METHOD2(Border, border, float, YGEdgeAll)

- (LKLayout * _Nonnull (^)(void))markDirty {
    return ^{
        if (YGNodeHasMeasureFunc(self.node)) {
            YGNodeMarkDirty(self.node);
        }
        return self;
    };
}

@end
