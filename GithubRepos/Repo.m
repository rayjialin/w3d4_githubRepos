//
//  Repo.m
//  GithubRepos
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fullName = [NSString new];
        _repoName = [NSString new];
        _repoId = [NSString new];
    }
    return self;
}

@end
