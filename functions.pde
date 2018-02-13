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
 
 void displayRefresh()
 {
   background(255);
   mainGraph.drawGraphLines();
 } //end displayRefresh function