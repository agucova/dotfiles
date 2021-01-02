# Defined in - @ line 1
function nmap --description 'alias nmap nmap -sC --script shodan-api'
	command nmap -sC --script shodan-api $argv;
end
