//
//  SAKCustomScript01.m
//  SAKAutoCode
//
//  Created by Fan Li Lin on 2020/12/16.
//

#import "SAKCustomScript01.h"

@implementation SAKCustomScript01

+ (NSString *)outputCodeWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    id JSONObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:kNilOptions
                                                      error:&error];
    if(error) {
        return error.description;
    }
    NSLog(@"JSONObject = %@", JSONObject);
    
    __block NSString *outputCode = @"";
    
    if ([JSONObject isKindOfClass:[NSArray class]]) {
        [((NSArray *)JSONObject) enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *title = obj[@"title"];
            NSString *titleId = obj[@"titleId"];
            NSString *ios = obj[@"ios"];
            NSString *android = obj[@"android"];
            
            NSString *temp = [NSString stringWithFormat:@"[self creatVCInfoWithIOS:@\"%@\" android:@\"%@\" titile:@\"%@\" titleId:@\"%@\"];", ios, android, title, titleId];
            outputCode = [outputCode stringByAppendingFormat:@"\n%@", temp];
        }];
    }
    return outputCode;
}

@end
