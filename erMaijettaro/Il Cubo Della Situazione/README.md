# IL CUBO DELLA SITUAZIONE
## #riusabile #eclettico #modulabile
### CONCEPT
> L'utente entra in una stanza e vede cubetti per terra muoversi vibrando, ha un foglietto in mano con su scritto "assegna argomento a cubetto" e un elenco di argomenti lungo uguale al numero di cubetti per terra. L'utente capisce che il vibrare dei cubetti è un indizio per decifrare l'ordine. C'è un elemento che mi fa capire che più vibra il cubetto più la sua notizia è diffusa e parlata. Quando l'utente esce dalla stanza scopre in qualche maniera la giusta corrispondenza.


### REFERENZE
#### Garden of Eden - Thorsten Kiesl, Harald Moser, and Timm-Oliver Wilks (2007)
>Garden of Eden è un progetto composto da otto lattughe, ognuna delle quali è racchiusa nella sua scatola di plexiglas a tenuta d'aria e rappresenta una grande città. La concentrazione dell'ozono in ciascuna scatola è controllata in tempo reale per riflettere l'attuale livello di inquinamento nella città.

![Imgur](https://imgur.com/klqOLAD.png)
![Imgur](https://imgur.com/vcyNAR7.png)


#### Dynamic Physical Charts to Communicate Community Data - David Sweeney (2014)
>David Sweeney di Microsoft Research ha progettato Dynamic Physical Charts, dei diagrammi fisici guidati meccanicamente per comunicare i dati alle persone che vivono o lavorano a Tenison Road a Cambridge, nel Regno Unito. Le classifiche fanno parte di un progetto di ricerca  per esplorare la comprensione dei dati da parte del pubblico e come può essere utilizzato per migliorare la vita a livello stradale: un migliore accesso ai servizi, il miglioramento delle relazioni sociali, un migliore coinvolgimento con la governance locale, eccetera.

![Imgur](https://imgur.com/4YV4mHd.jpg)
![Imgur](https://imgur.com/UuHG6N1.jpg)


#### Participatory Representation of Happiness - Stefan Sagmeister (2015)
>Questa fisizzazione del 2015 faceva parte della [*mostra sulla felicità*](https://sagmeisterwalsh.com/work/all/the-happy-show/) del designer Stefan Sagmeister . Contiene una rappresentazione partecipativa della felicità del telespettatore, che richiama il [*sondaggio MOMA*](http://dataphys.org/list/moma-poll-haackes-participatory-bar-chart/) di  Hans Haacke  (1970) e  il [*grafico partecipativo*](http://dataphys.org/list/physical-bar-charts/) di Lucy Kimball  (2006). Le unità che costituiscono la rappresentazione sono gumballs, come  la [*rappresentazione partecipativa*](http://dataphys.org/list/physical-visual-sedimentation/) di Jennifer Payne  (2014). A differenza degli esempi citati in Participatory Representation of Happiness le gummball vengono lasciate all'utente come regalo (e non viene chiesto loro di spostarle da un'altra parte) e l'indicatore fisico ad istogramma funziona con i vuoti in quanto il progetto è pensato per sottrazione delle gummball.

![Imgur](https://imgur.com/VIYKCmJ.jpg)



### DATI
>I dati vengono prelevati con uno scrapper messo a disposizione su Github. Nell'idea originale del progetto viene scrappato l'andamento delle prescelte parole chiave da Google Trend, ma la flessibilità del progetto, oltre a rendere facile l'aggiornamento delle parole chiave messe a confronto, permette di poter scegliere fra 4 piattaforme diverse dove fare scraping.
>[**Google Trends**](https://github.com/clintonboys/trendy-scraper)
>[**Instagram**](https://github.com/rarcega/instagram-scraper)
>[**Google News**](https://github.com/jm-contreras/google-news)
>[**Twitter**](https://github.com/taspinar/twitterscraper)



### ELABORAZIONE
>I dati vengono consegnati ad un arduino che li converte in segnale per i [*led*](https://www.pannelloled.it/striscia-led-singola-rgb-5m-60led) e i [*motori a vibrazione.*](https://www.cariatielettronica.eu/motori/2653-motore-a-vibrazione-vibratore-15v-arduino.html) Ogni volta che viene scrappata una parola chiave viene inviato un segnale che fa illuminare per 2 secondi tutti i led del quadro corrispondente e fa vibrare per 2 secondi i motori. Nel frattempo il corrispettivo contatore di parole chiave scrappate si incrementa proporzionalmente e ogni 100 parole chiave accumulate manda un segnale che fa illuminare permanentemente, partendo dal basso, una nuova striscia di led.



### VISUALIZZAZIONE
>
