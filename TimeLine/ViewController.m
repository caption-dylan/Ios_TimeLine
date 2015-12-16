//
//  ViewController.m
//  TimeLine
//
//  Created by denglin zhi on 15/12/16.
//  Copyright © 2015年 azhi. All rights reserved.
//

#import "ViewController.h"
#import "TimeCourseTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    maData1 = [[NSMutableArray alloc] initWithObjects:@"10-25",@"10-26",@"10-27", nil];
    maData2 = [[NSMutableArray alloc] initWithObjects:
               [NSMutableArray arrayWithObjects:@"25日11数11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111115",@"25日数据2",@"25日数据3", nil],
               [NSMutableArray arrayWithObjects:@"26日数据1",@"26日数据2",@"26日数据3",@"26日数据4", nil],
               [NSMutableArray arrayWithObjects:@"27日数据1",@"27日数据2",@"27日数据3",@"27日数据4",@"27日数据5", nil],
               nil];
    tableView1.dataSource = self;
    tableView1.delegate = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return maData1.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *strSimpleIdentify = @"TimeCell";
    TimeCourseTableViewCell *cell = (TimeCourseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:strSimpleIdentify];
    cell = [[[NSBundle mainBundle] loadNibNamed:@"TimeCourseTableViewCell" owner:self options:nil] objectAtIndex:0];
    
    cell.lblTime.text = [maData1 objectAtIndex:indexPath.row];
    NSMutableArray *item = [maData2 objectAtIndex:indexPath.row];
    
    UIView *itemView = cell.vContent;
    int lbl_jinaGe = 10;
    int y = 0;
    for (int i=0; i<item.count; i++) {
        y = i == 0 ? 0 : (y + lbl_jinaGe);
        
        NSString *str = [item objectAtIndex:i];
        
        //CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:CGSizeMake(itemView.bounds.size.width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
        
        
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.alignment = NSLineBreakByWordWrapping;
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18], NSParagraphStyleAttributeName: paragraph};
        CGSize size = [str boundingRectWithSize:CGSizeMake(itemView.bounds.size.width, CGFLOAT_MAX) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;

        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, y, itemView.bounds.size.width, size.height)];
        lbl.text = str;
        lbl.textColor = [UIColor redColor];
        lbl.font = [UIFont systemFontOfSize:18];

        lbl.numberOfLines = 0;
        lbl.lineBreakMode = NSLineBreakByWordWrapping;
        lbl.backgroundColor = [UIColor clearColor];
        
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [itemView addSubview:lbl];
        
        y += lbl.frame.size.height;
    }

    y += lbl_jinaGe;
    
    CGRect cellFrame = [cell frame];
    cellFrame.size.height = y+cell.lblTime.frame.origin.y+cell.lblTime.frame.size.height;

    [cell setFrame:cellFrame];
    
    UILabel *lblSmag = cell.lblSegment;
    [lblSmag setFrame:CGRectMake(39, 0, 3, cellFrame.size.height)];
    
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    cell.backgroundView = nil;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
