﻿BEGIN
BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"__EFMigrationsHistory" (
    "MigrationId" NVARCHAR2(150) NOT NULL,
    "ProductVersion" NVARCHAR2(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
)';
END;
EXCEPTION
WHEN OTHERS THEN
    IF(SQLCODE != -942)THEN
        RAISE;
    END IF;
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"AccessLog" (
    "Id" NUMBER(19) NOT NULL,
    "ApplicationType" NUMBER(10) NOT NULL,
    "Channel" NVARCHAR2(2000),
    "Action" NVARCHAR2(2000),
    "Username" NVARCHAR2(2000),
    "IssuedDate" TIMESTAMP(7) NOT NULL,
    CONSTRAINT "PK_AccessLog" PRIMARY KEY ("Id")
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"AwardChannel" (
    "Id" NUMBER(19) NOT NULL,
    "Name" NVARCHAR2(2000),
    CONSTRAINT "PK_AwardChannel" PRIMARY KEY ("Id")
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"IssuerChannel" (
    "Id" NUMBER(19) NOT NULL,
    "Name" NVARCHAR2(2000),
    CONSTRAINT "PK_IssuerChannel" PRIMARY KEY ("Id")
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"Promotion" (
    "Id" NUMBER(19) NOT NULL,
    "Code" NVARCHAR2(450) NOT NULL,
    "Enabled" NUMBER(1) NOT NULL,
    "ValidFrom" TIMESTAMP(7),
    "ValidTo" TIMESTAMP(7),
    "CouponSeries" NUMBER(10) NOT NULL,
    CONSTRAINT "PK_Promotion" PRIMARY KEY ("Id")
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"Property" (
    "Id" NUMBER(19) NOT NULL,
    "Name" NVARCHAR2(2000),
    CONSTRAINT "PK_Property" PRIMARY KEY ("Id")
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"System" (
    "Id" NUMBER(19) NOT NULL,
    "Name" NVARCHAR2(2000),
    "Username" NVARCHAR2(2000),
    "Password" NVARCHAR2(2000),
    CONSTRAINT "PK_System" PRIMARY KEY ("Id")
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"User" (
    "Username" NVARCHAR2(450) NOT NULL,
    "Domain" NVARCHAR2(2000),
    "Fullname" NVARCHAR2(2000),
    "AccessType" NUMBER(10) NOT NULL,
    CONSTRAINT "PK_User" PRIMARY KEY ("Username")
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"Coupon" (
    "Id" NUMBER(19) NOT NULL,
    "Code" NVARCHAR2(450),
    "Holder" NVARCHAR2(2000),
    "User" NVARCHAR2(2000),
    "Status" NUMBER(10) NOT NULL,
    "AquireFrom" TIMESTAMP(7),
    "AquireTo" TIMESTAMP(7),
    "AwardFrom" TIMESTAMP(7),
    "AwardTo" TIMESTAMP(7),
    "PromotionId" NUMBER(19) NOT NULL,
    "CouponSeries" NUMBER(10) NOT NULL,
    "MaxRedeemNo" NUMBER(10) NOT NULL,
    "Enabled" NUMBER(1) NOT NULL,
    CONSTRAINT "PK_Coupon" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Coupon_Promotion_PromotionId" FOREIGN KEY ("PromotionId") REFERENCES "Promotion" ("Id") ON DELETE CASCADE
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"PromotionAwardChannel" (
    "PromotionId" NUMBER(19) NOT NULL,
    "AwardChannelId" NUMBER(19) NOT NULL,
    CONSTRAINT "PK_PromotionAwardChannel" PRIMARY KEY ("PromotionId", "AwardChannelId"),
    CONSTRAINT "FK_PromotionAwardChannel_AwardChannel_AwardChannelId" FOREIGN KEY ("AwardChannelId") REFERENCES "AwardChannel" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_PromotionAwardChannel_Promotion_PromotionId" FOREIGN KEY ("PromotionId") REFERENCES "Promotion" ("Id") ON DELETE CASCADE
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"PromotionIssuerChannel" (
    "PromotionId" NUMBER(19) NOT NULL,
    "IssuerChannelId" NUMBER(19) NOT NULL,
    CONSTRAINT "PK_PromotionIssuerChannel" PRIMARY KEY ("PromotionId", "IssuerChannelId"),
    CONSTRAINT "FK_PromotionIssuerChannel_IssuerChannel_IssuerChannelId" FOREIGN KEY ("IssuerChannelId") REFERENCES "IssuerChannel" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_PromotionIssuerChannel_Promotion_PromotionId" FOREIGN KEY ("PromotionId") REFERENCES "Promotion" ("Id") ON DELETE CASCADE
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"PromotionProperty" (
    "PromotionId" NUMBER(19) NOT NULL,
    "PropertyId" NUMBER(19) NOT NULL,
    CONSTRAINT "PK_PromotionProperty" PRIMARY KEY ("PromotionId", "PropertyId"),
    CONSTRAINT "FK_PromotionProperty_Promotion_PromotionId" FOREIGN KEY ("PromotionId") REFERENCES "Promotion" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_PromotionProperty_Property_PropertyId" FOREIGN KEY ("PropertyId") REFERENCES "Property" ("Id") ON DELETE CASCADE
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"NotifyList" (
    "ChannelId" NUMBER(19) NOT NULL,
    "SystemId" NUMBER(19) NOT NULL,
    "Url" NVARCHAR2(2000),
    CONSTRAINT "PK_NotifyList" PRIMARY KEY ("SystemId", "ChannelId"),
    CONSTRAINT "FK_NotifyList_IssuerChannel_ChannelId" FOREIGN KEY ("ChannelId") REFERENCES "IssuerChannel" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_NotifyList_System_SystemId" FOREIGN KEY ("SystemId") REFERENCES "System" ("Id") ON DELETE CASCADE
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"CouponAwardChannel" (
    "CouponId" NUMBER(19) NOT NULL,
    "AwardChannelId" NUMBER(19) NOT NULL,
    CONSTRAINT "PK_CouponAwardChannel" PRIMARY KEY ("CouponId", "AwardChannelId"),
    CONSTRAINT "FK_CouponAwardChannel_AwardChannel_AwardChannelId" FOREIGN KEY ("AwardChannelId") REFERENCES "AwardChannel" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_CouponAwardChannel_Coupon_CouponId" FOREIGN KEY ("CouponId") REFERENCES "Coupon" ("Id") ON DELETE CASCADE
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"CouponHistory" (
    "Id" NUMBER(19) NOT NULL,
    "Date" TIMESTAMP(7) NOT NULL,
    "Action" NVARCHAR2(2000),
    "Status" NUMBER(10) NOT NULL,
    "CouponId" NUMBER(19) NOT NULL,
    "User" NVARCHAR2(2000),
    CONSTRAINT "PK_CouponHistory" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_CouponHistory_Coupon_CouponId" FOREIGN KEY ("CouponId") REFERENCES "Coupon" ("Id") ON DELETE CASCADE
)';
END;
/

BEGIN 
EXECUTE IMMEDIATE 'CREATE TABLE 
"CouponIssuerChannel" (
    "CouponId" NUMBER(19) NOT NULL,
    "IssuerChannelId" NUMBER(19) NOT NULL,
    CONSTRAINT "PK_CouponIssuerChannel" PRIMARY KEY ("CouponId", "IssuerChannelId"),
    CONSTRAINT "FK_CouponIssuerChannel_Coupon_CouponId" FOREIGN KEY ("CouponId") REFERENCES "Coupon" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_CouponIssuerChannel_IssuerChannel_IssuerChannelId" FOREIGN KEY ("IssuerChannelId") REFERENCES "IssuerChannel" ("Id") ON DELETE CASCADE
)';
END;
/

BEGIN
INSERT INTO "AccessLog" ("Id", "Action", "ApplicationType", "Channel", "IssuedDate", "Username")
VALUES (1, N'Create Promotion', 0, N'POS', TO_DATE('2020-04-30 15:18:34', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "AccessLog" ("Id", "Action", "ApplicationType", "Channel", "IssuedDate", "Username")
VALUES (2, N'Update Coupon', 1, NULL, TO_DATE('2020-04-30 15:18:34', 'YYYY-MM-DD HH24:MI:SS'), N'korisnik');
END;
/

BEGIN
INSERT INTO "AwardChannel" ("Id", "Name")
VALUES (1, N'POS');
INSERT INTO "AwardChannel" ("Id", "Name")
VALUES (3, N'SelfCare');
INSERT INTO "AwardChannel" ("Id", "Name")
VALUES (4, N'Telesales');
INSERT INTO "AwardChannel" ("Id", "Name")
VALUES (5, N'Webshop');
END;
/

BEGIN
INSERT INTO "IssuerChannel" ("Id", "Name")
VALUES (1, N'POS');
INSERT INTO "IssuerChannel" ("Id", "Name")
VALUES (2, N'Salesforce');
INSERT INTO "IssuerChannel" ("Id", "Name")
VALUES (3, N'SelfCare');
INSERT INTO "IssuerChannel" ("Id", "Name")
VALUES (4, N'Telesales');
INSERT INTO "IssuerChannel" ("Id", "Name")
VALUES (5, N'Webshop');
END;
/

BEGIN
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (15, N'Summer5', 0, 1, TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (16, N'Spring6', 0, 1, TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (17, N'Easter6', 0, 0, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (18, N'Summer6', 0, 1, TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (19, N'Spring7', 0, 1, TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (24, N'Summer8', 0, 1, TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (21, N'Summer7', 0, 1, TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (22, N'Spring8', 0, 1, TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (23, N'Easter8', 0, 0, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (14, N'Easter5', 0, 0, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (20, N'Easter7', 0, 0, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (13, N'Spring5', 0, 1, TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (12, N'Summer4', 0, 1, TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (11, N'Easter4', 0, 0, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (2, N'Easter', 0, 1, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (3, N'Summer', 0, 1, TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (4, N'SpringDown', 0, 0, TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (5, N'EasterDown', 0, 1, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (1, N'Spring', 0, 1, TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (7, N'FUNZIES!', 0, 1, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (8, N'NOTfunzies', 0, 0, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (9, N'Summer3', 0, 1, TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (10, N'Spring4', 0, 1, TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "Promotion" ("Id", "Code", "CouponSeries", "Enabled", "ValidFrom", "ValidTo")
VALUES (6, N'SummerDown', 0, 0, TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
END;
/

BEGIN
INSERT INTO "Property" ("Id", "Name")
VALUES (1, N'UniqueCoupons');
INSERT INTO "Property" ("Id", "Name")
VALUES (2, N'NamedHolders');
INSERT INTO "Property" ("Id", "Name")
VALUES (3, N'NamedConsumers');
INSERT INTO "Property" ("Id", "Name")
VALUES (4, N'HolderIsOnlyConsumer');
INSERT INTO "Property" ("Id", "Name")
VALUES (5, N'AllowMultipleRedeems');
INSERT INTO "Property" ("Id", "Name")
VALUES (6, N'AllowCouponSeries');
END;
/

BEGIN
INSERT INTO "System" ("Id", "Name", "Password", "Username")
VALUES (1, N'CRM', N'test', N'max');
INSERT INTO "System" ("Id", "Name", "Password", "Username")
VALUES (2, N'SalesForce', N'test', N'sf');
END;
/

BEGIN
INSERT INTO "User" ("Username", "AccessType", "Domain", "Fullname")
VALUES (N'ljubo', 1, N'LJUBO-PC', N'Ljubomir Kraljevic');
INSERT INTO "User" ("Username", "AccessType", "Domain", "Fullname")
VALUES (N'traktor', 1, N'LJUBO-PC', N'DJ Fresh Prince');
END;
/

BEGIN
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (14, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EASTER1234567289', 2, 0, N'38640440481', 1, 1, 2, N'38640440481');
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (8, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EDOWN1234567892', 1, 0, N'38640440481', 1, 5, 2, N'38640440481');
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (7, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EASTER1234567113', 1, 0, NULL, 1, 2, 3, NULL);
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (6, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EASTER1234567895', 1, 0, NULL, 1, 2, 3, NULL);
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (5, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EASTER1234567891', 1, 0, NULL, 1, 2, 4, NULL);
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (4, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EASTER1234567894', 1, 0, N'38640440483', 1, 2, 1, N'38640440483');
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (3, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EASTER1234567893', 1, 0, N'38640440482', 1, 2, 2, N'38640440482');
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (2, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EASTER1234567892', 1, 0, N'38640440481', 1, 2, 2, N'38640440481');
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (9, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EDOWN1234567893', 1, 0, N'38640440482', 1, 5, 2, N'38640440482');
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (10, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EDOWN1234567894', 2, 0, N'38640440483', 1, 5, 2, N'38640440483');
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (11, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EDOWN1234567891', 1, 0, NULL, 1, 5, 1, NULL);
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (12, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EDOWN1234567911', 1, 0, NULL, 1, 5, 1, NULL);
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (13, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EDOWN1234567912', 2, 0, NULL, 1, 5, 3, NULL);
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (16, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EASTER1234567291', 2, 0, N'38640440481', 1, 1, 4, N'38640440481');
INSERT INTO "Coupon" ("Id", "AquireFrom", "AquireTo", "AwardFrom", "AwardTo", "Code", "CouponSeries", "Enabled", "Holder", "MaxRedeemNo", "PromotionId", "Status", "User")
VALUES (15, TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), N'EASTER1234567290', 2, 0, N'38640440481', 1, 1, 3, N'38640440481');
END;
/

BEGIN
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (11, 1);
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (3, 3);
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (3, 4);
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (3, 1);
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (1, 1);
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (2, 5);
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (2, 4);
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (1, 3);
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (1, 5);
INSERT INTO "PromotionAwardChannel" ("PromotionId", "AwardChannelId")
VALUES (2, 3);
END;
/

BEGIN
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (2, 4);
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (11, 2);
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (2, 1);
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (1, 2);
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (1, 1);
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (3, 5);
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (3, 4);
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (3, 1);
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (2, 5);
INSERT INTO "PromotionIssuerChannel" ("PromotionId", "IssuerChannelId")
VALUES (1, 5);
END;
/

BEGIN
INSERT INTO "PromotionProperty" ("PromotionId", "PropertyId")
VALUES (2, 6);
INSERT INTO "PromotionProperty" ("PromotionId", "PropertyId")
VALUES (2, 1);
INSERT INTO "PromotionProperty" ("PromotionId", "PropertyId")
VALUES (11, 1);
INSERT INTO "PromotionProperty" ("PromotionId", "PropertyId")
VALUES (1, 2);
INSERT INTO "PromotionProperty" ("PromotionId", "PropertyId")
VALUES (7, 2);
INSERT INTO "PromotionProperty" ("PromotionId", "PropertyId")
VALUES (1, 4);
INSERT INTO "PromotionProperty" ("PromotionId", "PropertyId")
VALUES (5, 4);
INSERT INTO "PromotionProperty" ("PromotionId", "PropertyId")
VALUES (3, 6);
END;
/

CREATE UNIQUE INDEX "IX_Coupon_Code" ON "Coupon" ("Code") WHERE [Code] IS NOT NULL
/

CREATE INDEX "IX_Coupon_PromotionId" ON "Coupon" ("PromotionId")
/

CREATE INDEX "IX_CouponAwardChannel_AwardChannelId" ON "CouponAwardChannel" ("AwardChannelId")
/

CREATE INDEX "IX_CouponHistory_CouponId" ON "CouponHistory" ("CouponId")
/

CREATE INDEX "IX_CouponIssuerChannel_IssuerChannelId" ON "CouponIssuerChannel" ("IssuerChannelId")
/

CREATE INDEX "IX_NotifyList_ChannelId" ON "NotifyList" ("ChannelId")
/

CREATE UNIQUE INDEX "IX_Promotion_Code" ON "Promotion" ("Code")
/

CREATE INDEX "IX_PromotionAwardChannel_AwardChannelId" ON "PromotionAwardChannel" ("AwardChannelId")
/

CREATE INDEX "IX_PromotionIssuerChannel_IssuerChannelId" ON "PromotionIssuerChannel" ("IssuerChannelId")
/

CREATE INDEX "IX_PromotionProperty_PropertyId" ON "PromotionProperty" ("PropertyId")
/

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES (N'20200430131834_Init', N'2.2.6-servicing-10079')
/
