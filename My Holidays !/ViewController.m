//
//  ViewController.m
//  My Holidays !
//
//  Created by Jitendra Kadam on 6/3/17.
//  Copyright © 2017 Jitendra Kadam. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

@interface ViewController (){
    
    NSArray *holiday;
    NSArray *sectionHeaders;
    NSArray *myImages;
    NSArray *details;
    NSArray *rowDetails;
    NSArray *cellTitle;
    NSArray *items;
    
}

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    
    //[_myTableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
     NSLog(@"her %@", [holiday objectAtIndex:section]);
    
    return [[[holiday objectAtIndex:section] valueForKey:@"details"]count];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return holiday.count;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    return [NSString stringWithFormat: @"%@", [sectionHeaders objectAtIndex:section]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *myCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    myCell.textLabel.text = [[[[holiday objectAtIndex:indexPath.section] valueForKey:@"details"] objectAtIndex:indexPath.row] valueForKey:@"title"];
    
    myCell.detailTextLabel.text = [[[[holiday objectAtIndex:indexPath.section] valueForKey:@"details"] objectAtIndex:indexPath.row] valueForKey:@"date"];
    
    //myCell.backgroundColor = [UIColor ];
    
    
    //NSLog(@"%@", myCell.backgroundColor);
    NSLog(@"%@", myCell.textLabel.text);
    
    //[myCell setImage:[myImages objectAtIndex:indexPath.row]]
    
    //rowDetails = [details objectAtIndex:indexPath.row];
    
    return myCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [myImages objectAtIndex: section]]];
    
    imageView.frame = CGRectMake(10,10,300,100);
    
    return imageView;
}



/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return holiday.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [NSString stringWithFormat:@"%d",sectionHeaders.count];
}*/






- (IBAction)show:(UIButton *)sender {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"https://www.mahindralylf.com/apiv1/getholidays" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        holiday = [responseObject objectForKey:@"holidays"];
        sectionHeaders = [holiday valueForKey:@"month"];
        myImages = [holiday valueForKey:@"image"];
        details = [holiday valueForKey:@"details"];
        cellTitle = [details valueForKey:@"title"];
        
        for (items in details) {
            
            NSLog(@"show method %@", items);
        }
       
        
        /*NSLog(@"%d", holiday.count);
        NSLog(@"%@", sectionHeaders);
        NSLog(@"%d", myImages.count);*/
        //NSLog(@"%@", cellTitle);
        
        [_myTableView reloadData];

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@", error.localizedDescription);
        
    }];
    

}
@end
