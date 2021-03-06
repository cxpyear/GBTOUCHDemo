//
//  MRActivityIndicatorViewController.m
//  MRProgress
//
//  Created by Marius Rackwitz on 20.10.13.
//  Copyright (c) 2013 Marius Rackwitz. All rights reserved.
//

#import "MRActivityIndicatorViewController.h"
#import "MRActivityIndicatorView.h"
#import "MRColorPaletteViewController.h"


@interface MRActivityIndicatorViewController () <MRColorPaletteDelegate>

@property (weak, nonatomic) IBOutlet MRActivityIndicatorView *activityIndicatorView;

@end


@implementation MRActivityIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    [self.activityIndicatorView startAnimating];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ColorPalette"]) {
        MRColorPaletteViewController *colorPaletteVC = (MRColorPaletteViewController *)segue.destinationViewController;
        colorPaletteVC.delegate = self;
    }
}

- (void)colorPaletteViewController:(MRColorPaletteViewController *)colorPaletteViewController didSelectColor:(UIColor *)color {
    self.activityIndicatorView.tintColor = color;
}

@end
