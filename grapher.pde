/* a program for creating a bar graph based on an input array.
 objectives:
 -accept arrays of different lengths and adjust accordingly
 -adjust the scale of the graph to fit the array values
 -allow for viewing the data in different ways
 */
//====================================================================

Button sortButton;
Graph mainGraph;
float[] dataArray = new float[10];
int ticker = 10; 
int cooldown = 15;

void setup() {
  size (800, 700);
  declareArray(); //function to fill the array with 10 random float values
  sortButton = new Button(100, height-50, 15, 15);
  mainGraph = new Graph (dataArray.length, min(dataArray), max(dataArray));
  mainGraph.drawGraphLines();
  float sortedArray[] = sort(dataArray); //function to order the data array
} //end setup

void draw () {
  mainGraph.display(sortButton.clickCheck());
  sortButton.display(255, 0, 555);
  sortButton.clickCheck();
  //printArray(dataArray);
  ticker+=1;
  println();
}//end draw