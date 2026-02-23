from PIL import Image
import numpy as np
import os
import sys

'''
index	rgb888	name
0	#000000	black
1	#0000AA	dark blue
2	#00AA00	dark green
3	#00AAAA	dark cyan
4	#AA0000	dark red
5	#AA00AA	dark magenta
6	#AAAA00	dark yellow
7	#AAAAAA	light grey
8	#555555	dark grey
9	#5555FF	light blue
10	#55FF55	light green
11	#55FFFF	light cyan
12	#FF5555	light red
13	#FF55FF	light magenta
14	#FFFF55	light yellow
15	#FFFFFF	white
'''

colours = {
    (0, 0, 0): 0,
    (0, 0, 0xAA): 1,
    (0, 0xAA, 0): 2,
    (0, 0xAA, 0xAA): 3,
    (0xAA, 0, 0): 4,
    (0xAA, 0, 0xAA): 5,
    (0xAA, 0xAA, 0): 6,
    (0xAA, 0xAA, 0xAA): 7,
    (0x55, 0x55, 0x55): 8,
    (0x55, 0x55, 0xFF): 9,
    (0x55, 0xFF, 0x55): 10,
    (0x55, 0xFF, 0xFF): 11,
    (0xFF, 0x55, 0x55): 12,
    (0xFF, 0x55, 0xFF): 13,
    (0xFF, 0xFF, 0x55): 14,
    (0xFF, 0xFF, 0xFF): 15
}

def get_closest_colour(colour):
    return colours[min(colours.keys(), key=lambda x: sum((a - b) ** 2 for a, b in zip(x, colour)))]

img = Image.open(sys.argv[1])
img = img.convert("RGB")

img_array = []
for i in range(img.size[1]):
    row = []
    for j in range(img.size[0]):
        row.append(str(get_closest_colour(img.getpixel((j, i)))))
    img_array.append("{" + ",".join(row) + "}")

with open(os.path.splitext(sys.argv[1])[0] + ".txt", "w") as f:
    f.write("{\n" + ",\n".join(img_array) + "\n}")