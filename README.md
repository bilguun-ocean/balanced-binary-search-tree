The insert works like this:
1. You first find the value to insert to (which is a leaf node that is closest to the inserting value) recursively
2. Then on each recursive, assign to left or right the next recursive
3. After the correct leaf node is found, it will create a new leaf node on left or right side
4. Then every recursive will unravel and the new left or right side will be assigned to the original.