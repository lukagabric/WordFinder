#import <Foundation/Foundation.h>
#import "GraphNode.h"


@interface DirectionalGraph : NSObject


- (void)addEdgeFromNode:(GraphNode *)node1 toNode:(GraphNode *)node2;
- (void)addBidirectionalEdgeFromNode:(GraphNode *)node1 toNode:(GraphNode *)node2;


@end