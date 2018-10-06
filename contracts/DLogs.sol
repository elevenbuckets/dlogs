pragma solidity ^0.4.15;

contract DLogs {
	mapping (address => string) ipnsLookup;
	mapping (string => address) addrLookup;

   	function DLogs() {}

	function register(address blogger, string ipnsHash) public returns (bool) {
		ipnsLookup[blogger] = ipnsHash;
		addrLookup[ipnsHash] = blogger;

		return true;
	}

	function unregister(address blogger) public returns (bool) {
		require(msg.sender == blogger);

		delete addrLookup[ipnsLookup[blogger]];
		delete ipnsLookup[blogger];

		return true;
	} 

	function addr2ipns(address blogger) constant returns (string) {
		return ipnsLookup[blogger];
	}

	function ipns2addr(string ipnsHash) constant returns (address) {
		return addrLookup[ipnsHash];
	}

	function () payable { revert(); }
}
