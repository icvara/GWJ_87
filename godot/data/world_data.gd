extends Node


var gravity: float  = 200.

var isNight = 0


var gamespeed = 1.0


var maxfire = 100.0
var currentfire = 0.0

var wave_number = 1


func reset():
	wave_number = 1
	isNight = 0
	currentfire = 0.0
	maxfire = 100.0
