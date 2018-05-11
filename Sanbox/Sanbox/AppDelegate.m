//
//  AppDelegate.m
//  Sanbox
//
//  Created by Miugodigital on 2018/5/11.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "AppDelegate.h"
#import "JLRoutes.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [ViewController new];
    
//    总结: JLRoutes主要作用有两个 :
//    
//    1. 用于处理从网页跳转至app指定页面
//    
//    2. 多个应用间的互相跳转
    
    
[JLRoutes addRoute:@"/:TestViewController" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
    //跳转到某个类名
    NSLog(@"%@",parameters);
            NSString*controller = parameters[@"TestViewController"];
            [self.window.rootViewController presentViewController:[[NSClassFromString(controller)  alloc] init] animated:YES completion:^{

            }];
  
    return YES;
        }];
    
   
    return YES;
}

- (BOOL)application:(UIApplication*)application openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation {
    NSLog(@"%@",url);
     //JLRouteURL = "SanboxURL://TestViewController";
    
    
    return[JLRoutes routeURL:url];
    
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
