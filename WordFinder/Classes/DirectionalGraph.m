#import "DirectionalGraph.h"


@implementation DirectionalGraph


- (void)addEdgeFromNode:(GraphNode *)node1 toNode:(GraphNode *)node2
{
	[node1 addAdjacentNode:node2];
}


- (void)addBidirectionalEdgeFromNode:(GraphNode *)node1 toNode:(GraphNode *)node2
{
	[node1 addAdjacentNode:node2];
	[node2 addAdjacentNode:node1];
}


@end