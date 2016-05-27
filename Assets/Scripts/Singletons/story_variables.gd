extends Node

var story = []

var story_scene_1 = []
var story_scene_2 = []
var story_scene_3 = []
var story_scene_4 = []
var story_scene_5 = []
var story_scene_6 = []
var story_scene_7 = []
var story_scene_8 = []
var story_scene_9 = []
var story_scene_10 = []
var story_scene_11 = []

var cur_scene = 0

func _ready():
  story_scene_1.push_back("Everyone remembers the old stories.")
  story_scene_1.push_back("Once a grand spacefaring civilization, with luxuries and an empire that spread galaxies.")
  story_scene_1.push_back("That all changed when the Event happened.")

  story_scene_2.push_back("Long ago the planet shook and warped, transforming into what it is today.")
  story_scene_2.push_back("Barren, unturning, and either molten hot, or despairingly cold.")
  story_scene_2.push_back("This is our home.")
  story_scene_2.push_back("That was the Event.")

  story_scene_3.push_back("Our people lost their sanity.")
  story_scene_3.push_back("Civil War broke out, and it seemed we were lost.")
  story_scene_3.push_back("We were saved by the spheres.")

  story_scene_4.push_back("We called them Eden spheres.")
  story_scene_4.push_back("For a time, we could power them with geothermal energy, but our home eventually cooled.")
  story_scene_4.push_back("We attempted to create solar farms on the Far Side, but dangerous radiation prevented that.")

  story_scene_5.push_back("So we made contact with the last of our old allies.")
  story_scene_5.push_back("They agreed to send us resources to help us continue.")
  story_scene_5.push_back("Their only demand was that we light their way.")

  story_scene_6.push_back("After the Event, we could no longer afford to return to space.")
  story_scene_6.push_back("Satellites deteriorated, broke apart. All the junk we used long ago was now a danger.")

  story_scene_7.push_back("The first ships couldn't make it through.")
  story_scene_7.push_back("We watched in dismay as their wrecks only added to the shield.")
  story_scene_7.push_back("Over time they developed better technologies, and we developed the beacons.")

  story_scene_8.push_back("We called them the Light Receivers.")
  story_scene_8.push_back("They followed the beacons through the darkness.")

  story_scene_9.push_back("My people still hold hope there will be an end to this.")
  story_scene_9.push_back("As their leader, I must hide the truth from them.")
  story_scene_9.push_back("The engineers, the scientists, they left us long ago.")
  story_scene_9.push_back("Our machines are failing.")

  story_scene_10.push_back("It's time to stop this pretense.")
  story_scene_10.push_back("The Eden spheres are failing.")
  story_scene_10.push_back("I'm going to shut down the beacons.")
  story_scene_10.push_back("Our fate is already sealed.")
  story_scene_10.push_back("There are no more receivers coming.")

  story_scene_11.push_back("They came anyway.")
  story_scene_11.push_back("They're right. We can't destroy ourselves.")
  story_scene_11.push_back("I'm going to restore the Beacons.")

  story.push_back(story_scene_1)
  story.push_back(story_scene_2)
  story.push_back(story_scene_3)
  story.push_back(story_scene_4)
  story.push_back(story_scene_5)
  story.push_back(story_scene_6)
  story.push_back(story_scene_7)
  story.push_back(story_scene_8)
  story.push_back(story_scene_9)
  story.push_back(story_scene_10)
  story.push_back(story_scene_11)

func get_story():
  return story[cur_scene]

func inc_cur_scene():
  cur_scene += 1

func get_cur_scene_size():
  return story[cur_scene].size()
