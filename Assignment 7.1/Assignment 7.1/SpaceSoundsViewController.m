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

@property(nonatomic, strong)NSMutableArray *discoverySounds;
@property(nonatomic, strong)NSMutableArray *apolloSounds;
@property(nonatomic, strong)NSMutableArray *mercurySounds;

@end

@implementation SpaceSoundsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tableArray = [[NSMutableArray alloc] init];
    _discoverySounds = [[NSMutableArray alloc] init];
    _apolloSounds = [[NSMutableArray alloc] init];
    _mercurySounds = [[NSMutableArray alloc] init];
    [self addSounds];
    NSDictionary *discoverySoundsDict = [NSDictionary dictionaryWithObject:_discoverySounds forKey:@"Data"];
    NSDictionary *apolloSoundsDict = [NSDictionary dictionaryWithObject:_apolloSounds forKey:@"Data"];
    NSDictionary *mercurySoundsDict = [NSDictionary dictionaryWithObject:_mercurySounds forKey:@"Data"];
    [_tableArray addObject:discoverySoundsDict];
    [_tableArray addObject:apolloSoundsDict];
    [_tableArray addObject:mercurySoundsDict];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dictionary = [self.tableArray objectAtIndex:section];
    NSMutableArray *array = [dictionary objectForKey:@"Data"];
    return [array count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.tableArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionHeader = nil;
    if (section == 0) {
        sectionHeader = @"Discovery Missions";
    } else if (section == 1) {
        sectionHeader = @"Apolo Missions";
    } else if (section == 2) {
        sectionHeader = @"Mercury Missions";
    }

    return sectionHeader;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *dictionary = [self.tableArray objectAtIndex:indexPath.section];
    NSMutableArray *array = [dictionary objectForKey:@"Data"];
    Sound *sound = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = [sound name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *arrayToPlayFrom = nil;
    
    if (indexPath.section == 0) {
        arrayToPlayFrom = self.discoverySounds;
    } else if (indexPath.section == 1) {
        arrayToPlayFrom = self.apolloSounds;
    } else if (indexPath.section == 2) {
        arrayToPlayFrom = self.mercurySounds;
    }
    
    Sound * sound = [arrayToPlayFrom objectAtIndex:indexPath.row];
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
    [self.discoverySounds addObject:sound];
}

@end
