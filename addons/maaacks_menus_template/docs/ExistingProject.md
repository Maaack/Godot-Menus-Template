# Existing Project

For an existing project, developers can copy the contents of the `addons/` folder into their project. This will be the case when installing the plugin from the Godot Asset Library.

  

1.  Update the project’s main scene (if skipped during plugin install).
    

    1.  Go to `Project > Project Settings… > General > Application > Run`.
    2.  Update `Main Scene` to `MainMenu.tscn`.
        1.  Alternatively, any scene the inherits from it. One exists in the `examples/` folder.
    3.  Close the window.
    

2.  Update the project’s name in the main menu.
    

    1.  Open `MainMenu.tscn`.
    2.  Select the `Title` node.
    3.  Update the `Text` to your project's title.
    4.  Select the `Subtitle` node.
    5.  Update the `Text` to a desired subtitle or empty.
    6.  Save the scene.
    

3.  Link the main menu to the game scene.
    

    1.  Open `MainMenu.tscn`.
    2.  Select the `MainMenu` node.
    3.  Update `Game Scene Path` to the path of the project's game scene.
    4.  Save the scene.
    

4.  Add background music and sound effects to the UI.

    1.  Add `Music` and `SFX` to the project's default audio busses.

        1.  Open the Audio bus editor.
        2.  Click the button "Add Bus" twice (x2).
        3.  Name the two new busses `Music` and `SFX`.
        4.  Save the project.

    1.  Add background music to the Main Menu.

        1.  Import the music asset into the project.
        2.  Open `MainMenu.tscn`.
        3.  Select the `BackgroundMusicPlayer` node.
        4.  Assign the music asset to the `stream` property.
        5.  Save the scene.


    2.  Add sound effects to UI elements.

        1.  By scene.


            1.  Open `MainMenu.tscn` and `PauseMenu.tscn`.
            2.  Select the `UISoundController` node.
            3.  Add audio streams to the various UI node events.
            4.  Save the scenes.


        2.  Project-wide.


            1.  Open `ProjectUISoundController.tscn`.
            2.  Select the `UISoundController` node.
            3.  Add audio streams to the various UI node events.
            4.  Save the scene.
   

5.  Add readable names for input actions to the controls menu.
    

    1.  Open `InputOptionsMenu.tscn` (or `MasterOptionsMenu`, which contains an instance of the scene).
    2.  Select the `Controls` node.
    3.  Update the `Action Name Map` to show readable names for the project's input actions.  
        1.  The keys are the project's input action names, while the values are the names shown in the controls menu.  
        2.  An example is provided. It can be updated or removed, either in the inspector for the node, or in the code of `InputOptionsMenu.gd`.  
    4.  Save the scene.  


6.  Update the game credits / attribution.
    

    1.  Update the example `ATTRIBUTION.md` with the project's credits.
    2.  Open `Credits.tscn`.
    3.  Check the `CreditsLabel` has updated with the text.
    4.  Save the scene.
