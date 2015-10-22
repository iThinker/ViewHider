//
//  VHObserverStorage.m
//  ViewHider
//
//  Created by Roman Temchenko on 2015-10-19.
//  Copyright © 2015 Temkos. All rights reserved.
//

#import "VHObserverStorage.h"

@interface VHObserverStorage ()

@property (nonatomic, strong) NSMutableSet *observers;

@end

@implementation VHObserverStorage

+ (instancetype)sharedStorage {
    static VHObserverStorage *sharedStorage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStorage = [self new];
    });
    
    return sharedStorage;
}

- (instancetype)init {
    if (self = [super init]) {
        _observers = [NSMutableSet new];
    }
    
    return self;
}

- (void)storeObserver:(VHViewObserver *)observer {
    [self.observers addObject:observer];
}

- (void)removeObserver:(VHViewObserver *)observer {
    [self.observers removeObject:observer];
}

@end
