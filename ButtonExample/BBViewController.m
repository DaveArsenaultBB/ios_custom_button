//
//  BBViewController.m
//  ButtonExample
//
//  Created by Cary Yang on 8/26/14.
//  Copyright (c) 2014 Blackboard. All rights reserved.
//

#import "BBViewController.h"

@interface BBViewController ()

@property (nonatomic) UIButton *button;
@property (nonatomic) UISlider *slider;
@property (nonatomic) UISwitch *hasShadow;

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Control
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 220, 200, 20)];
    label.text = @"Corner Radius";
    [self.view addSubview:label];
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 260, 200, 20)];
    [self.slider addTarget:self action:@selector(changeRadius:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 200, 20)];
    label.text = @"Has Shadow";
    [self.view addSubview:label];
    
    self.hasShadow = [[UISwitch alloc] initWithFrame:CGRectMake(10, 340, 200, 20)];
    [self.hasShadow addTarget:self action:@selector(changeShadow:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.hasShadow];
    
    
    // Button
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(60, 100, 200, 100)];
    
    self.button.backgroundColor = [UIColor redColor];
    self.button.layer.shadowColor = [UIColor blackColor].CGColor;
    self.button.layer.shadowOffset = CGSizeMake(4, 2);
    [self setButtonShadow:YES changeSwitch:YES];
    [self setButtonRadius:20 changeSlider:YES];
    
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeRadius:(UISlider *)slider
{
    [self setButtonRadius:(slider.value * self.button.frame.size.height / 2) changeSlider:NO];
}

- (void)changeShadow:(UISwitch *)hasShadowSwitch
{
    [self setButtonShadow:hasShadowSwitch.on changeSwitch:NO];
}

- (void)setButtonRadius:(CGFloat)radius changeSlider:(BOOL)changeSlider
{
    self.button.layer.cornerRadius = radius;
    if (changeSlider) {
        self.slider.value = radius / self.button.frame.size.height * 2;
    }
}

- (void)setButtonShadow:(BOOL)showShadow changeSwitch:(BOOL)changeSwitch
{
    self.button.layer.shadowOpacity = showShadow ? 0.8 : 0;
    if (changeSwitch) {
        self.hasShadow.on = showShadow;
    }
}

@end
