# Persistent player data between scenes

 A project showing 4 ways to make player's data persistent in Godot Engine, each branch of this repository represents one way to maintain player's data across `get_tree().change_scene` calls.
 
 - [Using a Singleton](https://github.com/pigdevstudio/save-player-resources/tree/singleton)
 - [Using a Resource](https://github.com/pigdevstudio/save-player-resources/tree/player-resource)
 - [Remove and Readd the player from scenes](https://github.com/pigdevstudio/save-player-resources/tree/remove-add-child)
 - [Save player's data to file](https://github.com/pigdevstudio/save-player-resources/tree/save-to-file)
 
 Remember that none of these approaches are mutually excludent, meaning you can use any combination, including all four approaches.
