# Skript Erstellung einfaches Netzwerk

# lädt igraph Bibliothek (ggf. vorher isntallieren)
library(igraph)

# liest die Edgelist als "el" ein
el <- read.csv("https://raw.githubusercontent.com/hdm-crpr/226305/master/datasets/hp_network/hp_el.csv", header=T, as.is=T, sep = ",")

# zeigt die ersten sechs Zeilen des Datensatzes an
head(el)

# liest die Nodelist mit den Namen ein
nodes <- read.csv("https://raw.githubusercontent.com/hdm-crpr/226305/master/datasets/hp_network/hp_nl.csv", header=T, as.is=T, sep = ",")

# zeigt die ersten sechs Zeilen der Nodelist und die Attribute der Nodes an
head(nodes)

# Zwischenschritt verbindet die Edge- und Nodelist zu einer Matrix
hp_matrix <- as.matrix(el)

# zeigt die Matrix an
hp_matrix

# generiert ein igraph-Objekt (dataframe) aus der Matrix, das gerichtet ist (directed = true)
hp <- graph_from_data_frame(d=hp_matrix, vertices=nodes, directed=TRUE)

# ruft unser neues igraph-Objekt auf
hp

# generiert die Standard-Visualisierung des Netzwerks
plot(hp)

# Für Fortgeschrittene: verfeinerte Netzwerkdarstellung
# definiert einige grafische Elemente, damit wir diese nicht immer wieder eingeben müssen
#
E(hp)$arrow.size <- .2
E(hp)$color="darkblue"
E(hp)$width <- E(hp)$weight
E(hp)$curved=.2
V(hp)$color = "lightblue"
V(hp)$frame.color = "white"
V(hp)$label.dist = 3
V(hp)$label.degree=6
V(hp)$label.cex=.8
V(hp)$label.family="Helvetica"
V(hp)$label.font=1
V(hp)$label.color="darkblue"

degree <- degree(hp)
degree

# einfacher plot
plot(hp,
     layout=layout_with_kk,
     vertex.size=degree*10,
     main="Harry Potter-Netzwerk mit Degree-Verteilung")

