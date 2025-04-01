# Game Scene Setup

Here is a basic guide for setting up a game scene for advanced users.  

The [Godot Game Template](https://github.com/Maaack/Godot-Game-Template) is recommended for first time users, as it includes an example game scene, with level progression.  

## Pausing
The `PauseMenuController` node can be added to the tree, or the `pause_menu_controller.gd` script may be attached to an empty `Node`. Selecting the node should then allow for setting the `pause_menu_packed` value in the inspector. Set it to the `pause_menu.tscn` scene and save.

This should be enough to capture when the `ui-cancel` input action is pressed in-game. On keyboards, this is commonly the `Esc` key.

## Background Music
`BackgroundMusicPlayer`'s are `AudioStreamPlayer`'s with `autoplay` set to `true` and `audio_bus` set to "Music". These will automatically be recognized by the `ProjectMusicController` with the default settings, and allow for blending between tracks.

A `BackgroundMusicPlayer` can be added to the main game scene, but if using levels, the level scenes are typically a better place for them, as that allows for tracks to vary by level.  

## SubViewports
This guide recommends loading a game world into a `SubViewport` node, contained within a `SubViewportContainer`. This has a couple of advantages.

- Separates elements intended to appear inside the game world from those intended to appear on a layer above it. 
- Allows setting a fixed resolution for the game, like pixel art games.
- Allows setting rendering settings, like anti-aliasing, on the `SubViewport`.
- Supports easily adding visual effects with shaders on the `SubViewportContainer`.
- Visual effects can be added to the game world without hurting the readability of the UI.

It has some disadvantages, as well.

- Locks the viewport resolution if any scaling is enabled, which is not ideal for 3D games.
- Requires enabling Audio Listeners to hear audio from the game world.
- Extra processing overhead for the viewport layer.

If a subviewport does not work well for the game, use any empty `Node` as the game world or level container, instead.  

### Pixel Art Games
If working with a pixel art game, often the goal is that the number of art pixels on-screen is to remain the same regardless of screen resolution. As in, the art scales with the monitor, rather than bigger monitors showing more of a scene. This is done by setting the viewport size in the project settings, and setting the stretch mode to either `canvas_mode` or `viewport`.

If a higher resolution is desired for the menus and UI than the game, then the project viewport size should be set to a multiple of the desired game window size. Then set the stretch shrink in `SubViewportContainer` to the multiple of the resolution. For example, if the game is at `640x360`, then the project viewport size can be set to `1280x720`, and the stretch shrink set to `2` (`1280x720 / 2 = 640x360`). Finally, set the texture filter on the `SubViewportContainer` to `Nearest`.

### Mouse Interaction
If trying to detect `mouse_enter` and `mouse_exit` events on areas inside the game world, enable physics object picking on the `SubViewport`.

## Read Inputs
Generally, any game is going to require reading some inputs from the player. Where in the scene hierarchy the reading occurs is best answered with simplicity.  

If the game involves moving a player character, then the inputs for movements could be read by a `player_character.gd` script overriding the `_process(delta)` or `_input(event)` methods.  

If the game involves sending commands to multiple units, then those inputs probably should be read by a `game_ui.gd` script, that then propagates those calls further down the chain.  
