extends Node

const NEWS = [
	{ 
		"id" : 1,
		"title" : "La casa blanca manchada de sangre: El asalto al capitolio con cócteles molotov y armamento blindado", 
		"date"  : "01/02/19",
		"image" : "1_capitolio", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 2,
		"title" : "Líder Ultraderechista en Boston admite que el asalto al capitolio se venía pensando desde hace 5 meses atrás.", 
		"date"  : "09/12/20",
		"image" : "1_capitolio", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 3,
		"title" : "El ministro del interior iniciará inmediatamente una persecución contra todos los 'terroristas infiltrados'", 
		"date"  : "14/02/21",
		"image" : "1_capitolio", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 4,
		"title" : "Familia completa vinculada el acto terrorista contra el capitolio. El gato de la familia también fue procesado.", 
		"date"  : "01/01/21",
		"image" : "1_capitolio", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 5,
		"title" : "El presidente saliente Forbes, no habla sobre el asalto al Capitolio, pero admite que no le desagrada.", 
		"date"  : "05/08/20",
		"image" : "5_presidentes", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 6,
		"title" : "Expertos en extremismo piensan que el asalto al capitolio es  solo el comienzo.", 
		"date"  : "06/09/20",
		"image" : "1_capitolio", 
		"is_fake" : false,
		"is_story" : false
	},
	{ 
		"id" : 7,
		"title" : "Más de 300 camioneros franceses han muerto en territorio británico a causa del MST-19", 
		"date"  : "06/09/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 8,
		"title" : "Familias de camioneros declararon la incompetencia del gobierno ante el abandono de su gente.", 
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 9,
		"title" : "Agua y pan para el pueblo de Francia: plantón en la Bastilla por Camioneros atrapados en mitad de la peste.", 
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 10,
		"title" : "No es humano dejar a camioneros estancados, sin poder ir ni venir de Inglaterra", 
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : false,
		"is_story" : false
	},
	{ 
		"id" : 11,
		"title" : "CornHeal ha enviado un primer cargamento de ayuda a la frontera británica.", 
		"date"  : "06/09/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : true
	},
	{ 
		"id" : 12,
		"title" : "Provisiones Chinas llegan a la frontera británica. ¡Enlatados de Sardina y Arroz blanco!", 
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : true,
		"is_story" : true
	},
	{ 
		"id" : 13,
		"title" : "¡El agua será comprada!. Los posibles comerciantes están comenzando a filtrarse en los medios públicos.", 
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 14,
		"title" : "El agua ahora vale más que el oro. Economistas afirman que el agua se medirá en unidades de venta y consumo.", 
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 15,
		"title" : "¡Los fatalistas anuncian fin de los días! 'No queremos guardar agua como negocio, habría mucha competencia'", 
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 16,
		"title" : "¿Por qué el agua está en la bolsa de valores, depreciación económica mundial o plan socio-económico sostenible?", 
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 17,
		"title" : "Ecologistas han declarado manifestaciones en los próximos días. 'El agua no se vende, es un derecho natural'", 
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 18,
		"title" : "El agua en la bolsa de valores: ¿protección o especulación?", 
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : false,
		"is_story" : false
	},
	{ 
		"id" : 19,
		"title" : "Vacunas contra MST-19 no han llegado al puerto marítimo litoral. Las primeras dosis cumplen 1 mes de retraso hoy.", 
		"date"  : "06/09/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 20,
		"title" : "Vacunas contra la peste MST-19, fueron robadas el primer día de su arribo. Guardianes de Barlovento como posibles implicados en el hecho.", 
		"date"  : "06/09/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 21,
		"title" : "Sudáfrica no ha podido recuperarse de la 2da Cepa de MST-19. CornHeal se ha involucrado en el desarrollo de una cura.", 
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 22,
		"title" : "Francia e Inglaterra no han superado sus diferencias y esto ha complicado el ingreso de dosis en territorio Francés.", 
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 23,
		"title" : "En la región oriental primeros vacunados  empiezan a denunciar anomalías clínicas y efectos colaterales.", 
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 24,
		"title" : "Personal médico que no atiende covid recibe dosis de vacuna sobrantes", 
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : false,
		"is_story" : false
	},
	
	{ 
		"id" : 25,
		"title" : "Ingobernabilidad en medio de crisis mundial. País Latinoamericano está al borde de crisis político económica.", 
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 26,
		"title" : "Analistas advierten repercusiones importantes en la economía pública a corto plazo.", 
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 27,
		"title" : "'¿Que no hay gobierno?' que nos gobierne Rusia entonces", 
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 28,
		"title" : "'Si la gente no viene a votar, es porque no sabe a quién votar, no los culpo, hace décadas nadie lo sabe'", 
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 29,
		"title" : "La CIPU ( Comisión Internacional de Política Universal) ha empezado investigaciones en el país.",
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false
	},
	{ 
		"id" : 30,
		"title" : "Récord de candidatos presidenciales.",
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : false,
		"is_story" : false
	},
]

const TOTAL_FAKE_NEWS = 4
const MAX_ERRORES = 3

var first_play = true
var fake_news = 0
var total_errors = 0

func add_fake_news():
	fake_news += 1
	
func add_error():
	total_errors += 1
	if total_errors > MAX_ERRORES:
		total_errors = MAX_ERRORES
		print("Game over")

func get_news():
	randomize()
	NEWS.shuffle()
	return NEWS
