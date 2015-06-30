//
//  VCRoot.m
//  2048Demo
//
//  Created by qianfeng on 14-8-18.
//  Copyright (c) 2014年 Qianfeng. All rights reserved.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    _mainView=[[UIView alloc]init];
    _mainView.frame=CGRectMake(0, 40, 320, 320);
    _mainView.userInteractionEnabled=YES;
    _mainView.backgroundColor=[UIColor whiteColor];
    
    
    UILabel* scoreLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 360, 80, 30)];
    scoreLabel.text=@"Score:";
    scoreLabel.font=[UIFont systemFontOfSize:15];
    scoreLabel.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    _scoreLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 390, 80, 30)];
    _scoreLabel.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    
    
    UILabel* scoreLabel1=[[UILabel alloc]initWithFrame:CGRectMake(180, 360, 100, 30)];
    scoreLabel1.text=@"High Score:";
    scoreLabel1.font=[UIFont systemFontOfSize:15];
    scoreLabel1.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    _highScoreLabel=[[UILabel alloc]initWithFrame:CGRectMake(180, 390, 100, 30)];
    _highScoreLabel.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    [_mainView addSubview:scoreLabel1];
    [_mainView addSubview:_highScoreLabel];
    [_mainView addSubview:scoreLabel];
    [_mainView addSubview:_scoreLabel];
    
    
    [self creatStartView];
    
    
    UISwipeGestureRecognizer* swipeLeft=[[UISwipeGestureRecognizer alloc]init];
    [_mainView addGestureRecognizer:swipeLeft];
    swipeLeft.direction=UISwipeGestureRecognizerDirectionLeft;
    [swipeLeft addTarget:self action:@selector(swipeLeftAct:)];
    
    
    UISwipeGestureRecognizer* swipeRight=[[UISwipeGestureRecognizer alloc]init];
    [_mainView addGestureRecognizer:swipeRight];
    swipeRight.direction=UISwipeGestureRecognizerDirectionRight;
    [swipeRight addTarget:self action:@selector(swipeRightAct:)];
    
    
    UISwipeGestureRecognizer* swipeUp=[[UISwipeGestureRecognizer alloc]init];
    [_mainView addGestureRecognizer:swipeUp];
    swipeUp.direction=UISwipeGestureRecognizerDirectionUp;
    [swipeUp addTarget:self action:@selector(swipeUpAct:)];
    
    
    UISwipeGestureRecognizer* swipeDown=[[UISwipeGestureRecognizer alloc]init];
    [_mainView addGestureRecognizer:swipeDown];
    swipeDown.direction=UISwipeGestureRecognizerDirectionDown;
    [swipeDown addTarget:self action:@selector(swipeDownAct:)];
    
    
    
    [self.view addSubview:_mainView];
    
    
    
    // Do any additional setup after loading the view.
}

int view_state[4][4];
//左
- (void)swipeLeftAct:(UISwipeGestureRecognizer*)swipeLeft
{
    for (int i=0; i<4; i++) {
        if (i%4==0) {
            for (int j=0; j<=3; j++) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j+1; o<=3; o++) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.x=(j%4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j--;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j+1; o<=3; o++) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        
        else if (i%4==1)
        {
            for (int j=4; j<=7; j++) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j+1; o<=7; o++) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.x=(j%4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            
                            
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j--;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j+1; o<=7; o++) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        else if (i%4==2)
        {
            for (int j=8; j<=11; j++) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j+1; o<=11; o++) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.x=(j%4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            
                            
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j--;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j+1; o<=11; o++) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        else if (i%4==3)
        {
            for (int j=12; j<=15; j++) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j+1; o<=15; o++) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.x=(j%4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            
                            
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j--;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j+1; o<=15; o++) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
    
    [self resultShow];
    [self randomNum];
    
    move_state=NO;
}



int move_state=YES;

//右
- (void)swipeRightAct:(UISwipeGestureRecognizer*)swipeRight
{
    for (int i=0; i<4; i++) {
        if (i%4==0) {
            for (int j=3; j>=0; j--) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j-1; o>=0; o--) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.x=(j%4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            
                            
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            
                            j++;
                            move_state=YES;
                            break;
                        }
                        
                    }
                }
                else
                {
                    for (int o=j-1; o>=0; o--) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        else if (i%4==1)
        {
            for (int j=7; j>=4; j--) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j-1; o>=4; o--) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.x=(j%4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            
                            
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j++;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j-1; o>=4; o--) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        else if (i%4==2)
        {
            for (int j=11; j>=8; j--) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j-1; o>=8; o--) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.x=(j%4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            
                            
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j++;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j-1; o>=8; o--) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        
        
        else if (i%4==3)
        {
            for (int j=15; j>=12; j--) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j-1; o>=12; o--) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.x=(j%4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j++;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j-1; o>=12; o--) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    [self resultShow];
    [self randomNum];
    move_state=NO;
}




//上
- (void)swipeUpAct:(UISwipeGestureRecognizer*)swipeUp
{
    for (int i=0; i<4; i++) {
        if (i%4==0) {
            for (int j=0; j<=12; j+=4) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j+4; o<=12; o+=4) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.y=(j/4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j-=4;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j+4; o<=12; o+=4) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        else if (i%4==1)
        {
            for (int j=1; j<=13; j+=4) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j+4; o<=13; o+=4) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.y=(j/4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            
                            
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j-=4;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j+4; o<=13; o+=4) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
                
            }
        }
        
        
        else if (i%4==2)
        {
            for (int j=2; j<=14; j+=4) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j+4; o<=14; o+=4) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.y=(j/4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            
                            
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j-=4;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j+4; o<=14; o+=4) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        else if (i%4==3)
        {
            for (int j=3; j<=15; j+=4) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j+4; o<=15; o+=4) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.y=(j/4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j-=4;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j+4; o<=15; o+=4) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    [self resultShow];
    [self randomNum];
    move_state=NO;
}


