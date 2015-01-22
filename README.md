# Collatinus

Ce dépôt contient les données exploitées par [Collatinus](http://outils.biblissima.fr/collatinus/), un logiciel libre et gratuit pour la lemmatisation et l'analyse morphologique de textes latins. 

Ces données correspondent aux ressources linguistiques utilisées à la fois par la version dite "standalone" de Collatinus et par la version web (fichiers de dictionnaires de latin, lexiques en différentes langues, désinences etc.).

Les sources de l'application Collatinus sont disponibles sur Github : 
- version pour bureau : https://github.com/biblissima/collatinus-src
- version web (démon) : https://github.com/biblissima/collatinus-web-daemon

Collatinus est développé par Yves Ouvrard et Philippe Verkerk.

Page de présentation et téléchargement sur le site Biblissima : [http://outils.biblissima.fr/collatinus/](http://outils.biblissima.fr/collatinus/) (exécutables disponibles pour Mac OS, GNU/Linux et Windows).

## Avertissements

Ce dépôt ne contient pas l'intégralité des données exploitées par Collatinus. Ainsi les fichiers sources XML ou DjVu des dictionnaires de latin ne sont pas inclus car trop volumineux. Ils sont téléchargeables séparément depuis la page Collatinus du site Biblissima (section Téléchargements) : http://outils.biblissima.fr/collatinus/#telechargements

Pour que ces données soient adaptées à la version bureau de Collatinus, il convient de créer, dans ce répertoire ressources, un sous-répertoire dicos dans lequel sont rangés les fichiers relatifs aux dictionnaires (*.cfg, *.idx, *.css et *.xsl). Selon le système d'exploitation utilisé, le dossier ressources devra être rangé à un endroit précis. Pour Windows et Linux, il doit se trouver au même niveau que l'exécutable. Pour Mac OSX, tout se passe dans le paquet Collatinus.app (ou tout autre nom que l'on souhaite lui donner) et le dossier ressources doit être placé dans le répertoire Contents/MacOS (à côté de l'exécutable ; cet emplacement n'est probablement pas conforme aux directives d'Apple, et pourrait être modifié dans une version ultérieure).

## Crédits

**Remerciements** : William Whitaker †, Jose Luis Redrejo, Georges Khaznadar, Matthias Bussonier, Gérard Jeanneau, Philippe Verkerk, Jean-Paul Woitrain, Philipp Roelli, Perseus Digital Library.
