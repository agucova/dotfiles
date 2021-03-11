# Defined in - @ line 1
function nmap --description 'alias nmap nmap -sC --script shodan-api'
	# command sudo nmap -sC --script shodan-api $argv;
	# add api key later
	command sudo nmap -sS -sC -sV -O -T4 -A $argv;

end
