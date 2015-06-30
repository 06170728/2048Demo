//
//  VCRoot.h
//  test
//
//  Created by qianfeng on 14-8-18.
//  Copyright (c) 2014年 Qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCRoot : UIViewController <UIAlertViewDelegate>
{

    UIView* _mainView;
    UILabel* _scoreLabel;
    UILabel* _highScoreLabel;
    UITextField* _sava_arr[4][4];
}

@end
