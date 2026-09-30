# Build dell'immagine WebLogic 12.2.1.3

L'immagine WebLogic si basa sulla Server JRE 8 di Oracle, che va scaricata dal
registry Oracle (serve un account e l'accettazione della licenza).

1. Accedi a Docker Hub e al registry Oracle:

   ```bash
   docker login
   docker login container-registry.oracle.com
   ```

2. Scarica la Java 8 di Oracle e ritaggala con il nome che si aspetta lo script:

   ```bash
   docker pull container-registry.oracle.com/java/serverjre:8
   docker image tag container-registry.oracle.com/java/serverjre oracle/serverjre:8
   ```

   In alternativa puoi usare un'altra JRE 8: in quel caso indica all'installer di
   WebLogic il nome dell'immagine che vuoi usare.

3. Lancia la build (versione 12.2.1.3, distribuzione developer, senza controllo
   dei checksum):

   ```bash
   sh buildDockerImage.sh -v 12.2.1.3 -d -s
   ```

Poi avvia il container con `docker-compose-weblogic.yml` dalla cartella `toolkit/`.
