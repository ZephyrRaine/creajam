@tool

# Entity Post-Import Template for LDTK-Importer.

const Util = preload("res://addons/ldtk-importer/src/util/util.gd")

func post_import(entity_layer: LDTKEntityLayer) -> LDTKEntityLayer:
	var definition: Dictionary = entity_layer.definition
	var entities: Array = entity_layer.entities
	var firefly = preload("res://scenes/firefly.tscn")
	print("EntityLayer: ", entity_layer.name, " | Count: ", entities.size())

	for entity in entities:
		# Perform operations here
		print(entity)
		var instance = firefly.instantiate()
		
		instance.position = entity.position 
		
		entity_layer.add_child(instance)
		
		Util.update_instance_reference(entity.iid, instance)
		
		# Add unresolved reference (e.g. EntityRef field)
		if "Entity_ref" in entity.fields:
			var ref = entity.fields.Entity_ref
			if ref != null:
				instance.ref = ref
				print("adding unresolved ref")
				Util.add_unresolved_reference(instance, "ref")

		pass

	return entity_layer
