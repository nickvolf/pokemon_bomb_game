extends Node

export(Resource) var absol
export(Resource) var ampharos
export(Resource) var arcanine
export(Resource) var blastoise
export(Resource) var blaziken
export(Resource) var bulbasaur
export(Resource) var charzard
export(Resource) var dragonite
export(Resource) var eevee
export(Resource) var flygon
export(Resource) var garchomp
export(Resource) var gardevoir
export(Resource) var gengar
export(Resource) var infernape
export(Resource) var lacario
export(Resource) var luxray
export(Resource) var mudkip
export(Resource) var ninetales
export(Resource) var scizor
export(Resource) var snorlax
export(Resource) var squirtle
export(Resource) var torterra
export(Resource) var typhlosion
export(Resource) var tyranitar
export(Resource) var umbreon

var pokemons: Array =[]

func _ready():
	pokemons = [
		absol,
		ampharos,
		arcanine,
		blastoise,
		blaziken,
		bulbasaur,
		charzard,
		dragonite,
		eevee,
		flygon,
		garchomp,
		gardevoir,
		gengar,
		infernape,
		lacario,
		luxray,
		mudkip,
		ninetales,
		scizor,
		snorlax,
		squirtle,
		torterra,
		typhlosion,
		tyranitar,
		umbreon
	]
	pokemons.shuffle()
