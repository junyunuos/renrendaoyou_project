//
//  LinkmanViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-6.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "LinkmanViewController.h"
#import "ChineseString.h"
#import "pinyin.h"
#import "HMSegmentedControl.h"

#import "LinkmanCell.h"             //联系人 cell
@interface LinkmanViewController ()

@end

@implementation LinkmanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //IOS7 tableView被navigationBar挡住了
        if([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        self.navigationItem.title = @"联系人";
    }
    return self;
}
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [recipes filteredArrayUsingPredicate:resultPredicate];
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
	if (segmentedControl.selectedIndex==0) {
        arr=[[NSMutableArray alloc]init];
        arr1=[[NSMutableArray alloc]init];
        arr2=[[NSMutableArray alloc]init];
        arr3=[[NSMutableArray alloc]init];
        arr4=[[NSMutableArray alloc]init];
        arr5=[[NSMutableArray alloc]init];
        arr6=[[NSMutableArray alloc]init];
        arr7=[[NSMutableArray alloc]init];
        arr8=[[NSMutableArray alloc]init];
        arr9=[[NSMutableArray alloc]init];
        arr10=[[NSMutableArray alloc]init];
        arr11=[[NSMutableArray alloc]init];
        arr12=[[NSMutableArray alloc]init];
        arr13=[[NSMutableArray alloc]init];
        arr14=[[NSMutableArray alloc]init];
        arr15=[[NSMutableArray alloc]init];
        arr16=[[NSMutableArray alloc]init];
        arr17=[[NSMutableArray alloc]init];
        arr18=[[NSMutableArray alloc]init];
        arr19=[[NSMutableArray alloc]init];
        arr20=[[NSMutableArray alloc]init];
        arr21=[[NSMutableArray alloc]init];
        arr22=[[NSMutableArray alloc]init];
        arr23=[[NSMutableArray alloc]init];
        arr24=[[NSMutableArray alloc]init];
        arr25=[[NSMutableArray alloc]init];
        dic=[[NSMutableDictionary alloc]init];
        stringsToSort=[NSMutableArray arrayWithObjects:
                       @"阿初",
                       @"电脑",
                       @"电话",
                       @"电视",
                       @"推特",
                       @"乔布斯",
                       @"再见",
                       @"暑假作业",
                       @"键盘",
                       @"鼠标",
                       @"谷歌",
                       @"阿三",
                       nil];
        NSMutableArray *chineseStringsArray=[NSMutableArray array];
        for(int i=0;i<[stringsToSort count];i++){
            ChineseString *chineseString=[[ChineseString alloc]init];
            
            chineseString.string=[NSString stringWithString:[stringsToSort objectAtIndex:i]];
            
            if(chineseString.string==nil){
                chineseString.string=@"";
            }
            
            if(![chineseString.string isEqualToString:@""]){
                NSString *pinYinResult=[NSString string];
                for(int j=0;j<chineseString.string.length;j++){
                    NSString *singlePinyinLetter=[[NSString stringWithFormat:@"%c",pinyinFirstLetter([chineseString.string characterAtIndex:j])]uppercaseString];
                    
                    pinYinResult=[pinYinResult stringByAppendingString:singlePinyinLetter];
                }
                chineseString.pinYin=pinYinResult;
            }else{
                chineseString.pinYin=@"";
            }
            [chineseStringsArray addObject:chineseString];
        }
        
        //Step3:按照拼音首字母对这些Strings进行排序
        NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
        [chineseStringsArray sortUsingDescriptors:sortDescriptors];
        
        //Step3输出
        NSLog(@"\n\n\n按照拼音首字母后的NSString数组");
        for(int i=0;i<[chineseStringsArray count];i++){
            //BOOL yy=YES;
            ChineseString *chineseString=[chineseStringsArray objectAtIndex:i];
            // NSLog(@"原String:%@----拼音首字母String:%@",chineseString.string,chineseString.pinYin);
            NSString *str=[NSString stringWithFormat:@"%@",chineseString.pinYin];
            NSString *s=[str substringToIndex:1];
            if ([s isEqualToString:@"A"]) {
                [arr addObject:chineseString.string];
            }
            if ([arr count]==0) {
                [dic removeObjectForKey:@"A"];
            }
            else
            {
                [dic setValue:arr forKey:@"A"];
            }
            
            if ([s isEqualToString:@"B"]) {
                [arr1 addObject:chineseString.string];
            }
            if ([arr1 count]==0) {
                [dic removeObjectForKey:@"B"];
            }
            else
            {
                [dic setValue:arr1 forKey:@"B"];
            }
            
            if ([s isEqualToString:@"C"]) {
                [arr2 addObject:chineseString.string];
            }
            if ([arr2 count]==0) {
                [dic removeObjectForKey:@"C"];
            }
            else
            {
                [dic setValue:arr2 forKey:@"C"];
            }
            
            if ([s isEqualToString:@"D"]) {
                [arr3 addObject:chineseString.string];
            }
            if ([arr3 count]==0) {
                [dic removeObjectForKey:@"D"];
            }
            else
            {
                [dic setValue:arr3 forKey:@"D"];
            }
            
            if ([s isEqualToString:@"E"]) {
                [arr4 addObject:chineseString.string];
            }
            if ([arr4 count]==0) {
                [dic removeObjectForKey:@"E"];
            }
            else
            {
                [dic setValue:arr4 forKey:@"E"];
            }
            
            if ([s isEqualToString:@"F"]) {
                [arr5 addObject:chineseString.string];
            }
            if ([arr5 count]==0) {
                [dic removeObjectForKey:@"F"];
            }
            else
            {
                [dic setValue:arr5 forKey:@"F"];
            }
            
            if ([s isEqualToString:@"G"]) {
                [arr6 addObject:chineseString.string];
            }
            if ([arr6 count]==0) {
                [dic removeObjectForKey:@"G"];
            }
            else
            {
                [dic setValue:arr6 forKey:@"G"];
            }
            
            if ([s isEqualToString:@"H"]) {
                [arr7 addObject:chineseString.string];
            }
            if ([arr7 count]==0) {
                [dic removeObjectForKey:@"H"];
            }
            else
            {
                [dic setValue:arr7 forKey:@"H"];
            }
            
            if ([s isEqualToString:@"I"]) {
                [arr8 addObject:chineseString.string];
            }
            if ([arr8 count]==0) {
                [dic removeObjectForKey:@"I"];
            }
            else
            {
                [dic setValue:arr8 forKey:@"I"];
            }
            
            if ([s isEqualToString:@"J"]) {
                [arr9 addObject:chineseString.string];
            }
            if ([arr9 count]==0) {
                [dic removeObjectForKey:@"J"];
            }
            else
            {
                [dic setValue:arr9 forKey:@"J"];
            }
            
            if ([s isEqualToString:@"K"]) {
                [arr10 addObject:chineseString.string];
            }
            if ([arr10 count]==0) {
                [dic removeObjectForKey:@"K"];
            }
            else
            {
                [dic setValue:arr10 forKey:@"K"];
            }
            
            if ([s isEqualToString:@"L"]) {
                [arr11 addObject:chineseString.string];
            }
            if ([arr11 count]==0) {
                [dic removeObjectForKey:@"L"];
            }
            else
            {
                [dic setValue:arr11 forKey:@"L"];
            }
            
            if ([s isEqualToString:@"M"]) {
                [arr12 addObject:chineseString.string];
            }
            if ([arr12 count]==0) {
                [dic removeObjectForKey:@"M"];
            }
            else
            {
                [dic setValue:arr12 forKey:@"M"];
            }
            
            if ([s isEqualToString:@"N"]) {
                [arr13 addObject:chineseString.string];
            }
            if ([arr13 count]==0) {
                [dic removeObjectForKey:@"N"];
            }
            else
            {
                [dic setValue:arr13 forKey:@"N"];
            }
            
            if ([s isEqualToString:@"O"]) {
                [arr14 addObject:chineseString.string];
            }
            if ([arr14 count]==0) {
                [dic removeObjectForKey:@"O"];
            }
            else
            {
                [dic setValue:arr14 forKey:@"O"];
            }
            
            if ([s isEqualToString:@"P"]) {
                [arr15 addObject:chineseString.string];
            }
            if ([arr15 count]==0) {
                [dic removeObjectForKey:@"P"];
            }
            else
            {
                [dic setValue:arr15 forKey:@"P"];
            }
            
            if ([s isEqualToString:@"Q"]) {
                [arr16 addObject:chineseString.string];
            }
            if ([arr16 count]==0) {
                [dic removeObjectForKey:@"Q"];
            }
            else
            {
                [dic setValue:arr16 forKey:@"Q"];
            }
            
            if ([s isEqualToString:@"R"]) {
                [arr17 addObject:chineseString.string];
            }
            if ([arr17 count]==0) {
                [dic removeObjectForKey:@"R"];
            }
            else
            {
                [dic setValue:arr17 forKey:@"R"];
            }
            
            if ([s isEqualToString:@"S"]) {
                [arr18 addObject:chineseString.string];
            }
            if ([arr18 count]==0) {
                [dic removeObjectForKey:@"S"];
            }
            else
            {
                [dic setValue:arr18 forKey:@"S"];
            }
            
            if ([s isEqualToString:@"T"]) {
                [arr19 addObject:chineseString.string];
            }
            if ([arr19 count]==0) {
                [dic removeObjectForKey:@"T"];
            }
            else
            {
                [dic setValue:arr19 forKey:@"T"];
            }
            
            if ([s isEqualToString:@"U"]) {
                [arr20 addObject:chineseString.string];
            }
            if ([arr20 count]==0) {
                [dic removeObjectForKey:@"U"];
            }
            else
            {
                [dic setValue:arr20 forKey:@"U"];
            }
            
            if ([s isEqualToString:@"V"]) {
                [arr21 addObject:chineseString.string];
            }
            if ([arr21 count]==0) {
                [dic removeObjectForKey:@"V"];
            }
            else
            {
                [dic setValue:arr21 forKey:@"V"];
            }
            
            if ([s isEqualToString:@"W"]) {
                [arr22 addObject:chineseString.string];
            }
            if ([arr22 count]==0) {
                [dic removeObjectForKey:@"W"];
            }
            else
            {
                [dic setValue:arr22 forKey:@"W"];
            }
            
            if ([s isEqualToString:@"X"]) {
                [arr23 addObject:chineseString.string];
            }
            if ([arr23 count]==0) {
                [dic removeObjectForKey:@"X"];
            }
            else
            {
                [dic setValue:arr23 forKey:@"X"];
            }
            
            if ([s isEqualToString:@"Y"]) {
                [arr24 addObject:chineseString.string];
            }
            if ([arr24 count]==0) {
                [dic removeObjectForKey:@"Y"];
            }
            else
            {
                [dic setValue:arr24 forKey:@"Y"];
            }
            if ([s isEqualToString:@"Z"]) {
                [arr25 addObject:chineseString.string];
            }
            if ([arr25 count]==0) {
                [dic removeObjectForKey:@"Z"];
            }
            else
            {
                [dic setValue:arr25 forKey:@"Z"];
            }
            
            
        }
        
        key=[[dic allKeys]sortedArrayUsingSelector:@selector(compare:)];
        [self.tableView reloadData];
    }
    if (segmentedControl.selectedIndex==1) {
        arr=[[NSMutableArray alloc]init];
        arr1=[[NSMutableArray alloc]init];
        arr2=[[NSMutableArray alloc]init];
        arr3=[[NSMutableArray alloc]init];
        arr4=[[NSMutableArray alloc]init];
        arr5=[[NSMutableArray alloc]init];
        arr6=[[NSMutableArray alloc]init];
        arr7=[[NSMutableArray alloc]init];
        arr8=[[NSMutableArray alloc]init];
        arr9=[[NSMutableArray alloc]init];
        arr10=[[NSMutableArray alloc]init];
        arr11=[[NSMutableArray alloc]init];
        arr12=[[NSMutableArray alloc]init];
        arr13=[[NSMutableArray alloc]init];
        arr14=[[NSMutableArray alloc]init];
        arr15=[[NSMutableArray alloc]init];
        arr16=[[NSMutableArray alloc]init];
        arr17=[[NSMutableArray alloc]init];
        arr18=[[NSMutableArray alloc]init];
        arr19=[[NSMutableArray alloc]init];
        arr20=[[NSMutableArray alloc]init];
        arr21=[[NSMutableArray alloc]init];
        arr22=[[NSMutableArray alloc]init];
        arr23=[[NSMutableArray alloc]init];
        arr24=[[NSMutableArray alloc]init];
        arr25=[[NSMutableArray alloc]init];
        dic=[[NSMutableDictionary alloc]init];
        stringsToSort=[NSMutableArray arrayWithObjects:
                       @"阿初",
                       @"电脑",
                       @"电话",
                       @"阿三",
                       nil];
        NSMutableArray *chineseStringsArray=[NSMutableArray array];
        for(int i=0;i<[stringsToSort count];i++){
            ChineseString *chineseString=[[ChineseString alloc]init];
            
            chineseString.string=[NSString stringWithString:[stringsToSort objectAtIndex:i]];
            
            if(chineseString.string==nil){
                chineseString.string=@"";
            }
            
            if(![chineseString.string isEqualToString:@""]){
                NSString *pinYinResult=[NSString string];
                for(int j=0;j<chineseString.string.length;j++){
                    NSString *singlePinyinLetter=[[NSString stringWithFormat:@"%c",pinyinFirstLetter([chineseString.string characterAtIndex:j])]uppercaseString];
                    
                    pinYinResult=[pinYinResult stringByAppendingString:singlePinyinLetter];
                }
                chineseString.pinYin=pinYinResult;
            }else{
                chineseString.pinYin=@"";
            }
            [chineseStringsArray addObject:chineseString];
        }
        
        //Step3:按照拼音首字母对这些Strings进行排序
        NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
        [chineseStringsArray sortUsingDescriptors:sortDescriptors];
        
        //Step3输出
        NSLog(@"\n\n\n按照拼音首字母后的NSString数组");
        for(int i=0;i<[chineseStringsArray count];i++){
            //BOOL yy=YES;
            ChineseString *chineseString=[chineseStringsArray objectAtIndex:i];
            // NSLog(@"原String:%@----拼音首字母String:%@",chineseString.string,chineseString.pinYin);
            NSString *str=[NSString stringWithFormat:@"%@",chineseString.pinYin];
            NSString *s=[str substringToIndex:1];
            if ([s isEqualToString:@"A"]) {
                [arr addObject:chineseString.string];
            }
            if ([arr count]==0) {
                [dic removeObjectForKey:@"A"];
            }
            else
            {
                [dic setValue:arr forKey:@"A"];
            }
            
            if ([s isEqualToString:@"B"]) {
                [arr1 addObject:chineseString.string];
            }
            if ([arr1 count]==0) {
                [dic removeObjectForKey:@"B"];
            }
            else
            {
                [dic setValue:arr1 forKey:@"B"];
            }
            
            if ([s isEqualToString:@"C"]) {
                [arr2 addObject:chineseString.string];
            }
            if ([arr2 count]==0) {
                [dic removeObjectForKey:@"C"];
            }
            else
            {
                [dic setValue:arr2 forKey:@"C"];
            }
            
            if ([s isEqualToString:@"D"]) {
                [arr3 addObject:chineseString.string];
            }
            if ([arr3 count]==0) {
                [dic removeObjectForKey:@"D"];
            }
            else
            {
                [dic setValue:arr3 forKey:@"D"];
            }
            
            if ([s isEqualToString:@"E"]) {
                [arr4 addObject:chineseString.string];
            }
            if ([arr4 count]==0) {
                [dic removeObjectForKey:@"E"];
            }
            else
            {
                [dic setValue:arr4 forKey:@"E"];
            }
            
            if ([s isEqualToString:@"F"]) {
                [arr5 addObject:chineseString.string];
            }
            if ([arr5 count]==0) {
                [dic removeObjectForKey:@"F"];
            }
            else
            {
                [dic setValue:arr5 forKey:@"F"];
            }
            
            if ([s isEqualToString:@"G"]) {
                [arr6 addObject:chineseString.string];
            }
            if ([arr6 count]==0) {
                [dic removeObjectForKey:@"G"];
            }
            else
            {
                [dic setValue:arr6 forKey:@"G"];
            }
            
            if ([s isEqualToString:@"H"]) {
                [arr7 addObject:chineseString.string];
            }
            if ([arr7 count]==0) {
                [dic removeObjectForKey:@"H"];
            }
            else
            {
                [dic setValue:arr7 forKey:@"H"];
            }
            
            if ([s isEqualToString:@"I"]) {
                [arr8 addObject:chineseString.string];
            }
            if ([arr8 count]==0) {
                [dic removeObjectForKey:@"I"];
            }
            else
            {
                [dic setValue:arr8 forKey:@"I"];
            }
            
            if ([s isEqualToString:@"J"]) {
                [arr9 addObject:chineseString.string];
            }
            if ([arr9 count]==0) {
                [dic removeObjectForKey:@"J"];
            }
            else
            {
                [dic setValue:arr9 forKey:@"J"];
            }
            
            if ([s isEqualToString:@"K"]) {
                [arr10 addObject:chineseString.string];
            }
            if ([arr10 count]==0) {
                [dic removeObjectForKey:@"K"];
            }
            else
            {
                [dic setValue:arr10 forKey:@"K"];
            }
            
            if ([s isEqualToString:@"L"]) {
                [arr11 addObject:chineseString.string];
            }
            if ([arr11 count]==0) {
                [dic removeObjectForKey:@"L"];
            }
            else
            {
                [dic setValue:arr11 forKey:@"L"];
            }
            
            if ([s isEqualToString:@"M"]) {
                [arr12 addObject:chineseString.string];
            }
            if ([arr12 count]==0) {
                [dic removeObjectForKey:@"M"];
            }
            else
            {
                [dic setValue:arr12 forKey:@"M"];
            }
            
            if ([s isEqualToString:@"N"]) {
                [arr13 addObject:chineseString.string];
            }
            if ([arr13 count]==0) {
                [dic removeObjectForKey:@"N"];
            }
            else
            {
                [dic setValue:arr13 forKey:@"N"];
            }
            
            if ([s isEqualToString:@"O"]) {
                [arr14 addObject:chineseString.string];
            }
            if ([arr14 count]==0) {
                [dic removeObjectForKey:@"O"];
            }
            else
            {
                [dic setValue:arr14 forKey:@"O"];
            }
            
            if ([s isEqualToString:@"P"]) {
                [arr15 addObject:chineseString.string];
            }
            if ([arr15 count]==0) {
                [dic removeObjectForKey:@"P"];
            }
            else
            {
                [dic setValue:arr15 forKey:@"P"];
            }
            
            if ([s isEqualToString:@"Q"]) {
                [arr16 addObject:chineseString.string];
            }
            if ([arr16 count]==0) {
                [dic removeObjectForKey:@"Q"];
            }
            else
            {
                [dic setValue:arr16 forKey:@"Q"];
            }
            
            if ([s isEqualToString:@"R"]) {
                [arr17 addObject:chineseString.string];
            }
            if ([arr17 count]==0) {
                [dic removeObjectForKey:@"R"];
            }
            else
            {
                [dic setValue:arr17 forKey:@"R"];
            }
            
            if ([s isEqualToString:@"S"]) {
                [arr18 addObject:chineseString.string];
            }
            if ([arr18 count]==0) {
                [dic removeObjectForKey:@"S"];
            }
            else
            {
                [dic setValue:arr18 forKey:@"S"];
            }
            
            if ([s isEqualToString:@"T"]) {
                [arr19 addObject:chineseString.string];
            }
            if ([arr19 count]==0) {
                [dic removeObjectForKey:@"T"];
            }
            else
            {
                [dic setValue:arr19 forKey:@"T"];
            }
            
            if ([s isEqualToString:@"U"]) {
                [arr20 addObject:chineseString.string];
            }
            if ([arr20 count]==0) {
                [dic removeObjectForKey:@"U"];
            }
            else
            {
                [dic setValue:arr20 forKey:@"U"];
            }
            
            if ([s isEqualToString:@"V"]) {
                [arr21 addObject:chineseString.string];
            }
            if ([arr21 count]==0) {
                [dic removeObjectForKey:@"V"];
            }
            else
            {
                [dic setValue:arr21 forKey:@"V"];
            }
            
            if ([s isEqualToString:@"W"]) {
                [arr22 addObject:chineseString.string];
            }
            if ([arr22 count]==0) {
                [dic removeObjectForKey:@"W"];
            }
            else
            {
                [dic setValue:arr22 forKey:@"W"];
            }
            
            if ([s isEqualToString:@"X"]) {
                [arr23 addObject:chineseString.string];
            }
            if ([arr23 count]==0) {
                [dic removeObjectForKey:@"X"];
            }
            else
            {
                [dic setValue:arr23 forKey:@"X"];
            }
            
            if ([s isEqualToString:@"Y"]) {
                [arr24 addObject:chineseString.string];
            }
            if ([arr24 count]==0) {
                [dic removeObjectForKey:@"Y"];
            }
            else
            {
                [dic setValue:arr24 forKey:@"Y"];
            }
            if ([s isEqualToString:@"Z"]) {
                [arr25 addObject:chineseString.string];
            }
            if ([arr25 count]==0) {
                [dic removeObjectForKey:@"Z"];
            }
            else
            {
                [dic setValue:arr25 forKey:@"Z"];
            }
            
            
        }
        key=[[dic allKeys]sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"1");
        [self.tableView reloadData];
    }
    if (segmentedControl.selectedIndex==2) {
        arr=[[NSMutableArray alloc]init];
        arr1=[[NSMutableArray alloc]init];
        arr2=[[NSMutableArray alloc]init];
        arr3=[[NSMutableArray alloc]init];
        arr4=[[NSMutableArray alloc]init];
        arr5=[[NSMutableArray alloc]init];
        arr6=[[NSMutableArray alloc]init];
        arr7=[[NSMutableArray alloc]init];
        arr8=[[NSMutableArray alloc]init];
        arr9=[[NSMutableArray alloc]init];
        arr10=[[NSMutableArray alloc]init];
        arr11=[[NSMutableArray alloc]init];
        arr12=[[NSMutableArray alloc]init];
        arr13=[[NSMutableArray alloc]init];
        arr14=[[NSMutableArray alloc]init];
        arr15=[[NSMutableArray alloc]init];
        arr16=[[NSMutableArray alloc]init];
        arr17=[[NSMutableArray alloc]init];
        arr18=[[NSMutableArray alloc]init];
        arr19=[[NSMutableArray alloc]init];
        arr20=[[NSMutableArray alloc]init];
        arr21=[[NSMutableArray alloc]init];
        arr22=[[NSMutableArray alloc]init];
        arr23=[[NSMutableArray alloc]init];
        arr24=[[NSMutableArray alloc]init];
        arr25=[[NSMutableArray alloc]init];
        dic=[[NSMutableDictionary alloc]init];
        stringsToSort=[NSMutableArray arrayWithObjects:
                       @"推特",
                       @"乔布斯",
                       @"再见",
                       nil];
        NSMutableArray *chineseStringsArray=[NSMutableArray array];
        for(int i=0;i<[stringsToSort count];i++){
            ChineseString *chineseString=[[ChineseString alloc]init];
            
            chineseString.string=[NSString stringWithString:[stringsToSort objectAtIndex:i]];
            
            if(chineseString.string==nil){
                chineseString.string=@"";
            }
            
            if(![chineseString.string isEqualToString:@""]){
                NSString *pinYinResult=[NSString string];
                for(int j=0;j<chineseString.string.length;j++){
                    NSString *singlePinyinLetter=[[NSString stringWithFormat:@"%c",pinyinFirstLetter([chineseString.string characterAtIndex:j])]uppercaseString];
                    
                    pinYinResult=[pinYinResult stringByAppendingString:singlePinyinLetter];
                }
                chineseString.pinYin=pinYinResult;
            }else{
                chineseString.pinYin=@"";
            }
            [chineseStringsArray addObject:chineseString];
        }
        
        //Step3:按照拼音首字母对这些Strings进行排序
        NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
        [chineseStringsArray sortUsingDescriptors:sortDescriptors];
        
        //Step3输出
        NSLog(@"\n\n\n按照拼音首字母后的NSString数组");
        for(int i=0;i<[chineseStringsArray count];i++){
            //BOOL yy=YES;
            ChineseString *chineseString=[chineseStringsArray objectAtIndex:i];
            // NSLog(@"原String:%@----拼音首字母String:%@",chineseString.string,chineseString.pinYin);
            NSString *str=[NSString stringWithFormat:@"%@",chineseString.pinYin];
            NSString *s=[str substringToIndex:1];
            if ([s isEqualToString:@"A"]) {
                [arr addObject:chineseString.string];
            }
            if ([arr count]==0) {
                [dic removeObjectForKey:@"A"];
            }
            else
            {
                [dic setValue:arr forKey:@"A"];
            }
            
            if ([s isEqualToString:@"B"]) {
                [arr1 addObject:chineseString.string];
            }
            if ([arr1 count]==0) {
                [dic removeObjectForKey:@"B"];
            }
            else
            {
                [dic setValue:arr1 forKey:@"B"];
            }
            
            if ([s isEqualToString:@"C"]) {
                [arr2 addObject:chineseString.string];
            }
            if ([arr2 count]==0) {
                [dic removeObjectForKey:@"C"];
            }
            else
            {
                [dic setValue:arr2 forKey:@"C"];
            }
            
            if ([s isEqualToString:@"D"]) {
                [arr3 addObject:chineseString.string];
            }
            if ([arr3 count]==0) {
                [dic removeObjectForKey:@"D"];
            }
            else
            {
                [dic setValue:arr3 forKey:@"D"];
            }
            
            if ([s isEqualToString:@"E"]) {
                [arr4 addObject:chineseString.string];
            }
            if ([arr4 count]==0) {
                [dic removeObjectForKey:@"E"];
            }
            else
            {
                [dic setValue:arr4 forKey:@"E"];
            }
            
            if ([s isEqualToString:@"F"]) {
                [arr5 addObject:chineseString.string];
            }
            if ([arr5 count]==0) {
                [dic removeObjectForKey:@"F"];
            }
            else
            {
                [dic setValue:arr5 forKey:@"F"];
            }
            
            if ([s isEqualToString:@"G"]) {
                [arr6 addObject:chineseString.string];
            }
            if ([arr6 count]==0) {
                [dic removeObjectForKey:@"G"];
            }
            else
            {
                [dic setValue:arr6 forKey:@"G"];
            }
            
            if ([s isEqualToString:@"H"]) {
                [arr7 addObject:chineseString.string];
            }
            if ([arr7 count]==0) {
                [dic removeObjectForKey:@"H"];
            }
            else
            {
                [dic setValue:arr7 forKey:@"H"];
            }
            
            if ([s isEqualToString:@"I"]) {
                [arr8 addObject:chineseString.string];
            }
            if ([arr8 count]==0) {
                [dic removeObjectForKey:@"I"];
            }
            else
            {
                [dic setValue:arr8 forKey:@"I"];
            }
            
            if ([s isEqualToString:@"J"]) {
                [arr9 addObject:chineseString.string];
            }
            if ([arr9 count]==0) {
                [dic removeObjectForKey:@"J"];
            }
            else
            {
                [dic setValue:arr9 forKey:@"J"];
            }
            
            if ([s isEqualToString:@"K"]) {
                [arr10 addObject:chineseString.string];
            }
            if ([arr10 count]==0) {
                [dic removeObjectForKey:@"K"];
            }
            else
            {
                [dic setValue:arr10 forKey:@"K"];
            }
            
            if ([s isEqualToString:@"L"]) {
                [arr11 addObject:chineseString.string];
            }
            if ([arr11 count]==0) {
                [dic removeObjectForKey:@"L"];
            }
            else
            {
                [dic setValue:arr11 forKey:@"L"];
            }
            
            if ([s isEqualToString:@"M"]) {
                [arr12 addObject:chineseString.string];
            }
            if ([arr12 count]==0) {
                [dic removeObjectForKey:@"M"];
            }
            else
            {
                [dic setValue:arr12 forKey:@"M"];
            }
            
            if ([s isEqualToString:@"N"]) {
                [arr13 addObject:chineseString.string];
            }
            if ([arr13 count]==0) {
                [dic removeObjectForKey:@"N"];
            }
            else
            {
                [dic setValue:arr13 forKey:@"N"];
            }
            
            if ([s isEqualToString:@"O"]) {
                [arr14 addObject:chineseString.string];
            }
            if ([arr14 count]==0) {
                [dic removeObjectForKey:@"O"];
            }
            else
            {
                [dic setValue:arr14 forKey:@"O"];
            }
            
            if ([s isEqualToString:@"P"]) {
                [arr15 addObject:chineseString.string];
            }
            if ([arr15 count]==0) {
                [dic removeObjectForKey:@"P"];
            }
            else
            {
                [dic setValue:arr15 forKey:@"P"];
            }
            
            if ([s isEqualToString:@"Q"]) {
                [arr16 addObject:chineseString.string];
            }
            if ([arr16 count]==0) {
                [dic removeObjectForKey:@"Q"];
            }
            else
            {
                [dic setValue:arr16 forKey:@"Q"];
            }
            
            if ([s isEqualToString:@"R"]) {
                [arr17 addObject:chineseString.string];
            }
            if ([arr17 count]==0) {
                [dic removeObjectForKey:@"R"];
            }
            else
            {
                [dic setValue:arr17 forKey:@"R"];
            }
            
            if ([s isEqualToString:@"S"]) {
                [arr18 addObject:chineseString.string];
            }
            if ([arr18 count]==0) {
                [dic removeObjectForKey:@"S"];
            }
            else
            {
                [dic setValue:arr18 forKey:@"S"];
            }
            
            if ([s isEqualToString:@"T"]) {
                [arr19 addObject:chineseString.string];
            }
            if ([arr19 count]==0) {
                [dic removeObjectForKey:@"T"];
            }
            else
            {
                [dic setValue:arr19 forKey:@"T"];
            }
            
            if ([s isEqualToString:@"U"]) {
                [arr20 addObject:chineseString.string];
            }
            if ([arr20 count]==0) {
                [dic removeObjectForKey:@"U"];
            }
            else
            {
                [dic setValue:arr20 forKey:@"U"];
            }
            
            if ([s isEqualToString:@"V"]) {
                [arr21 addObject:chineseString.string];
            }
            if ([arr21 count]==0) {
                [dic removeObjectForKey:@"V"];
            }
            else
            {
                [dic setValue:arr21 forKey:@"V"];
            }
            
            if ([s isEqualToString:@"W"]) {
                [arr22 addObject:chineseString.string];
            }
            if ([arr22 count]==0) {
                [dic removeObjectForKey:@"W"];
            }
            else
            {
                [dic setValue:arr22 forKey:@"W"];
            }
            
            if ([s isEqualToString:@"X"]) {
                [arr23 addObject:chineseString.string];
            }
            if ([arr23 count]==0) {
                [dic removeObjectForKey:@"X"];
            }
            else
            {
                [dic setValue:arr23 forKey:@"X"];
            }
            
            if ([s isEqualToString:@"Y"]) {
                [arr24 addObject:chineseString.string];
            }
            if ([arr24 count]==0) {
                [dic removeObjectForKey:@"Y"];
            }
            else
            {
                [dic setValue:arr24 forKey:@"Y"];
            }
            if ([s isEqualToString:@"Z"]) {
                [arr25 addObject:chineseString.string];
            }
            if ([arr25 count]==0) {
                [dic removeObjectForKey:@"Z"];
            }
            else
            {
                [dic setValue:arr25 forKey:@"Z"];
            }
            
            
        }
        
        key=[[dic allKeys]sortedArrayUsingSelector:@selector(compare:)];
        [self.tableView reloadData];
    }
    
}
- (void)viewDidLoad
{

    recipes=[[NSMutableArray alloc]init];
    //self.navigationController.navigationBar.translucent = NO;
    arr=[[NSMutableArray alloc]init];
    arr1=[[NSMutableArray alloc]init];
    arr2=[[NSMutableArray alloc]init];
    arr3=[[NSMutableArray alloc]init];
    arr4=[[NSMutableArray alloc]init];
    arr5=[[NSMutableArray alloc]init];
    arr6=[[NSMutableArray alloc]init];
    arr7=[[NSMutableArray alloc]init];
    arr8=[[NSMutableArray alloc]init];
    arr9=[[NSMutableArray alloc]init];
    arr10=[[NSMutableArray alloc]init];
    arr11=[[NSMutableArray alloc]init];
    arr12=[[NSMutableArray alloc]init];
    arr13=[[NSMutableArray alloc]init];
    arr14=[[NSMutableArray alloc]init];
    arr15=[[NSMutableArray alloc]init];
    arr16=[[NSMutableArray alloc]init];
    arr17=[[NSMutableArray alloc]init];
    arr18=[[NSMutableArray alloc]init];
    arr19=[[NSMutableArray alloc]init];
    arr20=[[NSMutableArray alloc]init];
    arr21=[[NSMutableArray alloc]init];
    arr22=[[NSMutableArray alloc]init];
    arr23=[[NSMutableArray alloc]init];
    arr24=[[NSMutableArray alloc]init];
    arr25=[[NSMutableArray alloc]init];
    dic=[[NSMutableDictionary alloc]init];
    stringsToSort=[NSMutableArray arrayWithObjects:
                   @"阿初",
                   @"电脑",
                   @"电话",
                   @"电视",
                   @"推特",
                   @"乔布斯",
                   @"再见",
                   @"暑假作业",
                   @"键盘",
                   @"鼠标",
                   @"谷歌",
                   @"阿三",
                   nil];
    NSMutableArray *chineseStringsArray=[NSMutableArray array];
    for(int i=0;i<[stringsToSort count];i++){
        ChineseString *chineseString=[[ChineseString alloc]init];
        
        chineseString.string=[NSString stringWithString:[stringsToSort objectAtIndex:i]];
        
        if(chineseString.string==nil){
            chineseString.string=@"";
        }
        
        if(![chineseString.string isEqualToString:@""]){
            NSString *pinYinResult=[NSString string];
            for(int j=0;j<chineseString.string.length;j++){
                NSString *singlePinyinLetter=[[NSString stringWithFormat:@"%c",pinyinFirstLetter([chineseString.string characterAtIndex:j])]uppercaseString];
                
                pinYinResult=[pinYinResult stringByAppendingString:singlePinyinLetter];
            }
            chineseString.pinYin=pinYinResult;
        }else{
            chineseString.pinYin=@"";
        }
        [chineseStringsArray addObject:chineseString];
    }
    
    //Step3:按照拼音首字母对这些Strings进行排序
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
    [chineseStringsArray sortUsingDescriptors:sortDescriptors];
    
    //Step3输出
    NSLog(@"\n\n\n按照拼音首字母后的NSString数组");
    for(int i=0;i<[chineseStringsArray count];i++){
        //BOOL yy=YES;
        ChineseString *chineseString=[chineseStringsArray objectAtIndex:i];
        // NSLog(@"原String:%@----拼音首字母String:%@",chineseString.string,chineseString.pinYin);
        NSString *str=[NSString stringWithFormat:@"%@",chineseString.pinYin];
        NSString *s=[str substringToIndex:1];
        if ([s isEqualToString:@"A"]) {
            [arr addObject:chineseString.string];
        }
        if ([arr count]==0) {
            [dic removeObjectForKey:@"A"];
        }
        else
        {
            [dic setValue:arr forKey:@"A"];
        }
        
        if ([s isEqualToString:@"B"]) {
            [arr1 addObject:chineseString.string];
        }
        if ([arr1 count]==0) {
            [dic removeObjectForKey:@"B"];
        }
        else
        {
            [dic setValue:arr1 forKey:@"B"];
        }
        
        if ([s isEqualToString:@"C"]) {
            [arr2 addObject:chineseString.string];
        }
        if ([arr2 count]==0) {
            [dic removeObjectForKey:@"C"];
        }
        else
        {
            [dic setValue:arr2 forKey:@"C"];
        }
        
        if ([s isEqualToString:@"D"]) {
            [arr3 addObject:chineseString.string];
        }
        if ([arr3 count]==0) {
            [dic removeObjectForKey:@"D"];
        }
        else
        {
            [dic setValue:arr3 forKey:@"D"];
        }
        
        if ([s isEqualToString:@"E"]) {
            [arr4 addObject:chineseString.string];
        }
        if ([arr4 count]==0) {
            [dic removeObjectForKey:@"E"];
        }
        else
        {
            [dic setValue:arr4 forKey:@"E"];
        }
        
        if ([s isEqualToString:@"F"]) {
            [arr5 addObject:chineseString.string];
        }
        if ([arr5 count]==0) {
            [dic removeObjectForKey:@"F"];
        }
        else
        {
            [dic setValue:arr5 forKey:@"F"];
        }
        
        if ([s isEqualToString:@"G"]) {
            [arr6 addObject:chineseString.string];
        }
        if ([arr6 count]==0) {
            [dic removeObjectForKey:@"G"];
        }
        else
        {
            [dic setValue:arr6 forKey:@"G"];
        }
        
        if ([s isEqualToString:@"H"]) {
            [arr7 addObject:chineseString.string];
        }
        if ([arr7 count]==0) {
            [dic removeObjectForKey:@"H"];
        }
        else
        {
            [dic setValue:arr7 forKey:@"H"];
        }
        
        if ([s isEqualToString:@"I"]) {
            [arr8 addObject:chineseString.string];
        }
        if ([arr8 count]==0) {
            [dic removeObjectForKey:@"I"];
        }
        else
        {
            [dic setValue:arr8 forKey:@"I"];
        }
        
        if ([s isEqualToString:@"J"]) {
            [arr9 addObject:chineseString.string];
        }
        if ([arr9 count]==0) {
            [dic removeObjectForKey:@"J"];
        }
        else
        {
            [dic setValue:arr9 forKey:@"J"];
        }
        
        if ([s isEqualToString:@"K"]) {
            [arr10 addObject:chineseString.string];
        }
        if ([arr10 count]==0) {
            [dic removeObjectForKey:@"K"];
        }
        else
        {
            [dic setValue:arr10 forKey:@"K"];
        }
        
        if ([s isEqualToString:@"L"]) {
            [arr11 addObject:chineseString.string];
        }
        if ([arr11 count]==0) {
            [dic removeObjectForKey:@"L"];
        }
        else
        {
            [dic setValue:arr11 forKey:@"L"];
        }
        
        if ([s isEqualToString:@"M"]) {
            [arr12 addObject:chineseString.string];
        }
        if ([arr12 count]==0) {
            [dic removeObjectForKey:@"M"];
        }
        else
        {
            [dic setValue:arr12 forKey:@"M"];
        }
        
        if ([s isEqualToString:@"N"]) {
            [arr13 addObject:chineseString.string];
        }
        if ([arr13 count]==0) {
            [dic removeObjectForKey:@"N"];
        }
        else
        {
            [dic setValue:arr13 forKey:@"N"];
        }
        
        if ([s isEqualToString:@"O"]) {
            [arr14 addObject:chineseString.string];
        }
        if ([arr14 count]==0) {
            [dic removeObjectForKey:@"O"];
        }
        else
        {
            [dic setValue:arr14 forKey:@"O"];
        }
        
        if ([s isEqualToString:@"P"]) {
            [arr15 addObject:chineseString.string];
        }
        if ([arr15 count]==0) {
            [dic removeObjectForKey:@"P"];
        }
        else
        {
            [dic setValue:arr15 forKey:@"P"];
        }
        
        if ([s isEqualToString:@"Q"]) {
            [arr16 addObject:chineseString.string];
        }
        if ([arr16 count]==0) {
            [dic removeObjectForKey:@"Q"];
        }
        else
        {
            [dic setValue:arr16 forKey:@"Q"];
        }
        
        if ([s isEqualToString:@"R"]) {
            [arr17 addObject:chineseString.string];
        }
        if ([arr17 count]==0) {
            [dic removeObjectForKey:@"R"];
        }
        else
        {
            [dic setValue:arr17 forKey:@"R"];
        }
        
        if ([s isEqualToString:@"S"]) {
            [arr18 addObject:chineseString.string];
        }
        if ([arr18 count]==0) {
            [dic removeObjectForKey:@"S"];
        }
        else
        {
            [dic setValue:arr18 forKey:@"S"];
        }
        
        if ([s isEqualToString:@"T"]) {
            [arr19 addObject:chineseString.string];
        }
        if ([arr19 count]==0) {
            [dic removeObjectForKey:@"T"];
        }
        else
        {
            [dic setValue:arr19 forKey:@"T"];
        }
        
        if ([s isEqualToString:@"U"]) {
            [arr20 addObject:chineseString.string];
        }
        if ([arr20 count]==0) {
            [dic removeObjectForKey:@"U"];
        }
        else
        {
            [dic setValue:arr20 forKey:@"U"];
        }
        
        if ([s isEqualToString:@"V"]) {
            [arr21 addObject:chineseString.string];
        }
        if ([arr21 count]==0) {
            [dic removeObjectForKey:@"V"];
        }
        else
        {
            [dic setValue:arr21 forKey:@"V"];
        }
        
        if ([s isEqualToString:@"W"]) {
            [arr22 addObject:chineseString.string];
        }
        if ([arr22 count]==0) {
            [dic removeObjectForKey:@"W"];
        }
        else
        {
            [dic setValue:arr22 forKey:@"W"];
        }
        
        if ([s isEqualToString:@"X"]) {
            [arr23 addObject:chineseString.string];
        }
        if ([arr23 count]==0) {
            [dic removeObjectForKey:@"X"];
        }
        else
        {
            [dic setValue:arr23 forKey:@"X"];
        }
        
        if ([s isEqualToString:@"Y"]) {
            [arr24 addObject:chineseString.string];
        }
        if ([arr24 count]==0) {
            [dic removeObjectForKey:@"Y"];
        }
        else
        {
            [dic setValue:arr24 forKey:@"Y"];
        }
        if ([s isEqualToString:@"Z"]) {
            [arr25 addObject:chineseString.string];
        }
        if ([arr25 count]==0) {
            [dic removeObjectForKey:@"Z"];
        }
        else
        {
            [dic setValue:arr25 forKey:@"Z"];
        }
        
        
    }
    
    key=[[dic allKeys]sortedArrayUsingSelector:@selector(compare:)];
    for (int x=0; x<[key count]; x++) {
        
        NSString *str1=[key objectAtIndex:x];
        NSArray *a=[dic objectForKey:str1];
        if ([a count]==0) {
            [recipes addObject:[dic objectForKey:str1]];
        }
        else
        {
            for (int x=0; x<[a count]; x++) {
                NSString *s=[a objectAtIndex:x];
                [recipes addObject:s];
            }
        }
        
    }
    NSLog(@"%@",recipes);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - UITableView Datasoucre
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    }
    else
    {
        NSString *str1=[key objectAtIndex:section];
        NSArray *aa=[dic objectForKey:str1];
        return [aa count];
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sec=[indexPath section];
    NSUInteger row=[indexPath row];
    NSString *key1=[key objectAtIndex:sec];
    NSArray *name=[dic objectForKey:key1];
    static NSString *identifier = @"LinkmanCell";
    LinkmanCell *cell =(LinkmanCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell =[[[NSBundle mainBundle]loadNibNamed:@"LinkmanCell" owner:nil options:nil]lastObject];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else
    {
        cell.textLabel.text = [name objectAtIndex:row];
    }
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
    return 1;
    }
    else
    {
    return [key count];
    }
}
#pragma mark - UITableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 22;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    }
    else
    {
        NSString *kk=[key objectAtIndex:section];
        return kk;
    }
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return key;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
