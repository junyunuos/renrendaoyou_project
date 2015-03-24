//
//  HelloViewController.m
//  Hellow_WordDemo
//
//  Created by guoqiang on 14/10/29.
//  Copyright (c) 2014年 wang. All rights reserved.
//

#import "MePublishRouteViewController.h"
#import "MKNetworkOperation.h"
#import "MKNetworkEngine.h"
#import "UIViewController+Helper.h"
#import "CButtonBar.h"
#import "AppDelegate.h"
#import "RouteUiView.h"
#import "UIImageView+WebCache.h"
#import "CustomButton.h"



@interface MePublishRouteViewController (){

    CButtonBar *_buttonBar;
    UIImageView *_lineImageView;
    
    NSInteger _currentSelectedIndex;
    
    NSInteger _firstResult;
    NSInteger _maxResults;
    NSString *createDate;
    NSMutableArray *_serviceIdArray;
    
    
    NSString* _selectBarState;//选项卡的的index
    UITableView* _tableView;
    UIView* _selectView;
    NSString *_lastTime; //请求数据时间
    NSString *_requestNum;//请求数据条数
    NSMutableArray *results;
    NSString* _selectType;//选项卡类型、已发布、未发布
    
    NSInteger _deleteType;//删除类型、是否是通过编辑后删除的,0为滑动删除、1为编辑后滑动删除
    NSInteger _editState;//编辑状态 0为编辑状态,1为完成状态
    
    UIBarButtonItem* _barRightBtnItem;

}

@end

@implementation MePublishRouteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMainView];
    [self initButtonBar];
    self.title=@"我的线路";
    
    _editState=0;
    
    
    _barRightBtnItem=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(barRightBtnItemAction:)];
    _barRightBtnItem.tag=1010;
    self.navigationItem.rightBarButtonItem=_barRightBtnItem;
    

    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,103, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}
