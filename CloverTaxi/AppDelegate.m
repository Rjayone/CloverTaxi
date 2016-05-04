//
//  AppDelegate.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/4/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "AppDelegate.h"
@import GoogleMaps;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:[Common googleMapsAPIKey]];
    if(![self firstLaunch]) {
        [[NSUserDefaults standardUserDefaults]setObject:@(YES) forKey:@"kFirstLaunch"];
    } else {
        
        UIViewController* mapsVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MapsViewController"];
        UINavigationController* navigationController = [[UINavigationController alloc]initWithRootViewController:mapsVC];
        navigationController.navigationBar.topItem.title = @"";
        navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.1647 green:0.6588 blue:0.5333 alpha:1.0];
        
        self.window.rootViewController = navigationController;
        [self.window makeKeyAndVisible];
    }
        
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (BOOL)firstLaunch {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:@"kFirstLaunch"]boolValue] && [defaults objectForKey:@"kGPSPermission"];
}

@end
