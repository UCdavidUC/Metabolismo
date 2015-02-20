//
//  DetalleViewController.m
//  metabolismo3
//
//  Created by molina on 2/10/15.
//  Copyright (c) 2015 Tec de Monterrey. All rights reserved.
//

#import "DetalleViewController.h"

@interface DetalleViewController ()

@end

@implementation DetalleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)regresar:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}








@end
