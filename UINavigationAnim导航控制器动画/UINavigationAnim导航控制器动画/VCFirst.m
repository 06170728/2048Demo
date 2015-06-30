//
//  VCFirst.m
//  UINavigationAnim导航控制器动画
//
//  Created by qianfeng on 14-8-29.
//  Copyright (c) 2014年 Qianfeng. All rights reserved.
//

#import "VCFirst.h"
#import <QuartzCore/QuartzCore.h>
#import "VCSecond.h"

@interface VCFirst ()

@end

@implementation VCFirst

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
    // Do any additional setup after loading the view.
    
    UIImage* image=[UIImage imageNamed:@"17_2.jpg"];
    
    UIImageView* iView=[[UIImageView alloc]initWithImage:image];
    
    iView.frame=CGRectMake(0, 0, self.view.bounds.size.width
                           , self.view.bounds.size.height);
    
    [self.view addSubview:iView];
    
    UIBarButtonItem* btn=[[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(pressNext)];
    self.navigationItem.leftBarButtonItem=btn;
    
    
}


- (void)pressNext
{

    CATransition* animTrans=[CATransition animation];
    
    //设置动画风格
    //kCATransitionPush推入风格
    //kCATransitionFade逐渐消失
    //kCATransitionMoveIn移动进入风格
    //kCATransitionReveal普通风格
    animTrans.type=kCATransitionMoveIn;
    
//    animTrans.type=@"cube";
    
    //设置动画子风格
    //kCATransitionFromRight 从上方开始动画
    
    animTrans.subtype=kCATransitionFromTop;
    
//    animTrans.timingFunction=[CAMediaTimingFunction functionWithControlPoints:<#(float)#> :<#(float)#> :<#(float)#> :<#(float)#>]
    
    animTrans.duration=0.5;
    [self.navigationController.view.layer addAnimation:animTrans forKey:nil];
    
    VCSecond* vcsec=[[VCSecond alloc]init];
    
    vcsec.view.backgroundColor=[UIColor orangeColor];
    
//    vcsec.view.layer.frame=CGRectMake(0, 0, 200, 200);
    
    NSLog(@"%f,%f",vcsec.view.bounds.size.width,vcsec.view.bounds.size.height);

    
    [self.navigationController pushViewController:vcsec animated:YES];
    
    
    

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

@end
