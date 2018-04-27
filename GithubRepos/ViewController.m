//
//  ViewController.m
//  GithubRepos
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "ViewController.h"
#import "RepoModel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property Repo *repo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.repoModel = [RepoModel new];
    self.repoModel.delegate = self;
    
//    [self.repoModel downloadRepo:@"https://api.github.com/users/rayjialin/repos" completionBlock:^{
//            [self.tableView reloadData];
//    }];
    
    [self.repoModel downloadRepo:@"https://api.github.com/users/rayjialin/repos" completionBlock:nil];
    NSLog(@"%li", self.repoModel.repoArray.count);
    
}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"repoId" forIndexPath:indexPath];
    self.repo = [Repo new];
    self.repo = [self.repoModel.repoArray objectAtIndex:indexPath.row];
    cell.textLabel.text = self.repo.repoName;
    cell.detailTextLabel.text = self.repo.fullName;
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repoModel.repoArray.count;
}

-(void)updateUI{
    [self.tableView reloadData];
}
@end
