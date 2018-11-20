int width = 800;
int height = 400;
float ratio = width / height;
int counter = 0;
ArrayList<Float> x;
ArrayList<Float> y;

int r = 12;  // radius of points
int max = 200;  // maximum points (trying to generate)
float slope = 1.75;  // just a number to modify the slope of second function
float magic = 0.006; // because result of second function is just too big; could control the weight of second function 
float threshold = 0.6;  // a controller, read comment at line 67
float diagonal_length = (float)Math.sqrt(Math.pow(width, 2) + Math.pow(height, 2)); // distance from Point(width, height) to Point(0, 0)

/* ratio of color mode (8:5:2) */
float modA = 2+3+8;
float modB = 2+3;
float modC = 2;

void setup(){
  size(800, 400);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  background(248, 248, 248);
}

void mousePressed(){
  counter++;
  save(counter + ".png");
}

void draw(){
  fill(248, 248, 248);
  rect(0, 0, width, height);  // redraw the background
  x = new ArrayList<Float>();
  y = new ArrayList<Float>();
  for(int i = 0; i < max; i++) {
    /* generation part */
    // 8 is spacing between point and wall
    float tempX = (float)random(8, width - 8);
    float tempY = (float)random(8, height - 8);

    /* two functions here */
    // for first function, distance between Point(X1, Y1) and Point(X2, Y2) is (√((X1 - X2)^2 + (Y1 - Y2)^2))
    // for Point(0, 0), X2 = 0, Y2 = 0
    // after above, (point_distance / diagonal_length) is a ratio between [0, 1], if close to 0, than the point close to Point(0, 0), if close to 1, than the point close to Point(width, height)
    float probability1 = (float)((Math.sqrt(Math.pow(tempX, 2) + Math.pow(tempY, 2))) / diagonal_length);
    System.out.println("probability1: " + probability1);

    // for second function, distance between Point(X0, Y0) and Line(A*x + B*y + C = 0) is (|A*X0 + B*Y0 + C| / √(A^2 + B^2))
    // for Line(y = x), A = 1, B = -1, C = 0
    // "ratio" is used to modify Line(y = x) to Line(y * ratio = x), which is Line(height = width)
    float probability2 = magic * (float)(Math.abs(1 * tempX - 1 * ratio * slope * tempY + 0) / Math.sqrt(Math.pow(1, 2) + Math.pow(1 * ratio * slope, 2)));
    System.out.println("probability2: " + probability2);

    // here I just plus two probabilities
    float totalProbability = probability1 + probability2;

    //System.out.println("probability: " + totalProbability);

    float naturalize = random(0.6, 1.4);  // makeing generation looks more natural
    // if totalProbability greater or equal to (threshold * naturalize), than generate this point
    if(totalProbability <= (threshold * naturalize)) {
      x.add(tempX);
      y.add(height - tempY);  // flip Y axis
    }
  }
  
  /* draw points */
  for(int i = 0; i < x.size(); i++) {
    float color1 = random(0, modA);
    if(color1 < modC) {
      if(random(0, 1) < 0.5) {
        fill(246, 164, 140);
      }
      else {
        fill(224, 100, 134);
      }
      ellipse(x.get(i), y.get(i), r, r);
    }
    else if(color1 < modB) {
      float color2 = random(0, 3);
      if(color2 < 1) {
        fill(110, 204, 180);
        ellipse(x.get(i), y.get(i), r, r);
        fill(246, 164, 140);
        arc(x.get(i), y.get(i), r, r, QUARTER_PI, QUARTER_PI + PI);
      }
      else if(color2 < 2) {
        fill(110, 204, 180);
        ellipse(x.get(i), y.get(i), r, r);
        fill(60, 140, 206);
        arc(x.get(i), y.get(i), r, r, -QUARTER_PI, PI - QUARTER_PI);
      }
      else {
        fill(110, 204, 180);
        ellipse(x.get(i), y.get(i), r, r);
        fill(224, 100, 134);
        arc(x.get(i), y.get(i), r, r, -HALF_PI, HALF_PI);
      }
    }
    else {
      fill(110, 204, 180);
      ellipse(x.get(i), y.get(i), r, r);
    }
  }
  delay(1000);
}
