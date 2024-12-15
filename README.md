### Description
Our game is an open-world fantasy RPG where players can explore a detailed environment, interact with NPCs, and engage in combat with various enemies. The core gameplay loop involves progression through quests and battles, ultimately leading to a boss fight that marks the game's conclusion. The focus is on creating an immersive experience with a blend of exploration, story, and combat mechanics, aiming to balance player freedom with clear objectives.

### Gameplay Features 
* Movement and Collision
* Enemies
* Tilemaps and Worldbuilding
* Inventory
* Dialouge
* GUI
* Combat

spelling/grammar mistakes - 28

### Examples/Locations of Implemented Features
* Inheritance - Collect is used as a class name for picking stuff up
* Encapsulation - In the inventory GUI code there is an example of encapuslaion in a few of the IF statments where there is a variable that can't be used anywhere else
* Polymorphism - There are some examples of polymorphism in the health.gd, player.gd, and in the enemies scripts.
* Abstraction - There are examples of abstraction in the scripts for some of the enemies that follow you and same with the npc that moves freely

### Godot Features
1. **Movement and Collision**
There are many different uses of collisions used in the player scene.
Node Types - Spatial, Node, and Canvasitem
   - **Testing**: Use the arrow keys or WASD to move the player character in the game.
   - **Scenes**: `player.tscn` found in res://Player, and `game.tscn` (found in scenes).
   - **Related Scripts**: `player.gd` found in res://Player, handles movement and collision logic.

2. **Enemies**
The enemies can follow you around and attack and kill you.
Node Types - Spatial
   - **Testing**: Locate enemies in the game world and observe their behavior, such as following the player and attacking.
   - **Scenes**: `orcWorking.tscn`, `skeleton.tscn`, and `slimeWorking.tscn` found in res://enemies/common. `dragonWorking.tscn` found in res://enemies/bosses.
   - **Related Scripts**: `orc_2.gd`, `skeleton.gd`, and `slime_2.gd` found in res://enemies/common. `dragon_working.gd` found in res://enemies/bosses.

3. **Tilemaps and Worldbuilding**
There is a fully functional tilemap and there are enemies and npcs all around the map.
Node Types - Spatial, Node
   - **Testing**: Explore the map to see the tile-based environment and interact with NPCs and objects.
   - **Scenes**: There are no scenes as we just used TileMapLayers.
   - **Related Scripts**: There is no script.

5. **Inventory**
In the inventory you can move around items and pick other items up.
Node Types - Spatial, Node, and Canvasitem
   - **Testing**: Open the inventory, move items around, and pick up items in the game world.
   - **Scenes**: `inventory.tscn`, `inventory_cell.tscn`, and `itemsStack.tscn`, found in res://scenes/Inventory. `ui.tscn` found in res://scripts.
   - **Related Scripts**: `inventory.gd`, `collectable.gd`, `inventory_cell.gd`, `inventory_gui.gd`, `inventory_item`, and `item_stack_gui` found in res://scripts/Inventory. `ui.gd` found in res://scripts.

7. **Dialogue**
This dialogue allows you to talk with npcs and have conversations with them.
Node Types - Spatial, Node, and Canvasitem
   - **Testing**: Interact with NPCs and initiate conversations to see dialogue.
   - **Scenes**: `NobleMan` found in .
   - **Related Scripts**: `npc.gd` found in res://scripts.

9. **GUI**
This display allows the character see their health and gold.
Node Types - Node, and Canvasitem
   - **Testing**: Monitor the health bar and currency display while playing.
   - **Scenes**: Found in `ui.tscn`.
   - **Related Scripts**: `ui.gd`.

11. **Combat**
The player can fight the enemies and not just run away from them.
Node Types - Spatial, Node
   - **Testing**: Engage in combat with enemies by attacking and avoiding their attacks.
   - **Scenes**: Found in `combat.tscn`.
   - **Related Scripts**: `combat.gd`.

### Team Roles and Contributions
- Josh: Started the player (until he realized Jerry created one) and fixed the Main after it was broken
- Levi: Created the tilemap and inventory
- Brenden: Created the actualy map, and the dialogue
- Brayden: Started creating the enemies
- Jerry: Made the enemies work and created the entire player character
