# -talbeView-
将tableView的代理封装,免去了重复写代理和数据源的操作,cell中的任何操作支持回调到tableView,支持任何复杂的tableView,只需一行代码搞定


tableData中model定义了2模型类,2个视图:
      cellModel:存储cell有关信息:行高,类名,重用名,等;
      sectionModel:存储secion有关信息:头部视图,尾部视图,高度,等;
      tableviewCell:自己以后创建的cell必须继承这个;
      tableViewHeaderView:自己创建的头尾视图必须继承这个;
tableData中tableSource分别是tableView的代理和数据源;      

用法:详见demo
//模拟数据;  此数据必须是secionModel的集合,
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
//创建tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableview];
    _tableview.showsVerticalScrollIndicator = NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self congirgTableView];
}
//配置代理;
-(void)congirgTableView{
  
    
    //talbleView datasource代理;
    self.dataSource = [[ArrayDataSource alloc]initWithItems:self.dataArray cellDelegate:self CellWithIndexPath:^(tableViewCell *cell, CellModel *model, NSIndexPath *indexPath) {
       
    }];
    //talbleView delegate代理;
    self.dataDelegate = [[ArrayDataDelegate alloc]initWithItems:self.dataArray andDelegate:self didSelecteIndexPathBlock:^(CellModel *model, NSIndexPath *indexPath) {
    }];
    self.tableview.dataSource = self.dataSource;
    self.tableview.delegate = self.dataDelegate;
    
    
}
      
      
