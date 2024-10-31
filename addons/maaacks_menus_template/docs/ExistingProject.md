# Existing Project

These instructions assume starting with just the contents of `addons/`. This will be the case when installing the *plugin* version in the Godot Asset Library.


1.  Update the project’s main scene (if skipped during plugin install).
    

    1.  Go to `Project > Project Settings… > General > Application > Run`.
    2.  Update `Main Scene` to `opening_with_logo.tscn`, or skip openings and go straight to `main_menu_with_animations.tscn`. (These are the default scenes used, but other options are available.)
    3.  Close the window.
    

2.  Update the project’s name in the main menu.
    

    1.  Open `main_menu_with_animations.tscn`.
    2.  Select the `Title` node.
    3.  Update the `Text` to your project's title.
    4.  Select the `Subtitle` node.
    5.  Update the `Text` to a desired subtitle or empty.
    6.  Save the scene.
    

3.  Link the main menu to the game scene.
    

    1.  Open `main_menu_with_animations.tscn`.
    2.  Select the `MainMenu` node.
    3.  Update `Game Scene Path` to the path of the project's game scene.
    4.  Save the scene.
    

4.  Add background music and sound effects to the UI.

    1.  Add `Music` and `SFX` to the project's default audio busses.

        1.  Open the Audio bus editor.
        2.  Click the button "Add Bus" twice (x2).
        3.  Name the two new busses `Music` and `SFX`.
        4.  Save the project.

    2.  Add background music to the Main Menu.

        1.  Import the music asset into the project.
        2.  Open `main_menu_with_animations.tscn`.
        3.  Select the `BackgroundMusicPlayer` node.
        4.  Assign the music asset to the `stream` property.
        5.  Save the scene.
        6.  Optionally, repeat steps 3-5 for background music nodes in:
            1.  `opening_with_logo.tscn`


    3.  Add sound effects to UI elements.

        1.  By scene.


            1.  Open `main_menu_with_animations.tscn` and `pause_menu.tscn`.
            2.  Select the `UISoundController` node.
            3.  Add audio streams to the various UI node events.
            4.  Save the scenes.  


        2.  Project-wide.


            1.  Open `project_ui_sound_controller.tscn`.
            2.  Select the `UISoundController` node.
            3.  Add audio streams to the various UI node events.
            4.  Save the scene.  


5.  Add readable names for input actions to the controls menu.
    

    1.  Open `input_options_menu.tscn` (or `master_options_menu_with_tabs.tscn`, which contains an instance of the scene).
    2.  Select the `Controls` node.
    3.  Update the `Input Action Names` and corresponding `Readable Action Names` to show user-friendly names for the project's input actions.  
    4.  Save the scene.  


6.  Add / remove configurable settings to / from menus.
    

    1.  Open `mini_options_menu.tscn` or `[audio|visual|input|game]_options_menu.tscn` scenes to edit their options.
    2.  If an option is not desired, it can always be hidden, or removed entirely (sometimes with some additional work).
    3.  If a new option is desired, it can be added without writing code.
        1.  Find the node that contains the existing list of options. Usually, it's a `VBoxContainer`.
        2.  Add an `option_control.tscn` node as a child to the container.
            1.  `slider_option_control.tscn` or `toggle_option_control.tscn` can be used if those types match requirements. In that case, skip step 6.
            2.  `list_option_control.tscn` and `vector_2_list_option_control.tscn` are also available, but more complicated. See the `ScreenResolution` example.
        3.  Select the `OptionControl` node just added, to edit it in the inspector.
        4.  Add an `Option Name`. This prefills the `Key` string.
        5.  Select an `Option Section`. This prefills the `Section` string.
        6.  Add any kind of `Button`, `Slider`, `LineEdit`, or `TextEdit` to the `OptionControl` node.
        7.  Save the scene.
    4.  For options to have an effect outside of the menu, it will need to be referenced by its `key` and `section` from `config.gd`.
        1.  `Config.get_config(section, key, default_value)`
    5.  Validate the values being stored in your local `config.cfg` file.
        1.  Refer to [Accessing Persistent User Data User](https://docs.godotengine.org/en/stable/tutorials/io/data_paths.html#accessing-persistent-user-data-user) to find Godot user data on your machine.
        2.  Find the directory that matches your project's name.  
        3.  `config.cfg` should be in the top directory of the project.


7.  Update the game credits / attribution.
    

    1.  Update the example `ATTRIBUTION.md` with the project's credits.
    2.  Open `credits.tscn`.
    3.  Check the `CreditsLabel` has updated with the text.
    4.  Save the scene.
