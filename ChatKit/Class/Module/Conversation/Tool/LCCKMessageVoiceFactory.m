//
//  LCCKMessageVoiceFactory.m
//  LeanCloudChatKit-iOS
//
// v0.5.2 Created by 陈宜龙 on 16/3/21.
//  Copyright © 2016年 ElonChan. All rights reserved.
//

#import "LCCKMessageVoiceFactory.h"
#import "UIImage+LCCKExtension.h"

@implementation LCCKMessageVoiceFactory

+ (UIImageView *)messageVoiceAnimationImageViewWithBubbleMessageType:(LCCKMessageOwnerType)owner {
    UIImageView *messageVoiceAniamtionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    NSString *imageSepatorName;
    switch (owner) {
        case LCCKMessageOwnerTypeSelf:
            imageSepatorName = @"Sender";
            break;
        case LCCKMessageOwnerTypeOther:
            imageSepatorName = @"Receiver";
            break;
        default:
            break;
    }
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:4];
    for (NSInteger i = 0; i < 4; i ++) {
        NSString *imageName = [imageSepatorName stringByAppendingFormat:@"VoiceNodePlaying00%ld", (long)i];
        UIImage *image = [self imageInBundleForImageName:imageName];
        if (image)
            [images addObject:image];
    }
    
    messageVoiceAniamtionImageView.image = ({
        NSString *imageName = [imageSepatorName stringByAppendingString:@"VoiceNodePlaying"];
        UIImage *image = [self imageInBundleForImageName:imageName];
        image;});
    messageVoiceAniamtionImageView.animationImages = images;
    messageVoiceAniamtionImageView.animationDuration = 1.0;
    [messageVoiceAniamtionImageView stopAnimating];
    return messageVoiceAniamtionImageView;
}

+ (UIImage *)imageInBundleForImageName:(NSString *)imageName {
    UIImage *image = [UIImage lcck_imageNamed:imageName bundleName:@"VoiceMessageSource" bundleForClass:[self class]];
    return  image;
}

@end
