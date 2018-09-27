//
//  SuggestionCollectionViewCell.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 27/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuggestionCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *suggestionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *teamBoxImageView;

@end

NS_ASSUME_NONNULL_END
