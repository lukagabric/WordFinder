#import "GraphSearchController.h"


@implementation GraphSearchController


#pragma mark - Init


- (id)init
{
    self = [super init];
    if (self)
	{
		[self initDataSource];
		[self initGraph];
    }
    return self;
}


#pragma mark - Data source


- (void)initDataSource
{
	//loading words from dictionary
	_dataSource = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dataSource" ofType:@"dat"]];
}


#pragma mark - Init graph


//4x4 matrix like the one below is used for graph search example

//A B C D
//E F G H
//I J K L
//M N O P


//e.g. for a matrix:
//    r l e a
//    n e s c
//    a m s r
//    r n u o
//inline presentation of the above 4x4 matrix
static NSString *valueString = @"rleanescamsrnruo";


- (void)initGraph
{
	//creating an array of valueString characters
	NSMutableArray *values = [[NSMutableArray alloc] initWithCapacity:[valueString length]];
	for (int i = 0; i < [valueString length]; i++)
	{
		NSString *aChar = [[valueString substringFromIndex:i] substringToIndex:1];
		[values addObject:aChar];
	}

	//creating nodes and assigning positions in the matrix as node names
	//used later to display locations of each letter in the matrix

	GraphNode *A = [GraphNode new]; A.nodeName = @"(1,1)";
	GraphNode *B = [GraphNode new]; B.nodeName = @"(1,2)";
	GraphNode *C = [GraphNode new]; C.nodeName = @"(1,3)";
	GraphNode *D = [GraphNode new]; D.nodeName = @"(1,4)";

	GraphNode *E = [GraphNode new]; E.nodeName = @"(2,1)";
	GraphNode *F = [GraphNode new]; F.nodeName = @"(2,2)";
	GraphNode *G = [GraphNode new]; G.nodeName = @"(2,3)";
	GraphNode *H = [GraphNode new]; H.nodeName = @"(2,4)";

	GraphNode *I = [GraphNode new]; I.nodeName = @"(3,1)";
	GraphNode *J = [GraphNode new]; J.nodeName = @"(3,2)";
	GraphNode *K = [GraphNode new]; K.nodeName = @"(3,3)";
	GraphNode *L = [GraphNode new]; L.nodeName = @"(3,4)";

	GraphNode *M = [GraphNode new]; M.nodeName = @"(4,1)";
	GraphNode *N = [GraphNode new]; N.nodeName = @"(4,2)";
	GraphNode *O = [GraphNode new]; O.nodeName = @"(4,3)";
	GraphNode *P = [GraphNode new]; P.nodeName = @"(4,4)";

	_nodes = [NSArray arrayWithObjects:A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, nil];

	for (int i = 0; i < [_nodes count]; i++)
	{
		//assigning letter values to nodes at that position in the matrix
		GraphNode *aNode = [_nodes objectAtIndex:i];
		aNode.nodeValue = [values objectAtIndex:i];
	}

	//creting a graph and assigning node relations
	_graph = [DirectionalGraph new];

	//assigning node relations for every node e.g. A is connected to B, F, and E
	[_graph addEdgeFromNode:A toNode:B];
	[_graph addEdgeFromNode:A toNode:F];
	[_graph addEdgeFromNode:A toNode:E];

	[_graph addEdgeFromNode:B toNode:A];
	[_graph addEdgeFromNode:B toNode:E];
	[_graph addEdgeFromNode:B toNode:F];
	[_graph addEdgeFromNode:B toNode:G];
	[_graph addEdgeFromNode:B toNode:C];

	[_graph addEdgeFromNode:C toNode:B];
	[_graph addEdgeFromNode:C toNode:F];
	[_graph addEdgeFromNode:C toNode:G];
	[_graph addEdgeFromNode:C toNode:H];
	[_graph addEdgeFromNode:C toNode:D];

	[_graph addEdgeFromNode:D toNode:C];
	[_graph addEdgeFromNode:D toNode:G];
	[_graph addEdgeFromNode:D toNode:H];

	[_graph addEdgeFromNode:E toNode:A];
	[_graph addEdgeFromNode:E toNode:B];
	[_graph addEdgeFromNode:E toNode:F];
	[_graph addEdgeFromNode:E toNode:J];
	[_graph addEdgeFromNode:E toNode:I];

	[_graph addEdgeFromNode:F toNode:A];
	[_graph addEdgeFromNode:F toNode:B];
	[_graph addEdgeFromNode:F toNode:C];
	[_graph addEdgeFromNode:F toNode:G];
	[_graph addEdgeFromNode:F toNode:K];
	[_graph addEdgeFromNode:F toNode:J];
	[_graph addEdgeFromNode:F toNode:I];
	[_graph addEdgeFromNode:F toNode:E];

	[_graph addEdgeFromNode:G toNode:B];
	[_graph addEdgeFromNode:G toNode:C];
	[_graph addEdgeFromNode:G toNode:D];
	[_graph addEdgeFromNode:G toNode:H];
	[_graph addEdgeFromNode:G toNode:L];
	[_graph addEdgeFromNode:G toNode:K];
	[_graph addEdgeFromNode:G toNode:J];
	[_graph addEdgeFromNode:G toNode:F];

	[_graph addEdgeFromNode:H toNode:D];
	[_graph addEdgeFromNode:H toNode:C];
	[_graph addEdgeFromNode:H toNode:G];
	[_graph addEdgeFromNode:H toNode:K];
	[_graph addEdgeFromNode:H toNode:L];

	[_graph addEdgeFromNode:I toNode:E];
	[_graph addEdgeFromNode:I toNode:F];
	[_graph addEdgeFromNode:I toNode:J];
	[_graph addEdgeFromNode:I toNode:N];
	[_graph addEdgeFromNode:I toNode:M];

	[_graph addEdgeFromNode:J toNode:E];
	[_graph addEdgeFromNode:J toNode:F];
	[_graph addEdgeFromNode:J toNode:G];
	[_graph addEdgeFromNode:J toNode:K];
	[_graph addEdgeFromNode:J toNode:O];
	[_graph addEdgeFromNode:J toNode:N];
	[_graph addEdgeFromNode:J toNode:M];
	[_graph addEdgeFromNode:J toNode:I];

	[_graph addEdgeFromNode:K toNode:F];
	[_graph addEdgeFromNode:K toNode:G];
	[_graph addEdgeFromNode:K toNode:H];
	[_graph addEdgeFromNode:K toNode:L];
	[_graph addEdgeFromNode:K toNode:P];
	[_graph addEdgeFromNode:K toNode:O];
	[_graph addEdgeFromNode:K toNode:N];
	[_graph addEdgeFromNode:K toNode:J];

	[_graph addEdgeFromNode:L toNode:H];
	[_graph addEdgeFromNode:L toNode:G];
	[_graph addEdgeFromNode:L toNode:K];
	[_graph addEdgeFromNode:L toNode:O];
	[_graph addEdgeFromNode:L toNode:P];

	[_graph addEdgeFromNode:M toNode:I];
	[_graph addEdgeFromNode:M toNode:J];
	[_graph addEdgeFromNode:M toNode:N];

	[_graph addEdgeFromNode:N toNode:M];
	[_graph addEdgeFromNode:N toNode:I];
	[_graph addEdgeFromNode:N toNode:J];
	[_graph addEdgeFromNode:N toNode:K];
	[_graph addEdgeFromNode:N toNode:O];

	[_graph addEdgeFromNode:O toNode:N];
	[_graph addEdgeFromNode:O toNode:J];
	[_graph addEdgeFromNode:O toNode:K];
	[_graph addEdgeFromNode:O toNode:L];
	[_graph addEdgeFromNode:O toNode:P];

	[_graph addEdgeFromNode:P toNode:O];
	[_graph addEdgeFromNode:P toNode:K];
	[_graph addEdgeFromNode:P toNode:L];
}


