//
//  ViewController.m
//  Assignment 7
//
//  Created by Tony Klose on 3/9/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "SoundEffectsViewController.h"
#import "CatSound.h"

@interface SoundEffectsViewController ()

@property(nonatomic, strong) NSMutableArray* sounds;

@end

@implementation SoundEffectsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _sounds = [[NSMutableArray alloc] init];
    [self addSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sounds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.sounds objectAtIndex:indexPath.row] name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CatSound * sound = [self.sounds objectAtIndex:indexPath.row];
    [[sound audioPlayer] prepareToPlay];
    [[sound audioPlayer] play];
}

- (void)addSounds
{
    NSError *error;
    AVAudioPlayer* audioPlayer;
    NSURL *soundURL;
    NSString *soundPath;
    NSString *name;
    CatSound *catSound;
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-angry" ofType:@"mp3"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    name = @"Angry";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-furious" ofType:@"mp3"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    name = @"Furious";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-meow" ofType:@"mp3"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    name = @"Meow";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-sad" ofType:@"mp3"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    name = @"Sad";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-scared" ofType:@"mp3"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    name = @"Scared";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-squeak" ofType:@"mp3"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    name = @"Squeak";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
    
    soundPath = [[NSBundle mainBundle] pathForResource:@"cat-whining" ofType:@"mp3"];
    soundURL = [NSURL fileURLWithPath:soundPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    name = @"Whining";
    catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
    [self.sounds addObject:catSound];
}

@end
