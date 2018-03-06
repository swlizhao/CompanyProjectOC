//
//  LZOrderModel.h
//  LifeFinanceDemo
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZOrderModel : NSObject

//名称
@property(nonatomic,copy)NSString * title;
//状态
@property(nonatomic,copy)NSString * badge;
//网络图片
@property(nonatomic,copy)NSString * url;
//本地图片
@property(nonatomic,copy)UIImage * image;
//本地图片名称
@property(nonatomic,strong)NSString * imageName;

@end
