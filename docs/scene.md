- https://www.youtube.com/watch?v=8tVyHgjzPJI
- https://www.youtube.com/watch?v=-fTzZUAGtZg
- https://www.youtube.com/watch?v=-renxc-EmUg
- 
- 
- 

- https://forum.godotengine.org/t/how-to-load-and-change-scenes/28466

```
get_tree().change_scene("res://path/to/scene.tscn")
```

```
# Remove the current level
var level = root.get_node("Level")
root.remove_child(level)
level.call_deferred("free")

# Add the next level
var next_level_resource = load("res://path/to/scene.tscn)
var next_level = next_level_resource.instance()
root.add_child(next_level)
```
