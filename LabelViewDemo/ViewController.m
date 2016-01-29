//
//  ViewController.m
//  LabelViewDemo
//
//  Created by locojoy on 16/1/26.
//  Copyright © 2016年 fcihpy. All rights reserved.
//

#import "ViewController.h"
#import "FCLabelView.h"
#import "FCLabelItemModel.h"

@interface ViewController ()<LabelViewDelegate>

@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    FCLabelView *labelView = [[FCLabelView alloc] init];
    labelView.backgroundColor = [UIColor lightGrayColor];
    labelView.frame = CGRectMake(0, 100, 300, 400);
    labelView.dataSource = self.dataSource;
    labelView.delegate = self;
    [self.view addSubview:labelView];
    labelView.frame = CGRectMake(0, 100, 300, labelView.maxYOfLabel);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - LabelViewDelegate
- (void)lableView:(FCLabelView *)labelView didSelectIndex:(NSInteger)index{
    NSLog(@"sgsgsga %ld,-- %@",index,labelView.displayLabelArry[index]);
    UIView *view =  labelView.displayLabelArry[index];
    view.backgroundColor = [UIColor blueColor];
}


- (NSArray *)dataSource{
    if (!_dataSource) {
        
        NSMutableArray *tempArry = [NSMutableArray array];
        NSArray *nameStrArry = @[@"茜珍12312412",@"玩世不恭",@"荆不停地",@"答wfwfgq",@"agafawqfwqf",@"3rqr地村",@"qqrqwfafaaf",@"gq1241e1e1efq",@"qeegqrqw列",@"qrq行rq笏笏",@"玩世不恭",@"荆不停地",@"答wfwfgq",@"agafawqfwqf",@"3rqr地村",@"qqrqwfafaaf",@"gq1241e1e1efq",@"qeegqrqw列",@"qrq行rq"];
        for (int i = 0 ; i < nameStrArry.count; i ++) {
            FCLabelItemModel *model = [[FCLabelItemModel alloc]init];
            model.name = nameStrArry[i];
            [tempArry addObject:model];
        }
        _dataSource = [NSArray arrayWithArray:tempArry];
    }
    return _dataSource;
}

@end
