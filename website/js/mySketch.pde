import processing.sound.*;


// This variable is for the microphone input
var mic;
// These variables represent the colors for the lines of the sphere
var lr;
var lg;
var lb;
// These variables represent the color of the sphere
var sr;
var sg;
var sb;
// These variables control the rotation speed and direction of the sphere
var rx; 
var ry;
// This variable is for the strokeWeight
var sw;
// This is the mic level
var ml;

 void setup() {	
	mic =  new AudioIn(this,0);
	mic.start();
	createCanvas(windowWidth, windowHeight,WEBGL);
	lr = 0;
	lg = 0;
	lb = 0;
	sr = 255;
	sg = 255;
	sb = 255;
	rx= 0.01;
	ry= 0.01;
	sw= 25;
	ml= 0.00;
}

void draw() {
	
	background(sr,sg,sb);
	
	fill(sr,sg,sb);
	stroke(lr,lg,lb);
	strokeWeight(sw);
	rotateX(frameCount * rx );
	rotateY(frameCount * ry);
	sphere(height);
	
	if(keyIsDown(UP_ARROW)) {
		rx+=.0002;
	} else if(keyIsDown(DOWN_ARROW)) {
		rx-=.0002;
	} else if(keyIsDown(LEFT_ARROW)) {
		ry-=.0002;
	} else if (keyIsDown(RIGHT_ARROW)) {
		ry+=.0002;
	} else if( keyIsDown(ENTER) ) {
			changeSphereColor();
	}
	
	while(ml >=0.1) {
		sw = random(25)+ 25;
		changeColorMic();
		break;
	}
		ml=mic.getLevel();
	
}
// Clicking the mouse changes its color and randomly sets the rotation speed and direction
  void mouseClicked() {
	changeSphereColor();
	rx = random(.01);
	ry= random(.01);
}

void changeSphereColor() {
	sr= random(256);
	sg= random(256);
	sb= random(256);
	}

  void changeColorMic() {
	lr = random(ml)+random(256);
	lg = random(ml)+random(256);
	lb = random(ml)+random(256);	
}
