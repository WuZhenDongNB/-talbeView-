//
//  ViewController.m
//  simpleTableView
//
//  Created by xueqiao_summer on 2018/8/25.
//  Copyright © 2018年 xueqiao_summer. All rights reserved.
//

#import "ViewController.h"
#import "myTableCell.h"
#import "ArrayDataSource.h"
#import "ArrayDataDelegate.h"
#import "myModel.h"
@interface ViewController ()<btndidClick>

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)ArrayDataSource *dataSource;
@property(nonatomic,strong)ArrayDataDelegate*dataDelegate;

@end

@implementation ViewController

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        //tableview的secion数; 可以在里面设置secion的头部视图,尾部视图,等
        SectionModel *secion = [SectionModel new];
        secion.headerhHeight = 0.01;
        secion.footerHeight = 0.01;
        myModel *model = [myModel new];
        model.name = @"小明";
        CellModel *cell = [CellModel new];
        cell.className =NSStringFromClass([myTableCell class]);//每一行cell的类名;
        cell.height = 50;
        cell.reuseIdentifier = @"cell";
        cell.data = model;//data就是数据源;
        secion.cells = @[cell];
        [_dataArray addObject:secion];
        
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableview];
    _tableview.showsVerticalScrollIndicator = NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self congirgTableView];
}

-(void)congirgTableView{
  
    
    //talbleView datasource代理;
    self.dataSource = [[ArrayDataSource alloc]initWithItems:self.dataArray cellDelegate:self CellWithIndexPath:^(tableViewCell *cell, CellModel *model, NSIndexPath *indexPath) {
       
    }];
    //talbleView delegate代理;
    self.dataDelegate = [[ArrayDataDelegate alloc]initWithItems:self.dataArray andDelegate:self didSelecteIndexPathBlock:^(CellModel *model, NSIndexPath *indexPath) {
        NSLog(@"cell被点击了");
    }];
    self.tableview.dataSource = self.dataSource;
    self.tableview.delegate = self.dataDelegate;
    
    
}
-(void)btnDidiClick{
    
    NSLog(@"cell回调");
    
}

@end
