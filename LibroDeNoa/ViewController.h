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

- (IBAction)clickTronc:(id)sender;


@end

