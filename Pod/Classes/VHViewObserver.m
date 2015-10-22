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
- (void)vh_startObservingView;
- (void)vh_stopObservingView;
- (void)vh_hiddenStateChanged:(BOOL)hidden;

@end

@implementation VHViewObserver

static void * VHObserverHiddenContext = &VHObserverHiddenContext;

- (void)setView:(UIView *)view
{
    NSParameterAssert(view);
    NSAssert(_view == nil, @"View should not be mutated once it is set");
    
    _view = view;
    [self vh_startObservingView];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self vh_setupObserving];
}

- (void)vh_setupObserving {
    [[VHObserverStorage sharedStorage] storeObserver:self];
}

- (void)vh_startObservingView {
    [self.view addObserver:self
           forKeyPath:@"hidden"
              options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
              context:VHObserverHiddenContext];
    __weak typeof(self) weakSelf = self;
    [VHDeallocObserver observeObject:self.view handler:^{
        [weakSelf vh_stopObservingView];
    }];
}

- (void)vh_stopObservingView {
    [self.view removeObserver:self forKeyPath:@"hidden" context:VHObserverHiddenContext];
    [[VHObserverStorage sharedStorage] removeObserver:self];
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
