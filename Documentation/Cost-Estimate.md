# zMonitor

## Cost Estimates

Cost estimates for the zMonitor solution really depend on what you are monitoring, and how often.

All pricing estimates in this document are based on region "West Europe".

### Tenant / Subscription

For tenants or subscriptions with a small footprint, a couple of VMs, the free versions should be sufficient. Keep an eye on Log Analytics log usage, as you may need change to the paid version, depending on the amount of data you are collecting. If you're processing logs, you can quickly exceed the 500NB daily limit for the free tier of Log Analytics.

| Component                     | Assumptions               | Cost (monthly)     |
| ----------------------------- | ------------------------- | ------------------ |
| Log Analytics                 | Free tier                 | $ 0.00             |
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



