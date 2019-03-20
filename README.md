# PageBroadcast
文字广播(跑马灯) 可手动翻页

用法如下：

#import "ViewController.h"
#import "pageBroadcast.h"

@interface ViewController () <ZYPageBroadcastViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
[super viewDidLoad];

NSMutableArray *muArr = [NSMutableArray arrayWithObjects:@"今天是2019年3月20日",@"我怀着无法抒怀的心情",@"想着某年某月某日",@"那天我正在做什么",@"或是想什么",@"无法抗拒时间的无情",@"无法抗拒内心对自己的无奈",@"奈何如此伤悲透顶",@"如何不够洒脱",@"你妹的",@"想太多了吧", nil];

ZYPageBroadcastView *broadView = [[ZYPageBroadcastView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 30)];
broadView.delegate = self;
broadView.muBroadcastData = muArr;
// broadView.collectionView.textFont = [UIFont systemFontOfSize:15];
// broadView.collectionView.textColor = [UIColor redColor];
broadView.collectionView.textAlignment = NSTextAlignmentCenter;
broadView.collectionView.bgColor = [UIColor greenColor];

[self.view addSubview:broadView];

}

/*
* 点击某条广播时
*/
- (void)pageBrocastViewCollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
NSLog(@"indexPath.row = %ld",indexPath.row);

}
