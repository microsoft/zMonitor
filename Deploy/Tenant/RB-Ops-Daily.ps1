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

