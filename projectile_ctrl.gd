#Projectiles should not be placed as children of the parent that created them 
#as parent positioning will directly affect the projectiles
extends Node

func _on_projectile_fire(instance):
	add_child(instance)
