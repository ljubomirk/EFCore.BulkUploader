using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace CouponDatabase.Lifecycle
{
    [DataContract(Name = "CouponStatus", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public enum CouponStatus
    {
        Created = 1,
        Issued = 2,
        Redeemed = 3,
        Canceled = 4
    }
    [DataContract(Name = "CommandStatus", Namespace = "http://www.triple-innovations.com/WS/COMMANDO/Types/")]
    public enum CommandStatus
    {
        Valid = 0,
        ErrorInvalidStatus = 1,
        ErrorPromotionNotFound = 2,
        ErrorCouponNotFound = 3,
        ErrorInvalidUser = 4,
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
        AlloweMultipleRedeems = 5,
        AllowCouponSeries = 6
    }
}
