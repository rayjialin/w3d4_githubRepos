//
//  RepoModel.h
//  GithubRepos
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Repo.h"
#import "ViewController.h"


@interface RepoModel : NSObject 
@property (nonatomic) Repo *repo;
@property (nonatomic) NSMutableArray *repoArray;
@property (nonatomic) NSArray *repoJson;
@property (nonatomic, weak) id <repoDelegate> delegate;

-(void)downloadRepo:(NSString *)urlString completionBlock:(void(^)(void))completion;
@end
