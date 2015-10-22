//
//  VHObserverStorage.h
//  ViewHider
//
//  Created by Roman Temchenko on 2015-10-19.
//  Copyright © 2015 Temkos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VHViewObserver;

@interface VHObserverStorage : NSObject

+ (instancetype)sharedStorage;

- (void)storeObserver:(VHViewObserver *)observer;
- (void)removeObserver:(VHViewObserver *)observer;

@end
