//
//  LayoutKit.h
//  Layout
//
//  Created by august on 2020/7/2.
//  Copyright © 2020 august. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKStackLayout.h"
#import "UIView+LKLayout.h"
#import "LKLayoutSpecified.h"
#include <initializer_list>

namespace Layout {

    static inline LKHStackLayout * AxisX(UIView *forView, NSUInteger state, std::initializer_list<id<LKLayoutSpecified>> children) {
        LKHStackLayout *layout = [[LKHStackLayout alloc] initWithItem:forView];
        for (auto child : children) {
            [layout addChild:child];
        }
        LKBindingLayout(layout, forView, state);
        return layout;
    }

    static inline LKHStackLayout * AxisX(UIView *forView, std::initializer_list<id<LKLayoutSpecified>> children) {
        return AxisX(forView, 0, children);
    }

    static inline LKHStackLayout * AxisX(std::initializer_list<id<LKLayoutSpecified>> children) {
        return AxisX(nil, children);
    }

    static inline LKVStackLayout * AxisY(UIView *forView, NSUInteger state, std::initializer_list<id<LKLayoutSpecified>> children) {
        LKVStackLayout *layout = [[LKVStackLayout alloc] initWithItem:forView];
        for (auto child : children) {
            [layout addChild:child];
        }
        LKBindingLayout(layout, forView, state);
        return layout;
    }

    static inline LKVStackLayout * AxisY(UIView *forView, std::initializer_list<id<LKLayoutSpecified>> children) {
        return AxisY(forView, 0, children);
    }

    static inline LKVStackLayout * AxisY(float width, float height, std::initializer_list<id<LKLayoutSpecified>> children) {
        return (LKVStackLayout *)AxisY(nil, children).width(width).height(height);
    }

    static inline LKVStackLayout * AxisY(std::initializer_list<id<LKLayoutSpecified>> children) {
        return AxisY(NAN, NAN, children);
    }

    static inline LKZStackLayout * AxisZ(UIView *forView, NSUInteger state, std::initializer_list<id<LKLayoutSpecified>> children) {
        LKZStackLayout *layout = [[LKZStackLayout alloc] initWithItem:forView];
        for (auto child : children) {
            [layout addChild:child];
        }
        LKBindingLayout(layout, forView, state);
        return layout;
    }

    static inline LKZStackLayout * AxisZ(UIView *forView, std::initializer_list<id<LKLayoutSpecified>> children) {
        return AxisZ(forView, 0, children);
    }

    static inline LKZStackLayout * AxisZ(float width, float height, std::initializer_list<id<LKLayoutSpecified>> children) {
        return (LKZStackLayout *)AxisZ(nil, children).width(width).height(height);
    }

    static inline LKZStackLayout * AxisZ(std::initializer_list<id<LKLayoutSpecified>> children) {
        return AxisZ(nil, children);
    }

}
