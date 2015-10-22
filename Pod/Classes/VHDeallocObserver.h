//
//  VHDeallocObserver.h
//  ViewHider
//
//  Created by Roman Temchenko on 2015-10-20.
//  Copyright © 2015 Temkos. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^VHDeallocObserverHandler)(void);

@interface VHDeallocObserver : NSObject

+ (void)observeObject:(id)object handler:(VHDeallocObserverHandler)handler;

@end