#pragma mark - Search logic


- (void)startSearch
{
	double timestamp = [NSDate timeIntervalSinceReferenceDate];

	//used to store word paths in the matrix
	_allPaths = [NSMutableArray new];
	
	//used to store words only
	_allWords = [NSMutableArray new];

	//dictionary to store node object for the found word
	//used to find nodes that form the found word and the locations those nodes are at
	_wordPathDict = [NSMutableDictionary new];

	int nodesCount = [_nodes count];
	int totalCount = nodesCount * (nodesCount - 1);
	int progress = 0;

	//iterating through all nodes and finding paths (potential words) from and to each node
	//e.g. A .... B, A .... C and so on... then B .... A, B .... C and so on...
	for (int i = 0; i < nodesCount; i++)
	{
		for (int j = 0; j < nodesCount; j++)
		{
			if (i != j)
			{
				progress++;

				NSLog(@"%.2f%%", 100 * (double)progress/(double)totalCount);

				_startNode = [_nodes objectAtIndex:i];
				_endNode = [_nodes objectAtIndex:j];

				_visited = [NSMutableArray new];
				[_visited addObject:_startNode];
				[self performDepthFirstSearch];
			}
		}
	}

	//now that all possible words have been added to the _allWords array interect with the data source will result in leaving only the words that are existing in the dictionary
	NSMutableSet *intersection = [NSMutableSet setWithArray:_allWords];
	[intersection intersectSet:[NSSet setWithArray:_dataSource]];

	NSArray *matches = [intersection allObjects];

	//the words are sorted so that the words with the biggest lenght (which bring most points) are at the top
	NSArray *sortedMatches = [matches sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
		NSString *str1 = (NSString *)obj1;
		NSString *str2 = (NSString *)obj2;

		if ([str1 length] == [str2 length])
		{
			return [str1 compare:str2];
		}

		return [str1 length] > [str2 length] ? NSOrderedAscending : NSOrderedDescending;
	}];

	//logging words with paths
	for (NSString *match in sortedMatches)
	{
		NSLog(@"\n'%@'\n%@", match, [_wordPathDict objectForKey:match]);
	}

	//logging words only
	for (NSString *match in sortedMatches)
	{
		NSLog(@"%@", match);
	}

	NSLog(@"done in %.2f seconds", [NSDate timeIntervalSinceReferenceDate] - timestamp);
}


- (void)performDepthFirstSearch
{
	//finding all possible solutions would take a really long time so word lengths are limited
	if ([_visited count] >= 9) return;

	NSArray *adjacentNodes = [[_visited lastObject] adjacentNodes];

	for (GraphNode *node in adjacentNodes)
	{
		if ([_visited containsObject:node])
		{
			continue;
		}

		if (node == _endNode)
		{
			[_visited addObject:node];
			//there are many short words that do not bring that many points so they will not be used
			if ([_visited count] > 4) [self foundAPath];
			[_visited removeLastObject];
		}
	}

	for (GraphNode *node in adjacentNodes)
	{
		if ([_visited containsObject:node] || node == _endNode)
		{
			continue;
		}

		[_visited addObject:node];
		[self performDepthFirstSearch];
		[_visited removeLastObject];
	}
}


- (void)foundAPath
{
	//nodes that compose a word are in the _visited array
	NSArray *wordComponents = [NSArray arrayWithArray:_visited];

	[_allPaths addObject:wordComponents];

	NSMutableString *word = [NSMutableString new];

	for (GraphNode *node in _visited)
	{
		[word appendString:node.nodeValue];
	}

	[_wordPathDict setObject:wordComponents forKey:word];

	[_allWords addObject:word];
}


#pragma mark -


@end