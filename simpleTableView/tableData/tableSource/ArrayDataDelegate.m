//
//  ArrayDataDelegate.m
//  iTaskTour
//
//  Created by xueqiao_summer on 2018/5/24.
//  Copyright © 2018年 xueqiao_summer. All rights reserved.
//

#import "ArrayDataDelegate.h"
#import "tableViewHeaderView.h"

@interface ArrayDataDelegate()
@property(nonatomic, copy) didSelecteIndexPathBlock configureCellBlock;/**< block */
@property(nonatomic, strong )NSArray* secionArray;
@property(nonatomic,assign)id Class;
@end;


@implementation ArrayDataDelegate
- (CellModel*)itemAtIndexPath:(NSIndexPath *)indexPath {
    SectionModel *sec = self.secionArray[indexPath.section];
    CellModel *cell = sec.cells[indexPath.row];
    
    return cell;
}
-(id)initWithItems:(NSArray<SectionModel *> *)anItems andDelegate:(id)Class didSelecteIndexPathBlock:(didSelecteIndexPathBlock)aConfigureCellBlock{
    self = [super init];
    if (self) {
        self.secionArray = anItems;
        self.configureCellBlock = aConfigureCellBlock;
        self.Class = Class;
    }
    return self;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SectionModel * sect = self.secionArray[indexPath.section];
    CellModel *cellModel = sect.cells[indexPath.row];
    if ([cell respondsToSelector:@selector(fillData:)]) {
        [cell performSelector:@selector(fillData:) withObject:cellModel];
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SectionModel * sect = self.secionArray[section];
    
    tableViewHeaderView *header = (tableViewHeaderView*) [tableView dequeueReusableHeaderFooterViewWithIdentifier:sect.reuseIdentifier];
    if (!header) {
        header = [[NSClassFromString(sect.headerClassName) alloc]init];
       header.sectiondelegate = self.Class;
        if ([header respondsToSelector:@selector(fillData:)]) {
            
            [header performSelector:@selector(fillData:) withObject:sect];
        }
    }
    return header;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    SectionModel * sect = self.secionArray[section];
    
    tableViewHeaderView *footer = (tableViewHeaderView*) [tableView dequeueReusableHeaderFooterViewWithIdentifier:sect.reuseIdentifier];
    if (!footer) {
        footer = [[NSClassFromString(sect.footerClassName) alloc]init];
        footer.sectiondelegate = self.Class;
        if ([footer respondsToSelector:@selector(fillData:)]) {
            
            [footer performSelector:@selector(fillData:) withObject:sect];
        }
        
    }
    return  footer;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SectionModel *sectionModel = self.secionArray[indexPath.section];
    CellModel *cellModel = sectionModel.cells[indexPath.row];
    return cellModel.height;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    SectionModel *sectionModel = self.secionArray[section];    ;
    return sectionModel.headerhHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    SectionModel *sectionModel = self.secionArray[section];
    return sectionModel.footerHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     CellModel *model =  [self itemAtIndexPath:indexPath];
     self.configureCellBlock(model,indexPath);
}
@end