//下
- (void)swipeDownAct:(UISwipeGestureRecognizer*)swipeDown
{
    for (int i=0; i<4; i++) {
        if (i%4==0) {
            for (int j=12; j>=0; j-=4) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j-4; o>=0; o-=4) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.y=(j/4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j+=4;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j-4; o>=0; o-=4) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        
        
        if (i%4==1)
        {
            for (int j=13; j>=1; j-=4) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j-4; o>=1; o-=4) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.y=(j/4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            
                            j+=4;
                            move_state=YES;
                            break;
                        }
                    }
                }
                else
                {
                    for (int o=j-4; o>=1; o-=4) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag && o==j-4) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        if (i%4==2)
        {
            for (int j=14; j>=2; j-=4) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j-4; o>=2; o-=4) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.y=(j/4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j+=4;
                            break;
                        }
                    }
                }
                
                else
                {
                    for (int o=j-4; o>=2; o-=4) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag && o==j-4) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
        if (i%4==3)
        {
            for (int j=15; j>=3; j-=4) {
                if (view_state[j/4][j%4]==0) {
                    for (int o=j-4; o>=3; o-=4) {
                        if (view_state[o/4][o%4]==1) {
                            UITextField* view=_sava_arr[o/4][o%4];
                            
                            CGRect frame=view.frame;
                            view_state[o/4][o%4]=0;
                            
                            frame.origin.y=(j/4)*80;
                            view.frame=frame;
                            
                            _sava_arr[j/4][j%4]=view;
                            
                            
                            _sava_arr[o/4][o%4]=nil;
                            
                            view_state[j/4][j%4]=1;
                            move_state=YES;
                            j+=4;
                            break;
                        }
                    }
                }
                
                else
                {
                    for (int o=j-4; o>=3; o-=4) {
                        if (view_state[o/4][o%4]==1) {
                            if (_sava_arr[o/4][o%4].tag==_sava_arr[j/4][j%4].tag) {
                                [self changeFunc:o andJ:j];
                                break;
                            }
                            else if(view_state[o/4][o%4]==1){
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
    
    //随机生成区:
    [self resultShow];
    [self randomNum];
    move_state=NO;
}

int count_result;
- (void)resultShow
{
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            if (view_state[i][j]==1) {
                count_result++;
            }
            if ([_sava_arr[i][j].text isEqual:@"2048"]) {
                UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"成功通关!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
        }
    }
    
    
    if (count_result==16 && move_state==NO) {
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"Try Again!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            view_state[i][j]=0;
            start_count_2=0;
            [_sava_arr[i][j] removeFromSuperview];
            _sava_arr[i][j]=nil;
        }
    }
    
    count_result=0;
    move_state=YES;
    [self creatStartView];
    
}




int color_num;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


int start_count_2=0;
- (void)creatStartView
{
    while (1) {
        for (int i =0; i<4; i++) {
            for (int j=0; j<4; j++) {
                
                if (start_count_2<2) {
                    if (arc4random()%4==3) {
                        [self randomNum];
                        move_state=YES;
                        start_count_2++;
                    }
                }
            }
        }
        
        if (start_count_2==2) {
            break;
        }
    }
    NSString*str=[NSString stringWithContentsOfFile:[NSString stringWithFormat:@"%@/HighScore/score.plist",NSHomeDirectory()] usedEncoding:nil error:nil];
    _highScoreLabel.text=str;
}




- (void)randomNum
{
    if (move_state==YES) {
        for (int i=0; i<4; i++) {
            for (int j=0; j<4; j++) {
                if (view_state[i][j]==0) {
                    if (arc4random()%5==3) {
                        UITextField* _2_tx_start=[[UITextField alloc]init];
                        
                        _2_tx_start.backgroundColor=[UIColor lightGrayColor];
                        _2_tx_start.textAlignment=NSTextAlignmentCenter;
                        
                        _2_tx_start.borderStyle=UITextBorderStyleRoundedRect;
                        _2_tx_start.frame=CGRectMake(j*80+5, i*80+5, 70, 70);
                        [UIView animateWithDuration:0.5 animations:^{
                            _2_tx_start.frame=CGRectMake(j*80, i*80, 80, 80);
                        }];
                        _2_tx_start.text=@"2";
                        _2_tx_start.tag=2;
                        view_state[i][j]=1;
                        _2_tx_start.enabled=NO;
                        _sava_arr[i][j]=_2_tx_start;
                        move_state=NO;
                        [_mainView addSubview:_2_tx_start];
                        return;
                    }
                    
                    else if (arc4random()%30==8)
                    {
                        UITextField* _4_tx_start=[[UITextField alloc]init];
                        
                        _4_tx_start.backgroundColor=[UIColor lightGrayColor];
                        _4_tx_start.textAlignment=NSTextAlignmentCenter;
                        
                        _4_tx_start.borderStyle=UITextBorderStyleRoundedRect;
                        _4_tx_start.frame=CGRectMake(j*80+5, i*80+5, 70, 70);
                        [UIView animateWithDuration:0.5 animations:^{
                            _4_tx_start.frame=CGRectMake(j*80, i*80, 80, 80);
                        }];
                        _4_tx_start.text=@"4";
                        _4_tx_start.tag=4;
                        view_state[i][j]=1;
                        _4_tx_start.enabled=NO;
                        _sava_arr[i][j]=_4_tx_start;
                        move_state=NO;
                        [_mainView addSubview:_4_tx_start];
                        return;
                    }
                }
            }
        }
    }
}


int score;

- (void)changeFunc:(int)o andJ:(int)j
{
    UITextField* view=_sava_arr[j/4][j%4];
    int num=_sava_arr[o/4][o%4].tag*2;
    
    view_state[o/4][o%4]=0;
    
    view.text=[NSString stringWithFormat:@"%d",num];
    view.tag=num;
    score+=num*10;
    _scoreLabel.text=[NSString stringWithFormat:@"%d",score];
    
  
   
    if ([_scoreLabel.text intValue]>=[_highScoreLabel.text intValue]) {
        [self saveScore];
    }
    
    float a=num;
    
    view.backgroundColor=[UIColor colorWithRed:a/32 green:a/128 blue:a/512 alpha:0.4];
    
    _sava_arr[j/4][j%4]=view;
    
    [_sava_arr[o/4][o%4] removeFromSuperview];
    _sava_arr[o/4][o%4]=nil;
    view_state[j/4][j%4]=1;
    move_state=YES;
}



- (void)saveScore
{
    NSFileManager* fm=[NSFileManager defaultManager];
    
    [fm createDirectoryAtPath:[NSString stringWithFormat:@"%@/HighScore",NSHomeDirectory()] withIntermediateDirectories:YES attributes:nil error:nil];
    [fm createFileAtPath:[NSString stringWithFormat:@"%@/HighScore/score.plist",NSHomeDirectory()] contents:nil attributes:nil];
    NSString* strPath=[NSString stringWithFormat:@"%@/HighScore/score.plist",NSHomeDirectory()];
    
    NSString* str=[NSString stringWithContentsOfFile:strPath usedEncoding:nil error:nil];
    
    
    if ([_scoreLabel.text intValue]>=[str intValue]) {
        [_scoreLabel.text writeToFile:strPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        _highScoreLabel.text=_scoreLabel.text;
    }
//    NSLog(@"%@",NSHomeDirectory());
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
