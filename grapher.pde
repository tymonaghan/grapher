/* a program for creating a bar graph based on an input array.
objectives:
  -accept arrays of different lengths and adjust accordingly
  -adjust the scale of the graph to fit the array values
  -allow for viewing the data in different ways
  */
//====================================================================

float[] dataArray = new float[10];

void setup() {
  size (800,600);
  declareArray(); //function to fill the array with 10 random float values
  drawGraphLines();

} //end setup

void draw () {

  printArray(dataArray);
  sort(dataArray); //function to order the data array
  drawGraphBars(100,height-50);
}//end draw