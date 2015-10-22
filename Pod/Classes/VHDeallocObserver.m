//
//  VHDeallocObserver.m
//  ViewHider
//
//  Created by Roman Temchenko on 2015-10-20.
//  Copyright © 2015 Temkos. All rights reserved.
//

#import "VHDeallocObserver.h"
#import <objc/runtime.h>

@interface VHDeallocObserver ()

@property (nonatomic, copy) VHDeallocObserverHandler handler;

@end

@implementation VHDeallocObserver

static void *AssociationKey = &AssociationKey;

+ (void)observeObject:(id)object handler:(VHDeallocObserverHandler)handler {
    NSParameterAssert(object);
    NSParameterAssert(handler);
    VHDeallocObserver *observer = [[self alloc] initWithHandler:handler];
    objc_setAssociatedObject(object, AssociationKey, observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (instancetype)initWithHandler:(VHDeallocObserverHandler)handler {
    if (self = [super init]) {
        self.handler = handler;
    }
    
    return self;
}

- (void)dealloc {
    self.handler();
}

@end
