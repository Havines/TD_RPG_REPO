extends Node

signal experiance_vial_collected(value: float)

func emit_exp_vial_collected(value: float):
	experiance_vial_collected.emit(value)
