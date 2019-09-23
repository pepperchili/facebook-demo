//
//  ViewController.m
//  facebook-demo
//
//  Created by Efun on 2019/9/23.
//  Copyright © 2019 Efun. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController () <FBSDKSharingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    btn.center = CGPointMake(screenWidth/2, screenHeight/2 - 150);
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn setTitle:@"facebookShareLink" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickShareLink) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    btn2.center = CGPointMake(screenWidth/2, screenHeight/2 + 150);
    [btn2 setBackgroundColor:[UIColor blueColor]];
    [btn2 setTitle:@"facebookSharePhoto" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(clickSharePhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}


- (void)clickShareLink {
    FBSDKShareLinkContent *content= [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
    [FBSDKShareDialog showFromViewController:nil withContent:content delegate:self];
}

- (void)clickSharePhoto {
    FBSDKSharePhotoContent *content= [[FBSDKSharePhotoContent alloc] init];
    FBSDKSharePhoto *sharePhoto = [[FBSDKSharePhoto alloc]init];
    UIImage *img = [UIImage imageNamed:@"shareImage"];
    sharePhoto.image = img;
    content.photos = @[sharePhoto];
    [FBSDKShareDialog showFromViewController:nil withContent:content delegate:self];
}

#pragma mark - FBSDKSharingDelegate

- (void)sharer:(id)sharer didCompleteWithResults:(NSDictionary *)results {
    NSLog(@"results === %@",results);
}

- (void)sharer:(id)sharer didFailWithError:(NSError *)error {
   NSLog(@"error === %@",error);
}

- (void)sharerDidCancel:(id)sharer {
   NSLog(@"sharerDidCancel === %@",sharer);
}


@end
