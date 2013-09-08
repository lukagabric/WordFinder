#import "GraphNode.h"


@implementation GraphNode


@synthesize nodeValue = _nodeValue;
@synthesize nodeName = _nodeName;


- (id)init
{
    self = [super init];
    if (self)
	{
        _adjacent = [NSMutableArray new];
    }
    return self;
}


- (void)addAdjacentNode:(GraphNode *)node
{
	if (![_adjacent containsObject:node])
		[_adjacent addObject:node];
}

- (NSArray *)adjacentNodes
{
	return _adjacent;
}


- (NSString *)description
{
	return _nodeName && _nodeValue ? [NSString stringWithFormat:@"%@ - %@", _nodeValue, _nodeName] : @"(oops)";
}


@end