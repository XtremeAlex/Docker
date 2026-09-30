# Docker toolkit

Un piccolo ambiente di sviluppo pronto all'uso: un backend su Tomcat, un
frontend dietro NGINX e, se servono, Oracle, WebLogic, SonarQube e un
visualizzatore dei log in tempo reale. Ogni pezzo si avvia con uno script.

## Avvio rapido

| Cosa vuoi avviare | Comando | Compose usato |
|---|---|---|
| Tutto (backend + frontend + log) | `sh deploy-all.sh` | `docker-compose.yml` + `deploy-app-logs.sh` |
| Solo il backend (Tomcat) | `sh deploy-be.sh` | `docker-compose-only-be.yml` |
| Solo il frontend (NGINX) | `sh deploy-fe.sh` | `docker-compose-only-fe.yml` |
| Solo Oracle 11 | `sh deploy-oracle.sh` | `docker-compose-only-oracle.yml` |
| Solo SonarQube | `sh deploy-sonar.sh` | `docker-compose-only-sonar.yml` |
| Solo i visualizzatori dei log in tempo reale | `bash deploy-app-logs.sh` | container `mthenw/frontail` |

WebLogic ha un suo compose (`docker-compose-weblogic.yml`) e richiede prima la
build dell'immagine: vedi [`weblogic12/docker_build/`](weblogic12/docker_build/).
Per Oracle vedi [`oracle11/`](oracle11/).

## Rete e porte

Tutti i servizi stanno sulla stessa rete bridge Docker (`xtremealex_local`),
con IP fissi assegnati nei file compose e in `deploy-app-logs.sh`:

| Servizio | Container | Porte host |
|---|---|---|
| NGINX (frontend) | `nginx-fe` | 80, 443 |
| Tomcat (backend) | `tomcat-be` | 8081 → 8080, 8009 |
| WebLogic 12.2.1.3 | `wlsnode01` | 7001 → 8001, 9002 |
| Oracle 11 | `oracle-db-11` | 1521, 5500 |
| SonarQube | `sonar` | 9000 (context `/sonar`) |
| Log in tempo reale | `be-app1-log`, `be-app2-log`, `nginx-access-log`, `nginx-error-log` | porte casuali (`-P`) |

## Da sapere

- I volumi puntano a percorsi assoluti sotto `/opt/docker/toolkit/`: il toolkit
  si aspetta di essere copiato lì (oppure adatta i percorsi nei compose).
- `deploy-app-logs.sh` usa gli array di bash: lancialo con `bash`, non con `sh`.
  Si aggancia alla rete `xtremealex_local`, quindi va eseguito dopo che il
  compose l'ha creata.
- `tomcat/docker-compose-v1.yml` è una prima versione del setup Tomcat + NGINX
  con immagini ufficiali (`tomcat:8.5`, `nginx:1.19`), tenuta come riferimento.
