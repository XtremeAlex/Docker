# Docker

Qui tengo configurazioni, script e piccoli stack Docker che ho usato per
sviluppare e fare prove in locale: application server, database, reverse proxy
e qualche utility per tenere pulito l'ambiente.

> Stato: materiale storico (2021). Le immagini di riferimento (Tomcat 8.5,
> NGINX 1.19, WebLogic 12.2.1.3, Oracle XE 11g) e la sintassi `docker-compose`
> v1 sono datate. Lo lascio come riferimento: prima di riusarlo aggiorna
> versioni e comandi (oggi `docker compose`).

## Cosa c'è dentro

- [`_install_docker/`](_install_docker/): spazio per le note di installazione di Docker.
- `shell/`: script di utilità per il servizio Docker:
  - `_start_docker.sh`, `_stop_docker.sh`, `_restart_docker.sh`: avvio, arresto e riavvio
  - `_clean_all_not_used.sh`: fa pulizia con `docker system prune` (container
    fermi, reti inutilizzate, immagini orfane e cache di build)
- [`toolkit/`](toolkit/): stack di esempio già containerizzati:
  - Tomcat (nodo singolo e cluster), WebLogic 12, Oracle 11, SonarQube, NGINX
  - file `docker-compose-*.yml` e script `deploy-*.sh` per avviare i vari profili

## Prima di usarlo

Gli esempi usano credenziali e host di default pensati solo per lo sviluppo in
locale (per esempio `admin`, oppure `ORACLE_HOST_IP` come segnaposto).
Sostituiscili con valori tuoi e sicuri prima di qualsiasi uso non locale, e non
committare mai IP, host o credenziali di produzione.

## Licenza
Distribuito sotto licenza [Creative Commons Attribution 4.0 (CC BY 4.0)](LICENSE). Puoi condividere e adattare il materiale, anche commercialmente, a condizione di citare l'autore.

## Contatti

Andrei Alexandru Dabija (XtremeAlex) · [alexdabi92@gmail.com](mailto:alexdabi92@gmail.com) · [2ad.bubume.it](https://2ad.bubume.it/) · [LinkedIn](https://www.linkedin.com/in/andrei-alexandru-dabija/) · [github.com/XtremeAlex](https://github.com/XtremeAlex)
