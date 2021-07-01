# harcdzielnia

harcdzielnia to strona z listą harcerskich ubrań, które dostałem bo były już za
małe dla druhów z drużyny. Dzięki temu można taką listę wysłać rodzicom, żeby
nie musieli kupować nowych ciuszków.

## Uruchamianie

Aby wyrenderować stronę potrzebujesz `coreutils` (albo alternatywę)

```
  cd harcdzielnia
  ./deploy.sh
```

## Jak to działa

Skrypt deploy.sh jest bardzo prosty i możesz samemu zobaczyć jak on działa, ale
w skrócie bierze on wszystkie pliki .md z folderu `itemy` i generuje na jej
podstawie listę w index.html.
