extends Node

var NEWS = [
	{ 
		"id" : 1,
		"title" : TranslationServer.translate("KEY_NEWS_ID_1"), 
		"date"  : "01/02/19",
		"image" : "1_capitolio",
		"is_fake" : true,
		"related_to" : 6,
		"source" : "notfake.com"
	},
	{ 
		"id" : 2,
		"title" : TranslationServer.translate("KEY_NEWS_ID_2"), 
		"date"  : "09/12/20",
		"image" : "20_lider ultraderechista en boston_ 5 meses", 
		"is_fake" : true,
		"related_to" : 6,
		"source" : "alternativenews.com"
	},
	{ 
		"id" : 3,
		"title" : TranslationServer.translate("KEY_NEWS_ID_3"), 
		"date"  : "14/02/21",
		"image" : "1_capitolio", 
		"is_fake" : true,
		"related_to" : 6,
		"source" : "notajoke.com"
	},
	{ 
		"id" : 4,
		"title" : TranslationServer.translate("KEY_NEWS_ID_4"),
		"date"  : "01/01/21",
		"image" : "9_familiaCapitolio Gato", 
		"is_fake" : true,
		"related_to" : 6,
		"source" : "funnyvids.com"
	},
	{ 
		"id" : 5,
		"title" : TranslationServer.translate("KEY_NEWS_ID_5"),
		"date"  : "05/08/20",
		"image" : "13_presidente saliente forbes", 
		"is_fake" : true,
		"related_to" : 6,
		"source" : "almostserious.com"
	},
	{ 
		"id" : 6,
		"title" : TranslationServer.translate("KEY_NEWS_ID_6"),
		"date"  : "06/09/20",
		"image" : "1_capitolio", 
		"is_fake" : false,
		"related_to" : 6,
		"source" : "ccn.com"
	},
	{ 
		"id" : 7,
		"title" : TranslationServer.translate("KEY_NEWS_ID_7"), 
		"date"  : "06/09/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"related_to" : 10,
		"source" : "nomoretimes.com"
	},
	{ 
		"id" : 8,
		"title" : TranslationServer.translate("KEY_NEWS_ID_8"),
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : true,
		"related_to" : 10,
		"source" : "loltimes.com"
	},
	{ 
		"id" : 9,
		"title" : TranslationServer.translate("KEY_NEWS_ID_9"),
		"date"  : "06/09/20",
		"image" : "17_agua y pan francia", 
		"is_fake" : true,
		"related_to" : 10,
		"source" : "justforfun.com"
	},
	{ 
		"id" : 10,
		"title" : TranslationServer.translate("KEY_NEWS_ID_10"),
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : false,
		"related_to" : 10,
		"source" : "timesnewyork.com"
	},
	{ 
		"id" : 11,
		"title" : TranslationServer.translate("KEY_NEWS_ID_11"),
		"date"  : "06/09/20",
		"image" : "14_ corneal ha enviado cargamento", 
		"is_fake" : true,
		"is_story" : true,
		"related_to" : 18,
		"source" : "fakeitall.com"
	},
	{ 
		"id" : 12,
		"title" : TranslationServer.translate("KEY_NEWS_ID_12"),
		"date"  : "06/09/20",
		"image" : "7_provisionesChinasEnlatados", 
		"is_fake" : true,
		"is_story" : true,
		"related_to" : 18,
		"source" : "noresearch.com"
	},
	{ 
		"id" : 13,
		"title" : TranslationServer.translate("KEY_NEWS_ID_13"),
		"date"  : "06/09/20",
		"image" : "2_camiones", 
		"is_fake" : true,
		"related_to" : 18,
		"source" : "nontruefacts.com"
	},
	{ 
		"id" : 14,
		"title" : TranslationServer.translate("KEY_NEWS_ID_14"),
		"date"  : "06/09/20",
		"image" : "11_ agua vale mas que el oro", 
		"is_fake" : true,
		"related_to" : 18,
		"source" : "imaginafacts.com"
	},
	{ 
		"id" : 15,
		"title" : TranslationServer.translate("KEY_NEWS_ID_15"),
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : true,
		"related_to" : 18,
		"source" : "realorfake.com"
	},
	{ 
		"id" : 16,
		"title" : TranslationServer.translate("KEY_NEWS_ID_16"),
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : true,
		"related_to" : 18,
		"source" : "false.com"
	},
	{ 
		"id" : 17,
		"title" : TranslationServer.translate("KEY_NEWS_ID_17"),
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : true,
		"related_to" : 18,
		"source" : "failnews.com"
	},
	{ 
		"id" : 18,
		"title" : TranslationServer.translate("KEY_NEWS_ID_18"),
		"date"  : "06/09/20",
		"image" : "3_agua", 
		"is_fake" : false,
		"related_to" : 18,
		"source" : "verified-source.com"
	},
	{ 
		"id" : 19,
		"title" : TranslationServer.translate("KEY_NEWS_ID_19"),
		"date"  : "06/09/20",
		"image" : "23_vacunas contra mst-19_ marítimo litoral", 
		"is_fake" : true,
		"related_to" : 24,
		"source" : "newsfrompast.com"
	},
	{ 
		"id" : 20,
		"title" : TranslationServer.translate("KEY_NEWS_ID_20"),
		"date"  : "06/09/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"related_to" : 24,
		"source" : "past-times.com"
	},
	{ 
		"id" : 21,
		"title" : TranslationServer.translate("KEY_NEWS_ID_21"),
		"date"  : "06/02/20",
		"image" : "16_sudafrica no ha podido recuperarse", 
		"is_fake" : true,
		"related_to" : 24,
		"source" : "nonews.com"
	},
	{ 
		"id" : 22,
		"title" : TranslationServer.translate("KEY_NEWS_ID_22"),
		"date"  : "06/02/20",
		"image" : "27_francia e inglaterra no han superado diferencias", 
		"is_fake" : true,
		"related_to" : 24,
		"source" : "inventednews.com"
	},
	{ 
		"id" : 23,
		"title" : TranslationServer.translate("KEY_NEWS_ID_23"),
		"date"  : "06/02/20",
		"image" : "8_regioOrienta_anomaliasClinicas", 
		"is_fake" : true,
		"related_to" : 24,
		"source" : "hehefacts.com"
	},
	{ 
		"id" : 24,
		"title" : TranslationServer.translate("KEY_NEWS_ID_24"),
		"date"  : "06/02/20",
		"image" : "12_personal medico vacuna dosis sobrantes", 
		"is_fake" : false,
		"related_to" : 24,
		"source" : "propernews.com"
	},

	{ 
		"id" : 25,
		"title" : TranslationServer.translate("KEY_NEWS_ID_25"),
		"date"  : "06/02/20",
		"image" : "18_ingobernabilidad en medio de la crisis", 
		"is_fake" : true,
		"related_to" : 30,
		"source" : "loltimes.com"
	},
	{ 
		"id" : 26,
		"title" : TranslationServer.translate("KEY_NEWS_ID_26"),
		"date"  : "06/02/20",
		"image" : "24_analistas advierten repercusiones importantes en la economia", 
		"is_fake" : true,
		"related_to" : 30,
		"source" : "hehefacts.com"
	},
	{ 
		"id" : 27,
		"title" : TranslationServer.translate("KEY_NEWS_ID_27"),
		"date"  : "06/02/20",
		"image" : "10_que nos gobierne rusia", 
		"is_fake" : true,
		"related_to" : 30,
		"source" : "loltimes.com"
	},
	{ 
		"id" : 28,
		"title" : TranslationServer.translate("KEY_NEWS_ID_28"),
		"date"  : "06/02/20",
		"image" : "19_ si la gente no viene a votar", 
		"is_fake" : true,
		"related_to" : 30,
		"source" : "whatthef.com.ru"
	},
	{ 
		"id" : 29,
		"title" : TranslationServer.translate("KEY_NEWS_ID_29"),
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"related_to" : 30,
		"source" : "nofacts.jp"
	},
	{ 
		"id" : 30,
		"title" : TranslationServer.translate("KEY_NEWS_ID_30"),
		"date"  : "06/02/20",
		"image" : "4_virus_covid", 
		"is_fake" : false,
		"related_to" : 30,
		"source" : "trueresearch.com"
	},

	{ 
		"id" : 31,
		"title" : TranslationServer.translate("KEY_NEWS_ID_31"),
		"date"  : "01/04/19",
		"image" : "26_se ha detectado sintomas de mst-19 en animales domesticos", 
		"is_fake" : true,
		"related_to" : 35,
		"source" : "jk.com"
	},
	{ 
		"id" : 32,
		"title" : TranslationServer.translate("KEY_NEWS_ID_32"),
		"date"  : "22/09/19",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"related_to" : 35,
		"source" : "almostserious.com"
	},
	{ 
		"id" : 33,
		"title" : TranslationServer.translate("KEY_NEWS_ID_33"),
		"date"  : "11/05/19",
		"image" : "25_se denuncia mal administracion_ vacuna centros veterinarios", 
		"is_fake" : true,
		"related_to" : 35,
		"source" : "loltimes.com"
	},
	{ 
		"id" : 34,
		"title" : TranslationServer.translate("KEY_NEWS_ID_34"),
		"date"  : "11/05/19",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"related_to" : 35,
		"source" : "almostserious.com"
	},
	{
		"id" : 35,
		"title" : TranslationServer.translate("KEY_NEWS_ID_35"),
		"date"  : "12/10/19",
		"image" : "28_mst-19 para animales no protege humanos", 
		"is_fake" : false,
		"related_to" : 35,
		"source" : "news-trust.com"
	},
	{
		"id" : 36,
		"title" : TranslationServer.translate("KEY_NEWS_ID_36"),
		"date"  : "01/10/19",
		"image" : "21_Thomas berstein gerente Pacto acuerdo inmunidad", 
		"is_fake" : true,
		"is_story" : true,
		"related_to" : 0,
		"source" : "loltimes.com"
	},
	{
		"id" : 37,
		"title" : TranslationServer.translate("KEY_NEWS_ID_37"),
		"date"  : "01/10/19",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"is_story" : true,
		"related_to" : 0,
		"source" : "comedyfacts.com"
	},
	{
		"id" : 38,
		"title" : TranslationServer.translate("KEY_NEWS_ID_38"),
		"date"  : "01/10/19",
		"image" : "22_La empresa BioRuinik Formula, mst-19", 
		"is_fake" : true,
		"related_to" : 0,
		"source" : "comedyfacts.com"
	},
	{
		"id" : 39,
		"title" : TranslationServer.translate("KEY_NEWS_ID_39"),
		"date"  : "01/10/19",
		"image" : "4_virus_covid", 
		"is_fake" : true,
		"related_to" : 0,
		"source" : "justkidding.com.fr"
	}
]

