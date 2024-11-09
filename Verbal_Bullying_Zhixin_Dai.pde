PImage beingcyberbullied, cloud, girlshare, result;//Store the variables of the image
float cloudX = 0;// Initial horizontal position of the cloud
float cloudY = 50;// Initial ordinate position of the cloud
int page = 0, cx, cy;// Set the control page state and the coordinates of the center point to be used

Button back, next, send;// Three button objects
final int GAP = 20;// Define the gap between the button and the edge of the canvas
final int MAX = 2;// Define the maximum number of pages


void setup() { //setup base
  size(521, 737); //size
  beingcyberbullied = loadImage("Being cyberbullied.png");// Load images of girls who have been cyberbullied
  girlshare = loadImage("Girl happy to share.png");// Load happy girl image
  cloud = loadImage("cloud.png");// Load cloud&bird image
  result = loadImage("The result of cyberbullying.png");// Load the resulting image of cyberbullying
  imageMode(CORNER); // Set the mode of the image
  textAlign(CENTER,CENTER);// Set the text alignment to center
  
  stroke(0);// Set the current stroke color
  strokeWeight(1.5);
  
  // Set the horizontal and vertical coordinates of the center point
  cx = width >>1;
  cy = height >>1;
  
  back = new Button("BACK", GAP, height - Button.H - GAP);// Create a back button location
  next = new Button("NEXT", width - Button.W - GAP, height - Button.H - GAP);// Create the next button location
  send = new Button("SEND", width / 2 - Button.W / 2, height - Button.H - GAP);// Create a send button
}

void draw() { //Set the main content (loop)
  background(255);//background
 
 //Set program to decide which code to execute
  if (page == 0) {
    // Page 0: girlshare with cloud
    image(girlshare, 0, 0); // GIRLSHARE
    image(cloud, cloudX, cloudY, 410, 590); // CLOUD SIZE
    cloudX += 2; // MOVE TO RIGHT
    
  if (cloudX>width){
    cloudX=-cloud.width/2;//reset cloud
}

 send.display(); // Display SEND button
  } else if (page == 1) {
    // Page 1: beingcyberbullied with dark background and bouncing text
    background(0); // background
    image(beingcyberbullied, 52, 300); // Girl being cyberbullied

    // Display random messages
    fill(170, 0, 10);
    textSize(20);
    for (int i = 0; i < 10; i++) {//Loop to generate 10 randomly positioned barrage texts
      float x = random(width);
      float y = random(height);
      //Display the "Critical message" text in a random position to simulate the barrage effect
      text("Critical message", x, y);
    }

    back.display(); // Display BACK button
    next.display(); // Display NEXT button
  } else if (page == 2) { // If the current page is the third page
  
    background(#E8E5E5);//bacground color
    image(result, (width - result.width) / 2, (height - result.height) / 2); // Centered result image

    //Set text
    fill(#FF0000);//color
    textSize(20);//textsize
    stroke(10);// Set the current stroke color
    text("Words can kill, and bullying leaves an unbearable life wound.", cx, 60);//set Slogan

    back.display(); // Display BACK button
  }
}
void mousePressed() { //settings mousePressed clicled event
    //Set program to decide which code to execute
  if (mouseX > send.x && mouseX < send.x + Button.W && mouseY > send.y && mouseY < send.y + Button.H && page == 0) {
    page = 1;// Switch to the second page
  }
    // Check if mouse is within the BACK button area and page is big than 0
  if (mouseX > back.x && mouseX < back.x + Button.W && mouseY > back.y && mouseY < back.y + Button.H && page > 0) {
    page--;// Go back to the previous page
  }
   // Check if mouse is within the NEXT button area and page is less than MAX
  if (mouseX > next.x && mouseX < next.x + Button.W && mouseY > next.y && mouseY < next.y + Button.H && page < MAX) {
    page++; //to the next page
  }
}


// Button class definition
class Button {
  static final int W = 100; //The width of the button.
  static final int H = 50; //The height of the button.
  static final int TXTSZ = 16; //size
  static final int TXTC = 255; //color

  String label; //Label text used to store the button
  int x, y;// Button position coordinates.

  Button(String label, int x, int y) { // creates button object, sets label and position.
    this.label = label;//Assign a variable
    this.x = x;//Set abscissa
    this.y = y;//Set ordinate
  }

  void display() { //Drawing buttons
    fill(#AA2E2E); //color
    rect(x, y, W, H, 10); //draw
    fill(0);//set text color
    textAlign(CENTER, CENTER);//Set text position
    textSize(20);//size
    text(label, x + W / 2, y + H / 2);//Draws label text in the center of the button.
  }
}
