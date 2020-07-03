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
#include <initializer_list>

namespace lk {

    static inline LKHStackLayout * layoutX(UIView *forView, NSUInteger state, std::initializer_list<LKLayout *> children) {
        LKHStackLayout *layout = [[LKHStackLayout alloc] initWithItem:forView];
        for (auto child : children) {
            [layout addChild:child];
        }
        LKBindingLayout(layout, forView, state);
        return layout;
    }

    static inline LKHStackLayout * layoutX(UIView *forView, std::initializer_list<LKLayout *> children) {
        return layoutX(forView, 0, children);
    }

    static inline LKHStackLayout * layoutX(std::initializer_list<LKLayout *> children) {
        return layoutX(nil, children);
    }

    static inline LKVStackLayout * layoutY(UIView *forView, NSUInteger state, std::initializer_list<LKLayout *> children) {
        LKVStackLayout *layout = [[LKVStackLayout alloc] initWithItem:forView];
        for (auto child : children) {
            [layout addChild:child];
        }
        LKBindingLayout(layout, forView, state);
        return layout;
    }

    static inline LKVStackLayout * layoutY(UIView *forView, std::initializer_list<LKLayout *> children) {
        return layoutY(forView, 0, children);
    }

    static inline LKVStackLayout * layoutY(float width, float height, std::initializer_list<LKLayout *> children) {
        return (LKVStackLayout *)layoutY(nil, children).width(width).height(height);
    }

    static inline LKVStackLayout * layoutY(std::initializer_list<LKLayout *> children) {
        return layoutY(NAN, NAN, children);
    }

    static inline LKZStackLayout * layoutZ(UIView *forView, NSUInteger state, std::initializer_list<LKLayout *> children) {
        LKZStackLayout *layout = [[LKZStackLayout alloc] initWithItem:forView];
        for (auto child : children) {
            [layout addChild:child];
        }
        LKBindingLayout(layout, forView, state);
        return layout;
    }

    static inline LKZStackLayout * layoutZ(UIView *forView, std::initializer_list<LKLayout *> children) {
        return layoutZ(forView, 0, children);
    }

    static inline LKZStackLayout * layoutZ(float width, float height, std::initializer_list<LKLayout *> children) {
        return (LKZStackLayout *)layoutZ(nil, children).width(width).height(height);
    }

    static inline LKZStackLayout * layoutZ(std::initializer_list<LKLayout *> children) {
        return layoutZ(nil, children);
    }

}
