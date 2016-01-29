//
//  FCLabelItem.h
//  LabelViewDemo
//
//  Created by locojoy on 16/1/26.
//  Copyright © 2016年 fcihpy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCLabelItemModel.h"

@interface FCLabelItem : UIView

@property(nonatomic,strong)FCLabelItemModel *model;

+ (FCLabelItem *)labelItemWithModel:(FCLabelItemModel *)model;

@end
