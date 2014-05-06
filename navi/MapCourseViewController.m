//
//  MapCourseViewController.m
//  navi
//
//  Created by katoy on 2014/05/05.
//  Copyright (c) 2014年 Youichi Kato. All rights reserved.
//

#import "MapCourseViewController.h"

@interface MapCourseViewController ()
{
    // 元のTintColor
    UIColor *defaltColor;
}

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property (weak, nonatomic) IBOutlet UIToolbar *myToolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *trakingButton;
- (IBAction)tapTrakingButton:(id)sender;
- (IBAction)tapMapTypeSeg:(UISegmentedControl *)sender;
- (IBAction)tapSpotButton:(id)sender;

@end

@implementation MapCourseViewController

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

    // _myMapViewのデリゲートになる
    _myMapView.delegate = self;
    // 現在地を表示する
    _myMapView.showsUserLocation = YES;
    // 元のTintColorを控えておく
    defaltColor = self.view.window.tintColor;
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

// トラッキングボタンがタップされたので現在のトラッキングモードから次のモードに移行する
- (IBAction)tapTrakingButton:(id)sender {
    // 現在のトラッキングモードで振り分ける
    switch (_myMapView.userTrackingMode) {
        case MKUserTrackingModeNone:
            // None から Follow へ
            [_myMapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
            _trakingButton.image = [UIImage imageNamed:@"trackingFollow.png"];
            break;
        case MKUserTrackingModeFollow:
            // Follow から Heading へ
            [_myMapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
            _trakingButton.image = [UIImage imageNamed:@"trackingHeading.png"];
            break;
        case MKUserTrackingModeFollowWithHeading:
            // Heading から None へ
            [_myMapView setUserTrackingMode:MKUserTrackingModeNone animated:YES];
            _trakingButton.image = [UIImage imageNamed:@"trackingNone.png"];
            break;
        default:
            break;
    }
}

// トラッキングモードが解除された
- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animate\
d
{
    // トラッキングボタンを None に戻す
    _trakingButton.image = [UIImage imageNamed:@"trackingNone.png"];
}

// セグメントボタンがタップされたのでマップタイプを変更す
- (IBAction)tapMapTypeSeg:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            // 標準タイプに切り替える
            _myMapView.mapType = MKMapTypeStandard;
            // ツールバーのアルファを1に戻す
            _myToolbar.alpha = 1.0;
            // windowのtintColorを元に戻す
            self.view.window.tintColor = defaltColor;
            // ステータスバーの文字色を標準に戻す
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
            break;
        case 1:
            // サテライトタイプに切り替える
            _myMapView.mapType = MKMapTypeSatellite;
            // ツールバーが透けるようにする
            _myToolbar.alpha = 0.8;
            // window の tintColor を白にする
            self.view.window.tintColor = [UIColor whiteColor];
            // ステータスバーの文字色を白にする
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            break;
        case 2:
            // ハイブリッドタイプに切り替える
            _myMapView.mapType = MKMapTypeHybrid;
            // ツールバーが透けるようにする
            _myToolbar.alpha = 0.8;
            // window の tintColor を白にする
            self.view.window.tintColor = [UIColor whiteColor];
            // ステータスバーの文字色を白にする
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            break;
        default:
            break;
    }
}

- (IBAction)tapSpotButton:(id)sender {
    // 東京駅
    //  http://www.geocoding.jp/?q=%E6%9D%B1%E4%BA%AC%E9%A7%85
    CLLocationDegrees latitude = 35.681382;   // 緯度
    CLLocationDegrees longitude = 139.766084; // 経度
    // 緯度、経度から表示位置を求める
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    // 表示領域（中央、縦メートル、横メートル）
    MKCoordinateRegion theSpot = MKCoordinateRegionMakeWithDistance(center,500,500);
    // 指定の位置を表示する
    [_myMapView setRegion:theSpot animated:YES]; // YESのときアニメーションで指定座標に移動する
}
@end
