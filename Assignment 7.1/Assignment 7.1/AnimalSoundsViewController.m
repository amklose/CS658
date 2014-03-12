//
//  AnimalSoundsViewController.m
//  Assignment 7.1
//
//  Created by Tony Klose on 3/11/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "AnimalSoundsViewController.h"
#import "Sound.h"

@interface AnimalSoundsViewController()

@property(nonatomic, strong)NSMutableArray *animalSounds;

@end

@implementation AnimalSoundsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _animalSounds = [[NSMutableArray alloc] init];
    [self addSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.animalSounds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.animalSounds objectAtIndex:indexPath.row] name];
    cell.imageView.image = [[self.animalSounds objectAtIndex:indexPath.row] icon];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Sound * sound = [self.animalSounds objectAtIndex:indexPath.row];
    sound.audioPlayer.delegate = self;
    [[sound audioPlayer] prepareToPlay];
    [[sound audioPlayer] play];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
}

- (void)addSounds
{
    NSError *error;
    AVAudioPlayer* audioPlayer;
    NSURL *soundURL;
    NSString *iconPath;
    NSString *name;
    Sound *sound;
    
    NSArray *animals = [NSArray arrayWithObjects:@"Bear", @"Cat", @"Chimp", @"Cock", @"Cow", @"Dog", @"Elephant", @"Fox", @"Horse", @"Lion", @"Pig", @"Sheep", @"Tiger", nil];
    
    for (int i = 0; i < animals.count; ++i) {
        soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:animals[i] ofType:@"mp3"]];
        iconPath = [[NSBundle mainBundle] pathForResource:animals[i] ofType:@"png"];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
        name = animals[i];
        sound = [[Sound alloc] initWithName:name audioPlayer:audioPlayer icon:[[UIImage alloc] initWithContentsOfFile:iconPath]];
        [self.animalSounds addObject:sound];
    }
}

@end