const MUSIC_FADE_TIME = 2.0

const TOTAL_FAKE_NEWS = 7
const MAX_ERRORES = 3

var first_play = true
var fake_news = 0
var total_errors = 0

func get_time():
	var timeDict = OS.get_time();
	var hour = String(timeDict.hour);
	var minute = timeDict.minute;
	if minute < 10:
		minute = "0" + String(minute)
	else:
		minute = String(minute)
		
	return hour + ':' + minute

func add_fake_news():
	fake_news += 1
	
func add_error():
	total_errors += 1

func get_news():
	randomize()
	NEWS.shuffle()
	return NEWS
	
func get_alternate_news(id):
	var not_related = get_not_related(id)
	not_related.shuffle()
	var final = not_related.slice(0,5)
	
	var news_by_id = get_news_by_id(id)
	var real_news
	for news in NEWS:
		if news.related_to == news_by_id.related_to && news.is_fake == false:
			real_news = news
			break

	final.append(real_news)
	final.shuffle()
	
	return final

func get_not_related(id):
	var alt_news = []
	for news in NEWS:
		if news.related_to != id:
			alt_news.append(news)
	
	return alt_news
	
func get_news_by_id(id):
	for news in NEWS:
		if news.id == id:
			return news
	return null

func set_cursor():
	pass
