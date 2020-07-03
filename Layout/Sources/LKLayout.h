//
//  LKLayout.h
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKLayoutable.h"

NS_ASSUME_NONNULL_BEGIN

@interface LKLayout: NSObject<LKLayoutable>

#define LK_PROPERTY(name, type) @property (nonatomic, readonly) LKLayout * (^name)(type v)

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
LK_PROPERTY(paddingLeft, float);
LK_PROPERTY(paddingRight, float);
LK_PROPERTY(paddingTop, float);
LK_PROPERTY(paddingBottom, float);
LK_PROPERTY(paddingStart, float);
LK_PROPERTY(paddingEnd, float);
LK_PROPERTY(paddingHorizontal, float);
LK_PROPERTY(paddingVertical, float);
LK_PROPERTY(padding, float);


- (instancetype)initWithItem:(id<LKLayoutable>)item;

@end

NS_ASSUME_NONNULL_END
