BEGIN
INSERT INTO "AWARD_CHANNEL" ("ID", "NAME")
VALUES (4, 'Telesales');
INSERT INTO "AWARD_CHANNEL" ("ID", "NAME")
VALUES (3, 'SelfCare');
INSERT INTO "AWARD_CHANNEL" ("ID", "NAME")
VALUES (1, 'POS');
INSERT INTO "AWARD_CHANNEL" ("ID", "NAME")
VALUES (5, 'Webshop');
COMMIT;
END;
/

BEGIN
INSERT INTO "ISSUER_CHANNEL" ("ID", "NAME")
VALUES (2, 'Salesforce');
INSERT INTO "ISSUER_CHANNEL" ("ID", "NAME")
VALUES (3, 'SelfCare');
INSERT INTO "ISSUER_CHANNEL" ("ID", "NAME")
VALUES (4, 'Telesales');
INSERT INTO "ISSUER_CHANNEL" ("ID", "NAME")
VALUES (5, 'Webshop');
INSERT INTO "ISSUER_CHANNEL" ("ID", "NAME")
VALUES (1, 'POS');
COMMIT;
END;
/


BEGIN
INSERT INTO "PROPERTY" ("ID", "NAME")
VALUES (2, 'NamedHolders');
INSERT INTO "PROPERTY" ("ID", "NAME")
VALUES (4, 'HolderIsOnlyConsumer');
INSERT INTO "PROPERTY" ("ID", "NAME")
VALUES (5, 'AllowMultipleRedeems');
INSERT INTO "PROPERTY" ("ID", "NAME")
VALUES (6, 'AllowCouponSeries');
COMMIT;
END;
/
