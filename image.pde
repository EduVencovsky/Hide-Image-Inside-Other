PImage originalImage;      
PImage messageImage; 
PImage messageEncoded;
PImage messageDecoded;

void setup() {
  size(800, 800);
  
  originalImage = loadImage("key.png");  
  messageImage = loadImage("message.png");  
  //image(messageImage, 0, 0);
  //image(originalImage, 0, 0);
  
  messageEncoded = createImage(originalImage.width, originalImage.height, RGB);
  messageDecoded = createImage(originalImage.width, originalImage.height, RGB);
  
  encodeImage();
  decodeImage();
}

void decodeImage() {
  
  originalImage.loadPixels();
  messageEncoded.loadPixels();
  messageDecoded.loadPixels();
  
  PImage msg = loadImage("messageEncoded.png");
  
  for (int x = 0; x < originalImage.width; x++) {
    for (int y = 0; y < originalImage.height; y++ ) {
      int loc = x + y * originalImage.width;
      
      if (msg.pixels[loc] == originalImage.pixels[loc]) {
        messageDecoded.pixels[loc] = color(255);
      } else {
        messageDecoded.pixels[loc] = color(0);
      }
    }   
  }
  
  messageDecoded.updatePixels();
  messageDecoded.save("messageDecoded.png");
  image(messageDecoded, 0, 0);
  
}

void encodeImage() {
  
  originalImage.loadPixels();
  messageImage.loadPixels();
  messageEncoded.loadPixels();

  for (int x = 0; x < originalImage.width; x++) {
    for (int y = 0; y < originalImage.height; y++ ) {
      int loc = x + y * originalImage.width;

      if (messageImage.pixels[loc] != color(255)) {
        float r = red(originalImage.pixels[loc]);
        float g = green(originalImage.pixels[loc]);
        float b = blue(originalImage.pixels[loc]);
        messageEncoded.pixels[loc] = color(r + 1, g + 1, b + 1);
      } else {
        messageEncoded.pixels[loc] = originalImage.pixels[loc];
      }
      
    }
  }

  messageEncoded.updatePixels();
  messageEncoded.save("messageEncoded.png");
  //image(messageEncoded, 0, 0);
  
}
