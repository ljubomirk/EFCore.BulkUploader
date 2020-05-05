using System;

namespace WebApp.ViewModels
{
    public class ErrorViewModel : ContextData
    {
        public string RequestId { get; set; }
        public string Message { get; set; }
        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);
    }
}