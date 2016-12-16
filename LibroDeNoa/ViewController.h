//
//  ViewController.h
//  LibroDeNoa
//
//  Created by IVAN MOLERA on 26/11/14.
//  Copyright (c) 2014 UAB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    BOOL troncClicked;
}
@property (weak, nonatomic) IBOutlet UIImageView *capImage;
@property (strong, nonatomic) IBOutlet UIImageView *tiet_cos;
@property (weak, nonatomic) IBOutlet UIView *carlota;
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *carlotaBici;
@property (weak, nonatomic) IBOutlet UIImageView *carlotaHead;
@property (weak, nonatomic) IBOutlet UIView *tioView;
@property (weak, nonatomic) IBOutlet UIView *tiaView;
@property (weak, nonatomic) IBOutlet UIView *carlotaView;
@property (weak, nonatomic) IBOutlet UIView *linuxView;

- (IBAction)clickTronc:(id)sender;
- (IBAction)tioPressed:(id)sender;
- (IBAction)tiaPressed:(id)sender;
- (IBAction)carlotaPressed:(id)sender;
- (IBAction)linuxPressed:(id)sender;


@end

