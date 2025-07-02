BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "dw_data_stash" (
    "id" bigserial PRIMARY KEY,
    "identifier" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "data" json NOT NULL
);


--
-- MIGRATION VERSION FOR dartway_core_serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('dartway_core_serverpod', '20250702150820984', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250702150820984', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
