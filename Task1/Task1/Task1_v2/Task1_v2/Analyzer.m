//
//  Analyzer.m
//  Task1_v2
//
//  Created by fpmi on 14.04.17.
//  Copyright (c) 2017 Andrei Mashko. All rights reserved.
//

#import "Analyzer.h"

@implementation Analyzer


-(void)foo:(NSString *)bar{
    NSMutableDictionary *statictics=[NSMutableDictionary new];
    
    NSArray *words=[bar componentsSeparatedByString:@" "];
    for(NSString *word in words){
        NSNumber *repetitions=[statictics valueForKey:word];
        
        [statictics setObject:[[NSNumber alloc] initWithLong:([repetitions integerValue]+1)] forKey:word];
    }
	NSArray *sortedKeys=[statictics keysSortedByValueUsingComparator:
						 ^NSConparisonResult(id obj1, id obj2){
						 return [obj2 compare:obj1];
						 }]
						 
	
	for(int i=0; i<[sortedKeys count] && i<5; i++)
	NSLong(@"%@ %@", sortedKeys[i], [statictics valueForKey:sortedKeys[i]]);
}

@end
