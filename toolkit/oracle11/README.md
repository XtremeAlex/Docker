# Oracle XE 11g

Il database si basa sull'immagine `oracleinanutshell/oracle-xe-11g`:

```bash
docker pull oracleinanutshell/oracle-xe-11g
```

Se ti serve APEX aggiornato (18.1), scarica invece il tag
`oracleinanutshell/oracle-xe-11g:18.04-apex`. La console di amministrazione è
su <http://localhost:8080/apex/apex_admin>, con queste credenziali:

- username: `ADMIN`
- password: `Oracle_11g`

La verifica della password è disattivata di default, quindi le password non
scadono.

## Connessione al database

| Parametro | Valore |
|---|---|
| hostname | `localhost` |
| porta | `49161` |
| SID | `xe` |
| username | `system` |
| password | `oracle` |

La password di `SYS` e `SYSTEM` è `oracle`.

Nota: la porta `49161` è quella predefinita dell'immagine se la avvii da sola.
Con `docker-compose-only-oracle.yml` del toolkit il listener è esposto sulla
`1521`. Sono credenziali di default dell'immagine: vanno bene solo in locale.
