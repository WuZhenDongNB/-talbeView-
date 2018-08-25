//
//  tableViewCell.h
//  iTaskTour
//
//  Created by xueqiao_summer on 2017/5/25.
//  Copyright © 2017年 xueqiao_summer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableViewCell : UITableViewCell
@property(nonatomic,assign) id cellDelegate;
-(void)fillData:(id)data;
@end
