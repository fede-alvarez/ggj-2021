extends Node

const NEWS = [
	{ 
		"id" : 1,
		"title" : "La casa blanca manchada de sangre: El asalto al capitolio con cócteles molotov y armamento blindado", 
		"date"  : "01/02/19",
		"image" : "1_capitolio", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 6
	},
	{ 
		"id" : 2,
		"title" : "Líder Ultraderechista en Boston admite que el asalto al capitolio se venía pensando desde hace 5 meses atrás.", 
		"date"  : "09/12/20",
		"image" : "20_lider ultraderechista en boston_ 5 meses", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 6
	},
	{ 
		"id" : 3,
		"title" : "El ministro del interior iniciará inmediatamente una persecución contra todos los 'terroristas infiltrados'", 
		"date"  : "14/02/21",
		"image" : "1_capitolio", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 6
	},
	{ 
		"id" : 4,
		"title" : "Familia completa vinculada al acto terrorista contra el capitolio. El gato de la familia también fue procesado.", 
		"date"  : "01/01/21",
		"image" : "9_familiaCapitolio Gato", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 6
	},
	{ 
		"id" : 5,
		"title" : "El presidente saliente Forbes, no habla sobre el asalto al Capitolio, pero admite que no le desagrada.", 
		"date"  : "05/08/20",
		"image" : "13_presidente saliente forbes", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 6
	},
	{ 
		"id" : 6,
		"title" : "Expertos en extremismo piensan que el asalto al capitolio es  solo el comienzo.", 
		"date"  : "06/09/20",
		"image" : "1_capitolio", 
		"is_fake" : false,
		"is_story" : false,
		"related_to" : 0
	},
	{ 
		"id" : 7,
		"title" : "Más de 300 camioneros franceses han muerto en territorio británico a causa del MST-19", 
		"date"  : "06/09/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 10
	},
	{ 
		"id" : 8,
		"title" : "Familias de camioneros declararon la incompetencia del gobierno ante el abandono de su gente.", 
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 10
	},
	{ 
		"id" : 9,
		"title" : "Agua y pan para el pueblo de Francia: plantón en la Bastilla por Camioneros atrapados en mitad de la peste.", 
		"date"  : "06/09/20",
		"image" : "17_agua y pan francia", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 10
	},
	{ 
		"id" : 10,
		"title" : "No es humano dejar a camioneros estancados, sin poder ir ni venir de Inglaterra", 
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : false,
		"is_story" : false,
		"related_to" : 0
	},
	{ 
		"id" : 11,
		"title" : "CornHeal ha enviado un primer cargamento de ayuda a la frontera británica.", 
		"date"  : "06/09/20",
		"image" : "14_ corneal ha enviado cargamento", 
		"is_fake" : true,
		"is_story" : true,
		"related_to" : 18
	},
	{ 
		"id" : 12,
		"title" : "Provisiones Chinas llegan a la frontera británica. ¡Enlatados de Sardina y Arroz blanco!", 
		"date"  : "06/09/20",
		"image" : "7_provisionesChinasEnlatados", 
		"is_fake" : true,
		"is_story" : true,
		"related_to" : 18
	},
	{ 
		"id" : 13,
		"title" : "¡El agua será comprada!. Los posibles comerciantes están comenzando a filtrarse en los medios públicos.", 
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 18
	},
	{ 
		"id" : 14,
		"title" : "El agua ahora vale más que el oro. Economistas afirman que el agua se medirá en unidades de venta y consumo.", 
		"date"  : "06/09/20",
		"image" : "11_ agua vale mas que el oro", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 18
	},
	{ 
		"id" : 15,
		"title" : "¡Los fatalistas anuncian fin de los días! 'No queremos guardar agua como negocio, habría mucha competencia'", 
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 18
	},
	{ 
		"id" : 16,
		"title" : "¿Por qué el agua está en la bolsa de valores, depreciación económica mundial o plan socio-económico sostenible?", 
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 18
	},
	{ 
		"id" : 17,
		"title" : "Ecologistas han declarado manifestaciones en los próximos días. 'El agua no se vende, es un derecho natural'", 
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 18
	},
	{ 
		"id" : 18,
		"title" : "El agua en la bolsa de valores: ¿protección o especulación?", 
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : false,
		"is_story" : false,
		"related_to" : 0
	},
	{ 
		"id" : 19,
		"title" : "Vacunas contra MST-19 no han llegado al puerto marítimo litoral. Las primeras dosis cumplen 1 mes de retraso hoy.", 
		"date"  : "06/09/20",
		"image" : "23_vacunas contra mst-19_ marítimo litoral", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 24
	},
	{ 
		"id" : 20,
		"title" : "Vacunas contra la peste MST-19, fueron robadas el primer día de su arribo. Guardianes de Barlovento como posibles implicados en el hecho.", 
		"date"  : "06/09/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 24
	},
	{ 
		"id" : 21,
		"title" : "Sudáfrica no ha podido recuperarse de la 2da Cepa de MST-19. CornHeal se ha involucrado en el desarrollo de una cura.", 
		"date"  : "06/02/20",
		"image" : "16_sudafrica no ha podido recuperarse", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 24
	},
	{ 
		"id" : 22,
		"title" : "Francia e Inglaterra no han superado sus diferencias y esto ha complicado el ingreso de dosis en territorio Francés.", 
		"date"  : "06/02/20",
		"image" : "27_francia e inglaterra no han superado diferencias", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 24
	},
	{ 
		"id" : 23,
		"title" : "En la región oriental primeros vacunados  empiezan a denunciar anomalías clínicas y efectos colaterales.", 
		"date"  : "06/02/20",
		"image" : "8_regioOrienta_anomaliasClinicas", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 24
	},
	{ 
		"id" : 24,
		"title" : "Personal médico que no atiende covid recibe dosis de vacuna sobrantes", 
		"date"  : "06/02/20",
		"image" : "12_personal medico vacuna dosis sobrantes", 
		"is_fake" : false,
		"is_story" : false,
		"related_to" : 0
	},
	
	{ 
		"id" : 25,
		"title" : "Ingobernabilidad en medio de crisis mundial. País Latinoamericano está al borde de crisis político económica.", 
		"date"  : "06/02/20",
		"image" : "18_ingobernabilidad en medio de la crisis", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 30
	},
	{ 
		"id" : 26,
		"title" : "Analistas advierten repercusiones importantes en la economía pública a corto plazo.", 
		"date"  : "06/02/20",
		"image" : "24_analistas advierten repercusiones importantes en la economia", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 30
	},
	{ 
		"id" : 27,
		"title" : "'¿Que no hay gobierno?' que nos gobierne Rusia entonces", 
		"date"  : "06/02/20",
		"image" : "10_que nos gobierne rusia", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 30
	},
	{ 
		"id" : 28,
		"title" : "'Si la gente no viene a votar, es porque no sabe a quién votar, no los culpo, hace décadas nadie lo sabe'", 
		"date"  : "06/02/20",
		"image" : "19_ si la gente no viene a votar", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 30
	},
	{ 
		"id" : 29,
		"title" : "La CIPU ( Comisión Internacional de Política Universal) ha empezado investigaciones en el país.",
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 30
	},
	{ 
		"id" : 30,
		"title" : "Récord de candidatos presidenciales.",
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : false,
		"is_story" : false,
		"related_to" : 0
	},
	
	{ 
		"id" : 31,
		"title" : "Se han detectado síntomas de MST-19 en animales domésticos.",
		"date"  : "01/04/19",
		"image" : "26_se ha detectado sintomas de mst-19 en animales domesticos", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 35
	},
	{ 
		"id" : 32,
		"title" : "Las mascotas de todos los distritos centrales serán puestas en cuarentena.",
		"date"  : "22/09/19",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 35
	},
	{ 
		"id" : 33,
		"title" : "Se denuncia mal administración en la distribución de vacunas para los centros veterinarios",
		"date"  : "11/05/19",
		"image" : "25_se denuncia mal administracion_ vacuna centros veterinarios", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 35
	},
	{ 
		"id" : 34,
		"title" : "Se denuncia mal administración en la distribución de vacunas para los centros veterinarios",
		"date"  : "11/05/19",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 35
	},
	{
		"id" : 35,
		"title" : "MST-19 para animales no protege a humanos",
		"date"  : "12/10/19",
		"image" : "28_mst-19 para animales no protege humanos", 
		"is_fake" : false,
		"is_story" : false,
		"related_to" : 0
	},
	{
		"id" : 36,
		"title" : "Thomas Berstein, gerente de CornHeal ha pactado un acuerdo de inmunidad con países del Sur.",
		"date"  : "01/10/19",
		"image" : "21_Thomas berstein gerente Pacto acuerdo inmunidad", 
		"is_fake" : true,
		"is_story" : true,
		"related_to" : 0
	},
	{
		"id" : 37,
		"title" : "Gobernante de Región Central presenta gotas 'milagrosas' que 'neutralizan' la peste",
		"date"  : "01/10/19",
		"image" : "4_virus_covid", 
		"is_fake" : false,
		"is_story" : true,
		"related_to" : 0
	},
	{
		"id" : 38,
		"title" : "La empresa 'BIOquimik' ha desarrollado una fórmula soluble para tratamiento del MST-19.",
		"date"  : "01/10/19",
		"image" : "22_La empresa BioRuinik Formula, mst-19", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 0
	},
	{
		"id" : 39,
		"title" : "La siguiente semana empiezan pruebas de medicamento piloto 'Regional Sur'. ¡Altas expectativas!",
		"date"  : "01/10/19",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : false,
		"related_to" : 0
	}
]

const TOTAL_FAKE_NEWS = 4
const MAX_ERRORES = 3

var first_play = true
var fake_news = 0
var total_errors = 0

func get_time():
	var timeDict = OS.get_time();
	var hour = String(timeDict.hour);
	var minute = String(timeDict.minute);
	return hour + ':' + minute

func add_fake_news():
	fake_news += 1
	
func add_error():
	total_errors += 1

func get_news():
	randomize()
	NEWS.shuffle()
	return NEWS

func get_news_by_id(id):
	for news in NEWS:
		if news.id == id:
			return news
	return null
