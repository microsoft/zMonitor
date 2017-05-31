# zMonitor

## Reports

The queries included in this sample solution are designed to be flexible and highly configurable. To help kick start the process, a number of queries / reports are provided. They can be categorized in two categories, queries that can run daily, and queries that should run hourly (or any interval required for the data being reported on).

### Daily Reports

* Alerts generated in the past 24 hours that are still open ("activealertscritical")
* All Windows VMs that require updates ("anyupdatesrequired")
* All VMs that are missing critical updates ("criticalupdatesrequired")
* All VMs with more than 2GB RAM available on average ("vmswithover2gbramavailable")
* All computers with their most recent data ("allvmsmostrecentdata")

### Hourly Reports

* Average CPU usage calculated over 10 minutes for the last 1 hours ("perfavgcpu")
* All detected threats based on threat status rank ("securitydetectedthreats")
* All Windows security login failures in the past 1 hours ("acctloginfailurepasthour")
* All Linux Syslog errors in the past 1 hour ("linuxsyslogerrors")
