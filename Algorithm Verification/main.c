// downsampling a square shape image by factor 2
#include <stdio.h>

// original image
int image[16] = {128, 100, 100, 140, 
                150, 80, 60, 50,
                10, 80, 50, 98,
                150, 180, 200, 125};

// properties of the original image
int image_width  = 4; // width of the image
int image_height = 4; // height of the image

// downsampled image
int downsampledimage[4]; // variable to store downsampled image

// properties of the downsampled image
int dsimage_width  = 2; // width of the downsampled image
int dsimage_height = 2; // height of the downsampled image

int main(){

    //Horizontal Convolution
    printf("Horizontal Convolution\n");
    int height_count = image_height;    
    int x = 0;
    while (height_count > 0){
        int y = 0;
        int a = 0; //zero padding(left)
        int b = 2 * image[x*image_width + y];
        int width_count = image_width - 1;
        while (width_count > 0){
            int c = image[x*image_width + y + 1];
            int new_pixel = (a + b + c)/4;
            image[x*image_width + y] = new_pixel; 
            printf("%i, ", new_pixel);
            //sliding window
            a = b/2;
            b = c*2;
            y += 1; //moving to next pixel
            width_count -= 1;
        }            
        int c = 0; //zero padding(right)
        int new_pixel = (a + b + c)/4;
        image[x*image_width + y] = new_pixel;
        printf("%i, ", new_pixel);

        
        x += 1; // moving to next row
        height_count -= 1;

        printf("\n");
    }

    //Vertical Convolution
    printf("\nVertical Convolution\n");
    int width_count = image_width;
    int y = 0;
    while (width_count > 0){

        int x = 0;
        int a = 0; //zero padding(top)
        int b = 2*image[x*image_width + y];
        int height_count = image_height - 1;

        while (height_count > 0){
            int c = image[x*image_width + image_width + y];
            int new_pixel = (a + b + c)/4;
            image[x*image_width + y] = new_pixel;
            printf("%i, ", new_pixel);
            //sliding window
            a = b/2;
            b = c*2;
            x += 1; //moving to next pixel
            height_count -= 1;
        } 

        int c = 0; //zero padding(bottom)
        int new_pixel = (a + b + c)/4;
        image[x*image_width + y] = new_pixel;
        printf("%i, ", new_pixel);

        y += 1; // moving to next column
        width_count -= 1;        
        printf("\n");
    }
    
    // downsampling
    printf("\nDownsampling\n");
    height_count = image_height/2;// dsimage_height;
    x = 0;
    while (height_count > 0){
        int y = 0;
        int width_count = image_width/2; // dsimage_width;
        while (width_count > 0){

            int pixel_value = image[2 * (y*image_width + x)];
            downsampledimage[x* (image_width/2) + y] = pixel_value;
            
            printf("%i, ", pixel_value);
            y += 1; // moving to next pixel
            width_count -= 1;            
        }
        
        x += 1; // moving to next  row 
        height_count -= 1;

        printf("\n");
    }
}