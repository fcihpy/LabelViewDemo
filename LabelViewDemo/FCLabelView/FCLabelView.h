//
//  FCLabelView.h
//  LabelViewDemo
//
//  Created by locojoy on 16/1/26.
//  Copyright © 2016年 fcihpy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FCLabelView;

@protocol LabelViewDelegate <NSObject>

@optional
- (void)lableView:(FCLabelView *)labelView didSelectIndex:(NSInteger)index;

@end


@interface FCLabelView : UIView

@property(nonatomic,strong)NSArray      *dataSource;
@property(nonatomic,strong)NSArray      *displayLabelArry;
@property(nonatomic,assign)NSUInteger   numberLine;
@property(nonatomic,assign)CGFloat      maxYOfLabel;
@property(nonatomic,weak)id<LabelViewDelegate>delegate;

@end
