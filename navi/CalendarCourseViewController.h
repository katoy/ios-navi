//
//  CalendarCourseViewController.h
//  navi
//
//  Created by katoy on 2014/05/05.
//  Copyright (c) 2014年 Youichi Kato. All rights reserved.
//

// See  http://www.iosjp.com/dev/archives/529
//       オープンソースライブラリ：MBCalendarKit　カレンダービュー

#import <UIKit/UIKit.h>
#import "CalendarKit/CalendarKit.h"

@interface CalendarCourseViewController : UIViewController <CKCalendarViewDelegate, CKCalendarViewDataSource>
@end
