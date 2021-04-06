import {PrismaClient} from '@prisma/client'
import express from 'express';

const app = express()
const port = 3000

const prisma = new PrismaClient({
  log: ['query', 'info', `warn`, `error`],
})

// @ts-ignore // Typescript definition invalid? query not recognized as a valid string
prisma.$on('query', (e) => {
  console.log(e);
});

app.get('/', async (req: any, res: any) => {
  const all = await prisma.subject.findMany({
    where: {
      accountSubjects: {
        every: {
          accountId: 1
        }
      }
    }
  });

  console.log(all);
  // this produces 3 records just fine
  res.send(`
  await prisma.subject.findMany({
    where: {
      accountSubjects: {
        every: {
          accountId: 1
        }
      }
    }
  })
  <br><br>
  ${toJson(all)}`);
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

// hack for serializing bigint
function toJson(data: any) {
  return JSON.stringify(data, (_, v) => typeof v === 'bigint' ? `${v}n` : v)
    .replace(/"(-?\d+)n"/g, (_, a) => a);
}

