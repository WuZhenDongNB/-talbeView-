//
//  myTableCell.m
//  simpleTableView
//
//  Created by xueqiao_summer on 2018/8/25.
//  Copyright © 2018年 xueqiao_summer. All rights reserved.
//

#import "myTableCell.h"

#import "myModel.h"
@implementation myTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _namelab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
        [self addSubview:_namelab];
        _namelab.textColor = [UIColor redColor];
        _titileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _titileBtn.frame = CGRectMake(200, 0, 100, 50);
        [self addSubview:_titileBtn];
        [_titileBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [_titileBtn setTitle:@"点我回调" forState:UIControlStateNormal];
        [_titileBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return self;
}
-(void)fillData:(id)data{
    _cellData = data;
    CellModel *cell = data;
    myModel *my = cell.data;
    _namelab.text = my.name;
}
-(void)click{
    //这里我们还可以把数据回调出去;
    if ([self.cellDelegate respondsToSelector:@selector(btnDidiClick)]) {
        [self.cellDelegate btnDidiClick];
    }
    
}


@end
