//
//  main.m
//  airplays
//
//  Created by jackyshan on 2020/9/17.
//  Copyright © 2020 Jacky Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AirPlayGo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        NSString *arg;
        for (int i = 0; i < argc; i++) {
           arg = [NSString stringWithUTF8String:argv[i]];
        }
        if ([arg hasPrefix:@"http"]) {
            AirPlayGo *airPlay = [[AirPlayGo alloc] init];
            [airPlay search:arg];
            [[NSRunLoop currentRunLoop] run];
        }
        else {
            NSLog(@"提供播放url参数");
        }
    }
    return 0;
}
