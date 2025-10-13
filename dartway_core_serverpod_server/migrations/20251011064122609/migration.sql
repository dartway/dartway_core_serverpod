BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "dw_phone_verification_request" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "dw_phone_failed_sign_in" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "dw_auth_data_stash" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "dw_auth_request" (
    "id" bigserial PRIMARY KEY,
    "requestType" text NOT NULL,
    "userIdentifier" text NOT NULL,
    "authProvider" text NOT NULL,
    "verificationType" bigint NOT NULL,
    "status" text NOT NULL DEFAULT 'pending'::text,
    "errorMessage" text,
    "errorData" json,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "verifiedAt" timestamp without time zone,
    "extraData" json NOT NULL
);


--
-- MIGRATION VERSION FOR dartway_core_serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('dartway_core_serverpod', '20251011064122609', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251011064122609', "timestamp" = now();

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
