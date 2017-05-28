#Average CPU usage calculated over 10 minutes for the last 1 hours.
.\RB-ProcessLogs.ps1 `
		-ReportName "perfavgcpu" `
		-dynamicQuery "Type=Perf CounterName=""% Processor Time"" TimeGenerated>=NOW-1HOURS | measure avg(CounterValue) by Computer interval 30MINUTE"

#All detected threats based on threat status rank.
.\RB-ProcessLogs.ps1 `
		-ReportName "securitydetectedthreats" `
		-dynamicQuery "Type=ProtectionStatus ThreatStatusRank > 199 ThreatStatusRank != 470 | measure max(ThreatStatusRank) as Rank by Computer | Top 5000"

#All Windows security login failures in the past 1 hours.
.\RB-ProcessLogs.ps1 `
		-ReportName "acctloginfailurepasthour" `
		-dynamicQuery "Type=SecurityEvent EventID=4625 TimeGenerated>=NOW-1HOURS"
