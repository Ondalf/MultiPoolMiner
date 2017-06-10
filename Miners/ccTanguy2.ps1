$Path = '.\Bin\NVIDIA-pack\ccminerTanguy.exe'
$Uri = '.'
$ThreadIndex = 2
$Port = 4068+($ThreadIndex*10000)

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    Groestl = 'groestl'
	Timetravel = 'timetravel'
	Hmq1725 = 'hmq1725'
	Bitcore = 'bitcore'
	#Cryptonight = 'cryptonight'
}

$Optimizations = [PSCustomObject]@{
    Groestl = ''
	Timetravel = ''
	Hmq1725 = ''
	Bitcore = ''
	Cryptonight = ''
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {

	[PSCustomObject]@{
		Type = 'NVIDIA',$ThreadIndex
		Path = $Path
		Arguments = -Join ('-b 127.0.0.1:',"$port",' -d ',$ThreadIndex,' -a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -u $($Pools.', $_, '.User) -p $($Pools.', $_, '.Pass)', $Optimizations.$_)
		HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
		PowerUsages = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_PowerUsage.Week)')}
		API = 'Ccminer'
		Port = $Port
		Wrap = $false
		URI = $Uri
		Device = 'GPU#{0:d2}' -f $ThreadIndex
	}
}
