from PIL import Image, ImageDraw
import re
im = Image.new('RGBA', [256, 256])
d = ImageDraw.Draw(im)
f = open('../../../code/iphnoe/arialGlyphRects.h')
lines = f.readlines()
for line in lines:
    m = re.search('(?P<x1>[0-9]+), +(?P<y1>[0-9]+), +(?P<x2>[0-9]+), +(?P<y2>[0-9]+)', line)
    if m:
        c = [int(m.group('x1')), int(m.group('y1')), int(m.group('x2')), int(m.group('y2'))]
        #print c
        d.rectangle(c, fill='#ffa200')
f.close()
im.save('g.png')
