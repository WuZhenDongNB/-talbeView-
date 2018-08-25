//
//  ArrayDataSource.m
//  iTaskTour
//
//  Created by xueqiao_summer on 2018/5/24.
//  Copyright © 2018年 xueqiao_summer. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource()

@property(nonatomic, copy) CellWithIndexPath configureCellBlock;/**< block */
@property(nonatomic, strong) NSArray* secionArray;
@property(nonatomic,assign)id Class;
@end

@implementation ArrayDataSource

- (CellModel*)itemAtIndexPath:(NSIndexPath *)indexPath {
    SectionModel *sec = self.secionArray[indexPath.section];
    CellModel *cell = sec.cells[indexPath.row];
    
    return cell;
}
-(id)initWithItems:(NSArray<SectionModel *> *)anItems cellDelegate:(id)delegate CellWithIndexPath:(CellWithIndexPath)aConfigureCellBlock{
    
    self = [super init];
    if (self) {
        self.secionArray = anItems;
        self.configureCellBlock = aConfigureCellBlock;
        self.Class=delegate;
    }
    return  self;
    
    
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.secionArray.count;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SectionModel *sec = self.secionArray[section];
    return sec.cells.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     CellModel *ce = [self itemAtIndexPath:indexPath];
    tableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ce.reuseIdentifier];
    if (!cell) {
         cell = [[NSClassFromString(ce.className) alloc]initWithStyle:UITableViewCellStyleDefault     reuseIdentifier:ce.reuseIdentifier];
        
    }
    cell.cellDelegate = self.Class;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //在这儿将block传出。
    self.configureCellBlock(cell, ce,indexPath);
    return cell;
}

@end
