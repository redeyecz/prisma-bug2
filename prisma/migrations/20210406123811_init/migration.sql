-- CreateTable
CREATE TABLE "account" (
    "id" BIGSERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "dateInsert" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "account_subject" (
    "id" BIGSERIAL NOT NULL,
    "accountId" BIGINT NOT NULL,
    "subjectId" BIGINT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subject" (
    "id" BIGSERIAL NOT NULL,
    "accountInsertId" BIGINT NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "account_subject" ADD FOREIGN KEY ("accountId") REFERENCES "account"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "account_subject" ADD FOREIGN KEY ("subjectId") REFERENCES "subject"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subject" ADD FOREIGN KEY ("accountInsertId") REFERENCES "account"("id") ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO account ("name") VALUES ('Account 1');
INSERT INTO account ("name") VALUES ('Account 2');

INSERT INTO subject ("accountInsertId") VALUES (1);
