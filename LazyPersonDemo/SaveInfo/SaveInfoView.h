//
//  SaveInfoView.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/28.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 1.无论哪种存取方式，都是通过写入文件和读取文件来实现的
 2.注意写入文件的路径，路径不合适也会导致存取的失败
 3.写入文件：writeToFile，读取写入的文件：dataWithContentsOfFile
 */

NS_ASSUME_NONNULL_BEGIN

@interface SaveInfoView : UIView

@end

NS_ASSUME_NONNULL_END
