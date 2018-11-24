//
//  UIView+Tracking.m
//  hitTestDemo
//
//  Created by SeacenLiu on 2018/11/24.
//  Copyright © 2018 SeacenLiu. All rights reserved.
//

#import "UIView+Tracking.h"
#import <objc/runtime.h>

@implementation UIView (Tracking)

+ (void)load {
    Method touchBeginOrigin = class_getInstanceMethod([self class], @selector(hitTest:withEvent:));
    Method touchBeginCustom = class_getInstanceMethod([self class], @selector(sc_hitTest:withEvent:));
    method_exchangeImplementations(touchBeginOrigin, touchBeginCustom);
}

- (UIView *)sc_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    static NSInteger index = 0;
    NSLog(@"第%zd步操作", ++index);
    NSLog(@"sc_hitTest: %@", self);
    NSLog(@"subviews: %@", self.subviews);
    return [self sc_hitTest:point withEvent:event];
}

@end
