//
//  CalendarCourseViewController.m
//  navi
//
//  Created by katoy on 2014/05/05.
//  Copyright (c) 2014年 Youichi Kato. All rights reserved.
//

#import "CalendarCourseViewController.h"

@interface CalendarCourseViewController ()
  @property (nonatomic, strong) NSMutableDictionary *data;
@end

@implementation CalendarCourseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1. CKCalendarViewオブジェクトの作成
    CKCalendarView *calendar = [CKCalendarView new];
    
    // 2. datasourceとdelegateの設定
    [calendar setDelegate:self];
    [calendar setDataSource:self];
    
    // 3. カレントビューの中で表示する
    [[self view] addSubview:calendar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - CKCalendarViewDataSource

- (NSArray *)calendarView:(CKCalendarView *)calendarView eventsForDate:(NSDate *)date
{
    return [self data][date];
}

#pragma mark - CKCalendarViewDelegate

// Called before/after the selected date changes
- (void)calendarView:(CKCalendarView *)CalendarView willSelectDate:(NSDate *)date
{
}

- (void)calendarView:(CKCalendarView *)CalendarView didSelectDate:(NSDate *)date
{
}

//  A row is selected in the events table. (Use to push a detail view or whatever.)
- (void)calendarView:(CKCalendarView *)CalendarView didSelectEvent:(CKCalendarEvent *)event
{
}

@end
