using Newtonsoft.Json;
using System;

namespace WebApp.ViewModels
{
    public class ErrorViewModel : ContextData
    {
        public string RequestId { get; set; }
        public string Message { get; set; }
        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);
        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
        public ErrorViewModel() : base() { }
        public ErrorViewModel(string username, string group) : base(username, group)
        {
        }
    }
}