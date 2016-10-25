//
//  AutoLayoutObject.h
//  AutoLayout
//
//  Created by 付海鹏 on 2016/10/11.
//  Copyright © 2016年 Haipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AutoLayoutObject : NSObject

@property (nonatomic, strong) id item;
@property (nonatomic, assign) NSLayoutAttribute attribute;
@property (nonatomic, assign) NSLayoutRelation relation;
@property (nonatomic, assign) CGFloat multiplier;
@property (nonatomic, assign) CGFloat constant;



- (void)addEqualConstant:(CGFloat)constant;
- (void)addLessThanConstant:(CGFloat)constant;
- (void)addMoreThanConstant:(CGFloat)constant;


- (void)addEqualConstraint:(AutoLayoutObject *)secondLayoutObj
                multiplier:(CGFloat)multiplier
                  constant:(CGFloat)constant;

- (void)addLessThanConstraint:(AutoLayoutObject *)secondLayoutObj
                   multiplier:(CGFloat)multiplier
                     constant:(CGFloat)constant;

- (void)addMoreThanConstraint:(AutoLayoutObject *)secondLayoutObj
                   multiplier:(CGFloat)multiplier
                     constant:(CGFloat)constant;


@end
