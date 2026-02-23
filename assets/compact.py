import sys
import os
from itertools import batched

def compact_data(data):
    compacted = []
    for row in data:
        compacted_row = []
        for chunk in batched(row, 4):
            compacted_row.append(str(chunk[0] << 12 | chunk[1] << 8 | chunk[2] << 4 | chunk[3]))
        compacted.append("{" + ", ".join(compacted_row) + "}")

    return compacted


# very hacky
with open(sys.argv[1], "r") as f:
    data = f.read()
    data = eval(data.replace("{", "[").replace("}", "]"))
    compacted = compact_data(data)
    with open("Compacted_" + os.path.splitext(sys.argv[1])[0] + ".txt", "w") as out:
        out.write("{" + ",\n".join(compacted) + "}")
