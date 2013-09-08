#import <Foundation/Foundation.h>


@interface GraphNode : NSObject
{
	NSMutableArray *_adjacent;
	NSString *_nodeName;
	NSString *_nodeValue;
}


- (void)addAdjacentNode:(GraphNode *)node;
- (NSArray *)adjacentNodes;


@property (nonatomic, strong) NSString *nodeName;
@property (nonatomic, strong) NSString *nodeValue;


@end