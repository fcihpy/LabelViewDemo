//
//  FCLabelView.m
//  LabelViewDemo
//
//  Created by locojoy on 16/1/26.
//  Copyright © 2016年 fcihpy. All rights reserved.
//

#import "FCLabelView.h"
#import "FCLabelItem.h"

@interface FCLabelView ()

@property (nonatomic,strong) NSMutableArray         *labelFrames;
@property (nonatomic,strong) NSMutableDictionary    *labelDict;

@end

@implementation FCLabelView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    NSMutableArray *tempArry = [NSMutableArray array];
    for (int i = 0 ; i < self.dataSource.count; i ++) {
        FCLabelItem  *item = [[FCLabelItem alloc]init];
        item.frame = [self.labelFrames[i] CGRectValue];
        item.model = self.dataSource[i];
//        UIView *item = [[UIView alloc]init];
//        item.backgroundColor = [UIColor yellowColor];
//        item.frame = [self.labelFrames[i] CGRectValue];
    
        [self addSubview:item];
        [tempArry addObject:item];
    }
    self.displayLabelArry = [NSArray arrayWithArray:tempArry];
}

#pragma mark - ------------setter/getter-----------
- (NSMutableArray *)labelFrames{
    if (!_labelFrames) {
        _labelFrames = [NSMutableArray array];
    }
    return _labelFrames;
}



#pragma mark - 公共接口
/**
 *  刷新数据
 */
- (void)reloadData{
    
    CGFloat interItemSpace = 5;
    CGFloat lineSpace = 10;
    CGFloat leftOfItem = 10.f;
    CGFloat rightOfItem = 0.f;
    CGFloat topOfItem = 10.f;
    CGFloat bottomOfItem = 0.f;
    
    NSInteger lineNumber = 0;
    CGFloat maxWidth = self.frame.size.width;
    CGFloat heightOfItem = 50.f;
    CGSize sizeOfItem = CGSizeZero;
    
    for (int i = 0; i < self.dataSource.count; i ++) {
        sizeOfItem = [[self.dataSource[i] name] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        //判断是否折行
        if (maxWidth - rightOfItem  - interItemSpace < sizeOfItem.width) {
            lineNumber ++;
//            topOfItem = lineSpace * lineNumber + heightOfItem * lineNumber + topOfItem;
            topOfItem = topOfItem + heightOfItem + lineSpace;
            leftOfItem = 10.f;
        }   
      
        CGRect frame = CGRectMake(leftOfItem, topOfItem, sizeOfItem.width, heightOfItem);
        rightOfItem = frame.size.width + frame.origin.x;
        leftOfItem = rightOfItem + interItemSpace;
        bottomOfItem = frame.size.height + frame.origin.y + lineSpace;
        [self.labelFrames addObject:[NSValue valueWithCGRect:frame]];
        
    }
    self.maxYOfLabel = bottomOfItem;
    self.numberLine = lineNumber + 1;
}

#pragma mark - 私有方法
- (void)willMoveToSuperview:(UIView *)newSuperview{
    [self reloadData];
}

#pragma mark - 事件处理
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 获得触摸点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    //遍历item frame 判断点击区域是否在某个item的区域中，如果在得出所在item索引值
    __block NSNumber *selectIndex = nil;
    [self.displayLabelArry enumerateObjectsUsingBlock:^(FCLabelItem *item, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectContainsPoint(item.frame, point)) {
            selectIndex = @(idx);
            *stop = YES;
        }
    }];
    
    if (selectIndex) {
        if ([self.delegate respondsToSelector:@selector(lableView:didSelectIndex:)]) {
            [self.delegate lableView:self didSelectIndex:[selectIndex integerValue]];
        }
    }
}

@end
