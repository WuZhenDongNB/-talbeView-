//
//  CellModel.h
//  iTaskTour
//
//  Created by xueqiao_summer on 2017/5/24.
//  Copyright © 2017年 xueqiao_summer. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CellModel : NSObject
@property(nonatomic,assign)int storeId;
@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *subTitle;
@property(nonatomic,retain) NSString *image;
@property(nonatomic,strong) id data;
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,strong) NSArray *dataArray;
@property(nonatomic,retain) NSString *selectorString;
@property(nonatomic,assign) UITableViewCellAccessoryType accessoryType;
@property(nonatomic,assign) UITableViewCellStyle style;
@property(nonatomic,assign) UITableViewCellSelectionStyle selectionStyle;

@property(nonatomic,strong) NSString *className;
@property(nonatomic,strong) NSString *reuseIdentifier;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,weak) id delegate;
@property(nonatomic,assign)BOOL isChoice;
@property(nonatomic,assign)int isRead;
@property(nonatomic,retain) NSString *creatTime;

@property(nonatomic,strong) id userInfo;
///CollectionView模式下的size
@property(nonatomic,assign) CGSize size;

+(instancetype)cellModelWithTitle:(NSString*)title sel:(NSString*)selectorString;
+(instancetype)cellModelWithTitle:(NSString*)title subTitle:(NSString*)subTitle image:(NSString*)image sel:(NSString*)selectorString;

@end
