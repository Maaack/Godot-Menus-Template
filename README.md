# Godot Menus Template
For Godot 4.2

This template has a main menu, options menus, credits, and a scene loader.

[Example on itch.io](https://maaack.itch.io/godot-game-template)  
_Example is of [Maaack's Game Template](https://github.com/Maaack/Godot-Game-Template), which includes additional features._

![Main Menu](/addons/maaacks_menus_template/media/Screenshot-3-1.png)  
![Key Rebinding](/addons/maaacks_menus_template/media/Screenshot-3-2.png)  
![Audio Controls](/addons/maaacks_menus_template/media/Screenshot-3-4.png)  
![Credits Screen](/addons/maaacks_menus_template/media/Screenshot-3-5.png)  

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
-   Centralized UI Sound Control

### How it Works
- `AppConfig.tscn` is set as the first autoload. It loads all the configuration settings from the config file (if it exists).
- `SceneLoader.tscn` is set as the second autoload.  It can load scenes in the background or with a loading screen (`LoadingScreen.tscn` by default).   
- `MainMenu.tscn` is where a player can start the game, change settings, watch credits, or quit. It can link to the path of a game scene to play, and the packed scene of an options menu to use.  
- `Credits.tscn` reads from `ATTRIBUTION.md` to automatically generate the content for it's scrolling text label.  
- The `UISoundController` node automatically attaches sounds to buttons, tab bars, sliders, and line edits in the scene. `ProjectUISoundController.tscn` can used to apply UI sound effects project-wide.

## Installation

### Godot Asset Library
This package is available as a plugin, meaning it can be added to an existing project. 

![Package Icon](/addons/maaacks_menus_template/media/Menus-Icon-black-transparent-256x256.png)  

When editing an existing project:

1.  Go to the `AssetLib` tab.
2.  Search for "Maaack's Game Template Plugin".
3.  Click on the result to open the plugin details.
4.  Click to Download.
5.  Check that contents are getting installed to `addons/` and there are no conflicts.
6.  Click to Install.
7.  Reload the project (you may see errors before you do this).
8.  Enable the plugin from the Project Settings > Plugins tab.
9.  Continue with the [Existing Project Instructions](/addons/maaacks_menus_template/docs/ExistingProject.md)  


### GitHub


1.  Download the latest release version from [GitHub](https://github.com/Maaack/Godot-Menus-Template/releases/latest).  
2.  Extract the contents of the archive.
3.  Move the `addons/maaacks_menus_template` folder into your project's `addons/` folder.  
4.  Open/Reload the project.  
5.  Enable the plugin from the Project Settings > Plugins tab.  
6.  Continue with the [Existing Project Instructions](/addons/maaacks_menus_template/docs/ExistingProject.md) 

#### Extras

Users that want additional features can try [Maaack's Game Template](https://github.com/Maaack/Godot-Game-Template).  

## Usage

It is recommended developers copy the contents of the `addons/maaacks_menus_template/base/scenes/` into their project root directory before making changes. This avoids changes getting lost either from the package updating, or because of a .gitignore.

Alternatively, developers can inherit scenes from the `addons/` and save those to their project root directory.

### Main Scene

Set your project's main scene to `MainMenu.tscn` or any scene that inherits from it.

### Existing Project

[Existing Project Instructions](/addons/maaacks_menus_template/docs/ExistingProject.md)  
   


## Links
[Attribution](ATTRIBUTION.md)  
[License](LICENSE.txt)  

