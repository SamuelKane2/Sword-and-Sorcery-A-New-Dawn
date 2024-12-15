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

spelling/grammar mistakes - 26

### Examples/Locations of Implemented Features
* Inheritance - Collect is used as a class name for picking stuff up
* Encapsulation - In the inventory GUI code there is an example of encapuslaion in a few of the IF statments where there is a variable that can't be used anywhere else
* Polymorphism - There are some examples of polymorphism in the health.gd, player.gd, and in the enemies scripts.
* Abstraction - There are examples of abstraction in the scripts for some of the enemies that follow you and same with the npc that moves freely

* Inventory - The script for this can be found under the name inventory and the scene for it can also be found under the same scene. In the inventory you can move around items and pick other items up.
  	* Node Types - Spatial, Node, and Canvasitem
	* Scenes - inventory.tscn and ui.tscn
* Dialouge - There are npcs in the npc scene and also the script for the dialouge can also be found in the scene for the dialogue. This dialogue allows you to take with npcs and have conversations with them.
  	* Node Types - Spatial, Node, and Canvasitem
	* Scenes - dialogue.tscn and npc.tscn
* GUI - This is found in the UI scene and the script for it is also in there too. This display allows the character see their health and gold.
  	* Node Types - Node, and Canvasitem
	* Scenes - ui.tscn
* Combat - This is found under the combat scene and is used so the player can fight the enemies and not just run away from them.
  	* Node Types - Spatial, Node
	* Scenes - combat.tscn

### Godot Features
1. **Movement and Collision**
There is a script called movement that makes the player move around, and there are many different uses of collisions used in the player scene.
Node Types - Spatial, Node, and Canvasitem
   - **Testing**: Use the arrow keys or WASD to move the player character in the game.
   - **Scenes**: Found in `player.tscn` and `game.tscn`.
   - **Related Scripts**: `movement.gd` handles movement and collision logic.

2. **Enemies**
They can be found in the many different enemy scenes, there's a skeleton, slime, orc, and the drangon scenes, these can be accesed through the file called enemies. The enemies can follow you around and attack and kill you.
Node Types - Spatial
   - **Testing**: Locate enemies in the game world and observe their behavior, such as following the player and attacking.
   - **Scenes**: Found in `orc.tscn`, `skeleton.tscn`, and `slime.tscn` under the `enemies` folder.
   - **Related Scripts**: Each enemy has its own script (e.g., `orc.gd`, `skeleton.gd`).

3. **Tilemaps and Worldbuilding**
This can be found in the scene called game, there is a fully functuinal tilemap and there are enemies and npcs all around the map.
Node Types - Spatial, Node
   - **Testing**: Explore the map to see the tile-based environment and interact with NPCs and objects.
   - **Scenes**: Found in `game.tscn`.
   - **Related Scripts**: No direct script; implemented via Godot's Tilemap system.

5. **Inventory**
   - **Testing**: Open the inventory, move items around, and pick up items in the game world.
   - **Scenes**: Found in `inventory.tscn` and `ui.tscn`.
   - **Related Scripts**: `inventory.gd` and `ui.gd`.

6. **Dialogue**
   - **Testing**: Interact with NPCs and initiate conversations to see dialogue options.
   - **Scenes**: Found in `npc.tscn` and `dialogue.tscn`.
   - **Related Scripts**: `dialogue.gd` and `npc.gd`.

7. **GUI**
   - **Testing**: Monitor the health bar and currency display while playing.
   - **Scenes**: Found in `ui.tscn`.
   - **Related Scripts**: `ui.gd`.

8. **Combat**
   - **Testing**: Engage in combat with enemies by attacking and avoiding their attacks.
   - **Scenes**: Found in `combat.tscn`.
   - **Related Scripts**: `combat.gd`.

### Team Roles and Contributions
- Josh: Started the player (until he realized Jerry created one) and fixed the Main after it was broken
- Levi: Created the tilemap and inventory
- Brenden: Created the actualy map, and the dialogue
- Brayden: Started creating the enemies
- Jerry: Made the enemies work and created the entire player character
