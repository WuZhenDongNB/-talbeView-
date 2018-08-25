//
//  ArrayDataDelegate.h
//  iTaskTour
//
//  Created by xueqiao_summer on 2018/5/24.
//  Copyright © 2018年 xueqiao_summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellModel.h"
#import "SectionModel.h"
typedef void (^didSelecteIndexPathBlock)(CellModel *model,NSIndexPath *indexPath);

@interface ArrayDataDelegate : NSObject<UITableViewDelegate>


- (id)initWithItems:(NSArray<SectionModel*>*)anItems  andDelegate:(id)Class didSelecteIndexPathBlock:(didSelecteIndexPathBlock)aConfigureCellBlock;
@end
