//
//  NSObject+LKPrivate.m
//  Layout
//
//  Created by august on 2020/7/6.
//  Copyright © 2020 august. All rights reserved.
//

#import "NSObject+LKPrivate.h"
#import "LKLayout+Private.h"
#import <objc/runtime.h>

@interface _LKLayoutContext : NSObject

@property (nonatomic, strong) NSMutableDictionary *layoutsByState;
@property (nonatomic, assign) NSInteger currentLayoutState;
@property (nonatomic, weak) LKLayout *currentLayout;

@end

@implementation _LKLayoutContext

- (instancetype)init {
    self = [super init];
    if (self) {
        _layoutsByState = [NSMutableDictionary dictionary];
        _currentLayoutState = 0;
    }
    return self;
}

@end

@implementation NSObject (LKPrivate)

- (_LKLayoutContext *)associateLKLayoutContext {
    _LKLayoutContext *context = objc_getAssociatedObject(self, _cmd);
    if (context == nil) {
        context = [[_LKLayoutContext alloc] init];
        objc_setAssociatedObject(self, _cmd, context, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return context;
}

- (NSMutableDictionary *)lk_layoutContext {
    return [self associateLKLayoutContext].layoutsByState;
}

- (NSInteger)lk_layoutState {
    return [self associateLKLayoutContext].currentLayoutState;
}

- (void)setLk_layoutState:(NSInteger)lk_layoutState {
    [self associateLKLayoutContext].currentLayoutState = lk_layoutState;
}

- (void)setLk_activeLayout:(LKLayout *)lk_activeLayout {
    [self associateLKLayoutContext].currentLayout = lk_activeLayout;
}

- (LKLayout *)lk_activeLayout {
    return [self associateLKLayoutContext].currentLayout;
}

@end