//点击编辑后
-(void)barRightBtnItemAction:(UIBarButtonItem*)item{
    
    _deleteType=1;//点击编辑后改的删除状态
    
    if (_editState==0) {
        [_barRightBtnItem setTitle:@"完成"];
        _barRightBtnItem.style=UIBarButtonItemStylePlain;
        _editState=1;
        for(int i=0;i<[results count];i++){
            UITableViewCell *cell = [_tableView  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            
            UIView *view = [cell.contentView viewWithTag:3];
            CGPoint labelPosition = CGPointMake(view.frame.origin.x - 120.0, view.frame.origin.y);
            view.frame = CGRectMake( labelPosition.x , labelPosition.y , view.frame.size.width, view.frame.size.height);
        }
    }else{
        [_barRightBtnItem setTitle:@"编辑"];
        _barRightBtnItem.style=UIBarButtonItemStylePlain;
         _editState=0;
        
        for(int i=0;i<[results count];i++){
            UITableViewCell *cell = [_tableView  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];\
            
            UIView* view=[cell.contentView viewWithTag:3];
            view.frame=CGRectMake(0, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
        
        }
    }

}

//点击完成后
-(void)finishItemBtnAction{

    NSLog(@"点击完成咯");

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化选项卡 已发布，未发布
-(void)initMainView
{
    //self.navigationItem.leftBarButtonItem.customView.hidden = YES;
    _firstResult = 0;
    _maxResults = 10;
    createDate = @"";
    _currentSelectedIndex = 0;
    _serviceIdArray = [NSMutableArray array];
    
    CGFloat sx = 0;
    CGFloat sy = [self getInitY];
    CGFloat barHeight = 36;
    
    _buttonBar = [[CButtonBar alloc] initWithFrame:CGRectMake(sx, sy, SCREEN_WIDTH, barHeight)];
    _buttonBar.target = self;
    _buttonBar.action = @selector(buttonChangeAction:);
    _buttonBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_buttonBar];
    
    sy = sy + _buttonBar.frame.size.height - 2;
    _lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slideLine.png"]];
    _lineImageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_lineImageView];
    
}

//切换按钮
-(void)buttonChangeAction:(id)sender
{

    CButtonBarItem *item = (CButtonBarItem *)sender;
    
    if (_currentSelectedIndex==item.index)
    {
        return;
    }
    //获取当前的index
    _currentSelectedIndex = item.index;
    _firstResult = 0;

    
    //移动图片
    [self moveLineImage:item.index];
    //设置button的index
    [_buttonBar setSelectedIndex:_currentSelectedIndex];
    //获取数据
     [self initData];
    
}

//设置滚动条
-(void)moveLineImage:(NSInteger)index
{
    
    __block UIImageView *imageView = _lineImageView;
    [UIView animateWithDuration:0.3 animations:^{
        
        [imageView setFrame:CGRectMake((SCREEN_WIDTH/3/4+5)+SCREEN_WIDTH/2*index, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height)];
        
    } completion:^(BOOL finished) {
        //
    }];
}

//初始化选项卡 已发布、未发布选项卡
-(void)initButtonBar
{
    NSDictionary* nameDict=[[NSDictionary alloc]initWithObjectsAndKeys:@"已发布",@"name",@"0",@"serviceid",nil];
    NSDictionary* nameDict2=[[NSDictionary alloc]initWithObjectsAndKeys:@"未发布",@"name",@"1",@"serviceid",nil];
    NSArray* dataArray=[[NSArray alloc]initWithObjects:nameDict,nameDict2,nil];
    
    
    for (NSDictionary *dic in dataArray)
    {
        [_buttonBar addButton:dic[@"name"]];
        [_serviceIdArray addObject:dic[@"serviceid"]];
    }
    //选中的按钮
    [_buttonBar setSelectedIndex:_currentSelectedIndex];
    
    //设置下划线的frame
    [_lineImageView setFrame:CGRectMake((SCREEN_WIDTH/3/4+5), _buttonBar.frame.origin.y+_buttonBar.frame.size.height-1, 100, 2)];
    //获取数据列表
    [self initData];
}

-(void)initData{
    
    _deleteType=0;
    
    _lastTime = @"";
    _requestNum = @"10";
    results = [[NSMutableArray alloc] init];
    
    //获取已发布数据;
    if(_currentSelectedIndex==0){
        NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
        [dic setObject:APPDelagate.uid forKey:@"uid"];
        [dic setObject:APPDelagate.token forKey:@"token"];
       // [dic setObject:_lastTime forKey:@"last_time"];
        //[dic setObject:_requestNum forKey:@"num"];
        
        MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/Way/getWayByUid" params:dic httpMethod:@"GET"];
        [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
            
            id json = [completedOperation responseJSON];
            NSDictionary *jsonDic = (NSDictionary *)json;
            NSString *isOk = jsonDic[@"isOk"];
            
            if (isOk.integerValue == 1)
            {
                NSArray *array = jsonDic[@"result"];
                [results addObjectsFromArray:array];
                if (results.count == 0)
                {
                    _tableView.hidden = YES;
                }
                else
                {
                    _tableView.hidden = NO;
                    [_tableView reloadData];
                }
            }
            else
            {
                
            }
            
        } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
            
        }];
        
        [APPDelagate.appNetwork enqueueOperation:op];
        
    }else{
        NSDictionary* dic1=[[NSDictionary alloc] initWithObjectsAndKeys:@"Route.png",@"picture",@"西湖来咯",@"des",@"单人_100;双人_300;多人_100",@"price",@"杭州",@"region", nil];
        NSDictionary* dic2=[[NSDictionary alloc] initWithObjectsAndKeys:@"Route2.png",@"picture",@"杭州来咯",@"des",@"单人_100;双人_300;多人_100",@"price",@"上海",@"region",nil];
        results=[[NSMutableArray alloc] initWithObjects:dic1,dic2,nil];
        [_tableView reloadData];
        
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [results count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90.0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"RouteBase"];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RouteBase"];
        
        cell.backgroundColor=[UIColor whiteColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        CustomButton* closeBtn =[[CustomButton alloc]initWithFrame:CGRectMake(200, 0, 60, 90)];
        closeBtn.tag =1234;
        [closeBtn addTarget:self action:@selector(closeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:closeBtn];
        
        CustomButton* deleteBtn=[[CustomButton alloc]initWithFrame:CGRectMake(260, 0, 60, 90)];
        deleteBtn.tag =1235;
        [deleteBtn addTarget:self action:@selector(deleteBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:deleteBtn];
        
        RouteUiView* routeView=[[RouteUiView alloc]initWithFrame:CGRectMake(0, cell.frame.origin.y, self.view.frame.size.width, 90)];
        routeView.tag=3;
        routeView.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:routeView];
        
        
        //给_routeView添加左右滑动手势
        self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        
        UITapGestureRecognizer* routeViewTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(routeViewTapAction:)];
        
        self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
        self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        
        [routeView addGestureRecognizer:self.leftSwipeGestureRecognizer];
        [routeView addGestureRecognizer:self.rightSwipeGestureRecognizer];
        [routeView addGestureRecognizer:routeViewTap];
        
        
        UILabel* routeLabel=[[UILabel alloc]initWithFrame:CGRectMake(95, 10, 220, 80)];
        routeLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:14];
        routeLabel.numberOfLines=0;
        routeLabel.textColor=[UIColor blackColor];
        routeLabel.lineBreakMode = NSLineBreakByCharWrapping;
        routeLabel.tag=4;
        [routeView addSubview:routeLabel];
        
        UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 70)];
        imageView.tag=5;
        [routeView addSubview:imageView];
        
        //价格label
        UILabel* priceLabel=[[UILabel alloc] initWithFrame:CGRectMake(95, 50, 100, 40)];
        priceLabel.tag=6;
        [routeView addSubview:priceLabel];
        
        //地区表示图
        UIImageView* regionImageView=[[UIImageView alloc] initWithFrame:CGRectMake(210, 63, 10, 12)];
        regionImageView.tag=7;
        [routeView addSubview:regionImageView];
        
        //地区label
        UILabel* regionLabel=[[UILabel alloc] initWithFrame:CGRectMake(225, 50, 100, 40)];
        regionLabel.tag=8;
        regionLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:12];
        [routeView addSubview:regionLabel];
    }
    
    CustomButton* closeBtn=(CustomButton*)[cell viewWithTag:1234];
    closeBtn.index=indexPath.row;
    
    
    [closeBtn setImage:[UIImage imageNamed:@"closeImage.png"] forState:UIControlStateNormal];
    
    
    CustomButton *deleteBtn = (CustomButton*)[cell viewWithTag:1235];
    deleteBtn.index = indexPath.row;
    [deleteBtn setImage:[UIImage imageNamed:@"deleteImage.png"] forState:UIControlStateNormal];
    
    
    RouteUiView* routeView=(RouteUiView*)[cell viewWithTag:3];
    routeView.index = indexPath.row;
    
    UILabel* routeLabel=(UILabel*)[routeView viewWithTag:4];
    routeLabel.backgroundColor=[UIColor clearColor];
    
    UIImageView* routeImageView=(UIImageView*)[routeView viewWithTag:5];
    
    UILabel* priceLabel=(UILabel*)[routeView viewWithTag:6];
    [priceLabel setTextColor:[UIColor redColor]];
    
    
    UIImageView* regionImageView=(UIImageView*)[routeView viewWithTag:7];
    [regionImageView setImage:[UIImage imageNamed:@"location.png"]];
    
    UILabel* regionLabel=(UILabel*)[routeView viewWithTag:8];
    
    
    //赋值、
    NSDictionary* dic=[results objectAtIndex:indexPath.row];
    
    
    
    //路线url
    NSString* imageRulData=dic[@"picture"];
    NSArray *RouteUrlarry=[imageRulData componentsSeparatedByString:@"_"];
    
    //价格
    NSString* priceData=dic[@"price"];
    NSArray* priceArray=[priceData componentsSeparatedByString:@";"];
    NSArray* priceArra2=[priceArray[0] componentsSeparatedByString:@"_"];
    NSString* price=[@"￥" stringByAppendingString:priceArra2[1]];
    
    
    //给priceLabel赋值
    priceLabel.text=price;
    
    //赋值地区
    regionLabel.text=dic[@"region"];
    
    //赋值路线图片
    if(_currentSelectedIndex==0){
        [routeImageView sd_setImageWithURL:[NSURL URLWithString:RouteUrlarry[0]] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {}];
    }else{
        [routeImageView setImage:[UIImage imageNamed:dic[@"picture"]]];
    }
    
    //设置label换行
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:routeLabel.font, NSFontAttributeName,nil];
    CGSize size =[dic[@"des"] boundingRectWithSize:CGSizeMake(routeLabel.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    if(size.height>35){
        
        NSRange range=NSMakeRange(0,30);
        NSString* substring=[dic[@"des"] substringWithRange:range];
        NSString* routeStr=[substring stringByAppendingString:@"......."];
        CGSize size =[routeStr boundingRectWithSize:CGSizeMake(routeLabel.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
        routeLabel.text=routeStr;
        [routeLabel setFrame:CGRectMake(routeLabel.frame.origin.x, routeLabel.frame.origin.y, routeLabel.frame.size.width, size.height)];
        
    }else{
        //设置label换行
        CGSize size =[dic[@"des"] boundingRectWithSize:CGSizeMake(routeLabel.frame.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
        routeLabel.text=dic[@"des"];
        [routeLabel setFrame:CGRectMake(routeLabel.frame.origin.x, routeLabel.frame.origin.y, routeLabel.frame.size.width, size.height)];
    }
    return cell;
}
//侧滑、向左向右滑动事件
- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    RouteUiView *view =(RouteUiView*)sender.view;
    
    NSInteger currentIndex=view.index;
    NSInteger lastIndex=view.index-1;
    NSInteger nextIndex=view.index+1;
    
    
    
    //获取滑动对象的上一个对象  比如滑动cell[1] 那么这里就是cell[0]
    UITableViewCell* cell=[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:nextIndex inSection:0]];
    UIView* lastView=[cell viewWithTag:3];
    
    
    //获取滑动对象的下一个对象
    UITableViewCell* cell2=[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:nextIndex inSection:0]];
    
    UIView* nextView=[cell2 viewWithTag:3];
    
//    if(lastView.frame.origin.x!=_tableView.frame.origin.x){
//        lastView.frame=CGRectMake(_tableView.frame.origin.x, lastView.frame.origin.y, lastView.frame.size.width, lastView.frame.size.height);
//    
//    }
//    if(nextView.frame.origin.x!=_tableView.frame.origin.x){
//        lastView.frame=CGRectMake(_tableView.frame.origin.x, nextView.frame.origin.y, nextView.frame.size.width, nextView.frame.size.height);
//        
//    }
    
    
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        if(view.frame.origin.x>-120){
            CGPoint labelPosition = CGPointMake(view.frame.origin.x - 120.0, view.frame.origin.y);
            
            view.frame = CGRectMake( labelPosition.x , labelPosition.y , view.frame.size.width, view.frame.size.height);
            
        }
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        if(view.frame.origin.x!=self.view.frame.origin.x){
            CGPoint labelPosition = CGPointMake(view.frame.origin.x + 120.0, view.frame.origin.y);
            view.frame = CGRectMake( labelPosition.x , labelPosition.y , view.frame.size.width, view.frame.size.height);
        }
    }
}
-(void)routeViewTapAction:(UITapGestureRecognizer*)tap{
    
    UIView* tapView=tap.view;
    
    if(_deleteType==0){
        if(tapView.frame.origin.x!=_tableView.frame.origin.x){
            tapView.frame=CGRectMake(_tableView.frame.origin.x, tapView.frame.origin.y, tapView.frame.size.width, tapView.frame.size.height);
        }else{
            
            NSLog(@"线路详情");
        }
    }
    

    
}

//关闭预订或者打开预订
-(void)closeBtnAction:(CustomButton*)btn{
    
    NSLog(@"close.ta:%d",btn.index);
    
}

//删除cell单元格数据
-(void)deleteBtnAction:(CustomButton*)btn{
    
    NSLog(@"Btn.index:%d",btn.index);
    

    
    if(_deleteType==0){
        UITableViewCell *cell = [_tableView  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:btn.index inSection:0]];
        
        UIView *view = [cell.contentView viewWithTag:3];
        view.frame=CGRectMake(0, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    }

    [results removeObjectAtIndex:btn.index];
    [_tableView reloadData];
}

-(void)dealloc
{
    for (UIView *subView in self.view.subviews) {
        [subView removeFromSuperview];
    }
    
    _tableView = nil;
    results = nil;
}

@end
