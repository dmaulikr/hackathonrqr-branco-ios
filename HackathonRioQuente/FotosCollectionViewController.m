//
//  FotosCollectionViewController.m
//  HackathonRioQuente
//
//  Created by Jose Lino Neto on 05/08/17.
//  Copyright © 2017 Construtor. All rights reserved.
//

#import "FotosCollectionViewController.h"
#import "PhotoCellCollectionViewCell.h"
#import "Photo.h"
#import "DetailsViewController.h"

const NSString *cloudnary = @"http://res.cloudinary.com/datveqkzs/image/upload/w_400,h_400,c_crop,g_face,r_max/w_60/v1502021530/";

@interface FotosCollectionViewController ()

@property (strong, nonatomic) NSMutableArray *photosArray;

@end

@implementation FotosCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[PhotoCellCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.photosArray = [[NSMutableArray alloc] init];
    
    [Photo getPhotos:^(NSString *responseObject) {
        [self.photosArray addObject:responseObject];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.photosArray.count - 1 inSection:0];
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
        [self.collectionView insertItemsAtIndexPaths:indexPaths];
    } falha:^(NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photosArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCellCollectionViewCell *cell = (PhotoCellCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    // BackGround Color
    cell.backgroundColor = [UIColor whiteColor];
    
    // Text Share
    cell.shareText = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend, lacus vitae volutpat viverra, nisl orci pellentesque diam, a dapibus libero dolor vitae odio. Pellentesque consequat, felis in pulvinar malesuada, nibh erat efficitur lorem, ut iaculis purus augue a felis. In hac habitasse platea dictumst. Curabitur et justo quis ipsum efficitur volutpat quis in quam. Praesent nec mollis velit. ";
    //[cell.coracao bater];
    //cell.coracao.backgroundColor = [UIColor whiteColor];
    //cell.coracao.corBorda = [UIColor blackColor];
    //    cell.coracao.cor = [UIColor whiteColor];
    //    cell.coracao.corBorda = [UIColor blackColor];
    
    
    NSString *url = [self.photosArray objectAtIndex:indexPath.row];
    cell.fotoId = url;
    url = [[cloudnary stringByAppendingString:url] stringByAppendingString:@".jpg"];
    cell.voted = indexPath.row % 2 == 0 ? YES : NO;
    cell.numberLikes = indexPath.row;
    cell.photoUrl = url;
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^(void) {
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage* image = [[UIImage alloc] initWithData:imageData];
        if (image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [cell.imageView setImage:image];
                [cell setNeedsDisplay];
                //cell.imageView.image = image;
                //[avatar setImage:image];
                //  [cell setNeedsLayout];
            });
        }
    });
    
    //cell.coracao.bpm = indexPath.row;
    [cell setNeedsDisplay];
    return cell;
}


#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize newSize = CGSizeZero;
    
//    CGRect screenBounds = [[UIScreen mainScreen] bounds];
//    CGSize screenSize = screenBounds.size;
    
    newSize.width = 60.0;
    newSize.height = 60.0;
    
    return newSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(3, 3, 3, 0);
}

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

// // Uncomment this method to specify if the specified item should be selected
// - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//     return YES;
// }


// // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
// - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
//	return NO;
// }
//
// - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
//	return YES;
// }
//
// - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
//
// }

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCellCollectionViewCell *cell = (PhotoCellCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"Details" sender:cell];
//    cell.numberLikes = cell.numberLikes + 1;;
//    [cell bater];
//    [cell setNeedsDisplay];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Details"]){
        DetailsViewController *dvc = (DetailsViewController *)segue.destinationViewController;
        PhotoCellCollectionViewCell *selected = (PhotoCellCollectionViewCell *)sender;
        
        dvc.fotoId = selected.fotoId;
    }
}


@end
