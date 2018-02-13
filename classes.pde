//class Graph {
// int maxVal, minVal
//}

class Button {
  int xSize, ySize, xPos, yPos, stringNum, buttonFunction;
  color bColor, tColor;
  boolean buttonTicked, drawSortedVersion;

  Button(int xPos_, int yPos_, int xSize_, int ySize_) {
    xPos = xPos_;
    yPos = yPos_;
    xSize = xSize_;
    ySize = ySize_;
  } // end button constructor

  void display (color bColor_, color tColor_, int stringNum_) {
    stringNum = stringNum_;
    bColor = bColor_;
    tColor = tColor_;
    String buttonText = "sort";

    rectMode(CENTER);
    stroke(0);
    strokeWeight(2);
    fill(bColor);
    textAlign(LEFT, CENTER);
    rect (xPos, yPos, xSize, ySize);
    fill (tColor);
    text(buttonText, xPos+10, yPos);
    if (buttonTicked == true) //draw an X to tick the box when buttonTicked == true
    {
      textAlign(CENTER, CENTER);
      text("X", xPos, yPos);
    }//end if
  } // end display

  boolean clickCheck () 
  {
    if (mousePressed == true && ticker > cooldown) 
    {
      if (mouseX > xPos-xSize/2 && mouseX < xPos+xSize/2 && mouseY > yPos-ySize/2 && mouseY < yPos +yPos/2) 
      {
        this.executeButton();
        ticker = 0; //set ticker to 0 - prevents multiple clicks
        return true;
      }// end if mouse position check
    } // end if mousePressed
    return false;
  }//end clickCheck

  boolean executeButton () //function for handling when buttons are clicked/toggled
  {
    displayRefresh();
    println("Button clicked"); //debug -- print "button clicked" to console
    buttonTicked = ! buttonTicked; //toggle the boolean buttonTicked
    return buttonTicked;
  }//end executeButton

  boolean getTicked() //function for checking if a button is toggled on or off
  {
    if (buttonTicked==true)
    {
      //println(buttonTicked);

      return true;
    } else 
    {
      println(buttonTicked);
      return false;
    }
  } // end getTicked
} //end Button class

//=================END BUTTON CLASS===

//=================BEGIN GRAPH CLASS===
class Graph {
  int arraySize;
  float arrayMin, arrayMax;
  int xOrigin = 100;
  int yOrigin = height-150;
  boolean drawSortedVersion;

  Graph(int arraySize_, float arrayMin_, float arrayMax_) {
    arraySize = arraySize_;
    arrayMin = arrayMin_;
    arrayMax = arrayMax_;
  } //end graph constructor

  void display(boolean drawSortedVersion_) {
    drawSortedVersion = drawSortedVersion_;
    rectMode(CORNER);
    if (!drawSortedVersion)
    {
      for (int i = 0; i < dataArray.length; i++) {
        textAlign(LEFT);
        fill (dataArray[i]*2.5, 100, 100); //color coding changes depending on value
        rect (xOrigin, yOrigin-i*50-50, dataArray[i]*6, 20); //the colored bars
        text (dataArray[i], xOrigin, yOrigin-i*50-50); //text labeling each bar with its value
      }// end for loop
    } else
    {
      float sortedArray[] = sort(dataArray); //function to order the data array
      for (int i = 0; i < dataArray.length; i++) {

        textAlign(LEFT);
        fill (sortedArray[i]*2.5, 100, 100); //color coding changes depending on value
        rect (xOrigin, yOrigin-i*50-50, sortedArray[i]*6, 20); //the colored bars
        text (sortedArray[i], xOrigin, yOrigin-i*50-50); //text labeling each bar with its value
      }
    } //end else
  }//end graph.display

  void drawGraphLines() {
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
    }//end for loop
  }//end drayYaxis function
}//end Graph class