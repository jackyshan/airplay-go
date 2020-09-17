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
        
        NSString *arg = [NSString stringWithUTF8String:*argv];
        AirPlayGo *airPlay = [[AirPlayGo alloc] init];
        [airPlay search:arg];
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
