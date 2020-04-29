select * from dbo.Promotion;

select * from dbo.Promotion where enabled = 1 and code like '%summ%';


select * from dbo.PromotionProperty;


select * from dbo.Coupon;



-- PROMOTIONS
select * from dbo.Promotion
where 
enabled = 0;


-- UPDATES
-- update dbo.Promotion set Enabled = 1 where Id = 2;
/*
update dbo.Coupon set 
AquireFrom = '2020-04-01 00:00:00.0000000',
AquireTo = '2020-06-01 00:00:00.0000000',
AwardFrom = '2020-04-01 00:00:00.0000000',
AwardTo = '2020-06-01 00:00:00.0000000'
where promotionid = 1;*/

/*
update dbo.Coupon set 
status = 1 where PromotionId = 2 and Status = 4;
*/


/*
update dbo.Promotion
set 
ValidFrom = '2020-04-01 00:00:00.0000000', ValidTo = '2020-06-01 00:00:00.0000000'
where Id = 1;
*/

-- INSERTS 
/*

insert into 
dbo.Coupon(Code, Holder, "User", "Status", , AquireTo, AwardFrom, AwardTo, PromotionId, CouponSeries) 
values('SP0987654321', '38640440481', '38640440481', 2, '0001-01-01 00:00:00.0000000', '0001-01-01 00:00:00.0000000', '0001-01-01 00:00:00.0000000', '0001-01-01 00:00:00.0000000', 1, 1);


*/

-- DROP ORDER
/*
drop table CouponHistory;
drop table PromotionProperty;
drop table Property;
drop table PromotionIssuerChannel;
drop table PromotionAwardChannel;
drop table CouponIssuerChannel;
drop table CouponAwardChannel;
drop table Coupon;
drop table IssuerChannel;
drop table AwardChannel;
drop table Promotion;
*/


/*
drop database "aspnet-commando";
*/