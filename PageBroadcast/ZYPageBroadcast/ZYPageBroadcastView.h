//
//  ZYPageBroadcastView.h
//  PageBroadcast
//
//  Created by ren on 2019/3/19.
//  Copyright © 2019年 ren. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYPageBrocastCollectionView;

@protocol ZYPageBroadcastViewDelegate <NSObject>

@optional;
/*
 * 点击某条广播时
 */
- (void)pageBrocastViewCollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ZYPageBroadcastView : UIView
/// 代理对象
@property (nonatomic, weak) id <ZYPageBroadcastViewDelegate> delegate;
/// 数据源
@property (nonatomic, strong) NSMutableArray *muBroadcastData;
/// 轮播视图
@property (nonatomic, strong) ZYPageBrocastCollectionView * collectionView;

@end

