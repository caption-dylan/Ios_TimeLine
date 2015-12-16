//
//  TimeCourseTableViewCell.h
//  TimeLine
//
//  Created by denglin zhi on 15/12/16.
//  Copyright © 2015年 azhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeCourseTableViewCell : UITableViewCell


@property (retain,nonatomic) IBOutlet UILabel *lblSegment;  //分割线
@property (retain,nonatomic) IBOutlet UIButton *btnIco;      //圆图标
@property (retain,nonatomic) IBOutlet UILabel *lblTime;     //头部时间
@property (retain,nonatomic) IBOutlet UIView *vContent;     //详细内容
@property (retain,nonatomic) IBOutlet UIView *vBigContent;  //最大的视图

@end
