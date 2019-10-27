# Skript Erstellung einfaches Netzwerk   (editiert von ls149)

# lädt igraph Bibliothek
library(igraph)

# liest die Edgelist als "el" ein
el <- read.csv("edgelist.csv", header=TRUE, as.is=TRUE, sep = ",")

# zeigt die ersten sechs Zeilen des Datensatzes "el" an
head(el)

# liest die Nodelist mit den Namen als "nodes" ein
nodes <- read.csv("nodelist.csv", header=TRUE, as.is=TRUE, sep = ",")

# zeigt die ersten sechs Zeilen der Nodelist "nodes" und die Attribute der Nodes an
head(nodes)

# Wandelt die Edgelist in eine Matrix um
hp_matrix <- as.matrix(el)

# zeigt die Matrix an
hp_matrix

# generiert ein igraph-Objekt (dataframe) aus der Matrix, das ungerichtet ist (directed = false)
hp <- graph_from_data_frame(d=hp_matrix, vertices=nodes, directed=FALSE)

# ruft unser neues igraph-Objekt auf
hp

# generiert die Standard-Visualisierung des Netzwerks
# plot(hp)

# Für Fortgeschrittene: verfeinerte Netzwerkdarstellung
# definiert einige grafische Elemente, damit wir diese nicht immer wieder eingeben müssen
#
# E(hp)$arrow.size <- .2 # keine Definition nötig, da Verbindungen ungerichtet sind
E(hp)$color="orange"   # Farbe der Verbindungen
E(hp)$width <- E(hp)$weight   # Dicke der Verbindungen hängt von der Variablen "weight" ab
# E(hp)$curved=.2   # Verbindungen sind Geraden, wenn keine Krümmung definiert ist
V(hp)$color="grey"   # Füllfarbe der Vertices
V(hp)$frame.color="black"   # Randfarbe der Vertices
V(hp)$label.dist=0   # Verschiebung der Vertex-Labels vom Mittelpunkt des Vertex
V(hp)$label.degree=1.57   # Winkellage der Vertex-Labels PI/2 ist unten (in Radian)
V(hp)$label.cex=0.7   # Skalierung der Schriftgröße der Vertex-Labels
V(hp)$label.family="Helvetica"
V(hp)$label.font=2   # Schriftattribut 1=normal, 2=fett, 3=kursiv ...
V(hp)$label.color="darkgreen"   # Schriftfarbe der Labels

degree <- degree(hp)  # Bestimmung der Anzahl von Verbindungen eines Vertex
degree   # zeigt die Anzahl der Verbindungen aller Vertices an

# einfacher plot
plot(hp,
     layout=layout_with_kk,
     vertex.size=degree*10,  # skaliert die Vertexgröße mit der Anzahl ihrer Verbindungen
     main="Harry Potter - und der Gefangene von Azkaban",  # Überschrift des Plots
     sub="Freundschaften der Charaktere des Buches in drei Abstufungen      ls149")  # Überschrift des Plots

