//
//  XHDemoWeChatMessageTableViewController.m
//  MessageDisplayExample
//
//  Created by qtone-1 on 14-4-27.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHDemoWeChatMessageTableViewController.h"

@interface XHDemoWeChatMessageTableViewController ()

@end

@implementation XHDemoWeChatMessageTableViewController

- (void)loadDemoDataSource {
    WEAKSELF
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *messages = [[NSMutableArray alloc] initWithObjects:
                         [[XHMessage alloc] initWithText:@"这是华捷微信，为什么模仿这个页面效果呢？希望微信团队能看到我们在努力，请微信团队给个机会，让我好好的努力靠近大神，希望自己也能发亮，好像有点过分的希望了，如果大家喜欢这个开源库，请大家帮帮忙支持这个开源库吧！我是Jack，叫华仔也行，曾宪华就是我啦！Call Me 15915895880" sender:@"华仔" date:[NSDate distantPast]],
                         [[XHMessage alloc] initWithText:@"这是华捷微信，为什么模仿这个页面效果呢？希望微信团队能看到我们在努力，请微信团队给个机会，让我好好的努力靠近大神，希望自己也能发亮，好像有点过分的希望了，如果大家喜欢这个开源库，请大家帮帮忙支持这个开源库吧！我是Jack，叫华仔也行，曾宪华就是我啦！Call Me 15915895880" sender:@"曾宪华" date:[NSDate distantPast]],
                         [[XHMessage alloc] initWithText:@"这是华捷微信，为什么模仿这个页面效果呢？希望微信团队能看到我们在努力，请微信团队给个机会，让我好好的努力靠近大神，希望自己也能发亮，好像有点过分的希望了，如果大家喜欢这个开源库，请大家帮帮忙支持这个开源库吧！我是Jack，叫华仔也行，曾宪华就是我啦！Call Me 15915895880" sender:@"曾宪华" date:[NSDate distantPast]],
                         [[XHMessage alloc] initWithText:@"这是华捷微信，为什么模仿这个页面效果呢？希望微信团队能看到我们在努力，请微信团队给个机会，让我好好的努力靠近大神，希望自己也能发亮，好像有点过分的希望了，如果大家喜欢这个开源库，请大家帮帮忙支持这个开源库吧！我是Jack，叫华仔也行，曾宪华就是我啦！Call Me 15915895880" sender:@"曾宪华" date:[NSDate distantPast]],
                         [[XHMessage alloc] initWithText:@"这是华捷微信，为什么模仿这个页面效果呢？希望微信团队能看到我们在努力，请微信团队给个机会，让我好好的努力靠近大神，希望自己也能发亮，好像有点过分的希望了，如果大家喜欢这个开源库，请大家帮帮忙支持这个开源库吧！我是Jack，叫华仔也行，曾宪华就是我啦！Call Me 15915895880" sender:@"曾宪华" date:[NSDate date]],
                         [[XHMessage alloc] initWithText:@"这是华捷微信，为什么模仿这个页面效果呢？希望微信团队能看到我们在努力，请微信团队给个机会，让我好好的努力靠近大神，希望自己也能发亮，好像有点过分的希望了，如果大家喜欢这个开源库，请大家帮帮忙支持这个开源库吧！我是Jack，叫华仔也行，曾宪华就是我啦！Call Me 15915895880" sender:@"曾宪华" date:[NSDate date]],
                         nil];
        
        for (NSUInteger i = 0; i < 1; i++) {
            [messages addObjectsFromArray:messages];
        }
        
        for (NSInteger i = 0; i < 10; i ++) {
            XHMessage *message = [[XHMessage alloc] initWithPhoto:[UIImage imageNamed:@"JieIcon"] thumbnailUrl:nil originPhotoUrl:nil sender:@"Jack" date:[NSDate date]];
            message.bubbleMessageType = (i % 2) ? XHBubbleMessageTypeSending : XHBubbleMessageTypeReceiving;
            [messages addObject:message];
            
            [messages addObject:[[XHMessage alloc] initWithText:@"这是华捷微信，为什么模仿这个页面效果呢？希望微信团队能看到我们在努力，请微信团队给个机会，让我好好的努力靠近大神，希望自己也能发亮，好像有点过分的希望了，如果大家喜欢这个开源库，请大家帮帮忙支持这个开源库吧！我是Jack，叫华仔也行，曾宪华就是我啦！Call Me 15915895880" sender:@"曾宪华" date:[NSDate date]]];
            
            XHMessage *voiceMessage = [[XHMessage alloc] initWithvoicePath:nil voiceUrl:nil sender:@"Jack" date:[NSDate date]];
            voiceMessage.bubbleMessageType = (i % 2) ? XHBubbleMessageTypeSending : XHBubbleMessageTypeReceiving;
            [messages addObject:voiceMessage];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.messages = messages;
            [weakSelf.messageTableView reloadData];
            [weakSelf scrollToBottomAnimated:YES];
        });
    });
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Custom UI
//    [self setBackgroundColor:[UIColor clearColor]];
//    [self setBackgroundImage:[UIImage imageNamed:@"TableViewBackgroundImage"]];
    
    [self loadDemoDataSource];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self removeMessageAtIndexPath:indexPath];
//    [self insertOldMessages:self.messages];
}

#pragma mark - XHMessageTableViewController Delegate

- (void)didSendText:(NSString *)text fromSender:(NSString *)sender onDate:(NSDate *)date {
    [self addMessage:[[XHMessage alloc] initWithText:text sender:sender date:date]];
    [self finishSendMessageWithBubbleMessageType:XHBubbleMessageText];
}

- (void)didSendPhoto:(UIImage *)photo fromSender:(NSString *)sender onDate:(NSDate *)date {
    [self finishSendMessageWithBubbleMessageType:XHBubbleMessagePhoto];
}

- (void)didSendVideo:(NSString *)videoPath fromSender:(NSString *)sender onDate:(NSDate *)date {
    [self finishSendMessageWithBubbleMessageType:XHBubbleMessageVideo];
}

- (void)didSendvoice:(NSString *)voicePath fromSender:(NSString *)sender onDate:(NSDate *)date {
    [self finishSendMessageWithBubbleMessageType:XHBubbleMessagevoice];
}

- (void)didSendFace:(NSString *)facePath fromSender:(NSString *)sender onDate:(NSDate *)date {
    [self finishSendMessageWithBubbleMessageType:XHBubbleMessageFace];
}

- (void)didSendLocalPosition {
    [self finishSendMessageWithBubbleMessageType:XHBubbleMessageLocalPosition];
}

- (BOOL)shouldDisplayTimestampForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2)
        return YES;
    else
        return NO;
}

@end
