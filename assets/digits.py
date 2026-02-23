from PIL import Image

img = Image.open("digits.png")

# Convert to black and white
img = img.convert("L")

encoded_digits = []
for d in range(10):
    digit = 0
    for r in range(8):
        for c in range(4):
            pixel = img.getpixel((c + d * 4, r)) == 0 and 1 or 0
            index = (7 - r) * 4 + (3 - c)
            digit |= pixel << index
    encoded_digits.append(digit >> 16)
    encoded_digits.append(digit & 0xFFFF)
    

print(", ".join(map(lambda x: str(hex(x)), encoded_digits)))
            

