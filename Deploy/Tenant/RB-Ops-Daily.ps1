#Alerts generated in the past 24 hours that are still open
.\RB-ProcessLogs.ps1 `
		-ReportName "activealertscritical" `
		-dynamicQuery "Type=Alert (AlertSeverity=error or AlertSeverity=critical) TimeGenerated>NOW-24HOUR AlertState!=Closed"

#All Windows VMs that require updates
.\RB-ProcessLogs.ps1 `
		-ReportName "anyupdatesrequired" `
		-dynamicQuery "Type=Update OSType!=Linux UpdateState=Needed Optional=false | select Computer,Title,KBID,Classification,UpdateSeverity,PublishedDate"

#All VMs that are missing critical updates
.\RB-ProcessLogs.ps1 `
		-ReportName "criticalupdatesrequired" `
		-dynamicQuery "Type=Update UpdateState=Needed Optional=false (Classification=""Security Updates"" OR Classification=""Critical Updates"")"

#All VMs with more than 2GB RAM available on average
.\RB-ProcessLogs.ps1 `
		-ReportName "vmswithover2gbramavailable" `
		-dynamicQuery "Type=Perf ObjectName=Memory CounterName=""Available MBytes"" | measure avg(CounterValue) by Computer | where AggregatedValue>2048"

#All computers with their most recent data
.\RB-ProcessLogs.ps1 `
		-ReportName "allvmsmostrecentdata" `
		-dynamicQuery "NOT(ObjectName=""Advisor Metrics"" OR ObjectName=ManagedSpace) TimeGenerated>NOW-5MINUTES"

