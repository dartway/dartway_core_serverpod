BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "dw_auth_request" ADD COLUMN "verificationHash" text;
ALTER TABLE "dw_auth_request" ALTER COLUMN "extraData" DROP NOT NULL;

--
-- MIGRATION VERSION FOR dartway_core_serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('dartway_core_serverpod', '20251017050356465', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251017050356465', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
