//
//  main.m
//  CS658
//
//  Created by Tony Klose on 1/24/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "card.h"
#import "Deck.h"
#import "Player.h"


void playCards();
int compareCards();
void endGame();

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Deck *deck = [[Deck alloc]init];
        NSMutableArray *pot = [[NSMutableArray  alloc]init];

        // Instantiate and name players.
        Player *user = [[Player alloc] init];
        user.name = @"Tony";
        Player *comp = [[Player alloc] init];
        comp.name = @"Computer";
        
        // Deal half of the deck to each player.
        while ([deck hasCards]) {
            [user addCard:[deck dealCard]];
            [comp addCard:[deck dealCard]];
        }
        
        do {
            // Print card counts for both players.
            NSLog(@"%@ has %lu cards.\n", user, (unsigned long)user.hand.count);
            NSLog(@"%@ has %lu cards.\n", comp, (unsigned long)comp.hand.count);
            
            // Each player plays their card into the pot and the winner takes the pot.
            playCards(pot, user, comp);
        } while (user.hadCards && comp.hadCards);
        
        NSLog(@"%@ wins the game!", user.hadCards ? user : comp);
        
    }
    return 0;
}

void war(NSMutableArray *pot, Player *user, Player *comp)
{
    Card *userCard, *compCard;
    
    NSLog(@"##-----> WAR! <-----##\n");

    // Each player discards 3 cards if they have them.
    // If any player runs out of cards, end the game.
    for (int i=0; i<3; ++i) {
        if ([user hadCards]) {
            [pot addObject:[user getNextCard]];
            NSLog(@"%@ is discarding...\n", user);
        } else {
            endGame(comp);
        }
        if ([comp hadCards]) {
            [pot addObject:[comp getNextCard]];
            NSLog(@"%@ is discarding...\n", comp);
        } else {
            endGame(user);
        }
    }
    
    // Each player lays down their war card if they have any left.
    if ([user hadCards]) {
        userCard = [user getNextCard];
        [pot addObject:userCard];
        NSLog(@"%@ played the %@.\n", user, userCard);
    } else {
        NSLog(@"%@ has run out of cards.", user);
        endGame(comp);
    }
    if ([comp hadCards]) {
        compCard = [comp getNextCard];
        [pot addObject:compCard];
        NSLog(@"%@ played the %@.\n", comp, compCard);
    } else {
        NSLog(@"%@ has run out of cards.", comp);
        endGame(user);
    }
    
    // Whoever has the bigger war card takes the pot.
    // If war card values match, another war is initiated.
    if (userCard.value == compCard.value) {
        war(pot, user, comp);
    } else {
        Player *winner = (userCard.value > compCard.value) ? user : comp;
        NSLog(@"%@ won the war and acquired %lu cards!\n\n", winner, (unsigned long) pot.count);
        [winner.hand addObjectsFromArray:pot];
    }
    
    // Clear pot
    [pot removeAllObjects];
}

void playCards(NSMutableArray *pot, Player *user, Player *comp)
{
    Card *userCard, *compCard;
    Player *winner;
    if ([user hadCards]) {
        userCard = [user getNextCard];
        [pot addObject:userCard];
        NSLog(@"%@ played the %@.\n", user, userCard);
    } else {
        endGame(comp);
    }
    if ([comp hadCards]) {
        compCard = [comp getNextCard];
        [pot addObject:compCard];
        NSLog(@"%@ played the %@.\n", comp, compCard);
    } else {
        endGame(user);
    }
    if (compareCards(userCard, compCard) == -1) {
        war(pot, user, comp);
    } else {
        winner = (compareCards(userCard, compCard) == 1) ? user : comp;
        NSLog(@"%@ wins this round.\n\n", winner);
        [winner.hand addObjectsFromArray:pot];
    
        // Clear pot
        [pot removeAllObjects];
    }
}

int compareCards(Card *userCard, Card *compCard)
{
    // Return -1 if the card values match.
    if (userCard.value == compCard.value) {
        return -1;
    }
    
    // Return 1 if user card value is larger, otherwise 2.
    return (userCard.value > compCard.value) ? 1 : 2;
}

void endGame(Player *winner)
{
    // Print the winner and end the game.
    NSLog(@"%@ wins the game!\n\n", winner);
    exit(0);
}