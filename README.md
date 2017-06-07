# MultiPoolMiner
Monitors crypto mining pools in real-time in order to find the most profitable for your machine. Controls any miner that is available via command line. 

# Defaulted to zpool
In order to make this branch work properly, you have to set **-wallet YOUR-BTC-ADDR** in **start.bat**. You can leave -algo unset. Enabled algos are read from miner configs under $Algorithms. Both pools don't work together *yet*.
# Remember to change your BTC address!

The way I planned this branch to work is that you set **diffs** and intensities per GPU. This doesn't give anything new or premium things for miners, who have single type of GPU in their rigs. This is made for people, like me who doesn't yet own huge farm, but just single machine with random nVidias and want to get the best out of it.
To clarify my point, 750Ti likes to change algos bit more often, than 1080, and the program shows difference between algo-optimizations for these cards.

Way to change diffs and intensities *should* be easy. Open miner config for your certain GPU, set algo diff or intensity in $Optimizations by using <code>Algo = ',d=# -i ##'</code>. There should be several algos with empty <code>Algo = ''</code> already.
Do not leave space after first <code>'</code> for difficulty setting and remember the <code>,</code> when tweaking. Reason for this, <code>,d=x</code> goes into your password field, so stratum understands, you want fixed difficulty only for this certain miner. Setting intensity requires adding *space* after difficulty, or *space* after first <code>'</code>. That way it goes after password field and adds up to commmandline for ccminer.

Aaronsace's Bitcoin Donations: **1MsrCoAt8qM53HUMsUxvy9gMj3QVbHLazH**
