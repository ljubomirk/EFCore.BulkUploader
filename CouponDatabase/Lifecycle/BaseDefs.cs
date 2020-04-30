using System;
using System.Collections.Generic;
using System.Text;

namespace CouponDatabase.Lifecycle
{
    public abstract class BaseDefs
    {
        // Use ChannelEnum for mapping
        public long Id { get; set; }
        public string Name { get; set; }
        public static List<C> ArrayFrom<C, T>() where T : Enum where C : BaseDefs, new()
        {
            List<C> defs = new List<C>();
            foreach (int id in (IList<int>)Enum.GetValues(typeof(T)))
            {
                defs.Add(new C()
                {
                    Id = id,
                    Name = Enum.ToObject(typeof(T), id).ToString()
                });
            }
            return defs;
        }

    }
}
