:: Add the extra IIS components to provide required IIS6 backwards compatibilty
:: The main install of IIS is not covered in this script, but can be achieved 
:: using the same means. Use `dism /online /Get-Features /format:table` to get
:: the cmdline names of the various features and adjust for those required.

set featureList=/FeatureName:IIS-LegacyScripts /FeatureName:IIS-LegacySnapIn /FeatureName:IIS-WMICompatibility /FeatureName:IIS-IIS6ManagementCompatibility

DISM /Online /norestart /quiet /Enable-Feature %featureList% > "%tmp%\%computername%-iss-extn-install-info.log" 2> "%tmp%\%computername%-iss-extn-install-error.log"