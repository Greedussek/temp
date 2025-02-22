extends Node
const SAVE_PATH = "user://player_config.cfg" 
var Players = {}
@export var Many = 8
@export var Team=[3] 
var Temp = []
var Temp3 = []

func addPlayer():
	var player_data = {
		"name": load_player_name(),
		"game_status": load_player_id(),
		"game_id": "1"
	}
	Players[player_data.game_id] = player_data  
func _on_ready() -> void:
	pass

func start():
	for i in range(24):
		if i<8:
			Team.append(1)
		elif i<17:
			Team.append(2)
		else :
			Team.append(0)

func losuj_card():
	Team.shuffle()  
	return Team
	
func boolenvar():
	for i in range(25):
		Temp3.append(false)
	return Temp3
	
func load_player_name():
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)  # Próba wczytania pliku

	if err == OK:  # Jeśli udało się załadować
		var player_name = config.get_value("player", "name", "Unknown")  
		return player_name
	else:
		print("Brak zapisanej nazwy gracza, ustawiono domyślną.")
		return "Unknown"
		
func load_player_id():
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)  # Próba wczytania pliku

	if err == OK:  # Jeśli udało się załadować
		var player_name = config.get_value("player", "id", 0)  
		return player_name
	else:
		print("Brak zapisanej nazwy gracza, ustawiono domyślną.")
		return "Unknown"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


