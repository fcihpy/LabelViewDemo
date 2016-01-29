
//
//  FCLabelItem.m
//  LabelViewDemo
//
//  Created by locojoy on 16/1/26.
//  Copyright © 2016年 fcihpy. All rights reserved.
//

#import "FCLabelItem.h"

@interface FCLabelItem ()
{
    UILabel *_label;
}

@end

@implementation FCLabelItem

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _label = [[UILabel alloc]init];
        _label.backgroundColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:14.f];
//        _label.frame = frame;
        [self addSubview:_label];
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)setModel:(FCLabelItemModel *)model{
    _label.text = model.name;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _label.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}


//+ (FCLabelItem *)labelItemWithModel:(FCLabelItemModel *)model{
//    
//}

@end
