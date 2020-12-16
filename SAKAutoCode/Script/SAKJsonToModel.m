//
//  SAKJsonToModel.m
//  SAKAutoCode
//
//  Created by Fan Li Lin on 2020/12/16.
//

#import "SAKJsonToModel.h"

@implementation SAKJsonToModel

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
            
   
        }];
    }
    else if ([JSONObject isKindOfClass:[NSDictionary class]]) {
        return [self propertyCodeWithDictionary:JSONObject];
    }
    return outputCode;
}

+ (NSString *)propertyCodeWithDictionary:(NSDictionary *)dict
{
    __block NSString *outputCode = @"";
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *temp = @"";
        NSLog(@"%@",[obj class]);
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")] || [obj isKindOfClass:NSClassFromString(@"NSTaggedPointerString")] || [obj isKindOfClass:NSClassFromString(@"__NSCFConstantString")]) {
            temp = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            temp = [NSString stringWithFormat:@"@property (nonatomic, strong) NSNumber *%@;",key];
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")] || [obj isKindOfClass:NSClassFromString(@"__NSArrayI")] || [obj isKindOfClass:NSClassFromString(@"__NSArray0")]) {
            temp = [NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",key];
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")] || [obj isKindOfClass:NSClassFromString(@"__NSDictionaryI")]) {
            temp = [NSString stringWithFormat:@"@property (nonatomic, copy) NSDictionary *%@;",key];
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            temp = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",key];
        }
        if (temp.length > 0) {
            outputCode = [outputCode stringByAppendingFormat:@"\n%@", temp];
        }
    }];
    return outputCode;
}

@end
