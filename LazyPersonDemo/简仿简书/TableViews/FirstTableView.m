//
//  FirstTableView.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/8/28.
//  Copyright © 2019 火眼征信. All rights reserved.
//

#import "FirstTableView.h"

@interface FirstTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

static NSString *const REUSEABLECELLIDENTIFIER = @"REUSEABLECELLIDENTIFIER";

@implementation FirstTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollEnabled = NO;
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSEABLECELLIDENTIFIER];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:REUSEABLECELLIDENTIFIER];
    }
    cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"header" ofType:@"JPG"]];
    cell.textLabel.text = @"苹果橘子香蕉梨";
    cell.detailTextLabel.text = @"🍎🍊🍌🍐";
    return cell;
}

@end
