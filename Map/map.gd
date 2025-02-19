extends Node2D
@onready var world =$World
@onready var play =$Play




func _on_ready() -> void:
	var temp=world.losuj_slowa(25)
	var temp2=play.losuj_card()
	$Node2D8._Label_name(temp[0],temp2[0])
	$Node2D3._Label_name(temp[1],temp2[1])
	$Node2D._Label_name(temp[2],temp2[2])
	$Node2D2._Label_name(temp[3],temp2[3])
	$Node2D4._Label_name(temp[4],temp2[4])
	$Node2D5._Label_name(temp[5],temp2[5])
	$Node2D6._Label_name(temp[6],temp2[6])
	$Node2D7._Label_name(temp[7],temp2[7])
	$Node2D9._Label_name(temp[8],temp2[8])
	$Node2D10._Label_name(temp[9],temp2[9])
	$Node2D11._Label_name(temp[10],temp2[10])
	$Node2D12._Label_name(temp[11],temp2[11])
	$Node2D13._Label_name(temp[12],temp2[12])
	$Node2D14._Label_name(temp[13],temp2[13])
	$Node2D15._Label_name(temp[14],temp2[14])
	$Node2D16._Label_name(temp[15],temp2[15])
	$Node2D17._Label_name(temp[16],temp2[16])
	$Node2D18._Label_name(temp[17],temp2[17])
	$Node2D19._Label_name(temp[18],temp2[18])
	$Node2D20._Label_name(temp[19],temp2[19])
	$Node2D21._Label_name(temp[20],temp2[20])
	$Node2D22._Label_name(temp[21],temp2[21])
	$Node2D23._Label_name(temp[22],temp2[22])
	$Node2D24._Label_name(temp[23],temp2[23])
	$Node2D25._Label_name(temp[24],temp2[24])
