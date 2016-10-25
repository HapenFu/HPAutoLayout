//
//  AutoLayoutObject.m
//  AutoLayout
//
//  Created by 付海鹏 on 2016/10/11.
//  Copyright © 2016年 Haipeng. All rights reserved.
//

#import "AutoLayoutObject.h"
#import "UIView+AutoLayout.h"

@implementation AutoLayoutObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        _item = nil;
        _attribute = NSLayoutAttributeNotAnAttribute;
        _relation = NSLayoutRelationEqual;
        _multiplier = 1.f;
        _constant = 0.f;
    }
    return self;
}


- (void)addEqualConstant:(CGFloat)constant {
    UIView *superView = (UIView *)[self.item superview];
    switch (self.attribute) {
        case NSLayoutAttributeTop: {
            [self addEqualConstraint:superView.top multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeLeft: {
            [self addEqualConstraint:superView.left multiplier:1.f constant:constant];
    
            break;
        }
        case NSLayoutAttributeBottom: {
            [self addEqualConstraint:superView.bottom multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeRight: {
            [self addEqualConstraint:superView.right multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeHeight:
        case NSLayoutAttributeWidth: {
            [self addEqualConstraint:nil multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeCenterX: {
            [self addEqualConstraint:superView.centerX multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeCenterY: {
            [self addEqualConstraint:superView.centerY multiplier:1.f constant:constant];
            break;
        }
        default:
            break;
    }
}


- (void)addLessThanConstant:(CGFloat)constant {
    UIView *superView = (UIView *)[self.item superview];
    switch (self.attribute) {
        case NSLayoutAttributeTop: {
            [self addLessThanConstraint:superView.top multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeLeft: {
            [self addLessThanConstraint:superView.left multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeBottom: {
            [self addLessThanConstraint:superView.bottom multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeRight: {
            [self addLessThanConstraint:superView.right multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeHeight:
        case NSLayoutAttributeWidth: {
            [self addLessThanConstraint:nil multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeCenterX: {
            [self addLessThanConstraint:superView.centerX multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeCenterY: {
            [self addLessThanConstraint:superView.centerY multiplier:1.f constant:constant];
            break;
        }
        default:
            break;
    }
}

- (void)addMoreThanConstant:(CGFloat)constant {
    UIView *superView = (UIView *)[self.item superview];
    switch (self.attribute) {
        case NSLayoutAttributeTop: {
            [self addMoreThanConstraint:superView.top multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeLeft: {
            [self addMoreThanConstraint:superView.left multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeBottom: {
            [self addMoreThanConstraint:superView.bottom multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeRight: {
            [self addMoreThanConstraint:superView.right multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeHeight:
        case NSLayoutAttributeWidth: {
            [self addMoreThanConstraint:nil multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeCenterX: {
            [self addMoreThanConstraint:superView.centerX multiplier:1.f constant:constant];
            break;
        }
        case NSLayoutAttributeCenterY: {
            [self addMoreThanConstraint:superView.centerY multiplier:1.f constant:constant];
            break;
        }
        default:
            break;
    }
}

- (void)addEqualConstraint:(AutoLayoutObject *)secondLayoutObj multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    [self addGenericConstraint:secondLayoutObj multiplier:multiplier constant:constant relation:NSLayoutRelationEqual];
}

- (void)addLessThanConstraint:(AutoLayoutObject *)secondLayoutObj multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    [self addGenericConstraint:secondLayoutObj multiplier:multiplier constant:constant relation:NSLayoutRelationLessThanOrEqual];

}

- (void)addMoreThanConstraint:(AutoLayoutObject *)secondLayoutObj multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    [self addGenericConstraint:secondLayoutObj multiplier:multiplier constant:constant relation:NSLayoutRelationGreaterThanOrEqual];

}


- (void)addGenericConstraint:(AutoLayoutObject *)secondLayoutObj multiplier:(CGFloat)multiplier constant:(CGFloat)constant relation:(NSLayoutRelation)relation
{
    if(!self.item){
        return;
    }
    
    UIView *aView = self.item;
    UIView *bView = secondLayoutObj.item;
    UIView *ancestorView;
    if([aView isDescendantOfView:bView]){
        ancestorView = bView;
    }else if([bView isDescendantOfView:aView]){
        ancestorView = aView;
    }else if([aView isDescendantOfView:bView.superview]){
        ancestorView = bView.superview;
    }else if([bView isDescendantOfView:aView.superview]){
        ancestorView = aView.superview;
    }else{
        ancestorView = aView.superview;
    }
    
    NSLayoutConstraint *layoutConstraint = [NSLayoutConstraint constraintWithItem:self.item
                                                                        attribute:self.attribute
                                                                        relatedBy:relation
                                                                           toItem:secondLayoutObj.item
                                                                        attribute:secondLayoutObj.attribute
                                                                       multiplier:multiplier
                                                                         constant:constant];
    
    [ancestorView addConstraint:layoutConstraint];
}








@end
