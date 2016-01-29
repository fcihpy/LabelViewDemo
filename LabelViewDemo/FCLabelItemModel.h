//
//  FCLabelItemModel.h
//  LabelViewDemo
//
//  Created by locojoy on 16/1/26.
//  Copyright © 2016年 fcihpy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCLabelItemModel : NSObject

@property(nonatomic, strong) NSNumber *labelClickedCount;
@property(nonatomic, strong) NSString *labelID;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSNumber *time;
@property(nonatomic, strong) NSNumber *clicked;
@end
