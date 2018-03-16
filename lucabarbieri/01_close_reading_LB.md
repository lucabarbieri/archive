# The flow towards Europe #  
*** anno — 2015 ***   
*** design — Lucify e Ville Saarinen ***    
*** project — The flow towards europe ***     

### what’s — ###

L'Europa sta vivendo la più grande crisi dei rifugiati dalla seconda guerra mondiale. Sulla base dei dati dell'agenzia per i rifugiati delle Nazioni Unite, Ville Saarinen e Juho Ojala nel team finlandese di Lucify, chiariscono le l'entità della crisi. Il progetto di visualizzazione grafica di dati è una mappa che mostra il flusso dei richiedenti asilo verso i paesi europei nel tempo. La visualizzazione è pensata per fornire una comprensione intuitiva del problema nelle sue dimensioni di larga scala; percorsi o tempi di percorrenza non sono volutamente accurati. E’ presente anche un grafico a linee che mostra il tasso totale dei richiedenti asilo nel tempo.

### how does it work — ###

Ogni punto dovrebbe idealmente rappresentare una persona, tuttavia vista la mole di dati il grafico risulterebbe troppo affollato e servirebbero prestazioni che non tutti i browser supportano, per questo ogni punto mobile sulla mappa rappresenta da 25 a 50 persone, a seconda delle caratteristiche del dispositivo su cui vengono visualizzati. Passando il mouse sui paesi vengono mostrati i dettagli. Cliccando su un paese si blocca la selezione. I conteggi mostrati al passaggio del mouse rappresentano il numero di persone che hanno lasciato o sono arrivati in un paese dal 2012 al 2015. Il set di dati contiene informazioni su quanti richiedenti asilo sono arrivati in un dato mese. Per scegliere le date di arrivo per i rifugiati sono stati scelti in base a rapporti mensili. Inoltre, è stato assegnato a ciascun rifugiato una velocità casuale tra 4 e 6 km/h e è stata calcolata la data di inizio in base alla lunghezza del viaggio, alla velocità e alla data di arrivo. Naturalmente, i rifugiati si spostano con diversi mezzi, tra cui camminare, volare o andare in barca, in treno o in auto. Per questo motivo è stata approssimata una velocità media di 5 km / h.
Nella seconda visualizzazione è stato scelto un diagramma di Sankey con interazioni appropriate per concentrarsi sui singoli paesi. È basato sull'esempio Sankey di Mike Bostock.
L’implementazione è stata fatta in D3, PixiJS e la processazione dei dati in Ruby. Il codice sorgente della visualizzazione è disponibile in open source.
[+](https://github.com/lucified/lucify-refugees)

### how does it mean — ###
Dal lavoro traspare l’intenzione di ragguppare e interpretare una mole di dati relativi al fenomeno dei richiedenti asilo che in qualche modo si contrappone al perenne bombardamento mediatico al quale siamo purtroppo abituati. Una questione irrisolta per l’umanità.
Vedere visivamente mezzo milione di richiedenti asilo è una questione che fa riflettere inquadrando la questione in maniera più lontana e vedendo il fenomeno in maniera meno diretta.

### what if — ###
Il progetto pur parlando di migrazione prende in esame una sola fetta di territori riconducibili all’Europa, perché non estendere il lavoro per esempio integrando il Nord America? La tecnica narrativa utilizzata della visualizzazione di flussi può essere adattata a molti altri contesti per averne una maggiore comprensione di tali fenomeni.


*** fonti dei dati — ***
Dati mensili dei richiedenti asilo disponibili online presso l'UNHCR. [+](http://popstats.unhcr.org/en/asylum_seekers_monthly)
[+](http://data.unhcr.org/syrianrefugees/regional.php)
