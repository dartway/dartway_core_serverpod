BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "dw_auth_verification" (
    "id" bigserial PRIMARY KEY,
    "dwAuthRequestId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "dw_auth_verification"
    ADD CONSTRAINT "dw_auth_verification_fk_0"
    FOREIGN KEY("dwAuthRequestId")
    REFERENCES "dw_auth_request"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR dartway_core_serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('dartway_core_serverpod', '20251017052724328', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251017052724328', "timestamp" = now();

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
