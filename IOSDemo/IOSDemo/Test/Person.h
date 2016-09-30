//
//  Person.h
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/30.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@interface Person : NSObject
@property(nonatomic,weak) Book *book;
@end
