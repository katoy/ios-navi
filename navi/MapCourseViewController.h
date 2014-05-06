//
//  MapCourseViewController.h
//  navi
//
//  Created by katoy on 2014/05/05.
//  Copyright (c) 2014年 Youichi Kato. All rights reserved.
//

#import <UIKit/UIKit.h>


// MapKitフレームワークをインポートする
#import <MapKit/MapKit.h>
// CoreLocationフレームワークをインポートする
#import <CoreLocation/CoreLocation.h>

// MKMapViewDelegateプロトコルの採用を宣言する
@interface MapCourseViewController : UIViewController <MKMapViewDelegate>

@end
