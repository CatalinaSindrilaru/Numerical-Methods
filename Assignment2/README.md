Name: Sindrilaru Catalina-Maria
Group: 312CA

# NUMERICAL METHODS - HOMEWORK 2

## Interpolation applied to images


### TASK1 - Proximal Interpolation

* For the proximal_2x2 function, I calculated the nearest
neighbor for each pixel using the round function I determined
the pixel value in the final image. 
* For the proximal_2x2_RGB function, I extracted each channel
of the RGB image and I applied for it the previously
described function and then I calculated the resulting matrix.
* For the proximal_resize, I determined the scaling factors
and then I defined the transformation matrix and calculated its inverse
with the formula presented in the homework document.
I calculated x_p, y_p and determined the nearest neighbor for them
and then I calculated the pixel value of the final image.
* For the proximal_rotate_RGB function I made similar to the
proximal_2x2_RGB function so  I extracted channels and applied
the resize for each of them and then I calculated the resulting
matrix.
* For the proximal_rotate function I determined the transformation 
matrix consisting of the values cos and sin and I calculated its inverse.
I calculated x_p and y_p and I verified if the image size is exceeded,
I put a pixel black in the final image (0 value). I calculated the
coefficients with the proximal_coef function and then I calculated
the value of the pixel in the final image. After all the pixel was
calculated, I transformed the matrix in uint8 to make the image
a valid one.
* For the proximal_rotate_RGB function I extracted channels and applied
the proximal_rotate function for each of them and then I calculated
the resulting matrix.

### TASK2 - Bicubic Interpolation

* For the fx, fy, fxy functions I checked if the point (pixel) is on
the edge of the matrix (image) and if so I initialized the derivative with 0.
If not, I calculated each derivative according to the specific formula.
* For the precald_d function I went through all the matrix and I calculated
the matrix with derivatives towards x, y, and also xy using the previous
functions.
* For the bicubic_resize function I proceeded same as the proximal_resize
function, but the difference was that I changed the x_p and y_p values
to narrow them to square unit.
* For the bicubic_resize_RGB function I extracted channels and applied
the bicubic_resize function for each of them and then I calculated
the resulting matrix.

### TASK3 - Lanczos Interpolation

* I adapted the pseudocode from the homework document to work in Octave.