@export var czasowniki = [
	"akceptować", "analizować", "biec", "budować", "być", "chcieć", "ciągnąć", "czytać", "dawać", "definiować",
	"denerwować", "dobierać", "dobiegać", "doceniać", "dochodzić", "dopasować", "dotykać", "dowiadywać", "drżeć", "dźwigać",
	"dysponować", "egzekwować", "formować", "gasić", "gotować", "grać", "hamować", "inicjować", "interpretować", "istnieć",
	"jąkać", "jątrzyć", "kąpać", "kłamać", "kłócić", "kochać", "komentować", "kontrolować", "kopiować", "korespondować",
	"krzyczeć", "kupić", "kursować", "latać", "lubić", "magazynować", "malować", "martwić", "monitorować", "mówić",
	"myśleć", "należeć", "napełniać", "narzekać", "nastawiać", "nauczać", "nawlekać", "negować", "niepokoić", "nienawidzić",
	"obserwować", "oceniać", "ochraniać", "odczuwać", "odgrywać", "odkładać", "odmawiać", "odpoczywać", "odpowiadać", "odtwarzać",
	"ogłaszać", "omawiać", "opanowywać", "opierać", "organizować", "oszukiwać", "otrzymywać", "ozdabiać", "pakować", "parzyć",
	"patrzeć", "pertraktować", "pisać", "planować", "podchodzić", "podkreślać", "podnosić", "podróżować", "pojawiać", "pojmować",
	"pokazywać", "polecać", "pomyśleć", "porównywać", "posiadać", "postrzegać", "potrzebować", "powtarzać", "powstrzymywać", "poznać",
	"pracować", "prasować", "przemieszczać", "przenosić", "przerywać", "przyjmować", "przywoływać", "punktować", "pytać", "radzić",
	"realizować", "rejestrować", "rozbijać", "rozcinać", "rozdzielać", "rozpoznawać", "rozwiązywać", "rozważać", "ruch", "rysować",
	"rzucać", "scalić", "selekcjonować", "segregować", "sięgać", "skakać", "składać", "skomplikować", "skracać", "skupiać",
	"sluchać", "sortować", "spieszyć", "sprawdzać", "sprzedawać", "stawiać", "stosować", "sugerować", "suma", "szacować",
	"szczotkować", "szlifować", "szybować", "szyć", "ścierać", "śledzić", "śpiewać", "ściągać", "tolerować", "transportować",
	"trzymać", "uczyć", "udowadniać", "uginać", "układać", "ulepszać", "umykać", "unikać", "uparcie", "uporządkować",
	"uprawiać", "upraszczać", "ustawiać", "uwalniać", "uważać", "uznawać", "ważyć", "widzieć", "witać", "wnikać",
	"wpaść", "wspinać", "wstrzymywać", "wygrać", "wymieniać", "wynajdować", "wyobrażać", "wyostrzać", "wypełniać", "wypowiadać",
	"wystawiać", "wytrzymać", "wytwarzać", "wyważać", "wyznaczać", "wyznawać", "zachować", "zadawać", "zadłużać", "zagarniać",
	"zainicjować", "zakochiwać", "zakładać", "zakrywać", "zalecać", "zamawiać", "zamieniać", "zamykać", "zanikać", "zapalić",
	"zapanować", "zapewniać", "zapisywać", "zapominać", "zapowiadać", "zatrzymać", "zawiązywać", "zaznaczać", "zbierać", "zbliżać",
	"zdobywać", "zdumiewać", "zegnać", "zestawiać", "zlecać", "złamać", "zmieniać", "znaleźć", "znikać", "znosić",
	"zorientować", "zostać", "zużywać", "zwiedzać", "zwlekać", "zwracać", "żyć","abdykować", "adorować", "adoptować", "afirmować", "agresować", "alarmować", "amputować", "animować", "apelować", "aplikować",
	"aresztować", "argumentować", "asystować", "atakować", "autoryzować", "balansować", "balsamować", "barykadować", "bazować", "bełkotać",
	"benefitować", "bić", "blokować", "bluźnić", "bojkować", "brakować", "bronić", "budzić", "burzyć", "chłodzić",
	"chrząkać", "chwalić", "cenić", "cerować", "chichotać", "cyfryzować", "czynić", "ćwiczyć", "darzyć", "debatować",
	"delegować", "delikatnieć", "demaskować", "demolować", "dentystycznieć", "depresjonować", "deptać", "designować", "destylować", "diagnozować",
	"dokumentować", "domeblować", "donosić", "dopisywać", "doprowadzać", "doradzać", "doskonalić", "dotrzymywać", "dowcipkować", "drapać",
	"dryfować", "duplikować", "dyktować", "dyskutować", "edytować", "egzaminować", "egzorcyzmować", "eksmitować", "eksplodować", "eksportować",
	"eksponować", "ekstrahować", "eliminować", "emanować", "emigrować", "emocjonować", "ewakuować", "ewidencjonować", "ewoluować", "fabrykować",
	"fajczyć", "fantazjować", "faszerować", "faulować", "fermentować", "festynować", "fikcjonować", "filmować", "finalizować", "filtrować",
	"flirtować", "formatować", "forsować", "formułować", "francować", "fundować", "gadżetować", "galopować", "gasić", "gawędzić",
	"generować", "gestykulować", "gloryfikować", "godzić", "gotycyzować", "gramatyzować", "grantować", "grillować", "grymasić", "gryźć",
	"habitować", "hakować", "hamować", "harować", "hegemonizować", "hipnotyzować", "hodować", "holować", "honorować", "horroryzować",
	"hospicjować", "humorować", "hurtować", "imitować", "importować", "improwizować", "indeksować", "indoktrynować", "inhalować", "inicjować",
	"inspirować", "instalować", "integrować", "interpretować", "intrygować", "inwestować", "irytować", "izolować", "joggingować", "judykować",
	"jubilować", "kabaretować", "kadrować", "kalkulować", "kamerować", "kapitalizować", "karcić", "karikować", "katapultować", "katować",
	"kategoryzować", "klasować", "klepać", "klikać", "klimatyzować", "klonować", "kodować", "kombinować", "komentować", "kompletować",
	"komunikować", "komplikować", "kompromitować", "koncentrować", "konserwować", "konstruować", "kontaminować", "kontemplować", "kontrolować", "konwertować",
	"kopiować", "koordynować", "koronować", "korygować", "kosztować", "kotłować", "krzyczeć", "kwalifikować", "kwarantannować", "kwestionować",
	"laborować", "lansować", "legalizować", "lewitować", "licencjonować", "likwidować", "litować", "lokalizować", "logować", "luksusować",
	"malować", "manifestować", "manipulować", "marginalizować", "maskować", "maszerować", "masować", "medytować", "melancholizować", "meldować",
	"mieszać", "mieszkować", "militaryzować", "mobilizować", "modelować", "moderować", "monitorować", "montować", "motywować", "multiplikować",
	"naturalizować", "nawlekać", "negocjować", "neutralizować", "niepokoić", "niwelować", "normalizować", "notować", "numeryzować", "obalać",
	"obcinać", "objawiać", "oblizywać", "obserwować", "obudzić", "oceniać", "ochraniać", "odczarowywać", "oddawać", "odgrywać",
	"odkrywać", "odmieniać", "odpowiadać", "organizować", "oswajać", "ozdabiać", "pakować", "paraliżować", "patrolować", "penetrować",
	"pisać", "planować", "podkreślać", "podróżować", "pokazywać", "polować", "poprawiać", "porządkować", "posiadać", "prawniczyć",
	"pracować", "prasować", "przeanalizować", "przebudowywać", "przeciwdziałać", "przekształcać", "przemieszczać", "przetwarzać", "przygotowywać", "psychologizować","seks", "erotyka", "namiętność", "pożądanie", "miłość", "pieszczoty", "flirt", "uwodzenie", "rozkosz", "orgazm",
	"zmysłowość", "intymność", "pocałunek", "dotyk", "masturbacja", "fantazja", "romans", "ekstaza", "afrodyzjak",
	"podniecenie", "seksualność", "nagość", "fetysz", "dominacja", "uległość", "tantryzm", "partnerstwo", "kochankowie",
	"seksapil", "romantyzm", "bliskość", "czułość", "pasja", "rozpalanie", "dotykanie", "seksowny", "namiętny",
	"kamasutra", "intymny", "doznania", "chemia", "pragnienie", "cielesność", "zniewolenie", "kochanie", "przyciąganie",
	"oral", "anal", "penetracja", "namiętne", "podniecający", "ekstaza", "fantazje", "wyobraźnia", "eksperymentowanie",
	"przyjemność", "zjednoczenie", "dopasowanie", "przygoda", "dotyk", "pieszczota", "ekstaza", "rozkosz", "pragnienie",
	"pocałunki", "objęcia", "szept", "oddech", "skóra", "gładkość", "jędrność", "dominacja", "pasywność", "spojrzenie",
	"zniewolenie", "gorący", "rozpalony", "czuły", "ekstatyczny", "rozgrzany", "przyciągający", "podniecony", "namiętny",
	"soczysty", "aksamitny", "ponętny", "seksowny", "kuszący", "czule", "wrażliwy", "gorączkowy", "intensywny",
	"przytulny", "delikatny", "słodki", "rozkoszny", "ekscytujący", "tajemniczy", "fascynujący", "magnetyczny",
	"uwodzicielski", "niegrzeczny", "płomienny", "ognisty", "wyuzdany", "swawolny", "lubieżny", "namiętność",
	"sensualny", "hipnotyzujący", "mistyczny", "niewinny", "dojrzały", "wyrafinowany", "zabawny", "gorączkowy",
	"drażniący", "prowokujący", "zachwycający", "urzekający", "narkotyczny", "niezaspokojony", "dominujący",
	"zmysłowy", "odurzający", "pociągający", "mocny", "miękki", "sprężysty", "zgrabny", "jędrny", "czerwony",
	"aksamitny", "soczysty", "wilgotny", "muskularny", "gładki", "krągły", "pulsujący", "nagły", "delikatny",
	"subtelny", "zwodniczy", "intrygujący", "niebezpieczny", "przepełniony", "wrażliwy", "pieszczotliwy",
	"niezwykły", "unikatowy", "elektryzujący", "przesiąknięty", "rozsadzający", "oszałamiający", "hipnotyczny",
	"szaleńczy", "rozedrgany", "dziki", "pobudzający", "rozkoszny", "intymny", "ekstrawagancki", "oryginalny",
	"nieodparty", "zachłanny", "nienasycony", "pełen", "zaspokajający", "osobisty", "ekskluzywny", "drżący",
	"pulsujący", "otulający", "uwodzicielski", "prowokacyjny", "kuszący", "pożądan", "przepełniony", "miękki",
	"czujny", "gorący", "ogrzany", "rozpływający", "uwodzący", "rozkoszujący", "obezwładniający", "kuszący",
	"żarliwy", "śmiał", "figlarny", "pełen", "sprowokowany", "zaskakujący", "delikatny", "intensywny", "pulsujący",
	"namiętny", "miękki", "soczysty", "rozlewający", "otulający", "uwodzący", "wyjątkowy", "dominujący",
	"pełen", "przejmujący", "rozkoszujący", "bezgraniczny", "ekstatyczny", "bezczelny", "nieokiełznany",
	"kłujący", "żarliwy", "szalejący", "pulsujący", "pełzający", "hipnotyzujący", "obezwładniający", "niepowtarzalny",
	"uwodzicielski", "porywający", "przyciągający", "otaczający", "rozlewający", "drżący", "dominujący",
	"przyciągający", "rozpraszający", "hipnotyzujący", "muskający", "otulający", "bezgraniczny", "narkotyzujący",
	"intrygujący", "zmysłowy", "tajemniczy", "ekstatyczny", "ognisty", "rozpalony", "pasjonujący", "pełzający",
	"czujny", "ekstremalny", "przyciągający", "muskający", "sprowokowany", "obezwładniający", "podniecający",
	"oszałamiający", "drżący", "uwodzicielski", "szaleńczy", "zaspokajający", "przyciągający", "dominujący",
	"ogrzany", "przepełniony", "wyjątkowy", "nieodparty", "delikatny", "rozlewający", "pulsujący", "niezaspokojony",
	"hipnotyzujący", "oszałamiający", "ekstrawagancki", "sensualny", "rozkoszny", "subtelny", "intrygujący"
]

func losuj_slowa(): 
	czasowniki.shuffle()  
	Temp = czasowniki.slice(0, 25)
