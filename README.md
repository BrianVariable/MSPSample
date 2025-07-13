Read Me:
This repo contains a sample environment containing various components of a modern data platform.  These include the following:

Fivetran:
- Setup: for simplicity used google sheets > snowflake.  personal auth for google sheets, created un/pw user for snowflake.  In actual practice would have made this a service user and key pair auth as snowflake is deprecating the un/pw.
- Connections: two connections created one for each of the sheets in the sample data.  Fivetran indicated best practice is to create a pipeline per sheet.
Sync Schedule: Pipelines paused after initial connection.


Snowflake:
-	Setup – Standard edition for cost due to lack of complexity of pipeline itself.  Would likely evaluate enterprise and work with snowflake SA team to determine anticipated cost and commit to agreement.  Discount on credits is anywhere from 6-8% and can likely get entry into startup program to get an additional bucket of free credits.  20k p/y min agreement though.
-	Warehouse – setup an ETL and Reporting warehouse as a starting point.  Both XS due to data size.  Allow us keep usage contained to purpose driven compute to easily evaluate cost later as well as not have loads interfere with reporting/analytics use cases and vise versa.
-	Security – didn’t stand this up just due to time for exercise however my standard is MFA (or SSO if possible) for human users on a single network policy that only whitelists their IP addresses, service users utilizing key auth for automation and orchestration, each purpose driven for toolset and each on a network policy that whitelists IPs as documented by service.
-	Environments – stood up a single environment but I am a major proponent of utilizing a 3 tier approach. DEV – open access for developers, stagnant data that depending on sensitivity of environment can be refreshed to pull some things back from PROD.  STG – staging environment that allows us to test prior to releasing anything in production, utilizes a cloning strategy to keep source data in sync with PROD so pipelines do not need to be duplicative, mainly serves as an environment we can test DBT with.  PROD production environment, limited access to developers.

DBT:
- DBT environment is fairly naive in its current state but did setup snapshots for change capture and a simple fact/dim pattern that today is going to be current state (ie full refresh)  Also created some tests but time limiting did not create tests for all models.

Hex.tech:
- Service admin user provisioned for hex in snowflake and simple visuals created.
https://app.hex.tech/01980565-bf91-7111-9ffd-2b00a8349664/app/01980566-4539-7111-a902-b1e5b006c7a0/latest
