# IronSource iOS Mediation with Vungle SDK
This is a sample project by using mediation IronSource include Ad-Network Vungle.

## Goal
This project may help to reproduce issues and narrow down the root cause.

## Getting Started
This project is not include the app id and placement ids.
Go to the file Constant.m and input your placement ids:
```
NSString* const appKey = @"";
NSString* const interstitialPlacement = @"DefaultInterstitial";
NSString* const rewardPlacement = @"DefaultRewardedVideo";
```
Run the commmand below with your terminal
```
pod install --repo-update
```

You should good to go now!

## Manually Integration
1. Check out a new branch
2. Comment Podfile frameworks as below
```
# comment below lines
#  pod 'IronSourceSDK','6.13.0.1'
#  pod 'IronSourceVungleAdapter','4.1.8.3'
```
3. Run pod install to remove the frameworks from the project
4. Integrate frameworks manually

## For more details, please check IronSource integration document
https://developers.ironsrc.com/ironsource-mobile/ios/ios-sdk/

## Tested Version
IronSource + Vungle + Adapter:
6.13.0.1 + 6.4.5 + 4.1.8.3

## Note
This version is not support banner yet
