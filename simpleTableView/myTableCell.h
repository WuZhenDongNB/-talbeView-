//
//  myTableCell.h
//  simpleTableView
//
//  Created by xueqiao_summer on 2018/8/25.
//  Copyright © 2018年 xueqiao_summer. All rights reserved.
//

#import "tableViewCell.h"
#import "CellModel.h"
@protocol btndidClick<NSObject>

-(void)btnDidiClick;

@end



@interface myTableCell : tableViewCell
@property(nonatomic,strong)UILabel *namelab;
@property(nonatomic,strong)UIButton *titileBtn;
@property(nonatomic,strong)CellModel *cellData;
@end
