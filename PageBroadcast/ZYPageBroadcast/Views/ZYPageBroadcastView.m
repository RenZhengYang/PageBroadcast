//
//  ZYPageBroadcastView.m
//  PageBroadcast
//
//  Created by ren on 2019/3/19.
//  Copyright © 2019年 ren. All rights reserved.
//

#import "ZYPageBroadcastView.h"
#import "ZYPageBrocastCollectionView.h"
#define scrollMaxSections 20

@interface ZYPageBroadcastView () <ZYPageBrocastCollectionViewDelegate>

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) CGFloat broadCastH;

@end

@implementation ZYPageBroadcastView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 默认
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}


- (void)setMuBroadcastData:(NSMutableArray *)muBroadcastData
{
    _muBroadcastData = muBroadcastData;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[ZYPageBrocastCollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout DataArray:muBroadcastData];
    _collectionView.brocastDelegate = self;
    [self addSubview:_collectionView];
    
    [self addTimer];
    
}



#pragma mark - - - NSTimer
- (void)addTimer {
    [self removeTimer];
    self.timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(beginUpdateUI) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)beginUpdateUI {
    //    return;
    // 1、当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    //    NSLog(@"current:%lu", currentIndexPath.row);
    // 马上显示回最中间那组的数据
    NSIndexPath *resetCurrentIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:0.5 * scrollMaxSections];
    [self.collectionView scrollToItemAtIndexPath:resetCurrentIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
    
    // 2、计算出下一个需要展示的位置
    NSInteger nextItem = resetCurrentIndexPath.item + 1;
    NSInteger nextSection = resetCurrentIndexPath.section;
    if (nextItem == self.muBroadcastData.count) {
        nextItem = 0;
        nextSection++;
    }
    
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    //    NSLog(@"next:%lu", nextIndexPath.row);
    // 3、通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];
}

/*
 * 点击某条广播时
 */
- (void)pageBrocastcollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(pageBrocastViewCollectionView:didSelectItemAtIndexPath:)]) {
        [self.delegate pageBrocastViewCollectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
    
}

@end
