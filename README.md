# boss-design

A template Godot project to design bosses.

## Guide

### Scenes

The following has been defined for you:

1. Game & root scenes.

The `root` scene is the entry point of the game. It contains only one child scene: the `game` scene.

The `game` scene contains all the elements of the game: the `map`, the `player`, and the `boss`.

2. Player

The `player` is defined with `CharacterBody2D`, which is what the player will control. Basic movement has been implemented:

* Move left, either using key-left or `A`
* Move right either using key-right or `D`
* Jump from the ground, either using key-up, `W`, Space, or `Z`
* Shooting attack, using `X`

You may adjust the stats, which are defined at the start of the player script, to fit your game.

Assets for player are found in `/assets/pixel-platform/Main Characters/Mask Dude`

3. Boss

The `boss` is defined with `CharacterBody2D`, which is what you will be implementing. The logic to control the boss is empty for now. Only the logic for the boss to lose health has been implemented.

Assets for boss are found in `/assets/pixel-platform/Main Characters/Ninja Frog`

4. Map

The `map` is defined with `TileMap`, and all tiles have been loaded for you, with Physics collision layers and masks set up. You may change the map to customise your game, but this is not the focus of this session. For now, the base platform has been implemented.

5. UI

Basic healthbar has been implemented. The value of the healthbar is pegged to the value of health of the player and boss.

### Collision layers

#### Layers:

* Layer 1: Player
* Layer 2: Boss
* Layer 3: Map

#### Masks:

* Player: 3 (Map)
* Bullet: 2 (Boss)
* Boss: no mask
* Map: no mask

## Acknowledgements

Assets is obtained from [Pixel Adventure](https://pixelfrog-assets.itch.io/pixel-adventure-1).
