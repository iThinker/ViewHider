//
//  VHViewObserver.m
//  ViewHider
//
//  Created by Roman Temchenko on 2015-10-19.
//  Copyright © 2015 Temkos. All rights reserved.
//

#import "VHViewObserver.h"
#import "VHObserverStorage.h"
#import "VHDeallocObserver.h"

@interface VHViewObserver ()

@property (nonatomic, unsafe_unretained, readwrite) IBOutlet UIView *view;
@property (nonatomic, copy, readwrite) IBOutletCollection(NSLayoutConstraint) NSArray *constraintsToActivate;
@property (nonatomic, copy, readwrite) IBOutletCollection(NSLayoutConstraint) NSArray *constraintsToDeactivate;

- (void)vh_setupObserving;
- (void)vh_startObservingView:(UIView *)view;
- (void)vh_stopObservingView:(UIView *)view;
- (void)vh_hiddenStateChanged:(BOOL)hidden;

@end

@implementation VHViewObserver

static void * VHObserverHiddenContext = &VHObserverHiddenContext;

- (void)setView:(UIView *)view
{
    NSParameterAssert(view);
    NSAssert(_view == nil, @"View should not be mutated once it is set");
    
    _view = view;
    [self vh_startObservingView:view];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self vh_setupObserving];
}

- (void)vh_setupObserving {
    [[VHObserverStorage sharedStorage] storeObserver:self];
}

- (void)vh_startObservingView:(UIView *)view {
    [view addObserver:self
           forKeyPath:@"hidden"
              options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
              context:VHObserverHiddenContext];
    __weak typeof(self) weakSelf = self;
    [VHDeallocObserver observeObject:view handler:^{
        [weakSelf vh_stopObservingView:weakSelf.view];
    }];
}

- (void)vh_stopObservingView:(UIView *)view {
    [view removeObserver:self forKeyPath:@"hidden" context:VHObserverHiddenContext];
}

- (void)vh_hiddenStateChanged:(BOOL)hidden {
    NSArray *constraintsToDeactivate = hidden ? self.constraintsToDeactivate : self.constraintsToActivate;
    NSArray *constraintsToActivate = hidden ? self.constraintsToActivate : self.constraintsToDeactivate;
    [constraintsToDeactivate setValue:@(NO) forKey:@"active"];
    [constraintsToActivate setValue:@(YES) forKey:@"active"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    if (context == VHObserverHiddenContext) {
        NSNumber *newValue = change[NSKeyValueChangeNewKey];
        [self vh_hiddenStateChanged:[newValue boolValue]];
    }
}

@end
