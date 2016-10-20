////
////  DBManager.m
////  IOSDemo
////
////  Created by niuhome_vip on 16/10/12.
////  Copyright © 2016年 niuhome_vip. All rights reserved.
////
//
//#import "DBManager.h"
//
//static DBManager *sharedInstance = nil;
//static sqlite3 *database = nil;
//static sqlite3_stmt *statement = nil;
//
//@implementation DBManager
//+(DBManager*)getSharedInstance{
//    if (!sharedInstance) {
//        sharedInstance = [[super allocWithZone:NULL]init];
//        [sharedInstance createDB];
//    }
//    return sharedInstance;
//}
//
//-(BOOL)createDB{
//    NSString *docsDir;
//    NSArray *dirPaths;
//    // Get the documents directory
//    dirPaths = NSSearchPathForDirectoriesInDomains
//    (NSDocumentDirectory, NSUserDomainMask, YES);
//    docsDir = dirPaths[0];
//    // Build the path to the database file
//    databasePath = [[NSString alloc] initWithString:
//                    [docsDir stringByAppendingPathComponent: @"student.db"]];
//    BOOL isSuccess = YES;
//    NSFileManager *filemgr = [NSFileManager defaultManager];
//    if ([filemgr fileExistsAtPath: databasePath ] == NO)
//    {
//        const char *dbpath = [databasePath UTF8String];
//        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
//        {
//            char *errMsg;
//            const char *sql_stmt =
//            "create table if not exists studentsDetail (regno integer primary key, name text, department text, year text)";
//            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg)
//                != SQLITE_OK)
//            {
//                isSuccess = NO;
//                NSLog(@"Failed to create table");
//            }
//            sqlite3_close(database);
//            return  isSuccess;
//        }
//        else {
//            isSuccess = NO;
//            NSLog(@"Failed to open/create database");
//        }
//    }
//    return isSuccess;
//}
//
//- (BOOL) saveData:(NSString*)registerNumber name:(NSString*)name
//       department:(NSString*)department year:(NSString*)year;
//{
//              return nil;
//        }
//@end
