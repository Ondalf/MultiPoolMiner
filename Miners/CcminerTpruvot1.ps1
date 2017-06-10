$Path = '.\Bin\NVIDIA-TPruvot\ccminer-x64.exe'
$Uri = 'https://github.com/tpruvot/ccminer/releases/download/v2.0-tpruvot/ccminer-2.0-release-x64-cuda-8.0.7z'
$ThreadIndex = 1
$Port = 4068+($ThreadIndex*10000)

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
	#C11 = 'c11'
    #Quark = 'quark'
	Lyra2z = 'lyra2z'
    #Equihash = 'equihash' #not supported
    #Cryptonight = 'cryptonight'
    #Ethash = 'ethash' #not supported
    #Sia = 'sia'
    #Yescrypt = 'yescrypt'
    #BlakeVanilla = 'vanilla'
	Blake2s = 'blake2s'
    #Lyra2RE2 = 'lyra2v2'
	#Lyra2v2 = 'lyra2v2'
    #Skein = 'skein'
    #Qubit = 'qubit'
    NeoScrypt = 'neoscrypt'
	Nist5 = 'nist5'
    #X11 = 'x11'
	#X11evo = 'x11evo'
	#X17 = 'x17'
    #MyrGr = 'myr-gr'
    #Groestl = 'groestl'
    #Keccak = 'keccak'
    #Scrypt = 'scrypt'
	#Lbry = 'lbry'
	#Decred = 'decred'
    #Sib = 'sib'
	#Timetravel = 'timetravel'
	#Hmq1725 = 'hmq1725'
	#X13 = 'x13'
	#X15 = 'x15'
	#Veltor = 'veltor'
	Bitcore = 'bitcore'
	#MyriadGroestl = 'myr-gr'
	#MyrGr = 'myr-gr'
}

$Optimizations = [PSCustomObject]@{
    Lyra2z = ''
    Equihash = ''
    Cryptonight = ''
    Ethash = ''
    Sia = ''
    Yescrypt = ''
    BlakeVanilla = ''
	Blake2s = ''
    #Lyra2RE2 = ''
	Lyra2v2 = ''
    Skein = ''
    Qubit = ''
    NeoScrypt = ''
	Nist5 = ''
    #X11 = ''
	X11evo = ''
	#X17 = ''
	#MyriadGroestl = ''
    Groestl = ''
    Keccak = ''
    Scrypt = ''
	Lbry = ''
	Decred = ''
    Sib = ''
	Timetravel = ''
	Hmq1725 = ''
	#X13 = ''
	X15 = ''
	#Veltor = ''
	Bitcore = ''
	C11 = ''
	#MyrGr = ''
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