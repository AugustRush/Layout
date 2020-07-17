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
#import "NSObject+LKPrivate.h"

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
    LKLayout *activeLayout = [self lk_activeLayout];
    if (activeLayout == nil) {
        activeLayout = [self specifiedLayout];
    }
    return activeLayout;
}

#pragma mark - LKLayoutSpecified

- (LKLayout *)specifiedLayout {
    return [[LKLayout alloc] initWithItem:self];
}

@end


void LKBindingLayout(LKStackLayout *layout, NSObject *object, NSInteger state) {
    NSMutableDictionary *context = object.lk_layoutContext;
    [context setObject:layout forKey:@(state)];
}
