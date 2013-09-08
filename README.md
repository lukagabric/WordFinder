WordFinder
==========

Graph theory - Objective C Breadth-first search example

I’ve made an example where graph theory and Breadth-first search comes in hand using a simple game. “Wordz” was very popular for a while, if you don’t know the game itself you are probably familiar with the game concept where you have to connect given letters which would then form a word. The more letters in the word, the more points you get. The game in this example has 4×4 letter matrix and the words may be assembled from letters in all directions (not just vertically and horizontally). For 16 given letters that form the 4×4 matrix, all possible words are listed (with matrix coordinates for connecting each letter in the word) using the Breadth-first search algorithm.

[![](http://a4.mzstatic.com/us/r30/Purple/v4/f5/a2/78/f5a27824-9200-d2e2-c1bb-bd1ff4dc5e02/screen568x568.jpeg)](http://a4.mzstatic.com/us/r30/Purple/v4/f5/a2/78/f5a27824-9200-d2e2-c1bb-bd1ff4dc5e02/screen568x568.jpeg)

There are three main objects: graph node, directional graph and the search controller.

Every node has a list of other nodes it’s adjacent to. Graph adds the nodes via the addAdjacentNode: method:


    @interface GraphNode : NSObject
    {
	    NSMutableArray *_adjacent;
	    NSString *_nodeName;
    	NSString *_nodeValue;
    }

    - (void)addAdjacentNode:(GraphNode *)node;
    - (NSArray *)adjacentNodes;
    
Using the DirectionalGraph object the nodes are connected forming the Graph.

    @interface DirectionalGraph : NSObject

    - (void)addEdgeFromNode:(GraphNode *)node1 toNode:(GraphNode *)node2;
    - (void)addBidirectionalEdgeFromNode:(GraphNode *)node1 toNode:(GraphNode *)node2;

    @end
    
Search controller is used for performing the Breadth-first search on the DirectionalGraph object.

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
    
_nodes array contains all 16 node object representing each letter

_visited is used for the BFS algorithm to track the nodes that have already been visited

_dataSource is the array of words to match BFS results

_allPaths, _allWords and _wordPathDict are used to store BFS results

_startNode and _endNode are the two nodes the BFS is trying to find the path between; the BFS algorithm is executed for each two nodes in the graph

Input
-----

In GraphSearchController.m:

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

Output
------

All found words and letter locations are logged in the console, eg. resources:

'resources'
(
    "r - (1,1)",
    "e - (2,2)",
    "s - (3,3)",
    "o - (4,4)",
    "u - (4,3)",
    "r - (3,4)",
    "c - (2,4)",
    "e - (1,3)",
    "s - (2,3)"
)
