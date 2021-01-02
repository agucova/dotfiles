# Defined in - @ line 1
function nmapr --description 'alias nmapr nmap --script hostmap-bfk --script dns-brute --script http-auth-finder'
	nmap --script hostmap-bfk --script dns-brute --script http-auth-finder $argv;
end
