﻿$Path = '.\Bin\NVIDIA-Nanashi\ccminer.exe'
$Uri = 'https://github.com/nicehash/ccminer-nanashi/releases/download/1.7.6-r6/ccminer.zip'
$ThreadIndex = 0
$Port = 4068+($ThreadIndex*10000)

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
	#Replaced with alexis
}

$Optimizations = [PSCustomObject]@{
	#Replaced with alexis
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {

	[PSCustomObject]@{
		Type = 'NVIDIA',$ThreadIndex
		Path = $Path
		Arguments = -Join ('-b 127.0.0.1:',"$port",' -d ',$ThreadIndex,' -a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -u $($Pools.', $_, '.User) -p $($Pools.', $_, '.Pass)', $Optimizations.$_)
		HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
		API = 'Ccminer'
		Port = $Port
		Wrap = $false
		URI = $Uri
		Device = 'GPU#{0:d2}' -f $ThreadIndex
	}
}