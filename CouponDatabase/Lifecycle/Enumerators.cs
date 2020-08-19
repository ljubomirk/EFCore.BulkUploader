using System;
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
        ErrorInvalidCustomer = 5,
        [EnumMemberAttribute]
        ErrorInvalidRedeemDate = 6,
        [EnumMemberAttribute]
        DataError_CouponInsertFailed = 7,
        [EnumMemberAttribute]
        DataError_PromotionInsertFailed = 8,
        [EnumMemberAttribute]
        DataError_PromotionUpdateFailed = 9,
        [EnumMemberAttribute]
        DataError_CouponUpdateFailed = 10,
        [EnumMemberAttribute]
        ErrorSelectOneCheckbox = 11,
        [EnumMemberAttribute]
        Error_DuplicateCouponExists = 12,
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
        NamedHolders = 3,
        HoldersOnlyConsumer = 4,
        AllowMultipleRedeems = 5,
        AllowCouponSeries = 6
    }

    public enum CouponEnableEnum
    {
        No = 0,
        Yes = 1
    }
    public enum CouponCreationEnum : int
    {
        [EnumMemberAttribute]
        Generate = 1,
        [EnumMemberAttribute]
        Import = 2
    }
}
