//
//  RepoModel.m
//  GithubRepos
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "RepoModel.h"

@implementation RepoModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _repo = [Repo new];
        _repoArray = [NSMutableArray new];
        _repoJson = [NSArray new];
    }
    return self;
}

-(void)downloadRepo:(NSString *)urlString completionBlock:(void(^)(void))completion {
    self.repoJson = [NSArray new];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDataTask *downloadTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"fetch failed");
            return;
        }
        
        NSError *jsonError = nil;
        self.repoJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError){
            NSLog(@"json error");
            return;
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            for (NSDictionary *repo in self.repoJson){
                
                Repo *newRepo = [Repo new];
                
                newRepo.repoName = repo[@"name"];
                newRepo.fullName = repo[@"full_name"];
                newRepo.repoId = repo[@"id"];
                [self.repoArray addObject:newRepo];
//                NSLog(@"%li", self.repoArray.count);
            }
            
//            completion();
            [self.delegate updateUI];
            
        }];

    }];
    
    [downloadTask resume];

}

@end
