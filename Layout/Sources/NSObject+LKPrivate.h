//
//  NSObject+LKPrivate.h
//  Layout
//
//  Created by august on 2020/7/6.
//  Copyright © 2020 august. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LKLayout;
@interface NSObject (LKPrivate)

@property (nonatomic, readonly) NSMutableDictionary *lk_layoutContext;
@property (nonatomic, assign) NSInteger lk_layoutState;
@property (nonatomic, weak) LKLayout *lk_activeLayout;

@end

NS_ASSUME_NONNULL_END
