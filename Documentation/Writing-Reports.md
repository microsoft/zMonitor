# zMonitor

## Writing Queries

Some tips for gettings started with writing Log Analytics queries and generating reports.

A great place to start is the default "Saved Searches" in Log Analytics. Once you start exploring writing your own queries, a good place to start digging is:

```LogAnalytics
* | Measure count() by Type
```

## References

Some excellent resources to get up and running quickly:

* [Find data using log searches](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-log-searches)
* [Log Analytics search reference](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-search-reference)