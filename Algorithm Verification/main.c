// downsampling a square shape image by factor 2
#include <stdio.h>

// sample image
int image[16] = {128, 100, 100, 140, 
                150, 80, 60, 50,
                10, 80, 50, 98,
                150, 180, 200, 125};

int downsampledimage[4]; // variable to store downsampled image

int image_sidelen = 4;

int main(){

    //Horizontal Convolution
    printf("Horizontal Convolution\n");
    int height_count = image_sidelen;    
    int x = 0;
    while (height_count > 0){
        int y = 0;
        int a = 0; //zero padding(left)
        int b = 2 * image[x*image_sidelen + y];
        int width_count = image_sidelen - 1;
        while (width_count > 0){
            int c = image[x*image_sidelen + y + 1];
            int new_pixel = (a + b + c)/4;
            image[x*image_sidelen + y] = new_pixel; 
            printf("%i, ", new_pixel);
            //sliding window
            a = b/2;
            b = c*2;
            y += 1; //moving to next pixel
            width_count -= 1;
        }            
        int c = 0; //zero padding(right)
        int new_pixel = (a + b + c)/4;
        image[x*image_sidelen + y] = new_pixel;
        printf("%i, ", new_pixel);
        height_count -= 1;
        x += 1; // moving to next row
        printf("\n");
    }

    //Vertical Convolution
    printf("\nVertical Convolution\n");
    int width_count = image_sidelen;
    int y = 0;
    while (width_count > 0){

        int x = 0;
        int a = 0; //zero padding(top)
        int b = 2*image[x*image_sidelen + y];
        int height_count = image_sidelen - 1;

        while (height_count > 0){
            int c = image[x*image_sidelen + image_sidelen + y];
            int new_pixel = (a + b + c)/4;
            image[x*image_sidelen + y] = new_pixel;
            printf("%i, ", new_pixel);
            //sliding window
            a = b/2;
            b = c*2;
            x += 1; //moving to next pixel
            height_count -= 1;
        } 

        int c = 0; //zero padding(bottom)
        int new_pixel = (a + b + c)/4;
        image[x*image_sidelen + y] = new_pixel;
        printf("%i, ", new_pixel);

        width_count -= 1;
        y += 1; // moving to next column
        printf("\n");
    }
    
    // downsampling
    printf("\nDownsampling\n");
    height_count = image_sidelen/2;
    x = 0;
    while (height_count > 0){
        int y = 0;
        int width_count = image_sidelen/2;
        while (width_count > 0){

            int pixel_value = image[2*y*image_sidelen + 2*x];
            downsampledimage[x* (image_sidelen/2) + y] = pixel_value;
            
            printf("%i, ", pixel_value);
            y += 1; // moving to next pixel
            width_count -= 1;            
        }
        height_count -= 1;
        x += 1; // moving to next  row 
        printf("\n");
    }
}