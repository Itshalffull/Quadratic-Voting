{"filter":false,"title":"Organization.sol","tooltip":"/contracts/Organization.sol","undoManager":{"mark":100,"position":100,"stack":[[{"start":{"row":0,"column":0},"end":{"row":90,"column":0},"action":"remove","lines":["import \"Proposal\";","","contract Organization {  // can be killed, so the owner gets sent the money in the end","","\taddress public organizer;","\tmapping (address => bool) public members;","\tmapping (address => uint) public balances;","\tmapping (address => int) public propResults;","\tuint public numMembers;","\tuint public token_count;","\tuint public base_tokens = 100;","\tuint public numProposals;","\tuint public minNotice;","\taddress[] public proposals;","","\tevent NewMember(address _new); // so you can log the event","\tevent DeletedMember(address _old); // so you can log the event","\tevent Dispatch(uint amount);","","\tfunction Organization() {","\t\torganizer = msg.sender;\t\t","\t\ttoken_count = 0;","\t\tnumMembers = 0;","\t}","","\tfunction makeProposal(string name, uint startTime, uint endTime) {","\t\tif( msg.sender != organizer ) { return; }","\t\tif( startTime < now + minNotice ) { return; }","\t\taddress prop = new Proposal(name, startTime, endTime);","\t\tproposals.push(prop);\t\t","\t\tpropResults[prop] = -1;","\t\tnumProposals++;","\t}","","\tfunction addMember(address newMember) {","\t\tif(msg.sender != organizer) { return; }","\t\tmembers[newMember] = true;","\t\tnumMembers++;","\t\tbalances[newMember] = 0;","\t\tgiveTokens(base_tokens, newMember);","\t}","","\tfunction removeMember(address member) {","\t\tif(msg.sender != organizer || !members[member]) { return; }","\t\tmembers[member] = false;","\t\tnumMembers--;","\t\ttoken_count -= balances[member];","\t\tbalances[member] = 0;","\t}","","\tfunction giveTokens(uint amount, address dest) {","\t\ttoken_count += amount;","\t\tbalances[dest] += amount;","\t}","","\tfunction vote(bool vote, uint weight, address proposal) {","\t\tif( !members[msg.sender] ) { return; }","\t\tif( balances[msg.sender] < 1) { return; }","\t\tif( weight < 1 ) { return; }","\t\tif( weight*weight > balances[msg.sender] ) { return; }","","\t\tbalances[msg.sender] -= weight*weight;","","\t\tProposal(proposal).vote(vote, weight, msg.sender);","\t}","","\tfunction dispatchBalance(address proposal) {","\t\tProposal p = Proposal(proposal);","\t\tfor(var i=0; i < p.nbVoters(); i++) {","\t\t\tbalances[p.voted(i)] += (100 / p.nbVoters());\t","\t\t}","\t}","\t","\tfunction getResult (address proposalAddress) {","\t\tif (propResults[proposalAddress] != -1) { return; }","\t\tProposal p = Proposal(proposalAddress);","\t\tif(now >= p.endTime() ){","\t\t\tpropResults[proposalAddress] = p.Results();","\t\t\tdispatchBalance(proposalAddress);","\t\t\tp.destroy();","\t\t}","\t}","","\tfunction destroy() {","\t\tif (msg.sender == organizer) { // without this funds could be locked in the contract forever!","\t\t\tsuicide(organizer);","\t\t}","\t}","","}",""],"id":730},{"start":{"row":0,"column":0},"end":{"row":98,"column":0},"action":"insert","lines":["import \"Proposal\";","","contract Organization {  // can be killed, so the owner gets sent the money in the end","","\taddress public organizer;","\tmapping (address => bool) public members;","\tmapping (address => uint) public balances;","\tmapping (address => int) public propResults;","\tuint public numMembers;","\tuint public token_count;","\tuint public base_tokens = 100;","\tuint public numProposals;","\tuint public minNotice;","\taddress[] public proposals;","\tuint public Now;","","\tevent NewMember(address _new); // so you can log the event","\tevent DeletedMember(address _old); // so you can log the event","\tevent Dispatch(uint amount);","","\tfunction Organization() {","\t\torganizer = msg.sender;\t\t","\t\ttoken_count = 0;","\t\tnumMembers = 0;","\t}","","\tfunction toTime(uint fakeTime) {","\t\tNow = fakeTime;","\t}","","\tfunction makeProposal(string name, uint startTime, uint endTime) {","\t\tif( msg.sender != organizer ) { return; }","\t\tif( startTime < Now + minNotice ) { return; }","\t\taddress prop = new Proposal(name, startTime, endTime);","\t\tproposals.push(prop);\t\t","\t\tpropResults[prop] = -1;","\t\tnumProposals++;","\t}","","\tfunction addMember(address newMember) {","\t\tif(msg.sender != organizer) { return; }","\t\tmembers[newMember] = true;","\t\tnumMembers++;","\t\tbalances[newMember] = 0;","\t\tgiveTokens(base_tokens, newMember);","\t}","","\tfunction removeMember(address member) {","\t\tif(msg.sender != organizer || !members[member]) { return; }","\t\tmembers[member] = false;","\t\tnumMembers--;","\t\ttoken_count -= balances[member];","\t\tbalances[member] = 0;","\t}","","\tfunction giveTokens(uint amount, address dest) {","\t\ttoken_count += amount;","\t\tbalances[dest] += amount;","\t}","","\tfunction vote(bool vote, uint weight, address proposal) {","","\t\tif( !members[msg.sender] ) { return; }","\t\tif( balances[msg.sender] < 1) { return; }","\t\tif( weight < 1 ) { return; }","\t\tif( weight*weight > balances[msg.sender] ) { return; }","\t\tProposal prop = Proposal(proposal);","","\t\tif( Now >= prop.startTime() && Now < prop.endTime() ) {","\t\t\tbalances[msg.sender] -= weight*weight;","\t\t\tprop.vote(vote, weight, msg.sender);","\t\t}","\t}","","\tfunction dispatchBalance(address proposal) {","\t\tProposal p = Proposal(proposal);","\t\tfor(var i=0; i < p.nbVoters(); i++) {","\t\t\tbalances[p.voted(i)] += (p.bal() / p.nbVoters());\t","\t\t}","\t}","\t","\tfunction getResult (address proposalAddress) {","\t\tif (propResults[proposalAddress] != -1) { return; }","\t\tProposal p = Proposal(proposalAddress);","\t\tif(now >= p.endTime() ){","\t\t\tpropResults[proposalAddress] = p.Results();","\t\t\tdispatchBalance(proposalAddress);","\t\t\tp.destroy();","\t\t}","\t}","","\tfunction destroy() {","\t\tif (msg.sender == organizer) { // without this funds could be locked in the contract forever!","\t\t\tsuicide(organizer);","\t\t}","\t}","","}",""]}],[{"start":{"row":13,"column":28},"end":{"row":14,"column":17},"action":"remove","lines":["","\tuint public Now;"],"id":731,"ignore":true},{"start":{"row":25,"column":0},"end":{"row":29,"column":0},"action":"remove","lines":["\tfunction toTime(uint fakeTime) {","\t\tNow = fakeTime;","\t}","",""]},{"start":{"row":27,"column":18},"end":{"row":27,"column":19},"action":"remove","lines":["N"]},{"start":{"row":27,"column":18},"end":{"row":27,"column":19},"action":"insert","lines":["n"]},{"start":{"row":56,"column":0},"end":{"row":57,"column":0},"action":"remove","lines":["",""]},{"start":{"row":60,"column":0},"end":{"row":63,"column":1},"action":"remove","lines":["\t\tProposal prop = Proposal(proposal);","","\t\tif( Now >= prop.startTime() && Now < prop.endTime() ) {","\t"]},{"start":{"row":60,"column":0},"end":{"row":61,"column":0},"action":"insert","lines":["",""]},{"start":{"row":62,"column":0},"end":{"row":63,"column":0},"action":"insert","lines":["",""]},{"start":{"row":63,"column":2},"end":{"row":63,"column":7},"action":"remove","lines":["\tprop"]},{"start":{"row":63,"column":2},"end":{"row":63,"column":20},"action":"insert","lines":["Proposal(proposal)"]},{"start":{"row":64,"column":0},"end":{"row":65,"column":0},"action":"remove","lines":["\t\t}",""]},{"start":{"row":69,"column":28},"end":{"row":69,"column":35},"action":"remove","lines":["p.bal()"]},{"start":{"row":69,"column":28},"end":{"row":69,"column":31},"action":"insert","lines":["100"]}],[{"start":{"row":0,"column":0},"end":{"row":90,"column":0},"action":"remove","lines":["import \"Proposal\";","","contract Organization {  // can be killed, so the owner gets sent the money in the end","","\taddress public organizer;","\tmapping (address => bool) public members;","\tmapping (address => uint) public balances;","\tmapping (address => int) public propResults;","\tuint public numMembers;","\tuint public token_count;","\tuint public base_tokens = 100;","\tuint public numProposals;","\tuint public minNotice;","\taddress[] public proposals;","","\tevent NewMember(address _new); // so you can log the event","\tevent DeletedMember(address _old); // so you can log the event","\tevent Dispatch(uint amount);","","\tfunction Organization() {","\t\torganizer = msg.sender;\t\t","\t\ttoken_count = 0;","\t\tnumMembers = 0;","\t}","","\tfunction makeProposal(string name, uint startTime, uint endTime) {","\t\tif( msg.sender != organizer ) { return; }","\t\tif( startTime < now + minNotice ) { return; }","\t\taddress prop = new Proposal(name, startTime, endTime);","\t\tproposals.push(prop);\t\t","\t\tpropResults[prop] = -1;","\t\tnumProposals++;","\t}","","\tfunction addMember(address newMember) {","\t\tif(msg.sender != organizer) { return; }","\t\tmembers[newMember] = true;","\t\tnumMembers++;","\t\tbalances[newMember] = 0;","\t\tgiveTokens(base_tokens, newMember);","\t}","","\tfunction removeMember(address member) {","\t\tif(msg.sender != organizer || !members[member]) { return; }","\t\tmembers[member] = false;","\t\tnumMembers--;","\t\ttoken_count -= balances[member];","\t\tbalances[member] = 0;","\t}","","\tfunction giveTokens(uint amount, address dest) {","\t\ttoken_count += amount;","\t\tbalances[dest] += amount;","\t}","","\tfunction vote(bool vote, uint weight, address proposal) {","\t\tif( !members[msg.sender] ) { return; }","\t\tif( balances[msg.sender] < 1) { return; }","\t\tif( weight < 1 ) { return; }","\t\tif( weight*weight > balances[msg.sender] ) { return; }","","\t\tbalances[msg.sender] -= weight*weight;","","\t\tProposal(proposal).vote(vote, weight, msg.sender);","\t}","","\tfunction dispatchBalance(address proposal) {","\t\tProposal p = Proposal(proposal);","\t\tfor(var i=0; i < p.nbVoters(); i++) {","\t\t\tbalances[p.voted(i)] += (100 / p.nbVoters());\t","\t\t}","\t}","\t","\tfunction getResult (address proposalAddress) {","\t\tif (propResults[proposalAddress] != -1) { return; }","\t\tProposal p = Proposal(proposalAddress);","\t\tif(now >= p.endTime() ){","\t\t\tpropResults[proposalAddress] = p.Results();","\t\t\tdispatchBalance(proposalAddress);","\t\t\tp.destroy();","\t\t}","\t}","","\tfunction destroy() {","\t\tif (msg.sender == organizer) { // without this funds could be locked in the contract forever!","\t\t\tsuicide(organizer);","\t\t}","\t}","","}",""],"id":732},{"start":{"row":0,"column":0},"end":{"row":98,"column":0},"action":"insert","lines":["import \"Proposal\";","","contract Organization {  // can be killed, so the owner gets sent the money in the end","","\taddress public organizer;","\tmapping (address => bool) public members;","\tmapping (address => uint) public balances;","\tmapping (address => int) public propResults;","\tuint public numMembers;","\tuint public token_count;","\tuint public base_tokens = 100;","\tuint public numProposals;","\tuint public minNotice;","\taddress[] public proposals;","\tuint public Now;","","\tevent NewMember(address _new); // so you can log the event","\tevent DeletedMember(address _old); // so you can log the event","\tevent Dispatch(uint amount);","","\tfunction Organization() {","\t\torganizer = msg.sender;\t\t","\t\ttoken_count = 0;","\t\tnumMembers = 0;","\t}","","\tfunction toTime(uint fakeTime) {","\t\tNow = fakeTime;","\t}","","\tfunction makeProposal(string name, uint startTime, uint endTime) {","\t\tif( msg.sender != organizer ) { return; }","\t\tif( startTime < Now + minNotice ) { return; }","\t\taddress prop = new Proposal(name, startTime, endTime);","\t\tproposals.push(prop);\t\t","\t\tpropResults[prop] = -1;","\t\tnumProposals++;","\t}","","\tfunction addMember(address newMember) {","\t\tif(msg.sender != organizer) { return; }","\t\tmembers[newMember] = true;","\t\tnumMembers++;","\t\tbalances[newMember] = 0;","\t\tgiveTokens(base_tokens, newMember);","\t}","","\tfunction removeMember(address member) {","\t\tif(msg.sender != organizer || !members[member]) { return; }","\t\tmembers[member] = false;","\t\tnumMembers--;","\t\ttoken_count -= balances[member];","\t\tbalances[member] = 0;","\t}","","\tfunction giveTokens(uint amount, address dest) {","\t\ttoken_count += amount;","\t\tbalances[dest] += amount;","\t}","","\tfunction vote(bool vote, uint weight, address proposal) {","","\t\tif( !members[msg.sender] ) { return; }","\t\tif( balances[msg.sender] < 1) { return; }","\t\tif( weight < 1 ) { return; }","\t\tif( weight*weight > balances[msg.sender] ) { return; }","\t\tProposal prop = Proposal(proposal);","","\t\tif( Now >= prop.startTime() && Now < prop.endTime() ) {","\t\t\tbalances[msg.sender] -= weight*weight;","\t\t\tprop.vote(vote, weight, msg.sender);","\t\t}","\t}","","\tfunction dispatchBalance(address proposal) {","\t\tProposal p = Proposal(proposal);","\t\tfor(var i=0; i < p.nbVoters(); i++) {","\t\t\tbalances[p.voted(i)] += (p.bal() / p.nbVoters());\t","\t\t}","\t}","\t","\tfunction getResult (address proposalAddress) {","\t\tif (propResults[proposalAddress] != -1) { return; }","\t\tProposal p = Proposal(proposalAddress);","\t\tif(now >= p.endTime() ){","\t\t\tpropResults[proposalAddress] = p.Results();","\t\t\tdispatchBalance(proposalAddress);","\t\t\tp.destroy();","\t\t}","\t}","","\tfunction destroy() {","\t\tif (msg.sender == organizer) { // without this funds could be locked in the contract forever!","\t\t\tsuicide(organizer);","\t\t}","\t}","","}",""]}],[{"start":{"row":3,"column":0},"end":{"row":3,"column":1},"action":"insert","lines":["s"],"id":733}],[{"start":{"row":3,"column":1},"end":{"row":3,"column":2},"action":"insert","lines":["t"],"id":734}],[{"start":{"row":3,"column":2},"end":{"row":3,"column":3},"action":"insert","lines":["r"],"id":735}],[{"start":{"row":3,"column":3},"end":{"row":3,"column":4},"action":"insert","lines":["u"],"id":736}],[{"start":{"row":3,"column":4},"end":{"row":3,"column":5},"action":"insert","lines":["c"],"id":737}],[{"start":{"row":3,"column":5},"end":{"row":3,"column":6},"action":"insert","lines":["t"],"id":738}],[{"start":{"row":3,"column":6},"end":{"row":3,"column":7},"action":"insert","lines":[" "],"id":739}],[{"start":{"row":3,"column":7},"end":{"row":3,"column":8},"action":"insert","lines":["o"],"id":740}],[{"start":{"row":3,"column":7},"end":{"row":3,"column":8},"action":"remove","lines":["o"],"id":741}],[{"start":{"row":3,"column":7},"end":{"row":3,"column":8},"action":"insert","lines":["O"],"id":742}],[{"start":{"row":3,"column":8},"end":{"row":3,"column":9},"action":"insert","lines":["R"],"id":743}],[{"start":{"row":3,"column":9},"end":{"row":3,"column":10},"action":"insert","lines":["g"],"id":744}],[{"start":{"row":3,"column":10},"end":{"row":3,"column":11},"action":"insert","lines":["a"],"id":745}],[{"start":{"row":3,"column":11},"end":{"row":3,"column":12},"action":"insert","lines":["n"],"id":746}],[{"start":{"row":3,"column":11},"end":{"row":3,"column":12},"action":"remove","lines":["n"],"id":747}],[{"start":{"row":3,"column":10},"end":{"row":3,"column":11},"action":"remove","lines":["a"],"id":748}],[{"start":{"row":3,"column":9},"end":{"row":3,"column":10},"action":"remove","lines":["g"],"id":749}],[{"start":{"row":3,"column":8},"end":{"row":3,"column":9},"action":"remove","lines":["R"],"id":750}],[{"start":{"row":3,"column":8},"end":{"row":3,"column":9},"action":"insert","lines":["r"],"id":751}],[{"start":{"row":3,"column":9},"end":{"row":3,"column":10},"action":"insert","lines":["g"],"id":752}],[{"start":{"row":3,"column":10},"end":{"row":3,"column":11},"action":"insert","lines":["a"],"id":753}],[{"start":{"row":3,"column":11},"end":{"row":3,"column":12},"action":"insert","lines":["n"],"id":754}],[{"start":{"row":3,"column":12},"end":{"row":3,"column":13},"action":"insert","lines":["i"],"id":755}],[{"start":{"row":3,"column":13},"end":{"row":3,"column":14},"action":"insert","lines":["z"],"id":756}],[{"start":{"row":3,"column":14},"end":{"row":3,"column":15},"action":"insert","lines":["a"],"id":757}],[{"start":{"row":3,"column":15},"end":{"row":3,"column":16},"action":"insert","lines":["t"],"id":758}],[{"start":{"row":3,"column":16},"end":{"row":3,"column":17},"action":"insert","lines":["i"],"id":759}],[{"start":{"row":3,"column":17},"end":{"row":3,"column":18},"action":"insert","lines":["o"],"id":760}],[{"start":{"row":3,"column":18},"end":{"row":3,"column":19},"action":"insert","lines":["n"],"id":761}],[{"start":{"row":3,"column":19},"end":{"row":3,"column":20},"action":"insert","lines":["{"],"id":762}],[{"start":{"row":14,"column":17},"end":{"row":15,"column":0},"action":"insert","lines":["",""],"id":763},{"start":{"row":15,"column":0},"end":{"row":15,"column":1},"action":"insert","lines":["\t"]}],[{"start":{"row":15,"column":0},"end":{"row":15,"column":1},"action":"remove","lines":["\t"],"id":764}],[{"start":{"row":15,"column":0},"end":{"row":15,"column":1},"action":"insert","lines":["}"],"id":765}],[{"start":{"row":3,"column":0},"end":{"row":4,"column":0},"action":"insert","lines":["",""],"id":766}],[{"start":{"row":4,"column":0},"end":{"row":4,"column":20},"action":"remove","lines":["struct Organization{"],"id":767}],[{"start":{"row":3,"column":0},"end":{"row":4,"column":0},"action":"remove","lines":["",""],"id":768}],[{"start":{"row":15,"column":0},"end":{"row":15,"column":1},"action":"remove","lines":["}"],"id":769}],[{"start":{"row":14,"column":17},"end":{"row":15,"column":0},"action":"remove","lines":["",""],"id":770}],[{"start":{"row":80,"column":1},"end":{"row":80,"column":2},"action":"insert","lines":["/"],"id":772}],[{"start":{"row":80,"column":2},"end":{"row":80,"column":3},"action":"insert","lines":["*"],"id":773}],[{"start":{"row":89,"column":2},"end":{"row":90,"column":0},"action":"insert","lines":["",""],"id":774},{"start":{"row":90,"column":0},"end":{"row":90,"column":1},"action":"insert","lines":["\t"]}],[{"start":{"row":90,"column":1},"end":{"row":90,"column":2},"action":"insert","lines":["*"],"id":775}],[{"start":{"row":90,"column":2},"end":{"row":90,"column":3},"action":"insert","lines":["/"],"id":776}],[{"start":{"row":30,"column":65},"end":{"row":30,"column":66},"action":"remove","lines":[" "],"id":777}],[{"start":{"row":30,"column":65},"end":{"row":30,"column":66},"action":"insert","lines":[" "],"id":778}],[{"start":{"row":30,"column":66},"end":{"row":30,"column":67},"action":"insert","lines":["r"],"id":779}],[{"start":{"row":30,"column":67},"end":{"row":30,"column":68},"action":"insert","lines":["e"],"id":780}],[{"start":{"row":30,"column":68},"end":{"row":30,"column":69},"action":"insert","lines":["t"],"id":781}],[{"start":{"row":30,"column":69},"end":{"row":30,"column":70},"action":"insert","lines":["u"],"id":782}],[{"start":{"row":30,"column":70},"end":{"row":30,"column":71},"action":"insert","lines":["r"],"id":783}],[{"start":{"row":30,"column":71},"end":{"row":30,"column":72},"action":"insert","lines":["n"],"id":784}],[{"start":{"row":30,"column":72},"end":{"row":30,"column":73},"action":"insert","lines":["s"],"id":785}],[{"start":{"row":30,"column":73},"end":{"row":30,"column":74},"action":"insert","lines":[" "],"id":786}],[{"start":{"row":30,"column":74},"end":{"row":30,"column":75},"action":"insert","lines":["a"],"id":787}],[{"start":{"row":30,"column":75},"end":{"row":30,"column":76},"action":"insert","lines":["d"],"id":788}],[{"start":{"row":30,"column":76},"end":{"row":30,"column":77},"action":"insert","lines":["d"],"id":789}],[{"start":{"row":30,"column":77},"end":{"row":30,"column":78},"action":"insert","lines":["r"],"id":790}],[{"start":{"row":30,"column":78},"end":{"row":30,"column":79},"action":"insert","lines":["e"],"id":791}],[{"start":{"row":30,"column":79},"end":{"row":30,"column":80},"action":"insert","lines":["s"],"id":792}],[{"start":{"row":30,"column":80},"end":{"row":30,"column":81},"action":"insert","lines":["s"],"id":793}],[{"start":{"row":30,"column":80},"end":{"row":30,"column":81},"action":"remove","lines":["s"],"id":794}],[{"start":{"row":30,"column":79},"end":{"row":30,"column":80},"action":"remove","lines":["s"],"id":795}],[{"start":{"row":30,"column":78},"end":{"row":30,"column":79},"action":"remove","lines":["e"],"id":796}],[{"start":{"row":30,"column":77},"end":{"row":30,"column":78},"action":"remove","lines":["r"],"id":797}],[{"start":{"row":30,"column":76},"end":{"row":30,"column":77},"action":"remove","lines":["d"],"id":798}],[{"start":{"row":30,"column":75},"end":{"row":30,"column":76},"action":"remove","lines":["d"],"id":799}],[{"start":{"row":30,"column":74},"end":{"row":30,"column":75},"action":"remove","lines":["a"],"id":800}],[{"start":{"row":30,"column":74},"end":{"row":30,"column":75},"action":"insert","lines":["("],"id":801}],[{"start":{"row":30,"column":75},"end":{"row":30,"column":76},"action":"insert","lines":["a"],"id":802}],[{"start":{"row":30,"column":76},"end":{"row":30,"column":77},"action":"insert","lines":["d"],"id":803}],[{"start":{"row":30,"column":77},"end":{"row":30,"column":78},"action":"insert","lines":["d"],"id":804}],[{"start":{"row":30,"column":78},"end":{"row":30,"column":79},"action":"insert","lines":["r"],"id":805}],[{"start":{"row":30,"column":79},"end":{"row":30,"column":80},"action":"insert","lines":["e"],"id":806}],[{"start":{"row":30,"column":80},"end":{"row":30,"column":81},"action":"insert","lines":["s"],"id":807}],[{"start":{"row":30,"column":81},"end":{"row":30,"column":82},"action":"insert","lines":["s"],"id":808}],[{"start":{"row":30,"column":82},"end":{"row":30,"column":83},"action":"insert","lines":[" "],"id":809}],[{"start":{"row":30,"column":83},"end":{"row":30,"column":84},"action":"insert","lines":["p"],"id":810}],[{"start":{"row":30,"column":84},"end":{"row":30,"column":85},"action":"insert","lines":["r"],"id":811}],[{"start":{"row":30,"column":85},"end":{"row":30,"column":86},"action":"insert","lines":["o"],"id":812}],[{"start":{"row":30,"column":86},"end":{"row":30,"column":87},"action":"insert","lines":["p"],"id":813}],[{"start":{"row":30,"column":87},"end":{"row":30,"column":88},"action":"insert","lines":["A"],"id":814}],[{"start":{"row":30,"column":88},"end":{"row":30,"column":89},"action":"insert","lines":["d"],"id":815}],[{"start":{"row":30,"column":89},"end":{"row":30,"column":90},"action":"insert","lines":["d"],"id":816}],[{"start":{"row":30,"column":90},"end":{"row":30,"column":91},"action":"insert","lines":["r"],"id":817}],[{"start":{"row":30,"column":91},"end":{"row":30,"column":92},"action":"insert","lines":[")"],"id":818}],[{"start":{"row":36,"column":17},"end":{"row":37,"column":0},"action":"insert","lines":["",""],"id":819},{"start":{"row":37,"column":0},"end":{"row":37,"column":2},"action":"insert","lines":["\t\t"]}],[{"start":{"row":37,"column":2},"end":{"row":37,"column":3},"action":"insert","lines":["r"],"id":820}],[{"start":{"row":37,"column":3},"end":{"row":37,"column":4},"action":"insert","lines":["e"],"id":821}],[{"start":{"row":37,"column":4},"end":{"row":37,"column":5},"action":"insert","lines":["t"],"id":822}],[{"start":{"row":37,"column":5},"end":{"row":37,"column":6},"action":"insert","lines":["u"],"id":823}],[{"start":{"row":37,"column":6},"end":{"row":37,"column":7},"action":"insert","lines":["r"],"id":824}],[{"start":{"row":37,"column":7},"end":{"row":37,"column":8},"action":"insert","lines":["n"],"id":825}],[{"start":{"row":37,"column":8},"end":{"row":37,"column":9},"action":"insert","lines":[" "],"id":826}],[{"start":{"row":37,"column":9},"end":{"row":37,"column":10},"action":"insert","lines":["p"],"id":827}],[{"start":{"row":37,"column":10},"end":{"row":37,"column":11},"action":"insert","lines":["r"],"id":828}],[{"start":{"row":37,"column":11},"end":{"row":37,"column":12},"action":"insert","lines":["o"],"id":829}],[{"start":{"row":37,"column":12},"end":{"row":37,"column":13},"action":"insert","lines":["p"],"id":830}],[{"start":{"row":37,"column":13},"end":{"row":37,"column":14},"action":"insert","lines":[";"],"id":831}]]},"ace":{"folds":[],"scrolltop":1006,"scrollleft":0,"selection":{"start":{"row":88,"column":15},"end":{"row":88,"column":15},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1449360475913,"hash":"569f17d78b65ecc79701aa396e584c2ea1027028"}