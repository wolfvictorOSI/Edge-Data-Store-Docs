---
uid: visualizationQuickStart
---

# Edge Data Store visualization quick start

This document is a quick tour of getting data from the Edge Data Store Storage component and displaying it on the screen of the device where the Edge Data Store is installed. This example is intended for simplicity rather than thoroughness, and should run on any device that is supported by Edge Data Store. This example will iterate through all streams in the default namespace on the Edge Data Store and continously display the latest values to the screen. This example assumes the Edge Data Store was installed with the default port (5590).

```csharp
using System;
using System.Collections.Generic;
using System.Net.Http;
using Newtonsoft.Json;

namespace EdgeDataScroller
{
    class EdgeStream
    {
        public string Id { get; set; }
    }
    class DataScroller
    {
        static HttpClient _client = new HttpClient();

        private static Dictionary<string, Dictionary<string, object>> GetDataForNamespace(string ns)
        {
            Dictionary<string, Dictionary<string, object>> outputs = new Dictionary<string, Dictionary<string, object>>();
            string uri = string.Format("http://localhost:5590/api/v1/tenants/default/namespaces/{0}/streams", ns);
            string json = _client.GetStringAsync(uri).Result;
            List<EdgeStream> streams = JsonConvert.DeserializeObject<List<EdgeStream>>(json);
            foreach (var stream in streams)
            {
                string lastValueUri = string.Format("http://localhost:5590/api/v1/tenants/default/namespaces/{0}/streams/{1}/Data/Last", ns, stream.Id.Trim());
                string lastValueJson = _client.GetStringAsync(lastValueUri).Result;
                Dictionary<string, object> values = JsonConvert.DeserializeObject<Dictionary<string, object>>(lastValueJson);
                outputs.Add(stream.Id.Trim(), values);
            }
            return outputs;
        }

        static void DisplayData(List<string> namespaces, TimeSpan interval)
        {
            Dictionary<string, Dictionary<string, Dictionary<string, object>>> outputs = new Dictionary<string, Dictionary<string, Dictionary<string, object>>>();
            Console.WriteLine("Data Displayed at " + DateTime.UtcNow.ToString("o"));
            foreach (string ns in namespaces)
            {
                outputs.Add(ns, GetDataForNamespace(ns));
            }
            foreach (string ns in outputs.Keys)
            {
                foreach (string stream in outputs[ns].Keys)
                {
                    if (null == outputs[ns][stream])
                    {
                        Console.WriteLine("No values for " + stream);
                        continue;
                    }
                    foreach (string field in outputs[ns][stream].Keys)
                    {
                        object obj = outputs[ns][stream][field];
                        string value = obj.ToString();
                        if (obj is DateTime)
                        {
                            value = ((DateTime)obj).ToString("o");
                        }
                        Console.WriteLine($"{ns}.{stream}.{field} = {value}");
                    }
                }
                Console.WriteLine("****");
            }
            Console.WriteLine(string.Empty);
            System.Threading.Thread.Sleep(interval);
        }

        static void Main(string[] args)
        {
            List<string> namespaces = new List<string>();
            namespaces.Add("default");
            TimeSpan interval = TimeSpan.FromSeconds(5.0);
            if (null != args && args.Length > 0)
            {
                string choice = args[0].Trim().ToLowerInvariant();
                if (choice == "all")
                {
                    namespaces.Add("diagnostics");
                }
                if (choice == "diagnostics")
                {
                    namespaces.Clear();
                    namespaces.Add("diagnostics");
                }
                if (args.Length > 1)
                {
                    string newInterval = args[1].Trim();
                    double newValue = -1.0;
                    if (double.TryParse(newInterval, out newValue))
                    {
                        interval = TimeSpan.FromSeconds(newValue);
                    }
                }
            }
            while (true) DisplayData(namespaces, interval);
        }
    }
}
```
