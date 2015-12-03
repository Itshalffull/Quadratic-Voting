"use strict";

var _get = function get(_x, _x2, _x3) { var _again = true; _function: while (_again) { var object = _x, property = _x2, receiver = _x3; _again = false; if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { _x = parent; _x2 = property; _x3 = receiver; _again = true; desc = parent = undefined; continue _function; } } else if ("value" in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } } };

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var factory = function factory(Pudding) {
  // Inherit from Pudding. The dependency on Babel sucks, but it's
  // the easiest way to extend a Babel-based class. Note that the
  // resulting .js file does not have a dependency on Babel.

  var Organization = (function (_Pudding) {
    _inherits(Organization, _Pudding);

    function Organization() {
      _classCallCheck(this, Organization);

      _get(Object.getPrototypeOf(Organization.prototype), "constructor", this).apply(this, arguments);
    }

    return Organization;
  })(Pudding);

  ;

  // Set up specific data for this class.
  Organization.abi = [{ "constant": true, "inputs": [{ "name": "", "type": "uint256" }], "name": "proposals", "outputs": [{ "name": "", "type": "address" }], "type": "function" }, { "constant": true, "inputs": [{ "name": "", "type": "address" }], "name": "members", "outputs": [{ "name": "", "type": "bool" }], "type": "function" }, { "constant": true, "inputs": [{ "name": "", "type": "address" }], "name": "propResults", "outputs": [{ "name": "", "type": "int256" }], "type": "function" }, { "constant": false, "inputs": [{ "name": "fakeTime", "type": "uint256" }], "name": "toTime", "outputs": [], "type": "function" }, { "constant": false, "inputs": [{ "name": "member", "type": "address" }], "name": "removeMember", "outputs": [], "type": "function" }, { "constant": true, "inputs": [], "name": "base_tokens", "outputs": [{ "name": "", "type": "uint256" }], "type": "function" }, { "constant": true, "inputs": [], "name": "token_count", "outputs": [{ "name": "", "type": "uint256" }], "type": "function" }, { "constant": true, "inputs": [{ "name": "", "type": "address" }], "name": "balances", "outputs": [{ "name": "", "type": "uint256" }], "type": "function" }, { "constant": true, "inputs": [], "name": "minNotice", "outputs": [{ "name": "", "type": "uint256" }], "type": "function" }, { "constant": true, "inputs": [], "name": "numProposals", "outputs": [{ "name": "", "type": "uint256" }], "type": "function" }, { "constant": false, "inputs": [{ "name": "proposalAddress", "type": "address" }], "name": "getResult", "outputs": [], "type": "function" }, { "constant": true, "inputs": [], "name": "Now", "outputs": [{ "name": "", "type": "uint256" }], "type": "function" }, { "constant": true, "inputs": [], "name": "numMembers", "outputs": [{ "name": "", "type": "uint256" }], "type": "function" }, { "constant": true, "inputs": [], "name": "organizer", "outputs": [{ "name": "", "type": "address" }], "type": "function" }, { "constant": false, "inputs": [{ "name": "vote", "type": "bool" }, { "name": "weight", "type": "uint256" }, { "name": "proposal", "type": "address" }], "name": "vote", "outputs": [], "type": "function" }, { "constant": false, "inputs": [{ "name": "amount", "type": "uint256" }, { "name": "dest", "type": "address" }], "name": "giveTokens", "outputs": [], "type": "function" }, { "constant": false, "inputs": [], "name": "destroy", "outputs": [], "type": "function" }, { "constant": false, "inputs": [{ "name": "proposal", "type": "address" }], "name": "dispatchBalance", "outputs": [], "type": "function" }, { "constant": false, "inputs": [{ "name": "newMember", "type": "address" }], "name": "addMember", "outputs": [], "type": "function" }, { "constant": false, "inputs": [{ "name": "name", "type": "string" }, { "name": "startTime", "type": "uint256" }, { "name": "endTime", "type": "uint256" }], "name": "makeProposal", "outputs": [], "type": "function" }, { "inputs": [], "type": "constructor" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "_new", "type": "address" }], "name": "NewMember", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "_old", "type": "address" }], "name": "DeletedMember", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "amount", "type": "uint256" }], "name": "Dispatch", "type": "event" }];
  Organization.binary = "6060604052606460065560008054600160a060020a031916331781556005819055600455610da9806100316000396000f3606060405236156100f05760e060020a6000350463013cf08b81146100f257806308ae4b0c1461013857806308d103f7146101535780630909d4d51461016b5780630b1ca49a1461017a5780631cdc044b146101c257806323b161ab146101cb57806327e235e3146101d45780632d87017c146101ec578063400e3949146101f5578063446a37e0146101fe57806344d4fd191461022a5780634698d11014610233578063612032651461023c57806361ebccfd1461024e578063790b71331461028157806383197ef0146102b6578063c34c356f146102df578063ca6d56dc14610432578063d8af4d0e14610454575b005b6104c160043560098054829081101561000257506000527f6e1540171b6c0c960b71a7020d9f60077f6af931a8bbf590da0223dacf75c7af0154600160a060020a031681565b6104de60043560016020526000908152604090205460ff1681565b6104de60043560036020526000908152604090205481565b6100f0600435600a8190555b50565b6100f0600435600054600160a060020a03908116339091161415806101b85750600160a060020a03811660009081526001602052604090205460ff16155b1561068c57610177565b6104de60065481565b6104de60055481565b6104de60043560026020526000908152604090205481565b6104de60085481565b6104de60075481565b6100f0600435600160a060020a03811660009081526003602052604081205460001914610854576102b2565b6104de600a5481565b6104de60045481565b6104c1600054600160a060020a031681565b6100f060043560243560443533600160a060020a031660009081526001602052604081205460ff1615156106ce57610541565b6100f06004356024355b6005805483019055600160a060020a03811660009081526002602052604090208054830190555b5050565b6100f0600054600160a060020a0390811633909116141561093157600054600160a060020a0316ff5b6100f06004355b8060005b81600160a060020a031663bfcddbbc6040518160e060020a0281526004018090506020604051808303816000876161da5a03f1156100025750506040515160ff83161015905061084f5781600160a060020a031663bfcddbbc6040518160e060020a0281526004018090506020604051808303816000876161da5a03f115610002575050506040518051906020015082600160a060020a0316633d79d1c86040518160e060020a0281526004018090506020604051808303816000876161da5a03f1156100025750505060405180519060200150046002600050600084600160a060020a0316638fbb38ff856040518260e060020a028152600401808260ff1681526020019150506020604051808303816000876161da5a03f1156100025750506040805151600160a060020a031683526020939093525020805490910190556001016102ea565b6100f0600435600054600160a060020a03908116339091161461064957610177565b6100f06004808035906020019082018035906020019191908080601f0160208091040260200160405190810160405280939291908181526020018383808284375094965050933593505060443591505060008054600160a060020a03908116339091161461054757610541565b60408051600160a060020a03929092168252519081900360200190f35b60408051918252519081900360200190f35b5050506000928352506020808320909101805473ffffffffffffffffffffffffffffffffffffffff191684179055600160a060020a0383168252600390526040902060001990556007805460010190555b50505050565b600854600a540183101561055a57610541565b8383836040516104768061093383390180806020018481526020018381526020018281038252858181518152602001915080519060200190808383829060006004602084601f0104600302600f01f150905090810190601f1680156105d35780820380516001836020036101000a031916815260200191505b50945050505050604051809103906000f09050600960005080548060010182818154818355818115116104f05760008390526104f0907f6e1540171b6c0c960b71a7020d9f60077f6af931a8bbf590da0223dacf75c7af9081019083015b808211156106455760008155600101610631565b5090565b600160a060020a0381166000908152600160208181526040808420805460ff1916841790556004805490930190925560029052812055600654610177908261028b565b600160a060020a03166000908152600160209081526040808320805460ff19169055600480546000190190556002909152812080546005805491909103905555565b33600160a060020a031660009081526002602052604090205460019010156106f557610541565b600183101561070357610541565b33600160a060020a0316600090815260026020526040902054838002111561072a57610541565b81905080600160a060020a03166378e979256040518160e060020a0281526004018090506020604051808303816000876161da5a03f11561000257505060405151600a5410801591506107bd575080600160a060020a0316633197cbb66040518160e060020a0281526004018090506020604051808303816000876161da5a03f11561000257505060405151600a541090505b156105415733600160a060020a0390811660008181526002602052604080822080548880029003905580517f61ebccfd0000000000000000000000000000000000000000000000000000000081526004810189905260248101889052604481019390935251928416926361ebccfd926064818101939291829003018183876161da5a03f1156100025750505050505050565b505050565b81905080600160a060020a0316633197cbb66040518160e060020a0281526004018090506020604051808303816000876161da5a03f11561000257505060405151421090506102b25780600160a060020a03166394f0873d6040518160e060020a0281526004018090506020604051808303816000876161da5a03f1156100025750506040805151600092835260036020529120556108f2816102e6565b80600160a060020a03166383197ef06040518160e060020a0281526004018090506000604051808303816000876161da5a03f115610002575050505050565b56606060405260405161047638038061047683398101604052805160805160a05191909201919060605160008054600160a060020a0319163317815584516001805492819052926020601f6002600019868816156101000201909516949094048401047fb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6908101939091608001908390106100e257805160ff19168380011785555b506100bb9291505b80821115610112576000815583016100a8565b50508160066000508190555080600760005081905550505050610360806101166000396000f35b828001600101855582156100a0579182015b828111156100a05782518260005055916020019190600101906100f4565b509056606060405236156100a35760e060020a600035046306fdde0381146100a55780630909d4d5146101005780633197cbb61461010b5780633d79d1c81461011457806344d4fd191461011d57806361ebccfd1461012657806378e979251461014d57806383197ef0146101565780638fbb38ff1461017e57806394f0873d146101c4578063bd108fd4146101db578063bfcddbbc146101e4578063d6b225be146101ed575b005b6101f6600180546020601f6002600019848616156101000201909316929092049182018190040260809081016040526060828152929190828280156102af5780601f10610284576101008083540402835291602001916102af565b6004356009556100a3565b61026460075481565b61026460055481565b61026460095481565b6100a360043560243560443560005433600160a060020a039081169116146102c5576102c0565b61026460065481565b6100a360005433600160a060020a039081169116141561028257600054600160a060020a0316ff5b61026460043560028054829081101561000257506000527f405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5ace0154600160a060020a031681565b61026460075460095460009190101561026e575b90565b61026460035481565b61026460085481565b61026460045481565b60405180806020018281038252838181518152602001915080519060200190808383829060006004602084601f0104600302600f01f150905090810190601f1680156102565780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b6060908152602090f35b60045460035411156101d8575060016101d8565b565b820191906000526020600020905b81548152906001019060200180831161029257829003601f168201915b505050505081565b60048054830190555b505050565b600280546001810180835582818380158290116103055781836000526020600020918201910161030591905b8082111561035c57600081556001016102f1565b50505091909060005260206000209001600050805473ffffffffffffffffffffffffffffffffffffffff191683179055506005805483800201905560088054600101905582156102b75760038054830190556102c0565b509056";

  if ("0x6477f0189637def2f01e99a3fc3267319b1fb71c" != "") {
    Organization.address = "0x6477f0189637def2f01e99a3fc3267319b1fb71c";

    // Backward compatibility; Deprecated.
    Organization.deployed_address = "0x6477f0189637def2f01e99a3fc3267319b1fb71c";
  }

  Organization.generated_with = "1.0.2";
  Organization.contract_name = "Organization";

  return Organization;
};

// Nicety for Node.
factory.load = factory;

if (typeof module != "undefined") {
  module.exports = factory;
} else {
  // There will only be one version of Pudding in the browser,
  // and we can use that.
  window.Organization = factory;
}