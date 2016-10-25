//
//  UIView+AutoLayout.m
//  AutoLayout
//
//  Created by 付海鹏 on 2016/10/11.
//  Copyright © 2016年 Haipeng. All rights reserved.
//

#import "UIView+AutoLayout.h"
#import "AutoLayoutObject.h"

@implementation UIView (AutoLayout)

+ (id)create
{
    UIView *aView = [[self alloc] init];
    if(aView){
        aView.translatesAutoresizingMaskIntoConstraints = NO;
    
    }
    
    return aView;
}


- (AutoLayoutObject *)top
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeTop];

}

- (AutoLayoutObject *)bottom
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeBottom];
}

- (AutoLayoutObject *)left
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeLeft];
}

- (AutoLayoutObject *)right
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeRight];
}

- (AutoLayoutObject *)leading
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeLeading];
}

- (AutoLayoutObject *)trailing
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeTrailing];
}


- (AutoLayoutObject *)width
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeWidth];
}

- (AutoLayoutObject *)height
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeHeight];
}

- (AutoLayoutObject *)centerX
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeCenterX];
}

- (AutoLayoutObject *)centerY
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeCenterY];
}

- (AutoLayoutObject *)baseline
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeBaseline];
}

- (AutoLayoutObject *)notAnAttribute
{
    return [self autoLayoutObjWithAttribute:NSLayoutAttributeNotAnAttribute];
}



- (void)removeAllConstraint
{
    [self removeAllConstraint];
}

- (void)removeAutoLayoutObject:(AutoLayoutObject *)autoLayoutObj
{
    for(NSLayoutConstraint *constranit in self.constraints)
    {
        if(autoLayoutObj.attribute == constranit.firstAttribute){
            [self removeConstraint:constranit];
        }
    }
}

#pragma mark - Private Methods

- (AutoLayoutObject *)autoLayoutObjWithAttribute:(NSLayoutAttribute)attribute {
    
    AutoLayoutObject *autoLayoutObj = [[AutoLayoutObject alloc] init];
    autoLayoutObj.item = self;
    autoLayoutObj.attribute = attribute;
    
    return autoLayoutObj;
}




@end
