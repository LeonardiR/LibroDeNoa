//
//  ViewController.m
//  LibroDeNoa
//
//  Created by IVAN MOLERA on 26/11/14.
//  Copyright (c) 2014 UAB. All rights reserved.
//

#import "ViewController.h"
#import "SoundManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[SoundManager sharedManager] playMusic:@"BG04.07_hort.mp3"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCallback:)
                                                 name:nil
                                               object:nil];
    
    
    
    [self configTietNormal];
    [_tiet_cos startAnimating];
    [_capImage setHidden:true];
    
    [_storyLabel setFont:[UIFont systemFontOfSize:35]];
}

- (void) configTietNormal {
    
    troncClicked = NO;
    
    UIImage *tiet1 = [UIImage imageNamed:@"01_tiet_copet_destral1.png"];
    UIImage *tiet2 = [UIImage imageNamed:@"01_tiet_estatic.png"];
    
    NSArray *images = [[NSArray alloc] initWithObjects:tiet1, tiet2, nil];
    
    [_tiet_cos setAnimationImages:images];
    [_tiet_cos setAnimationRepeatCount:0];
    [_tiet_cos setAnimationDuration:2.0f];
}

- (void) configTietTronc {
    
    troncClicked = YES;

    UIImage *tiet1 = [UIImage imageNamed:@"01_tiet_Partint_tronc1.png"];
    UIImage *tiet2 = [UIImage imageNamed:@"01_tiet_Partint_tronc2.png"];
    UIImage *tiet3 = [UIImage imageNamed:@"01_tiet_Partint_tronc3.png"];
    
    NSArray *images = [[NSArray alloc] initWithObjects:tiet1, tiet2, tiet3, nil];
    
    [_tiet_cos setAnimationImages:images];
    [_tiet_cos setAnimationRepeatCount:1];
    [_tiet_cos setAnimationDuration:1.5f];
}

- (IBAction)clickTronc:(id)sender {

    if(!troncClicked) {
        [_tiet_cos stopAnimating];
    
        [self configTietTronc];
    
        [_tiet_cos startAnimating];
    
        [[SoundManager sharedManager] prepareToPlayWithSound:@"copfusta_tiet2.mp3"];
        [[SoundManager sharedManager] playSound:@"copfusta_tiet2.mp3"];
    }
}

- (void) notificationCallback:(NSNotification *)notification {
    
    if([[notification name] isEqualToString:SoundDidFinishPlayingNotification]) {
        Sound *sonido = (Sound*) [notification object];
        
        if([sonido.name isEqualToString:@"copfusta_tiet2.mp3"]) {
            [self configTietNormal];
            [_tiet_cos startAnimating];
        }
    }
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
