//
//  ViewController.m
//  IronSourceVungle
//
//  Created by Vincent on 2020/1/14.
//  Copyright © 2020 Vincent. All rights reserved.
//

#import "ViewController.h"
#import <IronSource/IronSource.h>
#import "Constant.h"

@interface ViewController () <ISRewardedVideoDelegate, ISInterstitialDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}

- (void)createView {
    float screenWidth = self.view.bounds.size.width;
    float x = screenWidth/2-100;
    float y = 100;
    float btnWidth = 200;
    float btnHeight = 50;
    
    UILabel *title = [[UILabel alloc] init];
    title.frame = CGRectMake(x, y - 50, btnWidth, btnHeight);
    title.text = @"IronSource + Vungle";
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];
    
    UIButton *initBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    initBtn.frame = CGRectMake(x, y, btnWidth, btnHeight);
    [initBtn setTitle:@"init IronSource" forState:UIControlStateNormal];
    [initBtn addTarget:self action:@selector(initIronsource) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *loadInterstitialBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadInterstitialBtn.frame = CGRectMake(x, y + 50, btnWidth, btnHeight);
    [loadInterstitialBtn setTitle:@"Load Interstitial" forState:UIControlStateNormal];
    [loadInterstitialBtn addTarget:self action:@selector(loadInterstitial) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *playIntersititalBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playIntersititalBtn.frame = CGRectMake(x, y + 100, btnWidth, btnHeight);
    [playIntersititalBtn setTitle:@"Play Interstitial" forState:UIControlStateNormal];
    [playIntersititalBtn addTarget:self action:@selector(playInterstitial) forControlEvents:UIControlEventTouchUpInside];
    
    // Reward Video Ad is auto cached, so no need to load manually
    UIButton *playRewardBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playRewardBtn.frame = CGRectMake(x, y + 150, btnWidth, btnHeight);
    [playRewardBtn setTitle:@"Play Reward" forState:UIControlStateNormal];
    [playRewardBtn addTarget:self action:@selector(playReward) forControlEvents:UIControlEventTouchUpInside];
    
    // IronSource did not support Vungle MREC & Banner on IronSource SDK 6.13.0.0
    [self.view addSubview:initBtn];
    [self.view addSubview:loadInterstitialBtn];
    [self.view addSubview:playIntersititalBtn];
    [self.view addSubview:playRewardBtn];
}

# pragma mark - IronSource init, load & play
- (void)initIronsource {
    [ISIntegrationHelper validateIntegration];
    [IronSource initWithAppKey:appKey];
    [IronSource setRewardedVideoDelegate:self];
    [IronSource setInterstitialDelegate:self];
}

- (void)loadInterstitial {
    [IronSource loadInterstitial];
}

- (void)playInterstitial {
    if ([IronSource hasInterstitial]) {
        [IronSource showInterstitialWithViewController:self];
    }
}

- (void)playReward {
    if ([IronSource hasRewardedVideo]) {
        [IronSource showRewardedVideoWithViewController:self placement:rewardPlacement];
    }
}

#pragma mark - ISInterstitialDelegate
- (void)interstitialDidLoad {
    NSLog(@"interstitialDidLoad");
}

- (void)interstitialDidShow {
    NSLog(@"interstitialDidShow");
}

- (void)interstitialDidFailToShowWithError:(NSError *)error {
    NSLog(@"interstitialDidFailToShowWithError %@", error.localizedDescription);
}

- (void)didClickInterstitial {
    NSLog(@"didClickInterstitial");
}

- (void)interstitialDidClose {
    NSLog(@"interstitialDidClose");
}

- (void)interstitialDidOpen {
    NSLog(@"interstitialDidOpen");
}

- (void)interstitialDidFailToLoadWithError:(NSError *)error {
    NSLog(@"interstitialDidFailToLoadWithError %@", error.localizedDescription);
}

#pragma mark - ISRewardedVideoDelegate

- (void)rewardedVideoHasChangedAvailability:(BOOL)available {
     NSLog(@"rewardedVideoHasChangedAvailability %d", available);
}

- (void)didReceiveRewardForPlacement:(ISPlacementInfo *)placementInfo {
    NSLog(@"didReceiveRewardForPlacement %@", placementInfo.placementName);
}

- (void)rewardedVideoDidFailToShowWithError:(NSError *)error {
    NSLog(@"rewardedVideoDidFailToShowWithError %@", error.localizedDescription);
}

- (void)rewardedVideoDidOpen {
    NSLog(@"rewardedVideoDidOpen");
}

- (void)rewardedVideoDidClose {
    NSLog(@"rewardedVideoDidClose");
}

- (void)didClickRewardedVideo:(ISPlacementInfo *)placementInfo{
    NSLog(@"didClickRewardedVideo %@", placementInfo.placementName);
}

- (void)rewardedVideoDidStart {
    NSLog(@"rewardedVideoDidStart");
}

- (void)rewardedVideoDidEnd {
    NSLog(@"rewardedVideoDidEnd");
}

@end

