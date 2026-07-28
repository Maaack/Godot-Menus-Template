# Game Scene Setup

Here is a basic guide for setting up a game scene for advanced users.  

The [Minimal Game Template](https://github.com/Maaack/Godot-Minimal-Game-Template) is recommended for first time users, as it includes an example game scene, with level progression.  

## Pausing
The `PauseMenuController` node can be added to the tree, or the `pause_menu_controller.gd` script may be attached to an empty `Node`. Selecting the node should then allow for setting the `pause_menu_packed` value in the inspector. Set it to the `pause_menu_layer.tscn` (or `pause_menu.tscn`) scene and save.

This should be enough to capture when the `ui-cancel` input action is pressed in-game. On keyboards, this is commonly the `Esc` key.

![Escape key aasigned to ui_cancel](/addons/maaacks_menus_template/media/documentation/ui_cancel-action-inputs.png)

## Background Music
`BackgroundMusicPlayer`'s are `AudioStreamPlayer`'s with `autoplay` set to `true` and `audio_bus` set to "Music". These will automatically be recognized by the `ProjectMusicController` with the default settings, and allow for blending between tracks.

A `BackgroundMusicPlayer` can be added to the main game scene, but if using levels, the level scenes are typically a better place for them, as that allows for tracks to vary by level.  

## Read Inputs
Generally, any game is going to require reading some inputs from the player. Where in the scene hierarchy the reading occurs is best answered with simplicity.  

If the game involves moving a player character, then the inputs for movements could be read by a `player_character.gd` script overriding the `_process(delta)` or `_input(event)` methods.  

If the game involves sending commands to multiple units, then those inputs probably should be read by a `game.gd` script, that then propagates those calls further down the chain.  
