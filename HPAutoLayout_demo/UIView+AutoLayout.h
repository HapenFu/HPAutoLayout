//
//  UIView+AutoLayout.h
//  AutoLayout
//
//  Created by 付海鹏 on 2016/10/11.
//  Copyright © 2016年 Haipeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AutoLayoutObject;

@interface UIView (AutoLayout)

+ (id)create;

- (AutoLayoutObject *)top;
- (AutoLayoutObject *)bottom;
- (AutoLayoutObject *)left;
- (AutoLayoutObject *)right;
- (AutoLayoutObject *)leading;
- (AutoLayoutObject *)trailing;

- (AutoLayoutObject *)width;
- (AutoLayoutObject *)height;
- (AutoLayoutObject *)centerX;
- (AutoLayoutObject *)centerY;
- (AutoLayoutObject *)baseline;
- (AutoLayoutObject *)notAnAttribute;



- (void)removeAllConstraint;

- (void)removeAutoLayoutObject:(AutoLayoutObject *)constraint;

@end
