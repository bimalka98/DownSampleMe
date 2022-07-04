import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt

# read the image
image = cv.imread('lena.jpg', cv.IMREAD_COLOR)
fig, ax = plt.subplots()
ax.imshow(image)
ax.set_title('Lenna')
ax.set_xticks([])
ax.set_yticks([])
plt.show()