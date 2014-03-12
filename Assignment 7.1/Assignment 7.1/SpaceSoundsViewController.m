//
//  FirstViewController.m
//  Assignment 7.1
//
//  Created by Tony Klose on 3/11/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "SpaceSoundsViewController.h"
#import "Sound.h"

@interface SpaceSoundsViewController ()

@property(nonatomic, strong)NSMutableArray* spaceSounds;

@end

@implementation SpaceSoundsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _spaceSounds = [[NSMutableArray alloc] init];
    [self addSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.spaceSounds count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.spaceSounds objectAtIndex:indexPath.row] name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Sound * sound = [self.spaceSounds objectAtIndex:indexPath.row];
    [[sound audioPlayer] prepareToPlay];
    [[sound audioPlayer] play];
}

-(void)addSounds
{
    NSError *error;
    AVAudioPlayer* audioPlayer;
    NSURL *soundURL;
    NSString *iconPath;
    NSString *name;
    Sound *sound;
    
    soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Computers_In_Control" ofType:@"mp3"]];
    iconPath = [[NSBundle mainBundle] pathForResource:@"Rocket" ofType:@"png"];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    name = @"Computer's In Control";
    sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer icon:[[UIImage alloc] initWithContentsOfFile:iconPath ]];
    [self.spaceSounds addObject:sound];
}

@end
