# zMonitor

## Overview

An Azure platform native monitoring solution that enables monitoring across multiple tenants or subscriptions.

The primary goal is to utilize Azure native components, and deliver an as simple as possible, highly configurable and scalable, cost-effective monitoring solution. The driving force behind this solution was the need to be able to monitor Azure resources across tenants (for service providers), using Azure native tools. While there are many metrics and logs generated in Azure, surfacing this information across subscriptions/tenants proved challenging.

## Solution

For monitoring within subscriptions, OMS Log Analytics is leveraged as the native log and metric aggregation toolset in Azure. Using the free tier of Log Analytics will be sufficient for most cases, but depends on the number of resources being monitored and the metrics being collected.

Log Analytics data is then exported into a central Cosmos DB collection, from where it can be vizualized using any preferred tool. For this solution, PowerBI is used for demonstration purposes.

![zMonitor Solution Overview](images/zMonitorOverview.png)

The components that make up the solution:

* Tenant / Subscription

  * Log Analytics
  * Azure Automation

* Service Provider / Central Repository

  * Azure Storage Account (BLOB)
  * Stream Analytics
  * Azure Cosmos DB
  * Azure Automation
  * [Optional] Power BI

## Azure Resource Documentation

* Log Analytics

  <!--![Log Analytics](images/loganalytics.png)-->
  [Documentation: Log Analytics][1]

* Azure Automation

  [Documentation: Azure Automation][2]

* Stream Analytics

  [Documentation: Stream Analytics][3]

* Azure Cosmos DB

  [Documentation: Azure Cosmos DB][4]

* Power BI

  [Documentation: Power BI][5]

## Deployment

[Deploying monitoring for Tenant/ Subscription][6]

[Deploying the central repository (e.g. Service Provider)][7]

## Contributions

Please refer to [CONTRIBUTING](Contributing.md)

## License

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information, see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

The MIT License (MIT)

Copyright (c) 2016 Microsoft

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


<!-- LINKS -->
[1]: https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-overview
[2]: https://docs.microsoft.com/en-us/azure/automation/automation-intro
[3]: https://docs.microsoft.com/en-us/azure/stream-analytics/stream-analytics-introduction
[4]: https://docs.microsoft.com/en-us/azure/cosmos-db/
[5]: https://powerbi.microsoft.com/en-us/documentation/powerbi-landing-page/
[6]: Deploy-Tenant.md
[7]: Deploy-ServiceProvider.md
