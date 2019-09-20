//
//  SpringViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/2.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "SpringViewController.h"
#import "CusLayerView.h"

@interface SpringViewController ()

@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    CusLayerView *cus = [[CusLayerView alloc]initWithFrame:self.view.bounds];
    cus.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:cus];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
