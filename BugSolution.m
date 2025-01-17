#import <Foundation/Foundation.h>

@interface ParentClass : NSObject
- (id)getObject;
@end

@implementation ParentClass
- (id)getObject {
    return [NSString stringWithString:@"Parent"];
}
@end

@interface ChildClass : ParentClass
- (NSString *)getObject; //Note the specific return type
@end

@implementation ChildClass
- (NSString *)getObject {
    return [NSString stringWithString:@"Child"];
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ParentClass *parent = [[ParentClass alloc] init];
        ChildClass *child = [[ChildClass alloc] init];

        //Unsafe - Potential runtime error
        id parentObject = [parent getObject];
        //Note that calling a specific string method on a 'id' object requires a type check
        if([parentObject isKindOfClass:[NSString class]])
        {
            NSLog(@"Parent Object: %@
",parentObject); //Safe
        }
        else
        {
            NSLog(@"Parent Object is not an NSString");
        }
        
        NSString *childObject = [child getObject]; //Safe - Compiler handles the casting to NSString
        NSLog(@"Child Object: %@
",childObject); //Safe
    }
    return 0;
}