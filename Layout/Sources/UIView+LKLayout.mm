//
//  UIView+LKLayout.m
//  Layout
//
//  Created by august on 2020/7/1.
//  Copyright © 2020 august. All rights reserved.
//

#import "UIView+LKLayout.h"
#import <objc/runtime.h>
#import "UIView+LKPrivate.h"
#import "LKStackLayout.h"
#import "LKLayout+Private.h"

@implementation UIView (LKLayout)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        SEL originalSelector = @selector(layoutSubviews);
        SEL swizzledSelector = @selector(lk_layoutSubviews);
        
        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
        BOOL didAddMethod =
        class_addMethod(aClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(aClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)lk_layoutSubviews {
    [self lk_layoutSubviews];
    //
    NSUInteger layoutState = self.lk_layoutState;
    LKStackLayout *stackLayout = [self.lk_layoutContext objectForKey:@(layoutState)];
    if (stackLayout && !stackLayout.parent && YGNodeGetParent(stackLayout.node) == nullptr) {
        [stackLayout applyLayoutWithOrigin:self.frame.origin size:self.frame.size];
    }
}

- (LKLayout *)lk {
    return [[LKLayout alloc] initWithItem:self];
}

- (NSMutableDictionary *)lk_layoutContext {
    NSMutableDictionary *context = objc_getAssociatedObject(self, _cmd);
    if (context == nil) {
        context = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, _cmd, context, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return context;
}

- (NSInteger)lk_layoutState {
    NSNumber *number = objc_getAssociatedObject(self, _cmd);
    return [number integerValue];
}

- (void)setLk_layoutState:(NSInteger)lk_layoutState {
    objc_setAssociatedObject(self, @selector(lk_layoutState), @(lk_layoutState), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - LKLayoutSpecified

- (LKLayout *)specifiedLayout {
    return [self lk];
}

@end


void LKBindingLayout(LKStackLayout *layout, UIView *view, NSInteger state) {
    NSMutableDictionary *context = view.lk_layoutContext;
    [context setObject:layout forKey:@(state)];
}
