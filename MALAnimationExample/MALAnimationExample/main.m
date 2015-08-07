//
//  main.m
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

void CrashHandlerExceptionHandler(NSException *exception)
{
    NSLog(@"%@",[exception callStackSymbols]);
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    NSArray *allModes = CFBridgingRelease(CFRunLoopCopyAllModes(runLoop));
    while (1)
    {
        for (NSString *mode in allModes)
        {
            CFRunLoopRunInMode((CFStringRef)mode, 0.0001, false);
        }
    }
}

int main(int argc, char * argv[])
{
    @autoreleasepool
    {
        NSSetUncaughtExceptionHandler (&CrashHandlerExceptionHandler);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
