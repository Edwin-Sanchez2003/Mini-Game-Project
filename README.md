# GDG MiniGame Project
The MiniGame Project made by the Game Developers' Group at IUPUI. This is made in the Godot game engine.

## Mini Game 1 - Dyson Sphere Game (Working Name)
The first minigame in the minigame collection is a bullet-hell style 2D mini-game. There are *4* main components: A **core** in the center of the screen, a **perimeter** that goes around the outside of the core, a **player ship** who moves along the inner-edge of the perimeter, and **projectiles** (4 types) that shoot out from the core towards the perimeter. The player can block the projectiles, which also allows the player to catch them. The player can then shoot back the projectiles into the core.

Some Notes:
* **Resolution:** 720p
* **Aspect Ratio:** 16:9

### Goal
The goal is for the player to body-block the projectiles shot out from the core (protecting the perimeter) while also shooting back the projectiles into specific quadrants of the core. 

#### Win Condition
The player wins once the core's health has been depleted.

#### Lose Condition
The player loses when the perimeter's health has been depleted.

### Core
The core is the main enemy of the game. It lies in the center of the screen, and pulsates as it launches volleys of projectiles toward the perimeter. The core is divided into 4 different quadrants. When the player body-blocks projectiles, the player will need to shoot back the correct projectile type into the correct quadrant.

Some Notes:
* Projectiles come from anywhere on the core (not from a specific quadrant).
* Projectiles (when the player shoots them back) must be shot back into the correct quadrant to affect the core's health.

#### Components
* **Health:** How many "hits" the core has until it is depleted/defeated.
* **Collision Box:** Allows the core to interact/get hit by projectiles
* **Spawner:** Spawns the projectiles (tranform location or area spawn).
* **Sprite:** What the core looks like.

### Projectiles
The projectiles are created by the core to be a threat to the perimeter. The core spawns them randomly and launches them in a random direction outward toward the perimeter. The player must intercept them before they reach the perimeter.

There are 4 different types of projectiles. These types are only used when the player shoots the projectiles back toward the core to do damage.

#### Components
 * **Damage:** How much damage the projectile does
 * **Collision Box:** Allows the projectile to interact with the Player and Perimeter.
 * **Speed:** How fast the projectile moves.
 * **Trajectory:** How the projectile moves toward the perimeter.
 * **Sprite:** What the projectile looks like.

### Player Ship
This is what the player controls to project the perimeter from the core. The player uses left & right keys to slide the player's ship along the edge of the perimeter to intercept projectiles before they hit the perimeter.

#### Components
* **Collision Box:** Allows the player to interact with the projectiles.
* **Speed:** How fast the player moves along the perimeter.
* **Movement:** How the player moves (if non-linear).
* **Sprite:** What the player looks like
* **Controls:** How the player operates the ship:
  * *left-right:* use (left right arrow keys??) to move the player along the perimeter
  * *shoot:* Shoot a projectile.
  * *projectile type selection:* selects what type of projectile to shoot (may be combined with *shoot* mechanic so that you select & shoot at the same time).

### Perimeter
This is the object that the player is trying to protect. The player moves along the inner edge of this object, defending its inner frame from projectiles running into it. When the perimeter is hit enough times by projectiles, it's health is depleted and the player loses.

#### Components
* **Collision Box:** Allows the projectiles to collide with the perimeter.
* **Sprite:** The visual for the perimeter.
* **Health:** Allows the perimeter to be damaged.

### User Interface
This is how the player keeps track of certain details in the game.

#### Components
* **Core Health:** Displays the health of the core (projectile spawner; our "enemy").
* **Perimeter Health:** Displays the health of the perimeter (what the player is protecting).
* **Score:** How well the player is doing (may end up just being a function of perimeter & core health).

## Teams
These are the sub-teams for the project. You will need to push your branch to this group's branch in the repo before it can be pushed to the main branch (see [Source Control Rules](#source-control-rules)).

* **Programmers:** Makes the doohickeys move in our game.
* **Artists:** Makes things actually look good in the game.

Discussions regarding the project is in the GDG's Dicord contained in the category: *MINI-GAME-PROJECT*.

### Artists
Here's some resources for the Artists:

* **OneDrive Link:** [Click Me](https://indiana-my.sharepoint.com/:f:/g/personal/edwsanch_iu_edu/Ejlkbx-it5xJrLyczf-oVdIB_jAHwndi57xuEdNJc7351w)

## Source Control Rules
In order to keep the project organized and maintained, we need to follow some rules.

1. **Each developer will need to have their own branch.** You will push your changes to this branch as you work. You do not need this work to be perfect, just use this branch to save your changes as you work - lets avoid losing hours of work!
2. **Once changes are ready & approved, you will then push to one of the sub-branches for your team: (Programmers, Artists, etc.).** This will contain code for your team/group, and help to catch issues before they get to main. You will need to work with the team lead to get your changes pushed. The team lead will need to make sure your push is successful and that it works with the project, and resolve issues if it doesn't.
3. **Once a set of core components are ready to be added to the main project, we will push it to the main branch.** This will be a job for each team's leader, who will now have to work with the project leader to make sure all of the changes work and the main project still works. It is the responsibility of the project lead to resolve issues with the team leader during this process.
4. **Prepare for inter-script interactions.** There will be times where we need to edit scripts so that they can interact with scripts made by our other developers. We need to try and anticipate these conflicts ahead of time and make a plan for them with our team leads and our project lead. If you realize you need to edit something outside of what you originally thought, make sure to communicate this with your team lead! See [Tips](#tips) for more details.

### Tips
* **Commit your changes often!** Get used to using Git & GitHub, and commit any changes you make to your branch every time you get something new working or have spend a decent amount of time making changes. This will help you to avoid losing lots of work if the worst happens - and trust me, it does!
* **Don't edit files that you aren't responsible for!!!** Merge conflicts are messy in git, even for experienced source control users... So we can avoid this by only making changes in files that you are responsible for as an individual. It will be team lead's responsibility to organize interactions between different developers' scripts, and the project leader's responsibility to manage between teams, if necessary. If you can't get your code to work without editing a certain file, talk with your team lead. You can work out how to best make those changes.
