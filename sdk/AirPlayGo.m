//
//  AirPlayGo.m
//  airplays
//
//  Created by jackyshan on 2020/9/17.
//  Copyright © 2020 Jacky Labs. All rights reserved.
//

#import "AirPlayGo.h"
#import "MYCAirplayManager.h"

@interface AirPlayGo()<MYCAirplayManagerDelegate>

@property (nonatomic, copy) NSString *url;

@end

@implementation AirPlayGo

- (void)search:(NSString *)url {
    NSLog(@"%@", url);

    _url = url;
    [[MYCAirplayManager sharedManager] setDelegate:self];
    [[MYCAirplayManager sharedManager] searchAirplayDeviceWithTimeOut:2];
}

#pragma mark - MYCAirplayManagerDelegate

- (void)MYCAirplayManager:(MYCAirplayManager *)airplayManager searchedAirplayDevice:(NSMutableArray<MYCAirplayDevice *> *)deviceList
{
    NSLog(@"已经获取到设备列表");
}

-(void)MYCAirplayManager:(MYCAirplayManager *)airplayManager searchAirplayDeviceFinish:(NSMutableArray<MYCAirplayDevice *> *)deviceList
{
    NSLog(@"搜索设备操作完成");
    MYCAirplayDevice *device = deviceList.firstObject;
    NSLog(@"连接设备%@", device.displayName);
//    [[MYCAirplayManager sharedManager] activateSocketToDevice:device];
}

-(void)MYCAirplayManager:(MYCAirplayManager *)airplayManager selectedDeviceOnLine:(MYCAirplayDevice *)airplayDevice
{
    NSLog(@"设备已连接---%@",airplayDevice.displayName);
    NSLog(@"开始播放");
    [[MYCAirplayManager sharedManager] playVideoOnAirplayDevice:nil videoUrlStr:_url];
}

- (void)MYCAirplayManager:(MYCAirplayManager *)airplayManager selectedDeviceDisconnect:(MYCAirplayDevice *)airplayDevice
{
    NSLog(@"设备已断开---%@",airplayDevice.displayName);
}

@end
