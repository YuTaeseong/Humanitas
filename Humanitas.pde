/**
 * Request Image
 * by Ira Greenberg ( From Processing for Flash Developers). 
 * 
 * Shows how to use the requestImage() function with preloader animation. 
 * The requestImage() function loads images on a separate thread so that 
 * the sketch does not freeze while they load. It's very useful when you are
 * loading large images. 
 * 
 * These images are small for a quick download, but try it with your own huge 
 * images to get the full effect. 
 * modified by Yu tae seong
 */

int imgCount = 1000;
PImage[] imgs = new PImage[imgCount];
float imgW;

// Keeps track of loaded images (true or false)
boolean[] loadStates = new boolean[imgCount];

// For loading animation
float loaderX, loaderY, theta;

void setup() {
  size(2000, 360);
  imgW = width/imgCount;

  // Load images asynchronously
  for (int i = 1; i <= imgCount; i++){
    imgs[i-1] = requestImage(i+2000+".jpg");
  }
}

void draw(){
  background(0);
  
  // When all images are loaded draw them to the screen
    drawImages();
}

void drawImages() {
  int y = (height - imgs[0].height) / 2;
  for (int i = 0; i < imgs.length; i++){
    image(imgs[i], width/imgs.length*i, y, imgs[i].height, imgs[i].height);
  }
}
