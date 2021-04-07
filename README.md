when using filter on subject model, referencing accounts through accountSubject and "every", the returned data are wrong

# Bug report
https://github.com/prisma/prisma/issues/6441

# How to run
Use docker-compose to run, the entrypoint is mapped to npm run build:run, which installs dependencies, generates prisma client, migrates database and runs the app

The init script (packages.json - scripts) includes:
* npm ci
* npx prisma generate
* npx prisma migrate dev -n init
* npx ts-node app.ts

It means the startup is a bit slow, since it always runs all these, but you don't have to fiddle with anything else

Docker creates 2 containers - postgres database from alpine image and a node image which uses host binds to add the project folder inside
