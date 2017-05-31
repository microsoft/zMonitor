# zMonitor

## Cost Estimates

Cost estimates for the zMonitor solution really depend on what you are monitoring, the solutions enabled in Log Analytics and how often.

All pricing estimates in this document are based on region "West Europe".

### Tenant / Subscription

For tenants or subscriptions with a small footprint, 4 VMs with log management enabled, the free versions should be sufficient. Log management drives the most consumption of capacity in Log Analytics, contributing approximatley 100MB per day per VM. After the 500MB daily limit is hit, switch to standalone per GB pricing tier (currently at $2.30 per GB). A inidicative rule of thumb is number of VMs x 100MB to work out potential costs, e.g. 20 VMs = 2GB = $4.60 per month (mileage may very depending on workloads but it's a good indicator).


| Component                     | Assumptions               | Cost (monthly)     |
| ----------------------------- | ------------------------- | ------------------ |
| Log Analytics                 | 3-4 VMs (Free)            | $ 0.00             |
| Azure Automation              | 500 minutes (Free)        | $ 0.00             |
|                               |                           | **$ 0.00**         |

### Service Provider / Central

| Component                     | Assumptions               | Cost (monthly)     |
| ----------------------------- | ------------------------- | ------------------ |
| Azure Storage Account (BLOB)  | 10 GB stored              | $ 0.20             |
| Stream Analytics              | 1 Unit                    | $ 89.28            |
| Azure Cosmos DB               | 2 GB stored, 400 RUs      | $ 24.31            |
| Azure Automation              | 500 minutes (Free)        | $ 0.00             |
|                               |                           | **$ 113.78**       |

* [Optional] Power BI - assume you have a license for PowerBI Desktop.

DISCLAIMER: The pricing reflected here is for demonstration purposes only. Actual pricing and costs may vary.
