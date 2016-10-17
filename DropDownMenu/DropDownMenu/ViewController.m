//
//  ViewController.m
//  DropDownMenu
//
//  Created by 高岩 on 2016/10/17.
//  Copyright © 2016年 高岩. All rights reserved.
//

#import "ViewController.h"
#import "LGYPopMenuView.h"
#import "UIView+Extension.h"
#import "PopViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *PopBut;
- (IBAction)but:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)but:(id)sender {
    
    _PopBut.selected = !_PopBut.selected;//状态取反
    
    
    PopViewController *Contr = [[PopViewController alloc]init];
    Contr.view.size =CGSizeMake(self.PopBut.width, 200);
    
    
    [LGYPopMenuView popFrom:_PopBut contentVC:Contr dismiss:^{
        //切换按钮状态
        _PopBut.selected = !_PopBut.selected;//状态取反
    }];

}
@end
