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
    [[SoundManager sharedManager]playSound:@"narrador01_fast_sp.mp3"];
    [[SoundManager sharedManager]playSound:@"narrador01_fast_ca.mp3"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCallback:)
                                                 name:nil
                                               object:nil];
    
    [self moveBici];
    [self moveHead];
    [self movePedals];
    [self configTietNormal];
    [_tiet_cos startAnimating];
    [_carlotaHead startAnimating];
    [_carlotaBici startAnimating];
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

- (void) moveBici {

    CGRect beginRect = CGRectMake(-1000.0f, 0.0f, 407.0f, 413.0f);
    CGRect endRect = CGRectMake(0.0f, 0.0f, 407.0f, 413.0f);
    
    [_carlotaBici setFrame:beginRect];
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0f];
    
    [_carlotaBici setFrame:endRect];
    
    [UIView commitAnimations];
    
    
}

- (void) moveHead {
    
    CGRect beginRect = CGRectMake(-1000.0f, 31.0f, 148.0f, 107.0f);
    CGRect endRect = CGRectMake(50.0f, 31.0f, 148.0f, 107.0f);
    
    [_carlotaHead setFrame:beginRect];
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0f];
    
    [_carlotaHead setFrame:endRect];
    
    [UIView commitAnimations];
    
}

- (void) movePedals{
    UIImage *bici2 = [UIImage imageNamed:@"01_Carlota_bici02.png"];
    UIImage *bici3 = [UIImage imageNamed:@"01_Carlota_bici03.png"];
    UIImage *bici4 = [UIImage imageNamed:@"01_Carlota_bici04.png"];
    UIImage *bici5 = [UIImage imageNamed:@"01_Carlota_bici05.png"];
    UIImage *bici6 = [UIImage imageNamed:@"01_Carlota_bici06.png"];
    UIImage *bici7 = [UIImage imageNamed:@"01_Carlota_bici07.png"];
    UIImage *bici8 = [UIImage imageNamed:@"01_Carlota_bici08.png"];
    UIImage *bici9 = [UIImage imageNamed:@"01_Carlota_bici09.png"];
    UIImage *bici10 = [UIImage imageNamed:@"01_Carlota_bici10.png"];
    UIImage *bici11 = [UIImage imageNamed:@"01_Carlota_bici11.png"];
    UIImage *bici12 = [UIImage imageNamed:@"01_Carlota_bici12.png"];
    UIImage *bici13 = [UIImage imageNamed:@"01_Carlota_bici13.png"];
    UIImage *bici14 = [UIImage imageNamed:@"01_Carlota_bici14.png"];
    
    NSArray *imagesBici = [[NSArray alloc] initWithObjects:bici2, bici3, bici4, bici5, bici6,bici7, bici8, bici9, bici10, bici11, bici12, bici13, bici14, nil];
    
    [_carlotaBici setAnimationImages:imagesBici];
    [_carlotaBici setAnimationRepeatCount:1.4];
    [_carlotaBici setAnimationDuration:2.0f];
    [_carlotaBici startAnimating];
    

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
