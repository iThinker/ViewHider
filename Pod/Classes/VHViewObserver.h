//
//  VHViewObserver.h
//  ViewHider
//
//  Created by Roman Temchenko on 2015-10-19.
//  Copyright © 2015 Temkos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VHViewObserver : NSObject

@property (nonatomic, unsafe_unretained, readonly) IBOutlet UIView *view;
@property (nonatomic, copy, readonly) IBOutletCollection(NSLayoutConstraint) NSArray *constraintsToActivate;
@property (nonatomic, copy, readonly) IBOutletCollection(NSLayoutConstraint) NSArray *constraintsToDeactivate;

@end
