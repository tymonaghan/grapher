void declareArray() {
  for (int i = 0; i < dataArray.length; i++) {
    dataArray[i] = random (100);
  }// end for
} // end declareArray

/* manualPrintArray() {  // a function that duplicates the functionality of the printArray function.
 for (int i = 0; i < dataArray.length; i++) {
 println(i+":"+dataArray[i]);
 }// end for
 }// end manualPrintArray 
 */

void drawGraphLines() {
  int xOrigin = 100;
  int yOrigin = height-50;
  drawXaxis(xOrigin, yOrigin);
  drawYaxis(xOrigin, yOrigin);
}

void drawXaxis(int xOrigin, int yOrigin) {
  textAlign(CENTER);
  fill(0);
  line (xOrigin, yOrigin, width-50, yOrigin); //draw X axis
  text ("x-axis", width-40, yOrigin);

  for (int xVal = 0; xVal < 101; xVal+=10) { //for loop to draw x Axis labels
    fill(0);
    text(xVal, (xOrigin)+(xVal*6), yOrigin+15);
    stroke(150);
    line((xOrigin+xVal*6), yOrigin, (xOrigin+xVal*6), 0);
  } //end for loop
} //end drawXaxis function

void drawYaxis(int xOrigin, int yOrigin) {
  textAlign(CENTER);
  fill(0);
  line(xOrigin, yOrigin, xOrigin, 50); //draw Y axis
  text ("y-axis", xOrigin, 25);
  for (int yVal =  0; yVal < 11; yVal++) {
    textAlign(RIGHT);
    text ("array pos:"+yVal, xOrigin-5, (yOrigin)-(yVal*45)-35);
  }
}

void drawGraphBars(int xOrigin, int yOrigin) {
  rectMode(CORNER);
  for (int i = 0; i < dataArray.length; i++) {
    textAlign(LEFT);
    fill (dataArray[i]*2.5, 100, 100);
    rect (xOrigin,yOrigin-i*50-50, dataArray[i]*6, 20);
    text (dataArray[i], xOrigin, yOrigin-i*50-50);
  } //end for loop
} //end drawBars