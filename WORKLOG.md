# Dev Log
### I. Working Features
-Player can walk on blocks and die when they touch the ground
-Player faces direction they are walking in
-Inventory that remains constant throughout game
-Drag and drop blocks from and to inventory
-Your blocks can disappear permanently if put onto prexisting blocks, so you have to be careful 
-Each room has a message
-Different type of blocks with different characteristics (bridge, stair, monster, water, earth, empty)
-Unique rooms 
-Room selection system
-Two modes: normal one in chronological order and hacks one that unlocks all levels
-Background Music and sound effects
### II. Broken Features/Bugs
-You can add new blocks from preset blocks, though you aren't supposed to
### III. Content resources you used that you found helpful
-Minecraft
-FRAMED Collection
# Work Log

## Nelli

### 5/23
Started Inventory, Map, Player, and Room classes on java files.

### 5/24

Established main game interface, walk mode (left and right), and setting in draw.

### 5/25

Drawing blocks in a room and loading background images.

### 5/26

Drawing blocks in a room finished and designed room0.

### 5/29

Finished designing room0, room1, and room2.
Experiencing issues with player deaths.
Designing Map mode.

### 5/30

Map menu functions correctly, you can select which level after tutorial.
Cleaned up obsolete code such as decisionValue for Rooms and EmptyBlock.

### 5/31

Submitted current game to demo branch.
Experimenting with gravity and improved player movement in separate file.

### 6/1

Furthered platforming on separate files, now can interact with platforms, bugs with jumping.
Cleaned code and death by jump bug for demo.


### 6/4

Planned out demo presentation with Jo over Zoom.

### 6/5

Practiced demo presentation with Jo over Zoom and discussed next steps.


### 6/6

Implementing being able to walk up stairs.
Designed room 3 so you can test stairs.
Organized background images into a folder.

### 6/7

Working on walking up stairs, simplyfying draw, and debugging rooms.

### 6/8

Designed room 4.
Replaced Controller with switch to make draw faster.
Other smaller edits to make draw faster and implementing new rooms more easier.

### 6/9

Levels now need to be unlocked in order, there are bugs with redoing levels though.

### 6/10

Simplified setup, fixed all the setup calls in draw, and filled out the ReadMe file. Designed and implemented room 5 and 6.


### 6/11

Added music. Final touches and room-related debugging. 

## Jo

### 5/23

Started creating the skeletons for block class and its children in Processing

### 5/24

Added images for all the image blocks

### 5/25

Put images in a folder so Nelli can access them
Made Sonny walk (turns left and right) and also updated paths for images

### 5/26

Made Sonny move in all 4 directions
Added constructors to all block classes and made a ground floor for Sonny

### 5/29

Added add and remove methods to inventory class and tested
Added a drag and drop method to get blocks from inventory to room
Added remove method to room to enable drag n drop both ways
Can drag n drop from room to inventory, from room to room, and from inventory to room- potential issue: if u drop it onto another block and then move it again, the first drop space will be null

### 5/30

Worked on gravity and making player fall if they go below the horizon

### 5/31

Added a getX and getY to each block
Worked on gravity to make Sonny fall

### 6/1

GRAVITY WORKS!!! demoable stage reached!
added death screen and way to return to map

### 6/6

added a get and set method, and also type to blocks"

### 6/7

added monsters that kill you!

### 6/8

added a setup and reset method for inventory and tested more

### 6/9

fixed weird inventory issues! currently resets after each level

### 6/10

Inventory does not reset after each level, instead once you use a block in one level it stays there and does not go back to inventory.

### 6/11

Fixed stair issue- stairs can be placed on empty space without dying
