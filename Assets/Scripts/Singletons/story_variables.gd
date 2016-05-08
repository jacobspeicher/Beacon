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
  for i in range(3):
    story_scene_1.push_back("The world was never the same after the Event happened.")
    story_scene_2.push_back("scene 2")
    story_scene_3.push_back("scene 3")
    story_scene_4.push_back("scene 4")
    story_scene_5.push_back("scene 5")
    story_scene_6.push_back("scene 6")
    story_scene_7.push_back("scene 7")
    story_scene_8.push_back("scene 8")
    story_scene_9.push_back("scene 9")
    story_scene_10.push_back("scene 10")
    story_scene_11.push_back("scene 11")

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
