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

### Examples/Locations of Implemented Features
* Inheritance - Collect is used as a class name for picking stuff up
* Encapsulation - In the iunventory GUI code there is an example of enscapuslaion in a few of the IF statments where there is a varbible that can't be used anywhere else
* Polymorphism - There are some examples of polymorphism in the health.gd, player.gd, and in the enimes srcpits.
* Abstraction - There are accepets of absrtaion in the srcipts for some of the enimes that follow youa nd same with the npc that moves freely
* Godot Features 
* Movement and Collision - There is a script called movment that makes the player move around, and there is many diffrent uses of colliosions used in the player scene
	* Node Types - Spatial, Node, and Canvasitem
	* Scenes - player.tscn and game.tscn
* Enemies - They can be found in the many diffrent enimie scenes, theres a skeliton, slime, orc, and the drangon scenes, these can be accesed through the file called enimies. The enimies can follow you around and attack and kill you.
  	* Node Types - Spatial
	* Scenes - orc.tsnc, skeleton.tscn, slime.tscn
* Tilemaps and Worldbuilding - This can be found in the scene called game, there is a fully functuinal tilemap and there are enimies and npcs all around the map
  	* Node Types - Spatial, Node
	* Scenes - game.tscn
* Inventory - The script for this can be found under the name inventory and the scene for it can also be found under the same scene. In the inventory you can move around items and pick other items up.
  	* Node Types - Spatial, Node, and Canvasitem
	* Scenes - inventory.tscn and ui.tscn
* Dialouge - There are npcs in the npc scene and also the script for the dialouge can also be found in the scene for the dialouge. This dialouge allows you to take with npcs and have conversations with them.
  	* Node Types - Spatial, Node, and Canvasitem
	* Scenes - dialouge.tscn and npc.tscn
* GUI - This is found in the UI scene and the sript for it is also in there too. This display allows the chaater to see their health and money.
  	* Node Types - Node, and Canvasitem
	* Scenes - ui.tscn
* Combat - This will be found under the combat scene and this is used so the player can fight the enimes and not just run away from them.
  	* Node Types - Spatial, Node
	* Scenes - combat.tscn
