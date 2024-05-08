# Godot Menus Template
For Godot 4.2

This template has a main menu, options menus, credits, and a scene loader.

[Example on itch.io](https://maaack.itch.io/godot-game-template)  
_Example is of [Maaack's Game Template](https://github.com/Maaack/Godot-Game-Template), which includes additional features._

![Main Menu](/addons/maaacks_menus_template/media/Screenshot-3-1.png)  
![Key Rebinding](/addons/maaacks_menus_template/media/Screenshot-3-2.png)  
![Audio Controls](/addons/maaacks_menus_template/media/Screenshot-3-4.png)  
![Credits Screen](/addons/maaacks_menus_template/media/Screenshot-3-5.png)  
[All screenshots](/addons/maaacks_menus_template/docs/Screenshots.md)

## Use Case
Setup menus and accessibility features in about 15 minutes.

The core components can support a larger project, but the template was originally built to support smaller projects and game jams.

## Features

### Base

The `base/` folder holds the core components of the menus application.

-   Main Menu    
-   Options Menus
-   Credits
-   Loading Screen
-   Persistent Settings
-   Simple Config Interface
-   Keyboard/Mouse Support
-   Gamepad Support
-   UI Sound Controller
-   Background Music Controller

### How it Works
- `AppConfig.tscn` is set as the first autoload. It calls `AppSettings.gd` to load all the configuration settings from the config file (if it exists) through `Config.gd`.
- `SceneLoader.tscn` is set as the second autoload.  It can load scenes in the background or with a loading screen (`LoadingScreen.tscn` by default).   
- `MainMenu.tscn` is where a player can start the game, change settings, watch credits, or quit. It can link to the path of a game scene to play, and the packed scene of an options menu to use.  
- `Credits.tscn` reads from `ATTRIBUTION.md` to automatically generate the content for it's scrolling text label.  
- The `UISoundController` node automatically attaches sounds to buttons, tab bars, sliders, and line edits in the scene. `ProjectUISoundController.tscn` is an autload used to apply UI sounds project-wide.
- `ProjectMusicController.tscn` is an autoload that keeps music playing between scenes. It detects music stream players as they are added to the scene tree, reparents them to itself, and blends the tracks.  
- `OptionControl.tscn` and its inherited scenes are used for most configurable options in the menus. They work with `Config.gd` to keep settings persistent between runs.
  
## Installation

### Godot Asset Library
This package is available as a plugin, meaning it can be added to an existing project. 

![Package Icon](/addons/maaacks_menus_template/media/Menus-Icon-black-transparent-256x256.png)  

When editing an existing project:

1.  Go to the `AssetLib` tab.
2.  Search for "Maaack's Menus Template".
3.  Click on the result to open the plugin details.
4.  Click to Download.
5.  Check that contents are getting installed to `addons/` and there are no conflicts.
6.  Click to Install.
7.  Reload the project (you may see errors before you do this).
8.  Enable the plugin from the Project Settings > Plugins tab.  
    If it's enabled for the first time,
    1.  A dialogue window will appear asking to copy the example scenes out of `addons/`.
    2.  Another dialogue window will ask to update the project's main scene.
9.  Continue with the [Existing Project Instructions](/addons/maaacks_menus_template/docs/ExistingProject.md)  


### GitHub


1.  Download the latest release version from [GitHub](https://github.com/Maaack/Godot-Menus-Template/releases/latest).  
2.  Extract the contents of the archive.
3.  Move the `addons/maaacks_menus_template` folder into your project's `addons/` folder.  
4.  Open/Reload the project.  
5.  Enable the plugin from the Project Settings > Plugins tab.  
    If it's enabled for the first time,
    1.  A dialogue window will appear asking to copy the example scenes out of `addons/`.
    2.  Another dialogue window will ask to update the project's main scene.
6.  Continue with the [Existing Project Instructions](/addons/maaacks_menus_template/docs/ExistingProject.md) 

#### Extras

Users that want additional features can try [Maaack's Game Template](https://github.com/Maaack/Godot-Game-Template).  

## Usage

Changes can be made directly to scenes and scripts outside of `addons/`. 

A copy of the `examples/` directory is made outside of `addons/` when the plugin is enabled for the first time. However, if this is skipped, it is recommended developers inherit from scenes they want to use, and save the inherited scene outside of `addons/`. This avoids changes getting lost either from the package updating, or because of a `.gitignore`.

### Existing Project

[Existing Project Instructions](/addons/maaacks_menus_template/docs/ExistingProject.md)  
   


## Links
[Attribution](/addons/maaacks_menus_template/ATTRIBUTION.md)  
[License](/addons/maaacks_menus_template/LICENSE.txt)  
[Godot Asset Library - Plugin](https://godotengine.org/asset-library/asset/2899) 
