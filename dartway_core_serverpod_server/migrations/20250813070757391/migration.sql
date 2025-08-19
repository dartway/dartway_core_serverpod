BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "dw_data_stash" CASCADE;


--
-- MIGRATION VERSION FOR dartway_core_serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('dartway_core_serverpod', '20250813070757391', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250813070757391', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
