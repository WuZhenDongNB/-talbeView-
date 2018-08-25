//
//  SectionModel.m
//  iTaskTour
//
//  Created by xueqiao_summer on 2017/5/24.
//  Copyright © 2017年 xueqiao_summer. All rights reserved.
//

#import "SectionModel.h"

@implementation SectionModel

-(instancetype)init {
    self = [super init];
    if(self) {
        self.reuseIdentifier = [[NSUUID UUID] UUIDString];
    }
    return self;
}

+(instancetype)sectionModelWithTitle:(NSString *)title cells:(NSArray<CellModel *> *)cells {
    SectionModel *section = [[SectionModel alloc] init];
    section.title = title;
    section.cells = cells;
    return section;
}
@end
