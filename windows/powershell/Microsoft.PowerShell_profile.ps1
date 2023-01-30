Import-Module posh-git
$GitPromptSettings.DefaultPromptPrefix.Text = '$(Get-Date -f "MM-dd HH:mm:ss") '
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $false
$GitPromptSettings.DefaultPromptWriteStatusFirst = $true
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n$([DateTime]::now.ToString("MM-dd HH:mm:ss"))'
$GitPromptSettings.DefaultPromptBeforeSuffix.ForegroundColor = 0x808080
$GitPromptSettings.DefaultPromptSuffix = ' $((Get-History -Count 1).id + 1)$(">" * ($nestedPromptLevel + 1)) '
$GitPromptSettings.BeforePath = '{'
$GitPromptSettings.AfterPath = '}'
$GitPromptSettings.BeforePath.ForegroundColor = 'Red'
$GitPromptSettings.AfterPath.ForegroundColor = 'Red'
function global:PromptWriteErrorInfo() {
	    if ($global:GitPromptValues.DollarQuestion) { return }

	        if ($global:GitPromptValues.LastExitCode) {
			        "`e[31m(" + $global:GitPromptValues.LastExitCode + ") `e[0m"
				    }
				        else {
						        "`e[31m! `e[0m"
							    }
}

$global:GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n$(PromptWriteErrorInfo)$([DateTime]::now.ToString("MM-dd HH:mm:ss"))'
