//
//  ViewController.h
//  GithubRepos
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RepoModel.h"
#import "Repo.h"
@class RepoModel;

@protocol repoDelegate <NSObject>
-(void)updateUI;
@end

@interface ViewController : UIViewController <repoDelegate>

@property (nonatomic) RepoModel *repoModel;
@end

