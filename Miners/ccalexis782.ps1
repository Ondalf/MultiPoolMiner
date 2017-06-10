$Path = '.\Bin\NVIDIA-pack\ccminerAlexis78.exe'
$Uri = '.'
$ThreadIndex = 2
$Port = 4068+($ThreadIndex*10000)

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
	C11 = 'c11'
	#Blake2s = 'blake2s'
	Decred = 'decred'
	Lyra2v2 = 'lyra2v2'
	Lyra2RE2 = 'lyra2v2'
    Skein = 'skein'
    #NeoScrypt = 'neoscrypt'
	Nist5 = 'nist5'
	X17 = 'x17'
	Lbry = 'lbry'
    Sib = 'sib'
	Veltor = 'veltor'
	MyriadGroestl = 'myr-gr'
	MyrGr = 'myr-gr'
	Keccak = 'keccak'
	X11evo = 'x11evo'
	Blakecoin = 'blakecoin'
}

$Optimizations = [PSCustomObject]@{
	Blake2s = ''
	Decred = ''
	Lyra2v2 = ''
    Skein = ''
    NeoScrypt = ''
	Nist5 = ''
	X17 = ''
	Lbry = ''
    Sib = ''
	Veltor = ''
	MyriadGroestl = ''
	MyrGr = ''
	Keccak = ''
	X11evo = ''
	Blakecoin = ''
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