//
//  ViewController.m
//  Task2_v2
//
//  Created by fpmi on 14.04.17.
//  Copyright (c) 2017 Andrei Mashko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *indicator;
@property (strong, nonatomic) IBOutlet UITextField *city;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)refresh:(id)sender {
    
    NSMutableString *UR = [NSMutableString stringWithString:@"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22"];
    [UR appendString:[[self city] text]];
    [UR appendString:@"%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"];
    
    NSURL *url = [[NSURL alloc] initWithString:UR];
    NSData *contents = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *forecasting = [NSJSONSerialization JSONObjectWithData:contents options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *currentForecast = [[[[[forecasting valueForKey:@"query"] valueForKey:@"results"]valueForKey:@"channel"]valueForKey:@"item"] valueForKey:@"condition"];
    
    NSString *temperature=[currentForecast valueForKey:@"temp"];
    
    double temp=[temperature doubleValue];
    temp=(temp - 32.0) * 5.0 / 9.0;
    

    NSLog(@"%@", temperature);
    
    [self.indicator setText:[NSString stringWithFormat:@"%lf C ", temp]];
    if(temp > 25) [[self indicator] setTextColor:[UIColor redColor]];
    else if(temp > 5) [[self indicator] setTextColor:[UIColor orangeColor]];
    else [[self indicator] setTextColor:[UIColor blueColor]];
}



@end
