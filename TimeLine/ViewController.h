//
//  ViewController.h
//  TimeLine
//
//  Created by denglin zhi on 15/12/16.
//  Copyright © 2015年 azhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *tableView1;
    NSMutableArray *maData1;
    NSMutableArray *maData2;
}


@end

