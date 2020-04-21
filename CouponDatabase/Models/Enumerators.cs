﻿using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace CouponDatabase.Lifecycle
{
    [DataContract(Name = "CouponStatus", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public enum CouponStatus
    {
        [EnumMemberAttribute]
        Created = 1,
        [EnumMemberAttribute]
        Issued = 2,
        [EnumMemberAttribute]
        Redeemed = 3,
        [EnumMemberAttribute]
        Canceled = 4
    }
    [DataContract(Name = "CommandStatus", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public enum CommandStatus
    {
        [EnumMemberAttribute]
        Valid = 0,
        [EnumMemberAttribute]
        ErrorInvalidStatus = 1,
        [EnumMemberAttribute]
        ErrorPromotionNotFound = 2,
        [EnumMemberAttribute]
        ErrorCouponNotFound = 3,
        [EnumMemberAttribute]
        ErrorInvalidUser = 4,
        [EnumMemberAttribute]
        ErrorSystem = 99
    }

    public enum IssuerChannelEnum
    {
        POS = 1,
        Salesforce = 2,
        SelfCare = 3,
        Telesales = 4,
        Webshop = 5
    }
    public enum AwardChannelEnum
    {
        POS = 1,
        SelfCare = 3,
        Telesales = 4,
        Webshop = 5
    }

    public enum PropertyTypeEnum
    {
        UniqueCoupons = 1,
        NamedHolders = 2,
        NamedConsumers = 3,
        HolderIsOnlyConsumer = 4,
        AllowMultipleRedeems = 5,
        AllowCouponSeries = 6
    }
}
