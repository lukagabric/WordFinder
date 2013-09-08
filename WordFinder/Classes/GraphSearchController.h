#import <Foundation/Foundation.h>
#import "GraphNode.h"
#import "DirectionalGraph.h"


@interface GraphSearchController : NSObject
{
	NSMutableArray *_nodes;
	NSMutableArray *_visited;
	NSMutableArray *_dataSource;
	NSMutableArray *_allPaths;
	NSMutableArray *_allWords;
	NSMutableDictionary *_wordPathDict;

	GraphNode *_startNode;
	GraphNode *_endNode;

	DirectionalGraph *_graph;
}


- (void)startSearch;


@end