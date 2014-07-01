//
//  Banner.h
//  lechouchou
//
//  Created by 李 雷川 on 14-6-21.
//  Copyright (c) 2014年 李 雷川. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banner : NSObject{
    NSString   *name;
    NSString   *imagePath;
}
@property(nonatomic, strong) NSString   *name;
@property(nonatomic, strong) NSString   *imagePath;


@end
