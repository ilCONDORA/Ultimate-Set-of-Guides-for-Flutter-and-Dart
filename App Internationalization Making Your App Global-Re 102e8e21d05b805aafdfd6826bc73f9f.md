# App Internationalization: Making Your App Global-Ready

Rendere l’app disponibile in qualsiasi lingua è la cosa migliore per avere un pubblico più ampio possibile. Per raggiungere questo obiettivo si deve utilizzare tre pacchetti: [**intl**](https://pub.dev/packages/intl), [**flutter_localizations**](https://pub.dev/packages/flutter_localization) e [**hydrated_bloc**](https://pub.dev/packages/hydrated_bloc). L’utilizzo di hydrated_bloc è importantissima perché ci rende mooolto più semplice la persistenza dello stato della lingua e la gestione dell’evento del cambio della lingua.

# File richiesti e struttura

 📂 lib
└── 📂 l10n
         ├── 📄 app_en.arb
         ├── 📄 app_it.arb
         └── 📄 l10n.dart

Quindi in ‘lib’ va creata la cartella ‘l10n’ dove andremo a mettere tutti i file arb(fimili a json) e il file ‘l10n.dart’ che è soltanto una classe che dichiara quali lingue disponibili ci sono. Ecco qua sotto come appare il file con la classe:

```dart
import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('it'),
  ];
}

// lanciare flutter gen-l10n ogni volta che si aggiunge qualcosa negli arb o in questo file.
```

Qua invece come appare il file ‘arb’:

```json
{
  "@@locale": "it",
  "exploreMovementsTitle": "Esplora movimenti",
  "@exploreMovementsTitle": {
    "description": "Bottone nel drawer laterale che porta alla schermata di esplorazione dei movimenti"
  },
  "yourSpaceTitle": "Il tuo spazio",
  "@yourSpaceTitle": {
    "description": "Bottone nel drawer laterale che porta alla schermata di esplorazione del tuo spazio"
  },
  "settingsTitle": "Impostazioni",
  "@settingsTitle": {
    "description": "Bottone nel drawer laterale che porta alla schermata di impostazioni"
  },
  "errorFetchingFilters": "Errore durante il recupero dei filtri, riprovare più tardi. Se il problema persiste, contattare l''amministratore.",
  "@errorFetchingFilters": {
    "description": "Errore nel recupero dei filtri dal database. Messaggio per riprovare o contattare l'amministratore."
  }
}
```

È caldamente consigliato installare l’estensione per il tuo IDE di Google per il linting dei file arb, l’estensione è chiamata ARB Editor.