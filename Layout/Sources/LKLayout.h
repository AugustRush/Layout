//
//  LKLayout.h
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKLayoutable.h"
#import "LKLayoutSpecified.h"
#import <yoga/Yoga.h>

NS_ASSUME_NONNULL_BEGIN

@interface LKLayout: NSObject<LKLayoutable,LKLayoutSpecified>

#define LK_PROPERTY(name, type) @property (nonatomic, readonly) LKLayout * (^name)(type v)


/// flex
LK_PROPERTY(flex, float);
LK_PROPERTY(positionType, float);
LK_PROPERTY(flexGrow, float);
LK_PROPERTY(flexShrink, float);
LK_PROPERTY(flexBasis, float);
LK_PROPERTY(justifyContent, YGJustify);
LK_PROPERTY(alignContent, YGAlign);
LK_PROPERTY(alignItems, YGAlign);
LK_PROPERTY(alignSelf, YGAlign);
LK_PROPERTY(flexWrap, YGWrap);
LK_PROPERTY(overflow, YGOverflow);
LK_PROPERTY(display, YGDisplay);


/// position
LK_PROPERTY(left, float);
LK_PROPERTY(top, float);
LK_PROPERTY(right, float);
LK_PROPERTY(bottom, float);
LK_PROPERTY(start, float);
LK_PROPERTY(end, float);
LK_PROPERTY(leftPercent, float);
LK_PROPERTY(topPercent, float);
LK_PROPERTY(rightPercent, float);
LK_PROPERTY(bottomPercent, float);
LK_PROPERTY(startPercent, float);
LK_PROPERTY(endPercent, float);

/// base
LK_PROPERTY(width, float);
LK_PROPERTY(height, float);
LK_PROPERTY(widthPercent, float);
LK_PROPERTY(heightPercent, float);
LK_PROPERTY(minWidth, float);
LK_PROPERTY(minHeight, float);
LK_PROPERTY(maxWidth, float);
LK_PROPERTY(maxHeight, float);
LK_PROPERTY(minWidthPercent, float);
LK_PROPERTY(minHeightPercent, float);
LK_PROPERTY(maxWidthPercent, float);
LK_PROPERTY(maxHeightPercent, float);
LK_PROPERTY(aspectRatio, float);

/// padding
LK_PROPERTY(paddingLeft, float);
LK_PROPERTY(paddingRight, float);
LK_PROPERTY(paddingTop, float);
LK_PROPERTY(paddingBottom, float);
LK_PROPERTY(paddingStart, float);
LK_PROPERTY(paddingEnd, float);
LK_PROPERTY(paddingHorizontal, float);
LK_PROPERTY(paddingVertical, float);
LK_PROPERTY(padding, float);
LK_PROPERTY(paddingLeftPercent, float);
LK_PROPERTY(paddingRightPercent, float);
LK_PROPERTY(paddingTopPercent, float);
LK_PROPERTY(paddingBottomPercent, float);
LK_PROPERTY(paddingStartPercent, float);
LK_PROPERTY(paddingEndPercent, float);
LK_PROPERTY(paddingHorizontalPercent, float);
LK_PROPERTY(paddingVerticalPercent, float);
LK_PROPERTY(paddingPercent, float);

/// margin
LK_PROPERTY(marginLeft, float);
LK_PROPERTY(marginRight, float);
LK_PROPERTY(marginTop, float);
LK_PROPERTY(marginBottom, float);
LK_PROPERTY(marginStart, float);
LK_PROPERTY(marginEnd, float);
LK_PROPERTY(marginHorizontal, float);
LK_PROPERTY(marginVertical, float);
LK_PROPERTY(margin, float);
LK_PROPERTY(marginLeftPercent, float);
LK_PROPERTY(marginRightPercent, float);
LK_PROPERTY(marginTopPercent, float);
LK_PROPERTY(marginBottomPercent, float);
LK_PROPERTY(marginStartPercent, float);
LK_PROPERTY(marginEndPercent, float);
LK_PROPERTY(marginHorizontalPercent, float);
LK_PROPERTY(marginVerticalPercent, float);
LK_PROPERTY(marginPercent, float);

/// boarder act as padding, do not recommend use it
LK_PROPERTY(borderLeft, float);
LK_PROPERTY(borderRight, float);
LK_PROPERTY(borderTop, float);
LK_PROPERTY(borderBottom, float);
LK_PROPERTY(borderStart, float);
LK_PROPERTY(borderEnd, float);
LK_PROPERTY(border, float);

- (instancetype)initWithItem:(id<LKLayoutable>)item;

@end

NS_ASSUME_NONNULL_END
