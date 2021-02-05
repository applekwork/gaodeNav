//
//  ViewController.m
//  Test
//
//  Created by KWOK on 2021/2/4.
//

#import "ViewController.h"
#import <AMapNaviKit/AMapNaviKit.h>
@interface ViewController () <AMapNaviCompositeManagerDelegate>
@property (nonatomic, strong) AMapNaviCompositeManager *compositeManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *routeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    routeBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 100) / 2, 100, 100, 45);
    [routeBtn setTitle:@"开始" forState:UIControlStateNormal];
    [routeBtn setTitleColor:[UIColor colorWithRed:53/255.0 green:117/255.0 blue:255/255.0 alpha:1] forState:UIControlStateNormal];
    routeBtn.layer.borderWidth = 1;
    routeBtn.layer.borderColor = [UIColor colorWithRed:53/255.0 green:117/255.0 blue:255/255.0 alpha:1].CGColor;
    routeBtn.layer.cornerRadius = 5;
    [routeBtn addTarget:self action:@selector(routePlanAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:routeBtn];
}
- (AMapNaviCompositeManager *)compositeManager {
    if (!_compositeManager) {
        _compositeManager = [[AMapNaviCompositeManager alloc] init];  // 初始化
        _compositeManager.delegate = self;  // 如果需要使用AMapNaviCompositeManagerDelegate的相关回调（如自定义语音、获取实时位置等），需要设置delegate
    }
    return _compositeManager;
}
- (void)routePlanAction {
    AMapNaviCompositeUserConfig *config = [[AMapNaviCompositeUserConfig alloc] init];
    [config setThemeType:AMapNaviCompositeThemeTypeDark];
    [self.compositeManager presentRoutePlanViewControllerWithOptions:config];  // 通过present的方式显示路线规划页面
}
@end
