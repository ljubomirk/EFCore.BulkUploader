i»?prompt PL/SQL Developer Export Tables for user APL_KUPON_MGMT@TEST.SIMOBIL.SI
prompt Created by ljubo on 6. lipanj 2020.
set feedback off
set define off

prompt Disabling triggers for ACCESS_LOG...
alter table ACCESS_LOG disable all triggers;
prompt Disabling triggers for AWARD_CHANNEL...
alter table AWARD_CHANNEL disable all triggers;
prompt Disabling triggers for PROMOTION...
alter table PROMOTION disable all triggers;
prompt Disabling triggers for COUPON...
alter table COUPON disable all triggers;
prompt Disabling triggers for COUPON_AWARD_CHANNEL...
alter table COUPON_AWARD_CHANNEL disable all triggers;
prompt Disabling triggers for COUPON_HISTORY...
alter table COUPON_HISTORY disable all triggers;
prompt Disabling triggers for ISSUER_CHANNEL...
alter table ISSUER_CHANNEL disable all triggers;
prompt Disabling triggers for COUPON_ISSUER_CHANNEL...
alter table COUPON_ISSUER_CHANNEL disable all triggers;
prompt Disabling triggers for SYSTEM...
alter table SYSTEM disable all triggers;
prompt Disabling triggers for NOTIFY_LIST...
alter table NOTIFY_LIST disable all triggers;
prompt Disabling triggers for PROMOTION_AWARD_CHANNEL...
alter table PROMOTION_AWARD_CHANNEL disable all triggers;
prompt Disabling triggers for PROMOTION_ISSUER_CHANNEL...
alter table PROMOTION_ISSUER_CHANNEL disable all triggers;
prompt Disabling triggers for PROPERTY...
alter table PROPERTY disable all triggers;
prompt Disabling triggers for PROMOTION_PROPERTY...
alter table PROMOTION_PROPERTY disable all triggers;
prompt Disabling triggers for USER...
alter table USER disable all triggers;
prompt Disabling foreign key constraints for COUPON...
alter table COUPON disable constraint FK_Coupon_Promotion_PromotionId;
prompt Disabling foreign key constraints for COUPON_AWARD_CHANNEL...
alter table COUPON_AWARD_CHANNEL disable constraint FK_COUPON_AWARD_CHANNEL_AWARD_CHANNEL_AWARD_CHANNEL_ID;
prompt Disabling foreign key constraints for COUPON_HISTORY...
alter table COUPON_HISTORY disable constraint FK_CouponHistory_Coupon_CouponId;
prompt Disabling foreign key constraints for COUPON_ISSUER_CHANNEL...
alter table COUPON_ISSUER_CHANNEL disable constraint FK_COUPON_ISSUER_CHANNEL_ISSUER_CHANNEL_ISSUER_CHANNEL_ID;
prompt Disabling foreign key constraints for NOTIFY_LIST...
alter table NOTIFY_LIST disable constraint FK_NOTIFY_LIST_ISSUER_CHANNEL_CHANNEL_ID;
alter table NOTIFY_LIST disable constraint FK_NOTIFY_LIST_SYSTEM_SYSTEM_ID;
prompt Disabling foreign key constraints for PROMOTION_AWARD_CHANNEL...
alter table PROMOTION_AWARD_CHANNEL disable constraint FK_PROMOTION_AWARD_CHANNEL_AWARD_CHANNEL_AWARD_CHANNEL_ID;
prompt Disabling foreign key constraints for PROMOTION_ISSUER_CHANNEL...
alter table PROMOTION_ISSUER_CHANNEL disable constraint FK_PROMOTION_ISSUER_CHANNEL_ISSUER_CHANNEL_ISSUER_CHANNEL_ID;
prompt Disabling foreign key constraints for PROMOTION_PROPERTY...
alter table PROMOTION_PROPERTY disable constraint FK_PROMOTION_PROPERTY_PROPERTY_PROPERTY_ID;
prompt Loading ACCESS_LOG...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (159, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:54:34.5367054', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (160, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:54:40.7411421', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (161, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:55:03.0105954', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (162, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:55:06.5152248', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (163, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:55:08.2995993', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (164, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:55:26.8762608', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (165, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:55:27.6603649', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (166, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:55:28.9192113', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (167, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:55:30.3071750', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (168, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:55:31.6629218', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (288, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:11:16.6737770', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (289, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:11:19.9156572', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (290, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:11:23.4367824', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (291, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:11:42.5266742', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (292, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:11:42.6554255', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (293, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:12:37.1447181', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (294, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:12:42.7522454', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (295, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:13:15.8103445', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (296, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:13:48.6144377', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (297, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:13:53.0220777', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (298, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:14:38.5642841', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (299, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:14:38.7255875', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (300, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:14:48.8696284', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (301, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:15:00.8083103', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (302, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:15:04.2531698', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (303, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:15:42.6510333', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (304, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:15:51.4180744', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (305, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:16:02.5617327', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (306, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:16:18.1502174', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (307, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:17:16.5890487', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (308, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:17:22.6768356', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (309, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:17:51.7590425', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (310, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:18:12.6584165', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (311, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:18:16.0430200', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (312, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:18:27.9620171', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (313, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:18:38.0934478', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (314, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:18:41.2700190', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (315, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:18:46.2152651', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (316, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:18:49.0646642', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (317, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:18:50.6308502', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (318, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:18:52.4594624', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (319, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:19:04.6085330', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (320, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:19:33.6810803', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (321, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:19:55.7510493', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (322, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:26:48.7152852', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (323, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:28:19.1891652', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (324, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:28:54.7014836', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (325, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:44:12.8247525', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (157, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:54:22.0665075', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (158, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 08:54:30.1330396', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (326, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:44:17.7530102', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (327, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:44:23.6396895', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (328, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:44:30.1642353', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (329, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:48:27.1688775', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (330, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:48:30.8734722', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (331, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:48:34.8089584', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (332, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:48:37.4684267', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (333, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:48:48.6650528', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (334, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:48:48.7359271', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (335, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:49:08.2895950', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (336, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:49:08.4014014', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (337, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 15:49:14.1482255', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (338, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 16:07:40.1251041', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (339, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 16:23:19.8183029', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (534, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:12.3585032', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (535, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:16.3326847', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (537, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:22.5237537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (539, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:34.6828226', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (545, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:18:37.0328049', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (575, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:37:30.9659885', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (576, 1, null, 'SavePromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:37:46.2220717', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (577, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:37:46.2953941', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (578, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:37:53.6539687', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (579, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:39:04.8887883', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (580, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:39:14.8676603', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (581, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:39:19.1855176', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (582, 1, null, 'SavePromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:39:24.3180369', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (583, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:39:24.3690604', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (584, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:39:27.7074771', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (585, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:42:18.9064843', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (586, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:42:27.4001490', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (587, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:42:34.2431535', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (588, 1, null, 'GenerateCoupons', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:42:57.2054815', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (589, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:42:57.4417206', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (590, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:43:35.2919529', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (591, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:43:43.8654643', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (255, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:38:32.1798802', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (257, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:38:57.8195091', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (533, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:12.3608362', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (549, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:19:46.4820543', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (622, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 12:03:44.0192118', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (623, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 12:11:21.9163993', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (624, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 12:11:26.3198796', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (625, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 12:11:28.2888863', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (626, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 12:11:30.9713850', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (627, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 12:11:33.1479294', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (721, 1, null, 'Index', 'WSCOUPONT\maks', 1, to_timestamp('19-05-2020 15:22:12.4090268', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (722, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:24:50.1638439', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (723, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:24:55.0811568', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (724, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:29:24.5794488', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 100 records committed...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (725, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:29:29.8332271', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (726, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:30:41.2510915', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (727, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:30:46.1859435', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (728, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:30:51.0441707', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (729, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('19-05-2020 15:40:26.2321820', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (730, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:41:06.0327011', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (731, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:41:08.8305984', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (732, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:42:25.5298989', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (733, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:42:30.9649639', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (734, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:42:34.8180524', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (735, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:44:47.0591195', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (736, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:44:55.0570367', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (737, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 15:45:05.3135987', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (738, 1, null, 'Index', 'WSCOUPONT\maks', 1, to_timestamp('19-05-2020 15:45:44.4785974', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (739, 1, null, 'ListPromotions', 'WSCOUPONT\maks', 1, to_timestamp('19-05-2020 15:45:51.6201847', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (740, 1, null, 'Index', 'WSCOUPONT\maks', 1, to_timestamp('19-05-2020 15:46:09.8678601', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (741, 1, null, 'Users', 'WSCOUPONT\maks', 1, to_timestamp('19-05-2020 15:46:58.6635839', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (782, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:55:12.5312881', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (784, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:55:24.4784590', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (786, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:55:35.0792229', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (791, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:56:16.6638856', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (814, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('24-05-2020 22:37:26.3375352', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (818, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('24-05-2020 23:55:26.2655931', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (819, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('24-05-2020 23:59:17.2159123', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (885, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 09:13:02.7769112', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (908, 0, 'POS', 'CouponAPI.Assign', null, 1, to_timestamp('26-05-2020 10:50:13.3432605', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (909, 0, 'POS', 'CouponAPI.Assign', null, 1, to_timestamp('26-05-2020 10:50:23.9389299', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (910, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('26-05-2020 13:39:54.6309123', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1021, 0, 'POS', 'PromotionAPI.AddCoupon', null, 1, to_timestamp('01-06-2020 10:45:08.4954686', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1140, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:33:20.9264942', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1141, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:33:28.6904147', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1142, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:33:28.9216075', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1143, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:33:32.6261454', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1144, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:33:34.6275126', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1145, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:33:43.9260022', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1146, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:33:43.9939968', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1147, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:33:46.3381110', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1148, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:33:47.7615832', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1149, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:01.8572264', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1150, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:03.2121505', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1151, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:11.2198113', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1152, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:14.7111986', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1153, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:17.7552474', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1154, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:19.3370937', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1155, 1, null, 'UpdateUsers', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:22.1129826', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1156, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:22.4500356', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1157, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:23.2415146', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1158, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:25.1421345', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1159, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:34:29.8412076', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1160, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:35:17.5780115', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1161, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:35:17.6076504', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1162, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:35:20.7390558', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1163, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:47:37.1078697', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1164, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:47:37.1488486', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1165, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:47:39.1456942', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1166, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:47:44.8523862', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1167, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:47:44.8821827', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1168, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('06-06-2020 23:47:46.9965392', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (592, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:44:48.0779006', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (593, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:44:49.9249477', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (594, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:44:53.1946443', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (595, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:44:54.7200292', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (596, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:45:03.9900853', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (597, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:45:09.2220881', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (598, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:45:22.3903919', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (599, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:45:25.5268777', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (600, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:46:01.9469465', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (601, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:46:06.0328999', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (602, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:46:32.4483047', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (543, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:18:00.3523632', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (550, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:20:10.2289767', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (603, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:46:37.1463114', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (604, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:46:44.0397986', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (605, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:46:53.3932794', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (606, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:03:10.3433538', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (607, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:03:20.5116932', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (608, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:03:25.4602445', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (609, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:03:43.6263102', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (610, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:03:57.8885595', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (611, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:04:09.1644983', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (612, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:04:14.0889643', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (613, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:04:19.9920141', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (614, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:04:26.6445864', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (615, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:04:29.9683185', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (616, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:13:56.9936908', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (617, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:14:07.7794832', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (618, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:14:20.0542160', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (619, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:14:37.6804224', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (620, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:15:58.5909545', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (621, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 14:16:14.9034515', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (667, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:54:21.3536756', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (668, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:54:27.2023592', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (669, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:54:30.0161017', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (670, 1, null, 'StoreAddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:54:55.8597514', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (671, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:54:55.9974814', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (672, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:07.3986828', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (673, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:07.5399330', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (674, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:12.4550418', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (675, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:21.1360699', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (676, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:39.1601847', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 200 records committed...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (677, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:39.2381882', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (678, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:48.7371707', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (679, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:48.8412228', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (680, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:53.1577406', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (681, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:55:53.2532857', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (682, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:00.5897148', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (683, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:00.7163375', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (684, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:03.5652566', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (685, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:11.8151685', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (686, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:11.8922650', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (687, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:14.6920735', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (688, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:27.8467363', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (689, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:39.1036067', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (690, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:54.7467365', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (691, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:56:59.1215479', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (692, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:57:10.9825480', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (693, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:57:23.0906324', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (694, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:57:32.4179949', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (695, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:57:35.5043342', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (696, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:57:44.1205325', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (697, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:57:48.9229482', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (698, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:57:49.8859537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (699, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:00.3631179', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (700, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:05.8007599', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (701, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:12.8600160', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (702, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:16.4913182', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (703, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:21.4373408', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (704, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:24.1542547', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (705, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:32.3299907', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (706, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:36.9327935', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (707, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:44.8754454', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (708, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:47.5866261', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (709, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:58:48.6026134', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (761, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('21-05-2020 15:00:37.7864165', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (762, 1, null, 'Index', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:23:11.7452893', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (763, 1, null, 'Index', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:23:17.2829931', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (764, 1, null, 'Users', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:23:19.0786894', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (765, 1, null, 'ListPromotions', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:23:20.3199307', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (766, 1, null, 'Index', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:23:24.2538798', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (767, 1, null, 'Users', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:23:25.1464317', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (768, 1, null, 'ListPromotions', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:23:25.9119065', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (770, 1, null, 'Index', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:24:22.4178012', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (771, 1, null, 'Index', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:24:28.9469109', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (772, 1, null, 'Users', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:24:30.0448133', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (773, 1, null, 'ListPromotions', 'WSCOUPONT\maks', 1, to_timestamp('21-05-2020 15:24:30.7165035', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (790, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:56:14.6156542', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (820, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:37:28.5789839', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (821, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:38:09.2382544', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (822, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:38:12.9710351', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (823, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:39:16.4612212', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (824, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:39:18.1019333', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (825, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:39:20.6162653', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (171, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:11.4741537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (172, 1, null, 'Enable', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:19.4260685', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (173, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:29.3572986', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (174, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:36.2116898', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (175, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:42.6126471', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (176, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:44.1785350', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (177, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:45.6714797', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (178, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:51.5520086', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (179, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:56.5081462', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (180, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:04:01.9747166', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (169, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:07.0583341', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (170, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:03:10.2174395', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (181, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:08:32.5695406', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (251, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:37:29.2529370', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (252, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:37:29.7742717', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (253, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:37:35.6348642', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (254, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:37:47.4236218', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (256, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:38:54.5809721', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (258, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:39:11.4818290', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (259, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:40:28.1142704', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (774, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('21-05-2020 16:15:34.8853773', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (826, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:39:23.1387788', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (827, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:40:32.7433340', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (840, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 01:33:38.8651236', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (841, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 01:33:42.4410836', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (842, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 01:33:44.5810872', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (843, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 01:33:52.4401843', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (844, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 01:33:55.3367882', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (845, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 01:57:51.7480862', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (846, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 01:57:53.6554798', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (851, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 15:51:13.3767052', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (852, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 15:51:18.3047634', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (853, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 15:51:20.0467507', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (854, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 15:51:28.5596666', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (855, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 15:51:33.4918176', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (856, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:23:42.6513772', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (857, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:23:47.2067188', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (858, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:24:25.3241454', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (859, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:28:31.3281164', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (860, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:28:34.9234128', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (861, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:31:54.6736230', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (862, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:33:13.5533734', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (863, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:33:16.9824626', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (864, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:33:31.0408079', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (865, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:38:18.6285242', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (866, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:38:22.7039570', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (867, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:43:27.6675092', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (868, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:43:27.7333851', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 300 records committed...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (869, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:43:31.3335292', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (870, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:43:48.3714762', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (871, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:43:54.7991156', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (872, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:44:31.7796360', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (873, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:44:31.8065891', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (874, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:44:35.7971632', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (875, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:51:36.5615349', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (876, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:51:41.6455435', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (877, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:51:59.4047984', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (878, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:51:59.4327720', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (879, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:52:02.1643936', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (880, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:55:28.3122079', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (881, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:55:32.2550300', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (882, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 16:55:42.0050330', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (883, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:55:42.0284639', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (884, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 16:55:44.2537167', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1036, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:12:19.7819591', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1037, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:12:36.6963172', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1038, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:12:39.0185606', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1039, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:12:40.1218970', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1040, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:12:48.4496252', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1041, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:13:22.1029522', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1042, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:13:43.2754836', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1043, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:13:47.1656649', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1044, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:14:02.8121034', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1045, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:14:05.6909103', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1046, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:14:18.5020759', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1047, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:14:29.6674982', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1048, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:14:31.6040906', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1049, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:14:37.4911076', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1050, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:14:46.3776798', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1051, 1, null, 'Enable', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:14:52.0719512', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1052, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:15:00.8702617', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1053, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:15:15.8313420', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1054, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:15:28.6290809', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1055, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('01-06-2020 16:15:32.3912387', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (262, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:41:52.3879354', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (263, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:41:54.0322256', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (264, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:41:57.8409543', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (265, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:41:59.3378989', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (266, 1, null, 'UpdateUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:42:03.2263910', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (267, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:42:03.2699961', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (268, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:42:05.0242609', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (260, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:41:43.6256493', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (261, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:41:47.0384671', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (269, 1, null, 'SystemDetails', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:42:08.3028457', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (270, 1, null, 'AddSystem', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:42:21.0362347', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (271, 1, null, 'DeleteNotifyList', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:44:58.2802004', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (272, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:47:57.6438886', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (273, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:48:45.4908624', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (274, 1, null, 'NotifyListDetails', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:48:49.3951313', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (275, 1, null, 'AddNotifyList', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:06.1501580', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (276, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:31.4640850', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (277, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:35.5858683', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (278, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:37.3205855', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (279, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:38.1944948', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (280, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:38.9350144', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (281, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:43.1026302', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (282, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:46.1358859', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (283, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:47.4799469', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (284, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:49:52.2612288', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (285, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:50:24.4147764', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (286, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:50:28.0566011', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (287, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:50:40.1555962', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (742, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 22:27:30.1649313', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (743, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 22:28:12.6915080', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (847, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 08:52:27.6801081', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (848, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 08:52:31.3518178', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (886, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('26-05-2020 10:06:21.0850817', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1067, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:56:16.1207079', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1068, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:56:49.5378817', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1069, 1, null, 'SavePromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:58:07.2648557', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1070, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:58:07.4026062', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1071, 1, null, 'SavePromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:58:21.2133996', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1072, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:58:21.3058925', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1073, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:58:31.8199868', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1074, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:58:40.0920109', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1075, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:58:44.3851901', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1076, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:58:57.2979097', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1077, 1, null, 'GenerateCoupons', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:59:12.9393779', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1078, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 14:59:13.0978613', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1079, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:00:02.8794570', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1080, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:00:10.5442905', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1081, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:00:22.5352989', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1082, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:00:36.6694385', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1083, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:00:39.6872766', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1084, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:00:47.4880364', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1085, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:00:51.7125535', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1086, 1, null, 'Enable', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:00:56.8580818', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1087, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:01:04.0049066', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1088, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:01:13.9159930', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1089, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:03:46.5019820', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1090, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:03:49.8353461', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1091, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:04:17.8413150', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1092, 1, null, 'UpdateSearchFilter', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:19:26.2169667', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1093, 1, null, 'UpdateSearchFilter', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:19:31.0381346', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1094, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:23:13.5617602', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1095, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:23:14.8684256', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1096, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:23:23.1791027', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1097, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:31:00.5761544', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 400 records committed...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1098, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:31:01.2669982', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1099, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:31:13.4676080', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1100, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:34:43.8855161', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1101, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:34:53.8762987', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1102, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:35:12.8054357', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1103, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:35:26.4623842', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1104, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:36:12.3300689', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1105, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:38:08.6139347', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1106, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:38:23.0467499', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1107, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:39:00.5776418', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1108, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:39:09.0372027', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1109, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:42:09.6492156', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1110, 1, null, 'SavePromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:42:54.6383643', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1111, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:42:54.7177389', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1112, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:43:05.4224756', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1113, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:43:13.9585241', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1114, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:43:22.0138833', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1115, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:50:22.3366037', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1116, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:50:31.9449247', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1117, 1, null, 'Enable', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:50:45.4798594', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1118, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:50:54.8047101', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1119, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 15:51:11.0690440', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (505, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:13.2217918', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (506, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:13.5612624', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (503, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:05.1580483', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (504, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:10.1365456', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (507, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:15.9621166', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (508, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:18.7945648', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (509, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:20.3530485', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (510, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:35.0230814', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (511, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:37.2692596', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (512, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:38.6250474', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (513, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:39.8375084', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (514, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:43.8420663', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (515, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:04:45.1067930', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (516, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:19:37.2678802', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (517, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:19:39.7007203', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (518, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:19:40.9311816', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (519, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:19:41.4053543', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (520, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:19:42.6082553', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (521, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:19:46.7071850', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (522, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:19:49.8217497', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (523, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:19:54.1557355', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (524, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('13-05-2020 17:23:56.2128461', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (525, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:24:26.8835906', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (526, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:24:29.0446621', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (527, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('13-05-2020 17:24:58.3516984', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (528, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 17:27:15.3765963', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (793, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:56:19.1004420', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (921, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('27-05-2020 07:54:20.7250626', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1022, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:08:31.1228085', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1023, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:13:52.0574718', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1024, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:14:04.7082233', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1025, 1, null, 'Enable', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:14:14.9593781', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1026, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:14:27.1471408', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1027, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:20:23.5693897', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1028, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:34:33.0619903', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1029, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:34:43.8051874', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1030, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:35:09.5348768', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1031, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:35:19.7087581', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1032, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:35:25.7436427', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1033, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:35:30.0276755', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1034, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:41:02.0706399', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1035, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('01-06-2020 13:43:25.9150103', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1057, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 13:55:30.1605820', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1058, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 13:55:32.9057790', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1059, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 13:56:10.2830714', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1060, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 13:56:15.7028139', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1061, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 13:56:19.9430065', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1062, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 13:57:49.6800630', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1063, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 13:57:59.1865162', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1120, 1, null, 'SavePromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:26:15.8210406', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1121, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:26:16.3767806', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1122, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:26:24.4522790', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1123, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:26:45.5784133', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1124, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:26:49.4706878', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1125, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:26:56.0311017', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1126, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:27:04.0803083', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1127, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:27:13.2148920', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1128, 1, null, 'SavePromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:27:24.2286463', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1129, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:27:24.3184062', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1130, 1, null, 'SavePromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:27:41.3142369', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1131, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:27:41.4072181', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1132, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:27:57.1203828', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1133, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:28:04.4702022', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1134, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 16:28:12.9921297', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1135, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('05-06-2020 08:20:13.7725182', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1136, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('05-06-2020 08:33:25.4787540', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1137, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('05-06-2020 08:33:28.0729467', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1138, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('05-06-2020 08:33:34.3880830', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1139, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('05-06-2020 08:43:48.2626373', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (182, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:40:18.9816973', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (183, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:40:22.3635821', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (184, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:40:26.3014061', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (185, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:40:52.5483851', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (186, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:40:52.6609830', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (187, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:44:05.6027112', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (188, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:44:09.6454278', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (189, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:44:13.1475452', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (190, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:44:17.0581575', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 500 records committed...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (191, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:44:20.7090391', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (192, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:44:53.2116733', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (193, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:46:01.8539599', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (194, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:46:12.2584519', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (195, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:46:18.2928288', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (196, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:31.9044644', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (197, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:34.4420339', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (198, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:36.5988522', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (199, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:38.1248130', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (200, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:40.9688308', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (201, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:44.0709717', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (202, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:46.7416059', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (203, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:49.1347424', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (204, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:51.1176989', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (205, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:51.9736744', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (206, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:52.9746775', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (207, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:53.7614448', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (208, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:55.4491822', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (209, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:56.1764646', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (210, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:57.9069723', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (211, 1, null, 'UpdateUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:58.9631144', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (212, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:47:59.0043865', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (213, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:48:01.2439950', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (214, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:48:02.5056725', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (215, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:48:03.1223460', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (216, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:48:04.9039479', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (217, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:48:07.8372398', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (218, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 09:48:13.4376202', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (628, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 16:46:46.7922130', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (629, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 16:47:09.5249381', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (630, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 16:47:11.9964626', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (631, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 16:47:18.2490898', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (632, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 16:47:38.3983906', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (633, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 16:54:29.8138410', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (634, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 16:58:01.6901907', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (635, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 16:58:15.1092414', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (636, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:04:03.9531635', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (637, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:04:17.3627488', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (638, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:04:45.3336123', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (639, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:04:47.6298656', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (640, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:05:11.5480275', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (641, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:06:09.7543542', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (642, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:06:12.7245926', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (643, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:06:57.4952577', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (644, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:07:01.3859058', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (645, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:07:10.6057541', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (646, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:07:16.4072544', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (647, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:07:23.9325852', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (648, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:07:35.1380490', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (649, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:12:09.0834554', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (650, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:12:24.8138606', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (651, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:12:29.2470252', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (652, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:12:47.2186494', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (653, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:13:02.3634749', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (654, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:13:16.3180353', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (655, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:13:39.4478132', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (656, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:16:46.5404769', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (657, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:16:59.6539181', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (658, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:20:11.0730437', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (659, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('15-05-2020 17:20:25.1914620', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (775, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 09:41:52.9444402', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (776, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 09:41:56.0530857', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (777, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('22-05-2020 09:43:14.3875506', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (778, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('22-05-2020 09:43:43.4459001', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (779, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('22-05-2020 09:45:41.0268096', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (780, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 09:48:24.6724655', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (781, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 09:48:26.1841483', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (785, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:55:32.8022341', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (787, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:55:37.7957649', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (828, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 00:46:17.7056812', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (829, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:46:20.8666415', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (830, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:46:51.8994265', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (831, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:47:29.3440373', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (832, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:47:44.4076292', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (833, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:47:54.1115714', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (834, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:48:07.0265036', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (835, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:48:32.1123178', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (836, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:48:34.7818391', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (837, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 00:48:38.4025951', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (838, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:48:42.8969776', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (223, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:55:47.2567184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (224, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:55:50.5412981', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (225, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:56:01.7176730', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (221, 1, null, 'AccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:55:24.1246463', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (222, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:55:45.6492300', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (226, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:56:08.2174677', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (227, 1, null, 'Enable', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:56:16.1810636', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (228, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:56:25.1450989', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (229, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:56:33.6478187', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (230, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:57:45.8023288', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (231, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:57:47.5716704', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (232, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:57:49.9037902', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (233, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:57:55.1167497', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (234, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:57:58.3380031', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (235, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:58:47.7627563', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (236, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:59:11.2520153', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (237, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:59:15.0817604', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (238, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:59:33.5553503', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (239, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:04:28.7933295', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (240, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:06:13.4597251', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 600 records committed...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (241, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:06:28.3358118', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (242, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:06:50.7541847', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (243, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:07:01.4810653', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (244, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:07:05.1366800', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (245, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:07:11.4628788', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (246, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:07:16.1296430', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (247, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:07:43.1557106', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (248, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:07:56.6126708', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (249, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:08:06.0612417', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (250, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 12:09:17.6985582', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (397, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:44:45.1793140', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (398, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:44:49.3758310', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (399, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:44:54.8754039', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (400, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:51:18.5508289', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (401, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:51:52.2554163', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (402, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:58:22.9697396', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (403, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 10:08:12.8904063', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (404, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 10:08:14.6814645', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (405, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 10:08:15.4699965', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (406, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 10:08:16.4835720', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (407, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 10:08:19.7413700', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (408, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 10:08:25.9440926', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (409, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 10:08:29.5990126', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (410, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 10:13:01.1534994', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (411, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 10:13:08.2198412', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (500, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 14:21:12.6086168', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (501, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 14:21:14.4274358', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (502, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 14:21:22.8036971', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (529, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 07:37:50.3705215', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (530, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 07:37:57.8802851', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (531, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 07:39:42.0298231', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (532, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('14-05-2020 07:40:28.8564268', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (544, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:18:15.9348479', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (552, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:20:44.9375115', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (554, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:21:25.3004233', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (556, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:22:24.9875090', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (749, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:16:49.9301749', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (750, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:17:01.9638324', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (751, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:17:04.9403570', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (752, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:17:09.7236126', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (753, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:17:18.4681965', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (754, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:17:23.2408837', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (755, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:17:27.2431210', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (756, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:17:30.1984392', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (757, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:17:54.2751183', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (758, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:18:00.0889736', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (759, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:18:08.6308997', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (760, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 11:18:16.1182811', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (839, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 00:48:45.6581577', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (887, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:37:34.1919596', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (888, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:37:38.3181987', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (889, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:37:39.7726673', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (890, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:37:43.5782007', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (891, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:37:45.5998385', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (892, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:37:47.5869306', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (893, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:37:50.4669712', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (894, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:37:55.1965813', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (895, 1, null, 'GenerateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:38:04.1677579', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (896, 1, null, 'Error', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:38:04.2183074', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (897, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:38:07.4636897', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (898, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:38:09.3526632', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (899, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:39:10.4300423', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (900, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:39:12.8203424', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (901, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:39:17.9487548', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (902, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:39:20.4720997', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (903, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:39:22.9701525', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (904, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:39:27.0071545', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (905, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:39:31.7948664', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (906, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:48:32.1374398', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (907, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('26-05-2020 10:48:33.6506696', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (446, 1, null, 'ExternalSystemsView', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:18:49.7970123', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (447, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:34:13.4463034', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (448, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:34:55.6893686', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (449, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:34:57.5821273', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (450, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:35:38.3043653', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (451, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:35:39.7514957', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (452, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:46:38.4895690', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (453, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:47:33.6578840', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (454, 1, null, 'ExternalSystemsView', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:47:48.0210556', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (455, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:47:54.0728453', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (456, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:47:56.6357707', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (457, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:21.0637802', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (458, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:29.0771230', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (459, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:30.4889842', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (460, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:31.1226276', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (461, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:32.2137873', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (462, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:32.9360660', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (463, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:33.7338458', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (464, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:34.2127690', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (465, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:37.7317892', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (466, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:48.1805892', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (467, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:53:49.9613389', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (468, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:23.2848414', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (469, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:23.8026333', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (470, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:24.3923591', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (471, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:26.2191359', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (472, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:26.7825496', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (473, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:28.5680511', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (474, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:29.8406020', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (475, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:31.0280123', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 700 records committed...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (476, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:35.1777389', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (477, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:35.4877978', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (478, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:35.9270498', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (479, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:36.5427975', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (480, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:37.0186877', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (481, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:38.0891556', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (219, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:24:44.4618070', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (220, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('11-05-2020 11:24:46.8456051', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (482, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:39.9652277', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (483, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:41.7676851', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (484, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:41.9843475', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (485, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:42.3536056', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (486, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:43.5977813', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (487, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:44.7978791', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (488, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:46.2965347', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (489, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:48.8866179', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (490, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:49.2020852', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (491, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:50.5056338', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (492, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:50.9355344', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (493, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:51.2716557', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (494, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:51.8636398', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (495, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:52.4541914', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (496, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:53.3273982', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (497, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:55:59.2855898', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (498, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:56:01.3001531', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (499, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 12:56:02.5747495', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (536, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:18.0868320', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (538, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:26.4998200', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (540, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:50.3199062', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (542, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:58.4560834', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (547, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:19:06.9302934', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (661, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:01:40.2868702', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (662, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:15:42.9552041', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (663, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:15:53.2100686', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (664, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:16:05.8283620', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (665, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:16:10.9903631', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (666, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 12:16:14.0454927', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (744, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 09:54:31.6389791', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (745, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 09:54:34.1968049', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (746, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 09:55:07.1786435', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (747, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 09:55:13.7638993', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (748, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('20-05-2020 10:00:41.6656500', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (783, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:55:12.5312891', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (788, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:55:39.2938157', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (789, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:56:12.2086304', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (792, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:56:18.0169091', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (794, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 12:56:19.8963238', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (795, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:21.7043522', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (796, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:23.3917687', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (797, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:28.4205033', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (798, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:29.8248501', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (799, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:30.7477540', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (800, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:31.3972913', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (801, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:32.0129878', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (802, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:32.7248416', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (803, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:33.4601683', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (804, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:38.5531214', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (805, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:40.4854792', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (806, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:46.9513789', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (807, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:01:49.3648960', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (808, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:02:17.1196318', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (809, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:06:43.8361189', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (810, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:06:49.0061260', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (811, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:06:53.5078608', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (812, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:06:59.2467997', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (813, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('22-05-2020 13:07:01.1700072', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1056, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('04-06-2020 09:23:40.2697042', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (546, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:18:44.5516398', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (710, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:10:22.7982159', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (711, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:10:26.8421188', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (712, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:10:28.3776397', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (713, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:10:30.1967818', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (714, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:10:34.6987699', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (715, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:10:40.8120874', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (815, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('24-05-2020 23:41:43.4926554', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (816, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('24-05-2020 23:42:55.7709937', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (817, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('24-05-2020 23:51:19.1447334', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (849, 1, null, 'ListPromotions', 'SIMOBIL\sizdit-None', 1, to_timestamp('25-05-2020 10:23:23.2342089', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (850, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('25-05-2020 10:49:34.4443155', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (941, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:02:27.3485748', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (942, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:04:07.1116080', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (943, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:04:17.8811195', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (944, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:04:31.8275820', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (945, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:05:00.5091523', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (946, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:05:29.8218037', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (947, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:05:38.5435847', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (948, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:06:00.6004109', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (949, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:06:04.2317530', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (950, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:06:19.2009701', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (951, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:06:32.1684734', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (952, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:06:43.5439861', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (953, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:07:06.6082184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (954, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:07:09.2106150', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (955, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:11:05.4663384', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (956, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:11:27.2936721', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (957, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:11:43.8888487', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (958, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:12:47.1880768', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (959, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:12:55.5810578', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (960, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:13:21.5531251', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (961, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:13:33.6358313', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 800 records committed...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (962, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:14:12.8016601', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (963, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:14:21.9914504', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (964, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:15:08.6771694', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (965, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:15:46.0292234', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (966, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:15:56.0104512', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (967, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:19:55.7551179', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (968, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:22:07.9442719', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (969, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:22:12.6777967', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (970, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:32:14.4243713', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (971, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:32:25.3826743', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (972, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:32:44.9300873', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (973, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:33:05.3646987', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (974, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:33:16.5869908', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (975, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:33:33.8771329', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (976, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:34:17.4710720', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (977, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:37:06.7832422', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (978, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:37:13.2458538', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (979, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:37:26.6478753', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (980, 1, null, 'Enable', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:37:54.9442358', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (981, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:38:04.1914007', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (982, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:38:16.0569227', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (983, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:38:23.6448510', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (984, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:38:26.6113253', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (985, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:38:39.6960688', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (986, 1, null, 'Index', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:39:27.0405986', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (987, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:39:36.0725095', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (988, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:39:44.7588048', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (989, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:39:53.3138788', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (990, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:39:55.9104286', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (991, 1, null, 'Search', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:40:03.9337711', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (992, 1, null, 'Back', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:41:37.3202081', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (993, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:41:41.1361867', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (994, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:41:42.8456250', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (995, 1, null, 'StoreAddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:44:30.1193410', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (996, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:44:30.2423107', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (997, 1, null, 'GenerateCoupons', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:45:55.2074450', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (998, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:45:55.3573180', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (999, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:47:21.7402221', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1000, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:47:28.6194896', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1001, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:47:37.3626803', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1002, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('28-05-2020 15:51:03.4915738', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1064, 0, 'POS', 'PromotionAPI.AddCoupon', null, 1, to_timestamp('04-06-2020 14:05:14.1831247', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1065, 0, 'POS', 'CouponAPI.Get', null, 1, to_timestamp('04-06-2020 14:05:27.0201365', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (1066, 0, 'POS', 'CouponAPI.Get', null, 1, to_timestamp('04-06-2020 14:05:29.2590776', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (412, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:31:01.1005396', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (413, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:31:11.0506747', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (414, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:31:18.2029333', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (415, 1, null, 'FilterUsers', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:31:19.9247640', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (416, 1, null, 'ExternalSystemsView', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:31:24.7753209', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (417, 1, null, 'SystemDetails', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:31:27.4422583', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (418, 1, null, 'NotifyListDetails', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:31:30.5937287', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (419, 1, null, 'NotifyListDetails', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:31:38.8709024', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (420, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:31:58.7572581', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (421, 1, null, 'FilteredListAccessHistory', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:32:35.9591074', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (422, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:32:41.0513125', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (423, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:32:46.5093723', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (424, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:32:49.3599283', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (425, 1, null, 'UpdateSearchFilter', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:33:01.8540917', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (426, 1, null, 'UpdateCoupons', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:33:17.9887731', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (427, 1, null, 'Back', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:33:29.9905096', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (428, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:33:35.2641471', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (429, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:34:16.4532974', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (430, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:34:26.2916989', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (431, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:34:26.4279387', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (432, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:34:57.6078017', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (433, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:35:35.4347098', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (434, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:35:56.6071885', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (435, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 16:35:59.2898501', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (441, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('13-05-2020 11:24:43.4489818', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (442, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('13-05-2020 11:26:14.6435452', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (443, 1, null, 'Index', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 11:26:46.2129070', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (444, 1, null, 'ListPromotions', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 11:26:51.3039034', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (445, 1, null, 'Users', 'SIMOBIL\sibgc1', 1, to_timestamp('13-05-2020 11:32:07.7970167', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (716, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:49:27.3512381', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (717, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:51:33.3777582', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (718, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:51:46.7871650', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (719, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:52:53.9886336', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (720, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('19-05-2020 13:52:59.6340199', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (769, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('21-05-2020 15:23:45.2440693', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (342, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:50:32.5352623', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (343, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:50:39.2905206', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (344, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:51:39.6773524', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (345, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:51:44.1692869', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (346, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:13.7085337', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (347, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:16.5993172', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (348, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:16.7068725', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (349, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:20.5924194', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (350, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:20.6593738', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (351, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:22.9571126', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (352, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:23.0753164', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (353, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:25.1098967', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (354, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:25.1830135', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (355, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:31.4004879', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (356, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:31.4560169', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (357, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:46.5585803', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (358, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:46.6443851', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (359, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:49.2573867', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (360, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:49.3293773', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (361, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:52.8729241', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (362, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:52.9380533', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 900 records committed...
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (363, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:55.6108419', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (364, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:55.6853743', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (365, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:54:58.2796250', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (366, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:55:04.2738551', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (367, 1, null, 'AddCouponSeries', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:55:11.7215895', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (368, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:55:14.9921871', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (369, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:55:17.2870715', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (370, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:55:18.3500725', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (371, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:55:19.8577003', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (372, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:55:29.0492715', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (373, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:55:37.8528141', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (374, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:56:16.5376365', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (375, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:56:20.6633906', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (376, 1, null, 'Search', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:56:30.4554934', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (377, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:56:41.8896974', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (378, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:04:18.6833304', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (379, 1, null, 'Users', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:04:20.6041662', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (380, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:07:31.5723277', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (340, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:49:35.0111957', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (341, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 08:50:28.7751999', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (381, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:09:08.9597736', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (382, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:09:17.2390935', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (383, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:09:21.7700786', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (384, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:09:32.5790334', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (385, 1, null, 'FilteredListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:09:52.9288270', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (386, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:12:23.5159498', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (387, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:12:46.4698145', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (388, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:12:48.1219611', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (389, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:14:45.1154281', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (390, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:14:45.2457432', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (391, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:15:02.1868947', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (392, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:15:03.9041096', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (393, 1, null, 'SavePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:15:38.0915712', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (394, 1, null, 'EditPromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:15:38.1515305', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (395, 1, null, 'ListPromotions', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:15:59.6295295', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (396, 1, null, 'CreatePromotion', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 09:16:00.5970385', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (436, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 21:14:31.2178920', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (437, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 21:14:33.8243811', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (438, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 21:28:50.6194038', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (439, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 21:33:40.3476836', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (440, 1, null, 'Index', 'SIMOBIL\sizdit', 1, to_timestamp('12-05-2020 21:33:44.4933198', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (541, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:17:52.8284934', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (548, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:19:13.9006688', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (551, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:20:24.7774111', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (553, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:21:10.9116736', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (555, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:21:41.0053653', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (557, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:29:15.8030724', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (558, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:29:18.0640409', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (559, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:29:24.0030792', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (560, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:29:54.2204492', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (561, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:31:46.2948724', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (562, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:31:48.5859275', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (563, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:31:51.3198339', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (564, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:31:52.8814553', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (565, 1, null, 'SavePromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:32:19.2538717', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (566, 1, null, 'EditPromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:32:19.3688113', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (567, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:32:46.3509069', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (568, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:32:58.3530134', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (569, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:33:06.5295238', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (570, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:33:14.5903115', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (571, 1, null, 'AddCouponSeries', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:36:41.9817454', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (572, 1, null, 'CreatePromotion', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:37:05.1677872', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (573, 1, null, 'ListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:37:12.5147802', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into ACCESS_LOG (id, application_type, channel, action, username, granted, issued_date)
values (574, 1, null, 'FilteredListPromotions', 'SIMOBIL\spelar', 1, to_timestamp('14-05-2020 13:37:21.0365718', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 964 records loaded
prompt Loading AWARD_CHANNEL...
insert into AWARD_CHANNEL (id, name)
values (1, 'POS');
insert into AWARD_CHANNEL (id, name)
values (3, 'SelfCare');
insert into AWARD_CHANNEL (id, name)
values (4, 'Telesales');
insert into AWARD_CHANNEL (id, name)
values (5, 'Webshop');
commit;
prompt 4 records loaded
prompt Loading PROMOTION...
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (1, 'Spring', 1, to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (3, 'Summer', 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (4, 'SpringDown', 0, to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (5, 'EasterDown', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('12-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (6, 'SummerDown', 0, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (2, 'Easter', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (8, 'NOTfunzies', 0, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (9, 'Summer3', 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (10, 'Spring4', 1, to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (7, 'SUMMERFUN', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (16, 'Spring6', 1, to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (17, 'Easter6', 0, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (18, 'Summer6', 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (19, 'Spring7', 1, to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (20, 'Easter7', 0, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (15, 'Summer5', 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (14, 'Easter5', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (13, 'Spring5', 1, to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (12, 'Summer4', 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (11, 'Easter4', 0, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (26, 'AllYear', 1, to_timestamp('01-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (22, 'Spring8', 1, to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (23, 'Easter8', 0, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (24, 'Summer8', 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (25, 'Bloom', 1, to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (21, 'Summer7', 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (40, 'AAAA', 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (34, 'Test1', 1, to_timestamp('11-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (32, 'ABC', 0, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (41, 'AA', 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (50, 'TestAddWithCoupon', 1, to_timestamp('19-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (42, 'Summer77', 1, to_timestamp('20-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('22-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (43, 'Summer76', 1, to_timestamp('20-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('22-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (44, 'Vacation3', 1, to_timestamp('30-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('02-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (45, 'Xsell MBB Telesales', 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (52, 'test', 0, null, null, 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (51, 'TestCreate', 0, null, null, 1);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (60, 'P14', 0, null, null, 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (70, 'Xsell MBB all channels', 0, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (80, 'MGM', 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (82, 'Xsell MBB import list', 0, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into PROMOTION (id, code, enabled, valid_from, valid_to, coupon_series)
values (81, 'Xsell Fix Salesforce', 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 0);
commit;
prompt 42 records loaded
prompt Loading COUPON...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (14, 'SPRING1234567289', '38640440481', '38640440481', 2, to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (26, 'SUMMER1234657292', '38640440482', '38640440482', 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (27, 'SUMMER1234657293', '38640440482', '38640440482', 4, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (28, 'SUMMER1234657294', '38640440481', '38640440481', 4, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (51, 'SUMMER1234657492', '38640440484', '38640440484', 3, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (8, 'EDOWN1234567892', '38640440481', '38640440481', 2, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 5, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (9, 'EDOWN1234567893', '38640440482', '38640440482', 2, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 5, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (10, 'EDOWN1234567894', '38640440483', '38640440483', 2, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 5, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (11, 'EDOWN1234567891', null, null, 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 5, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (12, 'EDOWN1234567911', null, null, 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 5, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (13, 'EDOWN1234567912', null, null, 3, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 5, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (25, 'SUMMER1234657391', '38640440481', '38640440481', 2, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (24, 'SUMMER1234657390', '38640440482', '38640440482', 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (52, 'SUMMER1234657493', '38640440485', '38640440485', 2, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (6, 'EASTER1234567895', null, null, 3, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (2, 'EASTER1234567892', '38640440481', '38640440481', 2, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (3, 'EASTER1234567893', '38640440482', '38640440482', 2, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (4, 'EASTER1234567894', '38640440483', '38640440483', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (5, 'EASTER1234567891', null, null, 4, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (46, 'SPRING1234567191', '38640440481', '38640440481', 2, to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (7, 'EASTER1234567113', null, null, 3, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (29, 'EASTER1234456294', '38640440481', '38640440481', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (30, 'EASTER1234456295', '38640440482', '38640440482', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (39, 'EASTER1234567901', '38591641146', '38591641146', 2, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 3, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (40, 'EASTER1234567902', '38591641146', '38591641146', 2, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 3, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (41, 'EASTER1234567903', '38591641146', '38591641146', 1, to_timestamp('12-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('12-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('12-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('12-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 3, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (23, 'SPRING1234657291', '38640440482', '38640440482', 4, to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (45, 'SPRING1234567190', '38640440481', '38640440481', 3, to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (16, 'SPRING1234567291', '38640440481', '38640440481', 4, to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (42, 'EASTER1234567904', '38591641147', '38591641147', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 3, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (43, 'EASTER1234567905', '38591641148', '38591641148', 3, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 3, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (44, 'EASTER1234567906', '38591641148', '38591641148', 2, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 3, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (15, 'SPRING1234567290', '38640440481', '38640440481', 3, to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (22, 'SPRING1234567093', '38640440482', '38640440482', 3, to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('20-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1101, 'GoCOMMANDO-WASD', null, null, 2, null, null, null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, 0, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (17, 'BLOOM1234567092', '38640440481', '38640440481', 1, to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 25, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (18, 'BLOOM1234567291', '38640440481', '38640440481', 2, to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 25, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (19, 'BLOOM1234567292', '38640440481', '38640440481', 1, to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 25, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (20, 'BLOOM1234567293', '38640440482', '38640440482', 3, to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 25, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (21, 'BLOOM1234567294', '38640440482', '38640440482', 3, to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 25, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (49, 'BLOOM1234567295', '38640440485', '38640440485', 3, to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 25, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (50, 'BLOOM1234567296', '38640440486', '38640440486', 2, to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('14-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 25, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (31, 'YEAR12345990', '38640440481', '38640440481', 1, to_timestamp('01-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-02-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (32, 'YEAR12345991', '38640440481', '38640440481', 1, to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-03-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (33, 'YEAR12345992', '38640440481', '38640440481', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (34, 'YEAR12345994', '38640440481', '38640440481', 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (35, 'YEAR12345092', '38640440481', '38640440481', 1, to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (36, 'YEAR12345093', '38640440481', '38640440481', 2, to_timestamp('15-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('15-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('15-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('15-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (37, 'YEAR12345094', '38640440481', '38640440481', 2, to_timestamp('08-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('18-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('08-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('18-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (38, 'YEAR12345095', '38640440482', '38640440482', 3, to_timestamp('18-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('04-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('18-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('04-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (47, 'YEAR12345096', '38640440487', '38640440487', 3, to_timestamp('08-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('18-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('08-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('18-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (48, 'YEAR12345097', '38640440487', '38640440487', 2, to_timestamp('08-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('18-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('08-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('18-04-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 26, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (60, 'A3von4KzxRBZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (61, 'AikU59ovBFXZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (62, 'AL1TYX7WlEcZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (63, 'AkhOeYXsDc9Z', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (64, 'AyacHmYTIBjZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (65, 'ASwVztN1DXdZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (66, 'AGvOZbbbNVDZ', null, '38640440448', 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (67, 'A9j4Tiw257oZ', null, '38640440448', 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (68, 'AN0xCQAaOGnZ', null, '38640440448', 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (69, 'Aikg8Qu2RQdZ', null, '38640440448', 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (70, '7F3Q24UBNczbhTfTgzUL', null, '38640440448', 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (71, 'PegVNOfLgGzOTeNoaq7z', null, '38640440448', 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (72, 'QgKwxNFrzNBFnzCfR3Nj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (73, '9ofCVmNfinBhr4O70FPf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (74, 'giAwEnxyH5gE9otIXmek', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (75, 'ZVr6HHTAoElAYBWDF3pL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (76, 'qJBSWhPE1E3EYg5j7FiX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (77, 'agPJbfBU4WK81b9zw3Rg', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (78, '8RXFhKz7d62F28krE1eI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (79, 'q1k3WGhwH8GlQC1XxKhC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (80, 'UVESglnHHbYwwhmqUDxr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (81, 'KYoOy0RxEmUKSrVEDW4P', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (82, 'sM8OPIFKAp3wr3SS7j0z', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (83, '95kGLd9HmTMw4WKaGAZa', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (84, 'r3ebFzA3MAxKh1mrrV7C', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (85, 'nNkHduhaFE2fFJZQplWe', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (86, 'Of6IHI4KaGVE0Wg3SxEC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (87, '7Iand0C4tCw59NeXsvJZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (88, 'S1y3j6R4jKNGET3YuOmZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (89, 'Mpda6Hr5MDht99GeSl6d', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (90, 'CSeW6EZnJtFlCEz7Gho0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (91, 'RrFpKJXrCg9zw9Yzbsr4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (92, 'j9pen1C47LKmAg3RbA2u', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (93, 'QERipHQOiaO99mTrvMVu', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (94, 'DHNG0U5Lj0ouIMxmNNFi', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (95, '6VyRGF35mXx3GyduqjIR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (96, 'bgChFCplntPCX4s3S0Px', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (97, 'zjm393DPxVcKlWu3KkoR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (98, '5q9ob6xNcrnNSYsvsYqE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (99, '8F53hFjCwxareMmQNu88', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (100, '88vUeHvyGIk7gOiXp7eP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (101, 'u8WY20R308MxZElOHjaP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (102, 'jhj3VDGu8MiOyQpkWyFy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (103, 'iS6pvBMx1hzlTFI958TZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (104, 'INaOC0JnFnVxXo67NkMj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (105, 'AcHDZAM1cj0ubYyP38GM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (106, 'GFbV1BliNdHSzbt58Qzx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (107, 'Y43m8R0IL6bEs7ryBg4q', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 100 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (108, 'N5iSkMTT4Hr2LfYzwzaV', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (109, 'CjBEbwNgOg2KXkTEo1KZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (110, 'nvielzkaMACMshV8zT0P', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (111, '2bgh5FdXjG0oRajNOqcd', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (112, 'eSP1UkxUG6r1lfVnQnPH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (113, 's3IA9LlkOAXSnFSyRJYD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (114, '5UDZODcyMNVW95isFHfJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (115, 'BBmgFmzgEyH8HcKEZVMb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (116, 'c9uI84RS2lTJ8hVHB1FI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (117, 'knaooTkwUu0yGRTomJf1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (118, 'XzrRLAk0CIQY4Bn1jQ6f', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (119, '5CSCIOfgY9ry7CtLAfm8', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (120, '8hN6l8feg8RDbfL8a2zL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (121, 'Uowxnfoyi9VEpDFKNJMw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (122, 'PUgB4YMM29VVs6rf6wbE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (123, 'VAgJbgHQUFDyU4K1hPn0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (124, '0jqr2hbnME1CjoZHdHt6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (125, 'Bck3PfAzRjKGZuKG4AOl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (126, 'uK7sEchQoDrfjoKBhNyg', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (127, '4J5hy5bBPq3LdYYSwNBF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (128, 'uwh16jLotq7JHCI1fJ1i', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (129, 'hDHCmxXLxnYM4AwPp3fm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (130, '5uRWPoE86Egk9gUoDCeB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (131, 'W6HTOQi5agwYOYh9XWtb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (132, 'Mv7c4450CawiY4vmgQpZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (133, 'DtOJVY3RptlqpHTaRxd5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (134, '1Y2YzPlrDS3qAGzFpwxl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (135, 'q3uL91bdmt0L0HyPFYQc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (136, 'EZLEIaQi4xbhflfrxNez', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (581, 'rvqGHCNX21Lg0yQDTTrC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (582, 'kAKb2bYal2o0XH9Qx5RY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (583, 'z5apHA1TW3OvcwzZjncb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (584, 'wCsCHFWMVoSAoMJqLyQ7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (585, '5eFgIEaIWVnew01DWWRY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (586, 'fz7ltsEjqJoROOs12yYX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (587, '6cRRMDARmEZvWIW5jof3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (588, '6lcEdrAhiuVAxAUK1UmH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (589, 'mP9xGAetSqNHwxqhXtBf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (590, 'gEnKnB9d2wkyQArkr4YX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (591, 'Wz1cneRpS1uv8WGin03J', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (592, '4SP9T0crbnWldoWmk0O1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (593, 'myUGFBeSLa9A5xp08mMN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (594, 'YXpIdIAmnk0EOtDSLkoe', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (595, 'XoK4jOZLPMrBmg5UkhZl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (596, 'T1XoMh12x6IzYmErhByl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (597, 'lktc4ax3HJTAOgeMTxyD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (598, 'wd9AukoiLR6Pcy79uFWN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (599, 'Dcyb0B96ooJVrpJ8Inz0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (600, 'sFvjCu8YgKuWGappRdq5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (601, 'kWxUG9iedZInEuFHDzja', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (602, 'sZulC1Va1rcYmAmOo80G', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (603, 'PInYBYqfvlQKHxDuc1Oc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (604, 'hM08LoLgPK38JgN6NtZr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (605, 'ee81v6EaKWn4HoNlaEqe', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (606, 'fKodwmevO8kOK2vM6HN7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (607, 'A85JUHeEmNm20cc1twNm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (608, 'AcQZ1AthrAqfbOr7uRI7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (609, 'LXCywNYTCMAcPqZOwIff', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (610, 'Lz1XBRnkg8CHSob9Pbgq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (611, '6cNhe630IQ8DnjjNUhRH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (612, 'atsuQwrLFjNJYX8KJD8h', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (613, 'mfUDGR4wwODsLIdQpjJT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (614, 'Fsb2MaNMeZvGBu2YUusH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (615, 'e34uXTdEA8mpzesUMu3l', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (616, 'kxzR3n0aL490mF4bzsEf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (617, 'vMKYazvg4qjlA36T1bfU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (618, 'dcsw0LxB8vmFhQ07OgFr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (619, 'fyDJQiYAnJkhNVj1gNXc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (620, '91038dSaxZRThpILTjDz', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (621, 'LD7g1GK5UShEEhAkAA1A', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (622, 'hOKWaqyIwvrbLdMdRo3x', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (623, 'DjVOpL0qjvD0n6p56aHy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (624, 'pFBRBasE65ayWo7Ew0GK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (625, 'pb2EdwSEGS2bidrvv5Q7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (626, 'J148Ge96f8wCDdCoJah8', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (627, 'lHmVZYWKKeRHtRU4H93W', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (628, 'o4196JP1sPDKqsBPFyKQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (629, 'Vc8V0fCXzqS0s5V1nWr5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (630, 'm1wqiwBCDukjDEZTqHA4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (631, 'E3ztkgJo2O1LxNane7sp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (632, 'J4On7jFeM20VA7k1ibO0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (633, 'NdiFPDVbq23VS2EScJHB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (634, 'CGANedlsFgfvkHGqCWgK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (635, '20moMU1boVd4UELqKi3d', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (636, 'HPEn33tOlEWFL3N6z6bn', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (637, 'p6NIYomBY5L7RBOL8Lhi', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (638, 'ZRoyPF4ZCYUdPwsX3gr7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (639, 'XLAQcgUSNPqpxWhVJ2wR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (640, 'n5e9yUWASTQIJWitW79p', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (641, 'RmxJEptUcF1elyLj8ZuE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (642, 'bdwLizywMPWj6lapCqwu', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (643, 'ecHprrPVeTVXwdUURIyj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (644, 'UxJslkEnO4slGQUaXYO5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (645, 'bDrKpy5XNEuP2T7bSwA9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (646, 'd8BX7Yv5PEiVYltVXYUZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (647, '3702dYIIKQgjz2WwraZ4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (648, 'i4K3KfY2sqTK4EG2NQdu', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (649, '4FAIwe75RSTCVrQobCjL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (650, 'drwCTGAHM45xeu6BUyK3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (651, 'sMjZhs2BXftjUO5HtqzD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 200 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (652, 'zG992lZIfBAxaC7XVkjQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (653, 'fjH72GtbjZ7uiCxPc6f6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (654, 'WaPBzZ5EwEOwdnvT8xDS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (803, '4xreN7e8CrzEyYmRBBvb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (804, 'uy2qh39mJbOm13b1FqrU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (805, 'tAqN5iqK82H9S5rG2Xou', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (806, 'aIzdg4gvUtXMZqQgor2A', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (807, 'MYJdUO9XKGPRgQFuUQn0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (808, 'VIhz0dol9RySesXJfSzx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (809, 'Dr77vlyPEgxLgb3VC3h3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (810, 'ksi0P9LsvGjgPs5duNg2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (811, 'd8E6dpYs0XrePmBFjoMd', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (812, 'cLvhN3oSTmjf3DvTHC0x', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (813, 'xgX1Bw6wfdb7uelR0mV0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (814, 'JXEV74Ile6L0Pkzt6fsG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (815, 'Hu1MgejQD4wUkyJ3YeFM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (816, 'NEJHhe3UX2qRMbcAvHsC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (817, '5wEbtpbq8ORlBoFm5LXD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (818, 'wR4EUDG93HJs8MdLujbG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (819, '5P98nOaehedX6IjsbRr6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (820, 'bJpsXMRZQSYUFx7SOlFJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (821, 'rZZLuWtVhK63SDpkeS75', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (822, 'OubADZ1WHTYdJcTdkZg3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (823, '2loujMsDkCrzV4vWLRws', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (824, 'MNSShizpkgDNvBUIHKv7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (825, 'WD2gBghhpJk253QhdZT6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (826, 'hBjQSDGR7264DLD3vlYk', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (827, 'fzhGpqIWeSJmPhIExFzZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (828, 'RqMyZUviKSWeDX524U8e', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (829, 'eMeAHNuqj0LMSf4bSTnR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (830, '1TsLamYTCpkX5iHOioTH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (831, 'jYeTWy88WXypQhy4dLer', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (832, 'p9Uj9nlAjYetXqwoUsxc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (833, 'GZ4BbYMFfPgYcqA3NOAw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (834, 'V618sErrGDUwVqjESgIW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (835, 'ZXwIFa41NacJW6cw9vFb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (836, 'QZPfwgfzcDnSTf5cVzHY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (837, 'dbZqavv14Rj1zocrKJGv', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (838, 'b2Qs7gpJoddzFtuCEW3i', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (839, 'srcqfVcaQ45k8vfxAI2i', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (840, 'dN1rHwjITXFPE13ACJm9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (841, 'hFPmQJQxfIyn4iCm9UlH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (842, '416yi0YVsTUfooW9V4JW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (843, 'Xi1aH8PkjBqhx1hyk7K9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (844, '4H1i3sUg6gVutKjHejUL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (845, 'araaGNmNoxo9vIdsmocf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (846, 'lhIJnL7bcbSWpwUwYHlf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (847, 'WesElpd1sAIQVDkwXyWC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (848, 'CXKCcHgChx3QcPQ9UVW4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (849, 'BxDub6ZnOnK9ubjocHCT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (850, 'ATy7IzxzZVW2xsA1PgRf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (851, '9uCDJyP66MXT5ZhVag2G', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (852, 'g9YzePZlBpXbQFMa9OKM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (853, 'VjCIiubduZDa37h8bMeO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (854, 'GAC8Nsup78MHS7rI9Yys', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (855, 'tGhBZHNuY2nz2DmbC3qB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (856, 'rRkXPS9he1KjNUKdinmJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (857, '16blBMJstv6wd3KmQj9K', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (858, 'zPMPYWCxPmbwwifUHSd5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (859, 'ElAfqbuKuNIIrSmUIZnJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (860, 'bM60lANzN71ZJXb7w3py', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (861, 'fHcKyuG0UybUV2Emv2ib', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (862, '0pPaPsJC0xGlGzriQCp0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (863, 'fqIgxJD9cG8JOYRP96mR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (864, 'timgMsTTZjTbs4wK9CjU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (865, 'EAXGUcDCdb91boHpQ40V', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (866, 'PjGAnoqpkLwJ6mHxHL3y', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (867, 'T6DmSo4aN1dtyNSjzzc3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (868, 'WmybnX0Zqwn7zNhwJtYT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (869, 'gZfDlryvtYb6h6TEgrpB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (870, 'VdxfK7yNEwtSyzzitgXI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (871, 'QQvwWFvyFYnRhiArk806', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (872, 'f2Y6t9ij3IrYPbcDnODA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (873, 'yGt8ljryWIB5IastNjXA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (874, 'd0phHHXeRPDg1nLO4EjB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (875, 'dUFcymKPNPVTkXGYdjH9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (876, 'aHPzKtriJguTwECzbwTB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (877, 'WFfn1JiqTJ8BM66wL2nP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (878, 'r1CsxwVGoypaaLLl9l4K', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (879, 'Y11FzqsbJu5dO06vf7sa', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (880, 'DB0SkrVSJ8dBo1MsPvoN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (881, '23Kab8sDDNizqK7DI8vS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (882, 'jT4ubGrRRrW5dm6AiwQI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (883, 'VHFI3x6De340Px5aBViS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (884, 'Byj9MDldtOg4EZJP11sS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (885, '3pV4fD5Pv4lAxFJVztj8', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (886, 'OFMqfcL9uwAMBBWixVZK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (887, 'opm3FumRsO8UjDMRwrxP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (888, 'MqAuNrQAxbKEh4gGgwab', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (889, 'JbFnVqsO2m2dRAfAkO9D', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (890, 'ZcRtJA3jmhAr6f4phDUw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (891, 'knV1o0heAWnNJBpLAZBX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (892, 'jWCOVYgCubRiEB2wZkTp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (893, '6x8VfvoRA5XvNtRG64yP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (894, 'mZkVJF1FH2m4eLeSrfDE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (895, 'SW5WEvNl7CtLa8oaX63k', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (896, 'DkoTfHVyNXvZIUb25rZg', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (897, '9lzzMf2FgRnnL1oVinnJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (898, '9n76giu5YwbAuQ67Ugv3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (899, 'RkCBeRgZ1DHwAXhotx37', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 300 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (900, 'NFXn7cwCqcwORyJbqSCQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (901, 'OGejfHATlzHtGXDdMvXY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (902, 'BDkEWnm5Sh3zUT9lAFyt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (903, '8VkKeERbS3ISwaKZZsJW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (904, 'odhXE7HyTqcPFnOJTg73', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (905, 'BbIZPzHeA8cbn5JrMmRk', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (906, 'sYfjt8qJp4eP0zOlAluK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (907, 'nm6LoqFvr4gWPQSPL9YF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (908, 'pRHQWNOBunw48XiR7eHE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (909, 'EhIagZ9IcC0xw0sZfVjo', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (910, '6dGECLUr9lK6B8rLhi9k', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (911, 'M0P4aTnKP5QFIjicN7cZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (912, '3Vmv46g1NIFGVlcIPwr1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (913, 'eVf5k3eiM9j83k4w6QYu', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (914, 'Yi48DT6KitfHG5okebkC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (915, 'Ks3bptTbx2w99IZHYWDm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (916, 'LiDqiMePwS0ggFxoSg20', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (917, '1Flws5UIR3cLaOBAntXO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (918, '9ucE7SGETE2JsZ6xQgvr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (919, 'jwtUzEfrxx4EAc9zpud5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (920, 'lmzX9cHy2MOHTFviAuur', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (921, 'lU9CyqDi2SdtnL0RfvQL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (922, 'esP3MJskOPzRYeNs5Ntm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (923, 'klC3KPmeKvvxNIYtMnOO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (924, '7hEyY67nhWW5HCXOdXX0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (925, 'kFDDPS88dM0jJx4ISMaJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (926, 'HwyJIBQ6BAVWPd2f3TNJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (927, 'qKd6aJ9p1YvqVJCJQzs2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (928, 'oSpKkteDfBLMmXmLBDPl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (929, 'GQgE2RFzuQylBaKWjzOi', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (930, '1MACSGX9GcTA2JfVCCp6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (931, 'tiOPR1rJ4XjmCkiETA33', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (932, 'ydBqSM7SzWnLf4AVrCLK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (933, '7PYljjeqtyXCOAs5qbds', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (934, 'Qqi3Z0eOQ9M7dJwUNJp1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (935, 'Z8K7h3Kc2GSV3iZAWzgL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (936, 'P4syOmIHEPiGWUF3EWVz', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (937, 'OGr8YhKpA5WFLKNYMBaF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (938, 'gWO5YEOaxI30R1Rn9Xe2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (939, 'kAVIIAgNhiAY9Euq1bBN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (940, 'rSju2CR8mxoiPMKRirH0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (941, 'eUoao3H349rrnWzbWf8v', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (942, '15J7yeAQvBypYN4Gu0P1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (943, '4A1oReG7pJCVr6jeT6Vm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (944, 'hg7vgPTHyzwVzANfNb0L', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (945, 'Uq8HpSKHQQ7HyBWpoCl0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (946, 'ELjtn9NQ32pkRIl3YHtb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (947, 'tI3CXLaz4NPreQcYpEX5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (948, 'WfwVafrNpH0egOECnlE8', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (949, 'WQDKi4CDPRd6kVTFyQJ4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (950, 'dboBdMlvp2uK0f0tcvlO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (951, 'iSlRoagKvGV797MTuG2p', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (952, 'eXlTIpdPQWPaqmLWlldc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (953, '1cgt1muId08rRBWHideJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (954, 'z7JZpFVd6M9pnRz3RefF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (955, 'kpn9kw16CgmOPbDfOyXZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (956, 'hQTnOi6Iq9MIBQHXMG0r', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (957, 'OGZOKJQMlWQcTSVG0Zao', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (958, 'TYLoxM2aaGSkj2u3ttUT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (959, 'Mwr46agWJsKZIZUgjCdp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (960, 'jCjuCP36kgUMvmfkVIaq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (961, '18NCHbh9q03iZ7GE4nRS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (962, 'Yg9swqu965qRnpLjJOcj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (963, 'wtplK9b3ZLaEFK0xowBu', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (964, 'iZPirdoU38s0wVwKGziE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (965, 'ffHsedlsa5QoOpsG7BCF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (966, 'x59SeGGZKjoghp6Ddhkm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (967, 'pG80gdsEPtIjNtPpAY1n', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (968, 'ZN4csgkRbdJFiB9EOXJL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (969, 'zUW5ryr5Nh0lyaGf5KFU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (970, 'j3qn8gicyZo4QFn4IUi1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (971, 'fBE5TmCXl88Xhm3hx5bT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (972, 'wb3jF2szha0SN2MEA5EU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (973, 'jcWdq0JcXcY3ymDjdYO2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (974, 'SPzsHsiFf2zsGtrUazsI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (975, 'LKBGbDOTDxQ8VsdT3KSm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (976, '5mHJvXumUXUnlteYf7Et', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (977, '0wG2evbjxdxW2sPUfga4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (978, 'rV1GQO5B73hHIX9XaHuU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (979, 'qayrZKODgcShpRGtrBFE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (980, 'oeMnffJMcOf0CHfDeRHD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (981, 'IYAHhRjU2LimwtJc7ymv', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (982, 'aQZsfaiLNGm5Qgswgvo4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (983, 'x6mQT7h4TXmzV2ZxBhtZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (984, 'l04l53CmJolB2w1i7Acx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (985, '4uCVgtzUoxy35axvYjop', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (986, 'TyWT5ACY25CytMlTWKz5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (987, '59r1RcudHj7mmmBYkM06', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (988, '2dTpFhTIlnV08rayQuQ5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (989, 'o5FLekhCp7A8lESV2ygL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (990, 'kb3RXFeKE1Gj4z1qSZXJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (991, 'rXY9c3GL8OTQakRCreNd', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (992, 'ZO7e0YPYm4AL1E1Dhaxr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (993, 'HU5QgqzoCJ5lXpa7mgL3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (994, 'BDk6Qb9XO9KOs3F8fAXq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (995, 'sKqUCf4BrzxoEAgKIBhx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (996, '97xqTTl1QBnQW2SES3gm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (997, 'utgy1OljxGhsJP6Q1NmQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (998, 'uQff9foGiMONrvH0bWA3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (999, '0Q6BfQR9HvKqfuVeJw1w', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 400 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1000, '4OgTRGGG4umnvILOvFUF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1001, 'k0EmnMUy3E6BcrRAVWtC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1002, 'Qv2YWu8lwkufeWQxgZ55', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1003, 'vHhtCGBJ7y0BucvnSauT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1004, '1gHOTFD7QpO1yEZrch4b', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1005, 'T0fxMPtKWBB29Fks6JaQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1006, 'FbAJ6cRZXWk8xtLyjy1i', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1007, 'X7ohq3bcPjEXIh6LFVk4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1008, 'ZDiAWENaxij14fWLTDEX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1009, '3hnXoN1g2elrGdyxseqH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1010, '4a0iaQi7NPV07ZqVwu8U', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1011, 'xqSYI2WHF9pNbhx4rqfo', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1012, 'Ni2oV1w3OTCWqzbH4DT0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1013, '710RNjRZq8u0v2wEm5rP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1014, 'Yf79e2Zec7fIb1eksZ6L', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1015, 'oPXl51wszwi5oyonIYRa', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1016, 'gGlYEDIBXsawfl4E0uIx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1017, 'a6gGIWD2yLIWN646BVLN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1018, '07WIxxxRcJKDDlzdkHzR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1019, '9X5jzOVzn5IMYoigPZP0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1020, '9yIGXrEkcSW0MYzeDmI1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1021, '5O0qTN6f6j0jtqwA3Ah8', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1022, 'fGUj2Pbp43e9eIve890H', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1023, 'PIAncE0pq3OloOGTm84U', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (655, 'fJ3XURhhRNDstNy4W6Ri', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (656, 'zh0dXwttqx5WNFZFtHzc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (657, '9it7wXjsUqaq9SxQOYNf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (658, 'dJ1hzzw0DzJwTvszUNII', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (659, '65ZQAljh71W8ghNG1WEn', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (660, 'q92s7n5He2R4qrAcWCJr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (661, '6iKbKTxrog3ASTU0nXvt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (662, 'tnTXUpmq7bpTYgE6TDJo', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (663, 'fmhS7wrOBtKCBg4QUCG0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (664, 'iuzBHRQXMxAEJNDY9ve2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (665, 'Lj1XLGjn8EkOzrvVz8fE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (666, '3x9F64Jt6PURyNkPbclM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (667, 'FkzwFiWORhP9C2ZUIRPT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (668, 'QI1y2G9SHWPSl6SuEeLa', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (669, 'lsOLH6mAWGqlrVIKX1FB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (670, 'XoPqU6LZIQ0tYwKXcOaH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (671, 'N6bbIaFMTvR4d12hrogq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (672, '1loql1KywnKNnwUO7k3P', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (673, '4FQ9O8zRnIJpxNVLLf0v', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (674, 'ol51JPPtDER8tfHJMDjd', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (675, 'JI9LiBlMK0GssflTEbjv', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (676, 'bpPwzLQl9av4tYRGILcm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (677, 'MxE6rQ4TbFPCxuQtmP28', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (678, 'jRQyfMfL3LyX7H5bzU1E', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (679, 'i9WKG8vMiSefhUHrEMUC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (680, 'lN5liQzTt414huhHbGpT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (681, '7KkAL8dOH4aA4GKmoC53', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (682, 'zGaS3OMCcm5SIflFFKKS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (683, 'bQVQ7oIBEb516CnWXKVr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (684, 'XkGyz1cY36FF4Mu8Denm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (685, 'cBuG7DbFeQWLjlnVHnVt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (686, '5z37lR3WmpcAc26Hbi82', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (687, 'Ic3GUoRU1rd7H50c8OIX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (688, '1dLFRfqIS6LdJxKQI509', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (689, 'LMpQhRNEa9YV4TdsVbHR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (690, 'hQFpAcZcbPyWVmoAeRUO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (691, 'KOBQ3QpWjDozEHkq26Ze', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (692, 'MX6VASWr6Kqc3SorAeft', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (693, 'yu6GiXqoqoJaUGyDkCuc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (694, 'FDfEujuwhbOmW1rZHnY4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (695, 'JzJCrewO7tDzjOrXSElS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (696, 'apQJd52D7CNHj6BEnKj2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (697, 'khrn6LXHAo4C4Fz2LeiT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (698, 'amzbE4coX006y1x1oaNr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (699, 'aDplu9J9bbznthAAkZRz', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (700, 'aRnFuTf6291qEAFuOQpn', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (701, 'rLPVXXCr58IcHFUYliAK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (702, 'B5TXtbP7XnwUzqIq46Et', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (703, 'nSCVh82DPessBjJEa89P', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (704, '85bKZ2xL3EhaSvMRZn1k', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (705, 'N1jeBeNurubumVenRCRr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (706, 'cPAFTF1F0GONIUNFG1Hi', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (707, 'cEnNShI74rDf8MqSslxj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (708, '7aOeGSr7pqAcBBcu6wNz', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (709, '2kCh9J771YIxTGb2q9lW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (710, 'DEFwdxnSp3VW6cPYruO9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (711, 'V70qcJxra72bdEwOvHrj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (712, 'R5HY0reeJGXBOaES1eHH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (713, 'asKo9sO2xOTIo9OWGgxH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (714, 'dMcG2vNdXmSqci8dkPXV', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (715, 'aWP2mI9s5VtDU5k9R0KO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (716, '57aSNqscQxZFvV5d7JOq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (717, 'V8ozorzsazEnb5Zyoh3W', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (718, 'K8Y0LzJ7e8AoS89KG8gg', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (719, 'Cqtxv8wzSMVF0hn9H6xy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (720, '6xRCZDKGCzbyKjgCqROG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (721, 'LVDdBCwbG80pqbJFbIjP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (722, 'DNL6aJ3TJLPCrvKSMuGN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (723, 'pTaROAdTkJqIB6svNMZJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (724, 'u36isudC1WAGPGsEz4Q6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (725, 'KgiQ3Pd9wbIF6FmC9fqZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (726, 'ulWDivJq3ey1h7JqRapr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (727, '2AbjBI418NM93eV2lFEG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (728, 'a7nhPHpI8ieySaFnumJv', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (729, 'NLXj6usiC444D2WODHBr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (730, 'wdUqTVzN4bKtUTQ6cWBT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 500 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (731, 'CQeMpRNGRTuSCTKcShef', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (732, 'l5hY7wg1XKh8n6OxcDgJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (733, 'NZbznzgYNuICa8qN63SJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (734, 'JtrlI3cemxSRmt8jaHGU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (735, '9bm3HkAXbnTCrY6opOij', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (736, 'VeCVWEqgLUK7xRJ0Abu0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (737, 'CRrRVO2AYP9kOSNyzPW1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (738, 'bHY5LcdEfwiwc8Y6sEgF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (739, 'RFd0REEsu9YwgkeeXVjp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (740, 'Qhxqn58NZOKlC5MXuLCJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (741, 'KMgF7ROUHz0Rm0UIwo7q', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (742, 'WtSwL4nEkMLyh5IqxUE5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (743, 'yRhBj9x6oOgQ3lnAk1bq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (744, 'IbG7vCxRIF0aQRQfRhMJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (745, 'QBqWqZjsx4es392tkFze', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (746, 'BbLiTZspWpjmQlQ4HtwQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (747, 'oO6BUecn3gwyUP1VQ2Mq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (748, 'pB5FyopM4pDoWXx2wwfU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (749, '8bVmanwI016lPb4kKdP0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (750, '3w7MtJtq197U8jK7sXkx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (751, 'vYJqxJPlAVbFsqh3ecbq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (752, 'yhOlk02nlx0PW236OXoG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (753, '3O2penPpKH41FpcZfxRl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (754, 'UGOZ5MfuKcjtEx45deN4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (755, '6hCJS9O3nxMfT4Ph5Jgs', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (756, 'bfZSpsLoLU5jLuuZyP51', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (757, 'Lm0URnRIShmnfegigcSv', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (758, 'QOxb6sg8qB3Tuea4cXmC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (759, 'uDfs6azCXeHjtU7HljoO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (760, 'nmh3GZ4VYvfplYJbJONI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (761, 'oIjkENlkPf3iN3XqC35Z', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (762, 'RQla8OeuFffnPqApKh2I', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (763, 'Q9kYHz6AaLWUnuPJe5yX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (764, 'MeYeOggVKurlYkqVLJRM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (765, 'feMRQALnDyUluWFlCMVl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (766, 'ba8T7uoQLTCC6D25rsWx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (767, 'qxRowtffjYUhHJA8jIfE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (768, 'zoZpFOnFtZOUDrKLYdTk', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (769, 'm9BNwlbtnt9HQAFpl6xS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (770, 'ayWqAmxNXNRXgnyBHkBw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (771, 'D2aoXJDLf9HU0rtWdF6b', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (772, 'WXwv34nCzD3wosO4RRB7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (773, '0rx1ujLSPwxdpl9u74sq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (774, 'uz8J36n1C1bpvXabmGgV', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (775, 'KU6WrrsQ6x4fcBrPOchO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (776, 'CBQRrKHkJjZfCScNLXHv', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (777, 'Dj2oZY1tg34Wd2akCLDP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (778, 'd7oOLTJ7c7OqaGJyc2iL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (779, 'zMoBBxadKTZuUfWRK6vX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (780, '1un5skXUMRH5mglOWjbM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (781, 'rhbcWyj4owu7iJGN5YtL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (782, 'xkgxKv6hvXDYwmQk0DBT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (783, 'omYnTRWxOGfPJNozYL0g', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (784, 'QskXRo2D2R4bKxjfEbxv', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (785, 'Zjvuchhkk8ypVH2iWyJz', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (786, '90IXNQqWdiDrMDZn6CeG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (787, 'Xwz7KwDzuEL3DwIHQxjQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (788, '8uVK5zm6uSTeAC5roHvr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (789, 'ibOuZP1LamBBKYDpynjt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (790, 'huzLa2ayndcaYvSnisid', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (791, 'Y9YmUmHojbwSZyaHnOB9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (792, 'VaMrF24YZeD6SzLvDEdS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (793, 'jYc0b0AYdZ6NKVhFXjnF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (794, 'jRZ7ZrgfVZ0TVLqoj4CQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (795, 'jS4nFftp6Dnb60KYBvan', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (796, 'ctoiagnyNHREKTNZYX8W', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (797, 'XWyA9FeyneVyCTwTDwtE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (798, 'gK9MCGcaQ2CZrYdWh4CQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (799, 'N7zKamzp11ZL2LGdsi2N', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (800, 'B4AueGq82GPvOqodCbnN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (801, 'gZXnfdZWnLZVRtuSrqL3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (802, 'LVTUFv0pQvVbY0fwCamX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (137, 'CKDOsUS7f5AV5TT8ksnA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (138, 'cEu58dsumK5iP1ds1Yov', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (139, 'K0n3RwCgpRgSF3K7qVMA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (140, 'TzYvPqp1xgBPhVMIDuyY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (141, 'bpx3c1AMwKLC1ZDbqCci', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (142, 'PMvqsISnVnf6fw4UyQMd', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (143, 'SLDFoVWMtWk9ROsYoh98', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (144, 'F8DOMk0HB79L9eL5TK81', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (145, 'U6KskGrIHeKGs5PVgEkE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (146, 'RTCbZ9DMjL9KzDjrxSkl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (147, 'RvjDiNOhG2RrFG0O2G6p', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (148, '8LWTuwAwvcnis7bLVxjt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (149, 'ThQW4q10R7n1dxlLG3UQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (150, 'k266Y9OFD8kwtldL5u6S', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (151, 'eAga0OCSswEOtdMe75Ws', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (152, '1IiS6XjLNylsAr1fVJg6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (153, 'PGR7j0iHId8dWddPimh8', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (154, 'iTAEviZMa2mKFj3fk7CR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (155, 'toZ7kA41umw1EJExJ52j', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (156, '26C9U0Efzj49KBzFdpu7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (157, 'b5RtvNX2HuPVVlCNd5M4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (158, 'ClZaZ4LFoe0fGHfiHldj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (159, 'SIoMuisT9MecmfyotQ3f', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (160, 'wW2ReFoZfJo7g5OE2yqa', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (161, 'KPGyG8WuGzBtArWlaI81', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (162, 'kZK8jMGQC9tXanKsoekZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (163, 'rna7Pmh09loaokmMnBFr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (164, 'NUqlBhuwZJwbGCf007UG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 600 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (165, 'XlisTQtDEItrzvvnBVBT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (166, 'qjSaqrklFpe3mfzeXRct', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (167, '7nfEU4LkiHJF5dHAr68k', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (168, 'LLtxYgZVXEnqmtOV1P0x', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (169, 'ofT5E9Jum0mS5dSxGC57', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (170, 'ORYSOh5J5J2WvQa73rXK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (171, 'vcyuDW2sMy9mM98Fx7GQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (172, 'mSL3eUPJb7OMVOXHgEmx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (173, 'qINq6Dc7GDX2qDnDoWVR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (174, 'pjqfxmkA3THLrhIgxnxJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (175, 'AeYkaa2JXQc4y6Smfr7c', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (176, 'sIdDTc5IazPuh8bfuFFY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (177, 'kn8jhKN7cjsnNpfGTA1U', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (178, 'yumVSGy0woToCrUcuZMI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (179, 'jd1J3mV7iC7sRvNtOG9y', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (180, 'DX1BWO4XDzqYfVhaEo72', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (181, '0vIJyR4RiPHcH8twtlHV', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (182, 'Ycu83WaSw1zjQf0bVZnW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (183, 'gc3xpRDL85cqvRmfoYXc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (184, 'L5TDgc4aPERJ7Oq1OUdJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (185, 'EMZK3Pksj1J5ieoxORPc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (186, 'ofChulPm5pwzHmsbaZfs', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (187, 'WxpidVT7Zc61J1S7Hpod', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (188, 'YTmaw5XshL7F6bSY0puZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (189, 'sQowTou3PDFiRqszXqiI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (190, 'pVDer0Mu8EpPLLaWe1zQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (191, 'SB7DKHyUdzBofSOaiDCm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (192, 'WmTeZ75gSrbeQe1lbpdU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (193, 'Mt0jRaj2GR0k8gehVj88', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (194, '14SxGDAmIJRkBMazIW2M', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (195, 'e5mIGz9wcOZKGjJ9kNnj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (196, 'g9GJM7q0bguKMPEGZA8r', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (197, 'dVJ4TRhjDJFwcRtEVKQa', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (198, 'bYhIHl7CDIXxTZ7R0FbO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (199, 'VaVNNibhAynkK0fhPdwe', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (200, 'NoxWZJ2uMCHMZloAszSQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (201, 'RS8mrAjpaRiMU59XbHfU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (202, 'ymqYImT4OEzqOVcJo0hp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (203, '2nkpPhMnNeyLBw5FgLIS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (204, 'OAnqb2LHop1y59cHIMEQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (205, 'otFuLPsI1yTTnL9GwSDR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (206, 'vedcK4Tepa67ybKW3Kl6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (207, 'jkfRZs2USy8wvIEOqfJ3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (208, 'b6bcacnARxLqjt7hRT43', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (209, 'iU0NV2OtFDgyNBEtPtS7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (210, 'S1enKNLmkPsaAoLanefh', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (211, 'UHmtLWJSeZhCOwPJYC4Y', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (212, 'OMT8r0K7ytkoKAFrkrCO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (213, '9HysjKztuhjKXHqoyHGU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (214, 'uhWpCbR7suJANL9THZlj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (215, 'lwiyncGg1RtWmS2oaqfS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (216, 'gJXLFW0LuexcilDx7RBs', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (217, '3mUUwHkH6QVb2wjQv1pa', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (218, 'nXVGXhT13iP9rNmU3gWc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (219, 'jhIWx4v6JCZdwTJLLfLQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (220, 'o6PfF5jnVEEQbIV6eZYl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (221, '6x3r2z2h7tZ44xQcnxxc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (222, 'vvNZCMeHyUbyd8GTq8OV', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (223, 'ur7rgYHWFHAtipT3KIPk', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (224, 'RILtvMHGwXwlWSQdaB7v', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (225, '06n230LTUpltZiwt2agG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (226, 'URCDEU9pCJwSYNDUdVrX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (227, 'TLYqevGK8YCnqWulharE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (228, 'Hkih6e3w4HxKsCyT0pbI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (229, 't3tSjThXfCdbsgnExyEj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (230, '7wtejD5V7kOMgc7uI0iK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (231, 'zwAsIgk3RDG5xhsR3bKK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (232, 'ebFzROcPsX2pcuc1DTW6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (233, 'Wpszfksr8fG69pgjyffA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (234, 'LZpt9FW9ASItF07HoHGn', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (235, 'XVu1S7BaRRbZ8r8QXQ4y', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (236, 'T54KIt3WAB9mYDBFkwjJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (237, 'I0gfVu7JLG47M1FrB8gr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (238, 'FaySHR0nrsCSrcBvhBHp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (239, 'aIRNQA2nezM1Cl2kpjCf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (240, 'MA7KOqanzbMDSRH5R4YP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (241, 'WT3BRFKd4nOpfmknO17E', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (242, 'oigKgU1fBJ4WYpiAqEMy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (243, 'LkWKFfxDjBZ4wAzw6pup', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (244, 'UNR1JDii9ipOaqFXKxEX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (245, 'adXWjCbeMReAIZNVFLCR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (246, '5iX7WJe5BM1XPbRzervG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (247, '9E31zAl6dyFNPOuWH8Bx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (248, 'YE4ulYa9lkP02qXq4A9w', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (249, '3laZQO4p4pptbsh2E1T9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (250, 'r6Rcup6rq8UG2Bgx9zgh', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (251, 'ZcUSAZsqJdtDxnqSjyQs', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (252, 'sKMIJxXargW6E68jgPHB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (253, '4Fl38nJhFRYOkt3wrHfH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (254, 'rNQL6FSr52d3OJmBqMWe', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (255, '0ajIMRG4ixBcWDstOLtd', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (256, 'SKPegJNJmWw4fehHNMhI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (257, 'vLcUoynd5nlGO4cQLJe5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (258, 'ooJtHR2YBkXXC74Cw9Mb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (259, 'mWY8tA9G4bAqCuf1cIOo', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (260, 'RSD3G5PMk9RH7v0P5Q1x', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (261, 'CLYSBkCNVMJGM82qKpwK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (262, '2se9yH1AW3LxuVOV1qkT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (263, '7da1MF6ZVdWBNYDInwt7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (264, 'qwzPVN2j6pv4ve3sbmoT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 700 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (265, 'VX1oC7OrDsr8fkU0jjTI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (266, 'YmrBqsM19GBMCjdTiQac', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (267, '1crCqOgAC6brRGvBSFbg', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (268, 'XRyHNI9HG1w0Kbaq2b4F', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (269, 'Oy2DqjlXhUIIEngBI2SS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (270, 'Fiq8MzeQ8a6YJr3fTqFn', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (271, 'rJloo7UuZosQpWyCy2rZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (272, 'WiD3MngEsKs5F7VlLHnm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (273, 'V7s7IzeeUoQNWgjK7rwZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (274, 'zc0B3PC8DSxMUkCeQ3ht', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (275, 'dJ5uCDl3T152DypG0OYV', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (276, 'mJvKnZwKNYngx8pP62Av', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (277, 'JhVE4AjDNJv8jTvldrMk', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (278, 'cX8tO13wUqMif49TG8g0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (279, 'nS7jPXOjVx7VGvsDGvEO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (280, 'aBO9InchoCY8MyGkg532', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (281, 'PVRkW479zjmadMqaQGqi', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (282, 'BCxdVSpvdeOwZXQe4FBO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (283, 'DeIfY2YQihFEcxbHDvvB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (284, 'rTaF5gFCNlDgTnewyy5B', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (285, 'vBxFQx9Kn8FLSLLXJ9FI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (286, 'QSQNk9GOa7VhffLrFzPN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (287, 'PVgv2X98kNY1fZ1GmI7S', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (288, 'AppNt23oNk9uIRXk5BKH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (289, 'NALHQi8tDr6TeJTIz3ac', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (290, 'QM2hlqui52HJMmKjWzDC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (291, 'RCsBz4pb3KRVc1rNRm92', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (292, 'UpL4VVLvs1cPnF9nd7OT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (293, 'U3a7BjNfm0P82nQtD1hh', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (294, 'rjfnV8zCZ8HgWp4UqdRj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (295, 'jYXfNq2gx405v4ka3aRF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (296, '1d1NEeMKr2Z5td4oXBVH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (297, 'FEUGB1LRjJonqNioH7Wx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (298, 'GwbUJbYkTO2qLIVoJx3T', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (299, 'KZcvGFPWuUIgCWJTfklY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (300, '5RfOUsKyf25o03tPy8nU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (301, 'AnDvYcqOJozgPtQvjYYJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (302, 'zrH1BRn7f3KMyiGOB2Cl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (303, '6YL72nL3xpbsDPiCFxFK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (304, 'LdufCULGmIwfecjXoiFZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (305, '1aNxlVmZjMGvSdaFlF33', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (306, '0ZkNDubfhfTGabd4yTae', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (307, 'G1W7K9HjLXHWdmrc9M25', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (308, 'YrDddV3BPzGCCLxF8aIM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (309, 'D893stEXP2flojVsgNQW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (310, 'qepEGM5LMYmVoamtaxaO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (311, '791mc59OaoKzZs2GTtrH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (312, '6XVEnkLmT4eumgOIE04L', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (313, 'VKgXnYAJdgqL65d2gI8l', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (314, 'jwjWHSIJI2HQYhGvUnjR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (315, 'lpKUgPFg2WPxKjwHgk5R', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (316, 'aS1QULwWnB1xWKJmmDEL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (317, 'hSKBYObFRDiguBSeGfgM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (318, '0xQoaVdbpkMNYE4gaehu', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (319, 'r8B9js1bmDPfXw1cdKvA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (320, 'xoJWBSPTLdnoL2U5B5r1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (321, 'UDnHRdOPONwkDDQjyEoN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (322, 'O2bHB9LpWr2nUUTkVWAl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (323, 'CWPz8hcFgy89V4ckoxbP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (324, 'uze0j6Cp8P4wgsSp67nR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (325, 'UFRNcyxsQjTX0U1sQVob', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (326, 'R2EtUdcK5HFTgNvBIxsi', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (327, 'pJ5RyRfDeNRDFWKtcFWa', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (328, '7e902LTwBdOYbWMJSUOm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (329, '34phm5M4Uso8EwhpA0xv', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (330, 'ly0zlmg8hcg0XAWXMtps', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (331, '8xYVmlixAJqUahwxbeuh', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (332, '0gU42jN15LVr1m1GRCrI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (333, 'HQO0hSrV2nGavfCjwTs7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (334, '8dNCm6wrQRgqJkBIXjJn', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (335, 'TrLqfrD7Xva3Hk3OI0kx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (336, '1F6BFUkJ1DxdQ75aHWIj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (337, 'zUKTjttjA2r0KVLgItdD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (338, 'qBB7FPdMgKVvgLNG2jMt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (339, '4U960RWwvr1mYFygSGVP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (340, 'PPunYfFsMTYkE3Oxe8gy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (341, 'mQ8igc2gokz8RsPXJ2Fx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (342, 'YJHpAIWlU6howPDS8D1U', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (343, 'zVaR90ZX5SMFg1RnU3ru', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (344, 'iMqeT1k8ZtOzEt16HDqp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (345, 'iQtGwBNw5ueWPoZ9EdNi', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (346, 'm0z4gjKOrRVlQIjpWDtA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (347, 'MAOCfa8WgFd13sMfhfZy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (348, 's6wFz9Bwl2bzGcOnQnAd', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (349, 'hVB7ksdTpDZdpov5Htu2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (350, 'hwuXMr5CNu6VdksI7QXE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (351, 'vkNnQm6YSv239c5m2qpy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (352, 'pySYUDoVymEHQ0bhjrJ1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (353, 'FnFC11X4nPZJNmFD8jCg', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (354, 'd2jyfEBEnKDMkZMJBZqX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (355, 'e0MeT1n2TIFK1WoVZuei', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (356, 'v97ggGBX4awHF87MbasT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (357, 'typx4wkAAXdvmTDn20Mu', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (358, '3yF4hjQGdeOhQsCY2VpO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (359, '05bFfrgJeIJw02vMxo97', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (360, '1fA6qNMQ0DPKR0ToGVg8', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (361, 'C9LMIuj9ilYsCZaRggrA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (362, 'KfC5YBWhSX30ugU8Q2iQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (363, 'ACshwBU5LMzrSDiUDngr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (364, 'wXbq3iLSHDjQC39PFLlb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 800 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (365, 'caBKs7fXnJRD2VhY4aoW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (366, 'dWsdX1CvmCW3lKjcnSB1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (367, 'UYcHbDho6qqUwpBawiK0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (368, 'VS8ZuZmx0wWizJjczmYK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (369, 'RvMzjRLwEBZyIkGSbI4g', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (370, 'CLp4xs8kdSWa4wtUC8o3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (371, 'QzRHx9IMMPHCvazFR3Kh', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (372, '9NEq90MJZwZtnTiIahRD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (373, 'zWU1ulUA1J2NooAjWOmm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (374, 'LlCqh0HH5OWBk6eadg8y', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (375, 'AqGUML7JFW2yUJ9pV361', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (376, 'pT6F5rD9mV8KzL1bJAa9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (377, 'JvCRJEcARoCVEFaOorRy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (378, 'orUfcQz4Jsb4DKrNx3lU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (379, 'pTbH9eMuQAJFKFgYNtty', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (380, 'VCqxjlcymDCPoVgAosHx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (381, 'x5G0pEohz5TUMmVb66Qt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (382, '0Bm0efOJI9nG4tFx1oqt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (383, 'yyUPKZbyeEmHfmLO53MW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (384, 'dl9hUqLPXtKNFuPlMFpS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (385, 'xMYYGYOYvBqnuug91keY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (386, 'gyDVXD5nS2C2CXQjI8iN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (387, 'xNztOhKI44Khzi05gaBa', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (388, 'JByOeZoaNHZacG7t5uPk', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (389, 'hh5Pup3rhQc0J1ofaiFr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (390, 'HDuLJS26QyLMi8Yvq97X', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (391, 'Iuo9bsQ1W8Ujys6xKQd8', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (392, 'gukrKMOJKsSPwVfWgnzU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (393, '1ylitsRTuIQlHoiHoV47', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (394, 'jGrgdX880uSFUG0EGbeE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (395, 'S9vkzW9gmBoileVNAEY3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (396, 'O2GSzWk5LXzN6P1m75AN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (397, 'KU99xdxJQfl4Ibx5PuL5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (398, 'hwBJ5l6mAGfb17FlJBKK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (399, 'jatJ49Gn8w71cnQf9RTD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (400, 'jeBEgAvcoqGAbrGzo0dJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (401, 'KyVu5Lx5sAHssIN8kKlk', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (402, 'LtQiJsdRZd0M7DytHi4q', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (403, 'CVkhf1k7MbwWzNBMHX7i', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (404, '8j6owhiNqFjQTxzuSwJb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (405, 'wcaKTIv7WZG8bcXR1hNp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (406, 'IbTUjjZ2rFArgQg8fRj4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (407, 'v9CX33WWlJCgBBGNhw87', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (408, '6MVJMwRZ9smeurMYBHbK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (409, 'mWo4DuKEIJKxCIyJcxwe', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (410, 'VRElgIvYXremadpLflxI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (411, '0mp2bH5KyaKDDLXzLVS1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (412, 'yplQClYPXT45P8hhcR9D', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (413, 'aDN1Ixh5hjQPNpREwSlu', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (414, '3ZvfsvO0MYSKSQO0a46c', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (415, 'DgCHrFLpljkRbskiAEzN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (416, 'C2KpfTbo5AOVjaLpH2W0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (417, 'iQLWUGCtCaZsT6CaSxkW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (418, 'e8C98lDrxvPglMNvjRLZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (419, 'dz7YIkmojf3tUcfrSX0f', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (420, 'aZS2VjXJnKpu8FNuzcqY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (421, '2FMyIlIeUtU8XSqwN5Cs', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (422, 'wVJ6TI94802d34ObfvHl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (423, 'Z8ypIqBLUzX7XQXuPhrD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (424, 'DF8h3owbBzd3Tr2LAyWN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (425, '2Fw5XUpHH094ddKr2Hhb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (426, 'XzM1Y5gpnE3oB3ct6ILI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (427, 'zk9nFJ2q0PVFEkaDqkSZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (428, 'uOa4jyhxX3A1zPvX0BMy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (429, 'wJjYMHTNB2hDc4b2iM6K', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (430, 'vBo0xxE2wVnlxC7jzUdh', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (431, 'Eag8mj4dO10tVD6O1Kff', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (432, 'Bf1yQSwSY2hVbldzYUzi', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (433, 'iL5uFFAvHHCggRetfJxl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (434, 'xY7OX5Xnu1zlFtrh1GJY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (435, 'dxOuWutZdkk5Zcq3wmD2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (436, 'AVvSAutv9r0OCKcWURgj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (437, 'yekFfFEr5i4UbM7S7ul9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (438, 'psRAd4vF2hgY4RMTrAdL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (439, 'HVxYOrqtZp7Ab6B82c9K', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (440, 'M9U31OwiFWCn4njpXua3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (441, '5YhTAetUCvs24h2rteGC', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (442, 'sovfEkBj4Oy8aeIf6Kky', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (443, 'oFMxR8BQalJK2aKjMoA1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (444, 'XV50kRnIJRCppyIquwL8', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (445, 'LNZz3LJ1uV7UwzWotBTA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (446, 'UpIU2hs1JuEMyCUsbjsr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (447, 'fZWoXb3XT0UUmc13VYHA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (448, 'LWX33Z7uIaJv7WiboUL5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (449, 'QSDJtNMTUYGKWnf9w87k', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (450, 'jF6WXfv3CunCTJ4cF6lb', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (451, 'btWeRjvisUr3hUV3lPcW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (452, 'Uj19U7EV1nI6qOkfkZGE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (453, 'aB8YEA4GuV5niOOzyxo3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (454, '0UdJchnZlgKFgX48qxmD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (455, 'BUI7nJM13Dn4s4PRcbWw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (456, 'DjIANrLGB1nZXJjZSVke', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (457, '3raUdc0qSHTXd9IwupEm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (458, 'LNDCZ1raU0Bi8mRqS3kl', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (459, 'Ke5u4LwqIJKJoT06Q7sA', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (460, 'dh4KiIVNOHVfLrTcmmHX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (461, 'y50lwqSD0LAolrSQt0k3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (462, 'G6q4G709AEWD3v3q35ed', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (463, '2YSaOM8XNCcrNdfrWqpE', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (464, 'Av4kfpiQWfEvqKb5fAZL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 900 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (465, 'LIEOWmZxAMggeHF7r3ur', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (466, 'vOv1g8Ef7HBtv7m609Wf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (467, 'AyUymopdZbNy4i2QUGfd', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (468, 'qmfHBiEwOtvY05hUudSf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (469, 'q4pUKo5jP1i9P4L3Tnib', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (470, 'qTI7YrAWDBGJ13NNB9eB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (471, '6lU42CLGEdPkSyuZBPlz', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (472, 'Ex9bk0ttAvGMomGobmoj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (473, 'q5i1M4WFhQ8Ku0obMw4V', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (474, 'LJs6suZMb8JKMuiTXCtN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (475, '3v1Rbd32lOtiQzoG9Iaj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (476, 'VSp3jvxHwUepwcbfLR8O', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (477, 'vrweHqDUXOwSiDLbsiss', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (478, 'Pr2aCn9o8eomTyPeFODt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (479, 'mCjwfF0CXavqyE2dvyxB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (480, 'qj6ASk3SqyJrwS8NF2K0', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (481, 'jiWNrvO2UyngKVkb6S7F', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (482, '0posfxRyIMu6zDfOgAm9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (483, 'BB37dFjZWKSaYWU5fbox', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (484, 'QHjdY06bBXPz953xfXCH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (485, 'TH1okTGEY6CT37CtEP8a', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (486, 'ZtQztDvM1P2noii04Plo', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (487, 'ybHv1Np28lGxVnlUJoeR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (488, 'yl1ca77ZKBiHhViFzVlN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (489, 'ohU5A2gP2rEqF5viRE79', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (490, 'ezHnbcI7xv0Y4t5abu6x', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (491, 'SVv1ukT628EGvlfi8ONJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (492, 'vpQYGxgPQPENDZCodkur', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (493, 'zyVhkeN77RPYu1rs3WzH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (494, 'JT0Q7AZyHbGU0C1mWjRw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (495, 'a8ctJmFZL2TJGq7NAD60', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (496, 'rRcPc805KIpPp8mRTJXp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (497, 'zjPjDMNL43WHibIDjRyt', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (498, 'yNZF5h7ZSe7lUn6Pij39', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (499, 'C5TEXJs92RrenddH68HO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (500, 'QDV3IxAtV676x5u1LLyw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (501, 'OO9mwZYhNHR9NAY6izG6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (502, '0iO9bxlRR6ZSjauUX0lV', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (503, 'hudu1jRZvaNpSi7MdsLy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (504, 'sXZVf8CT0scTbpwbUGzu', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (505, 'cx3wcghBBIgrNXzIZbCD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (506, 'Ct6f0w40VCytK7hD4RHf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (507, 'YhAmH2qujHGOOW1cLJW2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (508, 'hZTMyTnAOvnz82W6nfL1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (509, 'Wl32szajTMzJHAW0IRpN', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (510, 'fz82UzQ80M02z4cDHEXH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (511, 'dVa7UmoefaAm01uIpigw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (512, 'cZVE1sSSA0GFE4XRja3R', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (513, 'qs6T5fzpTSIiHsiTi26a', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (514, 'KVaWfmRMX6HrQymQIpoL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (515, 'Uu3jpMujG4FtdIFJGHyy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (516, '2ZmZYs4Whrm0WpcPOJgQ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (517, 'IIc40HbUYxBnwB4mdYDV', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (518, 'rzBrrcwiykqaJFuLnpHz', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (519, 'q3lqGGQM5iaEae7tX6Bo', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (520, 'C629n9jykA0DdJ9ISNtm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (521, 'aLWO4kOdzFEvUP0CA0Lq', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (522, 'AoLyMtas7ntD42LU2vQm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (523, '34ivUJ2dWzzRDmmQBrTM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (524, 'vxKL6n2nCpc5APZuMFon', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (525, 'F3E14tLggBion7j8WJEM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (526, '8NjSWPfqx7SZf9MtgYix', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (527, 'aboedeW3c8NqKcezbzto', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (528, 'ZKeYyZOxkYHDQnXEwbBk', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (529, 'l4IpFKdbkq7IwKdhVeaK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (530, '5omJwU2AAzEQpY5oViDr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (531, 'j6a5FIVfpuqbZNu2MKcG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (532, 'bi82QilhK5ZMe2xho1hR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (533, 'g4pfFwA9sHPdhS05Nqzx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (534, '2t7d6WyEEydpQkzNclPp', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (535, 'rC0KxCRfrdrZ7UXsPVSJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (536, '2O4mywjjY6ROH6ANDWCK', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (537, 'FuIl4R5Pq03JgLNRBmeG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (538, 'WSXArCdO6hq4nxIF5rp6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (539, 'Ri5qFayjJ6E9KsFXBQ2q', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (540, 'JLv5VZGmv8lNQkWp6GNJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (541, 'bmdfusTiSQM5gL2ajcXm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (542, 'Mkv9LP1cyIUDKEQojEc3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (543, 'BAQWPE8dzcgQiWqNV6Jg', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (544, 'M9skTCc5shMXvBLJetcY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (545, '7VzD4xzEbnCqKiZcgvog', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (546, 'cEkEknbeyfthE5kHuRRB', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (547, 'CupcBwpJgLpxJiqwsU7o', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (548, 'ODPFcECDE4Y5rFGPK6ZW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (549, 'cGoaGiYJVXcJ4QlzZvSM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (550, 'ScuI4mWaimbgNwBQLQAG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (551, 'ZvF0CXifPWUyjgVBtsrM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (552, 'sgBBlRauz8lmDixlJCz4', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (553, 'fy2HCD6h1SBLyuhpI54i', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (554, 'jgBlK04Bgs8ZSUKcfFN6', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (555, 'zYLraKIeLEFQvF36wNwF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (556, 'dg0Aby6u7QO7pvDgxMp2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (557, 'vbK61pMpZBqGkMbFf9qw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (558, 'JniZ8LV0unJEBQCibxWn', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (559, 'MsIBhHsLhjTaMb4zqk8e', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (560, 'abQTM1XecdqBY8ThrGG3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (561, 'abilRZYgjTeeYLiKJOWL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (562, 'ogji2eMAiaO4mWBhNwNJ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (563, 'DpjEcb6zrkJ0g6ad8d3h', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (564, 'ilmFicsDDY0YY9Slc4fz', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
commit;
prompt 1000 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (565, 'NRcH5T6m103OV5WjMqSw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (566, 'TypuhEGYQnSeINQxm8J1', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (567, 'nUuTpnBK9n6rdGxfp3fr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (568, '0G7fhI4W6dz3TM4IgObP', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (569, 'lS6IJlHKKRi9Xtyk8CBX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (570, 'Ii3eB1eSvwKNWyKIQFZw', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (571, 'D7ogXxPYvTQm98i11vYh', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (572, 'FMOyauy5nIG3MoJhcEoM', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (573, 'My9PRCfnGjW772sQy2SZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (574, 'zDamP6LG08EYDKh9leIx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (575, 'FpJY7vpp0ZAZwqA6AEOI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (576, 'mZRQBgfIGTq19jkGv0SY', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (577, 'RMNVyv2MT3v3Wfex4B5Q', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (578, 'kB30T1DsjWkBHSbtLJdT', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (579, 'jhmQnBlol0dDcmf4FHKX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (580, 'dLdSOexvTIDn7msgtyEr', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1024, 'mUKC6197UUzgJ5GCr36I', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1025, '8tJ1mahpSBurEnngz7Gs', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1026, '5LtQzsyrHUpUUXcMukbh', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1027, 'YXg1YG4YyEEp3kPkPlx7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1028, '2skmDkZe1xqPKFGeHH24', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1029, 'cyU0vO6S8kI5xCSlriI3', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1030, 'LOJGqCEZsPJ072v9IrCZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1031, 'RKGcvp4s2WoRY6slc2BZ', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1032, 'znBOio4cZcRQozkVjERx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1033, '7mlJYlbXQY7fY23xUhGD', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1034, 'SyuukbcZffG0JfzU87oI', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1035, 'HA4kilgHB3atQlcuU3U9', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1036, 'MUouXRNGNiMwv7Z7TIji', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1037, 'nuel8J3hKvbTZPTrKMvm', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1038, 'epdQwHrvM6xIYi8RlLeo', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1039, 'rPWoWJdzCLEQ6V5OhzzO', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1040, 'cYwxSOecjQzXNLSeWZBW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1041, 'uXSJA0YuVUfjQ62BxVwG', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1042, 'EVG5xLfcsY0Mbc608ySX', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1043, 'gGfeoHATqB7tUBy7tmMx', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1044, 'ol7rT7BptADuuQz9Ftzj', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1045, 'DqXMP6TZRYvPhzLC52zy', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1046, 'qYOL13kiGB0YCMPp926p', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1047, 'plEBkuiD5ShdoC9V6p2w', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1048, 'R0FhExN5PU2HBKMptZ8h', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1049, 'PfuLUUaj64MRpu2ovZkh', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1050, 'kg5KXbEUMQGabbIEbgs7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1051, '3yZz1wK0TG6DWEcN2Yqz', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1052, '23oXdAoDt0N6iQ1weY5K', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1053, 'pORlNaXXC8qbJR9HaAeR', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1054, '5y7b7flY0eThS89fGQzf', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1055, 'ToFNqcHIc5lfzsaW3UpF', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1056, 'H3IQ3Us2rnEF7v6gmT6q', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1057, 'aiEMhD9HLUswWNuOCRKi', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1058, 'n7FQHNYlPPO587nlPwIU', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1059, 'My3Dt7NaSAzDz1MJKSIL', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1060, '1rNGx7MK3cMCJCmmrKsS', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1061, 'VjgH6IebIF0kMzqKoUa2', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1062, 'fjdiyx1yDN0gfh8PUxVW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1063, 'fVIuZS6eLKBz4aGh10Ui', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1064, 'I4WcTEYnmZzdq2UPQtiH', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1065, 'CtuI1Nu9bBXFisbVRq3C', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1066, 'P9L95P4tb0RWUR6iiao7', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1067, 'fLIFw6YCZJGf7tpMh5RW', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1068, 'U8SUhp5OepMqz58ZKWHc', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1069, '9pYDd4uhcZJjDS4DwmG5', null, null, 1, to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('10-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 40, 2, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1070, '0AiHwxxd557', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1071, 'x8kcH6ejhyP', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1072, 'N1tGdqdeJnA', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1073, 'DEoOu2mivtK', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1074, 'qi0ezdTo0hf', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1075, '5DyUyvQD4mo', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1076, 'EfoTb0l4w7Q', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1077, 'pHwyEwitieT', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1078, '1SIUFg2zYFH', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1079, 'ZcGSTI3HdV1', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 41, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1095, 'GoCOMMANDO', null, null, 1, null, null, null, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 44, 0, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1090, 'SXVywZF0', null, null, 1, to_timestamp('19-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('19-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 50, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1091, '2JWSNgSI', null, null, 1, to_timestamp('19-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('19-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 50, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1092, 'T6I7KODw', null, null, 1, to_timestamp('19-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('19-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 50, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1080, 'TSbu6Fz2s919', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1081, 'TShMKT80A019', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1082, 'TScqXjNPmR19', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1083, 'TSC5Yx3EWT19', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1084, 'TStaSnz6Wc19', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1085, 'TS7XOFXS1219', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1086, 'TS9AdDeU1I19', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1087, 'TSKXkk1lxF19', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1088, 'TS4evc6aDN19', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1089, 'TSthLvhCFi19', null, null, 1, to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('13-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-09-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 45, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1096, 'te', 'h1', 'u2', 4, null, null, null, null, 52, 0, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1097, 'te2', 'h1', 'u1', 2, null, null, null, null, 52, 0, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1093, '97fbw2ME', null, null, 1, null, null, null, null, 51, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1094, 'HsQSocpg', null, null, 1, null, null, null, null, 51, 1, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1112, 'te23', 'hold', 'u1', 1, null, null, null, null, 52, 0, 1, 0);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1120, 'txNteIPQ', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1121, '43SNSovb', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1122, 'Y1SKKRaK', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1123, '0V05oJAY', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1124, 'nuwPArbV', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1125, 'ZNb3Y5nu', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1126, '4lZxvtut', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1127, 'DzpmkSKM', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1128, 'X3UFEjmT', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
commit;
prompt 1100 records committed...
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1129, 'HblQMFRx', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1130, 'fTdo8gG7', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1131, 'ba3H4ODP', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1132, 'gO2ztezZ', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1133, 'NNE9HzBf', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1134, 'YkXgqrle', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1135, 'pcGBw8I1', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1136, 'uqhQTFAk', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1137, 'kdKzJqN2', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1138, 'JOtrFj9k', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1139, 'UnTkzrDY', null, null, 1, to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-05-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-07-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 70, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1141, 'U9wRt9sZ', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1142, 'wU6kzUdJ', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1143, 'aNKOAA0e', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1144, 'OMw4f3yp', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1145, 'oQXPNMok', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1146, 'E1u5nQvq', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1147, '9dBfwOb4', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1148, 'krw59aiW', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1149, 'EBzy8kCY', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
insert into COUPON (id, code, holder, user, status, aquire_from, aquire_to, award_from, award_to, promotion_id, coupon_series, max_redeem_no, enabled)
values (1150, '2j9MFWMF', null, null, 1, to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-06-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-08-2020 00:00:00.0000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 80, 1, 1, 1);
commit;
prompt 1121 records loaded
prompt Loading COUPON_AWARD_CHANNEL...
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (6, 1);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (7, 5);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (13, 1);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (15, 5);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (20, 3);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (21, 3);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (22, 5);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (38, 1);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (43, 1);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (44, 1);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (45, 3);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (46, 3);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (47, 4);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (48, 4);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (49, 5);
insert into COUPON_AWARD_CHANNEL (coupon_id, award_channel_id)
values (50, 5);
commit;
prompt 16 records loaded
prompt Loading COUPON_HISTORY...
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (1, to_timestamp('11-05-2020 08:35:48.4908518', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Disable', 1, 26, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (83, to_timestamp('26-05-2020 10:50:13.8829520', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Assign', 2, 1101, '38640440442');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (82, to_timestamp('25-05-2020 16:33:31.0487735', 'dd-mm-yyyy hh24:mi:ss.ff'), 'UpdateStatus', 2, 25, 'Issued');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (2, to_timestamp('11-05-2020 12:06:28.3430100', 'dd-mm-yyyy hh24:mi:ss.ff'), 'UpdateStatus', 3, 27, 'Redeemed');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (3, to_timestamp('11-05-2020 12:06:50.7607720', 'dd-mm-yyyy hh24:mi:ss.ff'), 'UpdateStatus', 2, 27, 'Issued');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (4, to_timestamp('11-05-2020 12:07:43.1620012', 'dd-mm-yyyy hh24:mi:ss.ff'), 'UpdateStatus', 3, 27, 'Redeemed');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (5, to_timestamp('11-05-2020 12:07:56.6190835', 'dd-mm-yyyy hh24:mi:ss.ff'), 'UpdateStatus', 4, 27, 'Canceled');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (81, to_timestamp('25-05-2020 16:31:54.7097724', 'dd-mm-yyyy hh24:mi:ss.ff'), 'UpdateStatus', 2, 36, 'Issued');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (41, to_timestamp('15-05-2020 16:47:38.4345929', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 36, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (42, to_timestamp('15-05-2020 16:47:38.5155653', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 37, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (43, to_timestamp('15-05-2020 17:04:17.3697160', 'dd-mm-yyyy hh24:mi:ss.ff'), 'UpdateStatus', 2, 37, 'Issued');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (6, to_timestamp('11-05-2020 15:17:51.7701200', 'dd-mm-yyyy hh24:mi:ss.ff'), 'AssignUser', 1, 66, '38640440448');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (7, to_timestamp('11-05-2020 15:17:51.7707676', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 66, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (8, to_timestamp('11-05-2020 15:17:51.8321063', 'dd-mm-yyyy hh24:mi:ss.ff'), 'AssignUser', 1, 67, '38640440448');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (9, to_timestamp('11-05-2020 15:17:51.8322999', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 67, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (10, to_timestamp('11-05-2020 15:17:51.8418384', 'dd-mm-yyyy hh24:mi:ss.ff'), 'AssignUser', 1, 68, '38640440448');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (11, to_timestamp('11-05-2020 15:17:51.8422766', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 68, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (12, to_timestamp('11-05-2020 15:17:51.8509037', 'dd-mm-yyyy hh24:mi:ss.ff'), 'AssignUser', 1, 69, '38640440448');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (13, to_timestamp('11-05-2020 15:17:51.8510934', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 69, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (14, to_timestamp('11-05-2020 15:17:51.8609564', 'dd-mm-yyyy hh24:mi:ss.ff'), 'AssignUser', 1, 70, '38640440448');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (15, to_timestamp('11-05-2020 15:17:51.8611549', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 70, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (16, to_timestamp('11-05-2020 15:17:51.8695878', 'dd-mm-yyyy hh24:mi:ss.ff'), 'AssignUser', 1, 71, '38640440448');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (17, to_timestamp('11-05-2020 15:17:51.8697790', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 71, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (18, to_timestamp('11-05-2020 15:19:33.6905376', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 115, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (19, to_timestamp('11-05-2020 15:19:33.6980214', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 116, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (20, to_timestamp('11-05-2020 15:19:33.7045006', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 117, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (21, to_timestamp('11-05-2020 15:19:33.7116146', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Enable', 1, 118, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (61, to_timestamp('19-05-2020 16:30:03.1076234', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Assign', 2, 1096, 'u2');
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (62, to_timestamp('19-05-2020 16:30:23.2255545', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Cancel', 4, 1096, null);
insert into COUPON_HISTORY (id, date, action, status, coupon_id, user)
values (63, to_timestamp('19-05-2020 16:37:20.7538733', 'dd-mm-yyyy hh24:mi:ss.ff'), 'Assign', 2, 1097, 'u1');
commit;
prompt 30 records loaded
prompt Loading ISSUER_CHANNEL...
insert into ISSUER_CHANNEL (id, name)
values (1, 'POS');
insert into ISSUER_CHANNEL (id, name)
values (2, 'Salesforce');
insert into ISSUER_CHANNEL (id, name)
values (3, 'SelfCare');
insert into ISSUER_CHANNEL (id, name)
values (4, 'Telesales');
insert into ISSUER_CHANNEL (id, name)
values (5, 'Webshop');
commit;
prompt 5 records loaded
prompt Loading COUPON_ISSUER_CHANNEL...
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (2, 1);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (3, 1);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (4, 1);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (5, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (6, 1);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (7, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (8, 4);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (9, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (10, 2);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (11, 1);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (12, 3);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (13, 1);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (15, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (17, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (18, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (19, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (20, 3);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (21, 3);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (22, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (38, 1);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (43, 1);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (44, 1);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (45, 3);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (46, 3);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (47, 4);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (48, 4);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (49, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (50, 5);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (51, 2);
insert into COUPON_ISSUER_CHANNEL (coupon_id, issuer_channel_id)
values (52, 2);
commit;
prompt 30 records loaded
prompt Loading SYSTEM...
insert into SYSTEM (id, name, username, password)
values (1, 'CRM', 'max', 'test');
insert into SYSTEM (id, name, username, password)
values (2, 'SalesForce', 'sf', 'test');
commit;
prompt 2 records loaded
prompt Loading NOTIFY_LIST...
insert into NOTIFY_LIST (channel_id, system_id, url)
values (1, 1, 'http://MAX/Notify');
commit;
prompt 1 records loaded
prompt Loading PROMOTION_AWARD_CHANNEL...
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (1, 1);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (1, 3);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (1, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (2, 3);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (2, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (2, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (3, 1);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (3, 3);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (3, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (7, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (7, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (11, 1);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (32, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (34, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (40, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (40, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (42, 1);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (42, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (42, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (43, 1);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (43, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (43, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (45, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (50, 3);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (50, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (51, 3);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (51, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (70, 1);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (70, 3);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (70, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (70, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (80, 1);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (80, 3);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (80, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (80, 5);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (81, 1);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (82, 1);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (82, 4);
insert into PROMOTION_AWARD_CHANNEL (promotion_id, award_channel_id)
values (82, 5);
commit;
prompt 39 records loaded
prompt Loading PROMOTION_ISSUER_CHANNEL...
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (1, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (1, 2);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (1, 5);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (2, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (2, 4);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (2, 5);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (3, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (3, 4);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (3, 5);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (7, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (7, 2);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (7, 4);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (11, 2);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (32, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (34, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (40, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (41, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (42, 2);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (43, 2);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (50, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (50, 2);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (51, 1);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (51, 2);
insert into PROMOTION_ISSUER_CHANNEL (promotion_id, issuer_channel_id)
values (81, 2);
commit;
prompt 24 records loaded
prompt Loading PROPERTY...
insert into PROPERTY (id, name)
values (1, 'UniqueCoupons');
insert into PROPERTY (id, name)
values (2, 'NamedHolders');
insert into PROPERTY (id, name)
values (3, 'NamedConsumers');
insert into PROPERTY (id, name)
values (4, 'HolderIsOnlyConsumer');
insert into PROPERTY (id, name)
values (5, 'AllowMultipleRedeems');
insert into PROPERTY (id, name)
values (6, 'AllowCouponSeries');
commit;
prompt 6 records loaded
prompt Loading PROMOTION_PROPERTY...
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (1, 2);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (1, 4);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (2, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (2, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (3, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (5, 4);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (7, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (7, 2);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (7, 3);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (7, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (11, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (14, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (23, 5);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (23, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (32, 5);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (32, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (34, 5);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (34, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (40, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (41, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (41, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (42, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (42, 3);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (42, 4);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (43, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (43, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (45, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (45, 2);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (45, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (50, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (50, 5);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (50, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (51, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (51, 3);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (51, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (70, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (70, 2);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (70, 6);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (80, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (80, 2);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (81, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (81, 2);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (82, 1);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (82, 2);
insert into PROMOTION_PROPERTY (promotion_id, property_id)
values (82, 4);
commit;
prompt 45 records loaded
prompt Loading USER...
