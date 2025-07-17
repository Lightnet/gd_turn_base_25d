
# 

# GameData.gd
-hand player data save and load
# Global.gd


# GameController.gd
-handle scene change for scene 2d, 3d and gui.
```
GameController(root)
-World2D
-World3D
-GUI
```



# notes:

Loader scene manage is partly working. need more testing.

battle win and lost condition need be added.

need to save and load player position.

# change scene:
	note that cleanup does take a while to get to player or character to cleanup on change the scenes. Since it mannula clean up script or change scene need to do clean up in real time.
