//
//  LKLayout+Private.h
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import "LKLayout.h"
#import <yoga/Yoga.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

NS_INLINE float YGSanitizeMeasurement(
    CGFloat constrainedSize,
    CGFloat measuredSize,
    YGMeasureMode measureMode) {
  float result;
  if (measureMode == YGMeasureModeExactly) {
    result = constrainedSize;
  } else if (measureMode == YGMeasureModeAtMost) {
    result = MIN(constrainedSize, measuredSize);
  } else {
    result = measuredSize;
  }

  return result;
}


NS_INLINE YGSize YGMeasureView(
    YGNodeRef node,
    float width,
    YGMeasureMode widthMode,
    float height,
    YGMeasureMode heightMode) {
  const CGFloat constrainedWidth =
      (widthMode == YGMeasureModeUndefined) ? CGFLOAT_MAX : width;
  const CGFloat constrainedHeight =
      (heightMode == YGMeasureModeUndefined) ? CGFLOAT_MAX : height;

  id<LKLayoutable> view = (__bridge id<LKLayoutable>)YGNodeGetContext(node);

  // The default implementation of sizeThatFits: returns the existing size of
  // the view. That means that if we want to layout an empty UIView, which
  // already has got a frame set, its measured size should be CGSizeZero, but
  // UIKit returns the existing size.
  //
  // See https://github.com/facebook/yoga/issues/606 for more information.
  CGSize sizeThatFits = [view sizeThatFits:(CGSize){
                                          .width = constrainedWidth,
                                          .height = constrainedHeight,
                                      }];
  return (YGSize){
      .width = YGSanitizeMeasurement(
          constrainedWidth, sizeThatFits.width, widthMode),
      .height = YGSanitizeMeasurement(
          constrainedHeight, sizeThatFits.height, heightMode),
  };
}

NS_INLINE CGFloat YGRoundPixelValue(CGFloat value) {
  static CGFloat scale;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^() {
    scale = [UIScreen mainScreen].scale;
  });

  return round(value * scale) / scale;
}

@class LKStackLayout;
@interface LKLayout (Private)

@property (nonatomic, weak, readonly) id<LKLayoutable> item;
@property (nonatomic, weak) LKStackLayout *parent;
@property (nonatomic, readonly) YGNodeRef node;

- (void)applyMeasureFunc:(YGMeasureFunc _Nullable)func positionType:(YGPositionType)type;

@end

NS_ASSUME_NONNULL_END
