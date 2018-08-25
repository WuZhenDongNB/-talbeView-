//
//  ArrayDataSource.h
//  iTaskTour
//
//  Created by xueqiao_summer on 2018/5/24.
//  Copyright © 2018年 xueqiao_summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tableViewCell.h"
#import "SectionModel.h"
typedef void (^CellWithIndexPath)(tableViewCell *cell, CellModel *model,NSIndexPath *indexPath);
@interface ArrayDataSource : NSObject<UITableViewDataSource>


- (id)initWithItems:(NSArray<SectionModel*>*)anItems cellDelegate:(id)delegate CellWithIndexPath:(CellWithIndexPath)aConfigureCellBlock;
@end
