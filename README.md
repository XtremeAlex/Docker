# Docker

Raccolta di configurazioni, script e toolkit Docker per sviluppo e ambienti di prova.

## Contenuto

- `_install_docker/` — note per l'installazione di Docker
- `shell/` — script di utilita:
  - `_start_docker.sh`, `_stop_docker.sh`, `_restart_docker.sh` — gestione del servizio
  - `_clean_all_not_used.sh` — pulizia di immagini/volumi/container inutilizzati
- `toolkit/` — stack di esempio containerizzati:
  - Tomcat (single node e cluster), WebLogic 12, Oracle 11, SonarQube
  - `docker-compose-*.yml` e script `deploy-*.sh` per avviare i vari profili

## Note

Gli esempi usano credenziali e host di default pensati per ambienti locali di
sviluppo (es. `admin`, `ORACLE_HOST_IP` come placeholder). Sostituiscili con
valori reali e sicuri prima di qualsiasi uso non locale. Non committare mai IP,
host o credenziali di produzione.

## Contatti

Andrei Alexandru Dabija — [LinkedIn](https://www.linkedin.com/in/andrei-alexandru-dabija/) — [github.com/XtremeAlex](https://github.com/XtremeAlex)
