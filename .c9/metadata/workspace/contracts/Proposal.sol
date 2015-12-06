{"changed":true,"filter":false,"title":"Proposal.sol","tooltip":"/contracts/Proposal.sol","value":"contract Proposal {\n\tstring public organization;\n\taddress public owner;\n\tstring public description;\n\tstring public name;\n\taddress[] public voted;\n\tuint public forVotes;\n\tuint public againstVotes;\n\tuint public bal;\n\tuint public startTime;\n\tuint public endTime;\n\tuint public nbVoters;\n\tuint Now = now;\n\n\n\tfunction Proposal(string orgName, string newName, string newDescription, uint startime, uint endtime) {\n\t\torganization = orgName;\n\t\towner = msg.sender;\n\t\tname = newName;\n\t\tstartTime = startime;\n\t\tendTime = endtime;\n\t\tdescription = newDescription;\n\t}\n\n\tfunction toTime(uint fakeTime) {\n\t\tNow = fakeTime;\n\n\t}\n\n\tfunction vote(bool vote, uint weight, address member) {\n\t\tif(msg.sender != owner) { return; }\n\n\t\tvoted.push(member);\n\t\tbal += weight * weight;\n\t\tnbVoters++;\n\t\tif(vote) {\n\t\t\tforVotes += weight;\n\t\t\treturn;\n\t\tagainstVotes += weight;\n\t\treturn;\n\t\t}\n\t}\n\t\n\t//We should allow for a supermajority as well- return the ratio of forVotes to againstVotes and let the organization decides what that means\n\tfunction Results() returns (uint result) {\n\t\tif( Now < endTime ) { return; }\n\t\treturn forVotes/againstVotes;\n\t}\n\t\n\tfunction totalResult() returns (uint result) {\n\t\tif( Now < endTime ) { return; }\n\t\treturn forVotes - againstVotes;\n\t}\n\tfunction destroy() {\n\t\tif (msg.sender == owner) { // without this funds could be locked in the contract forever!\n\t\t\tsuicide(owner);\n\t\t}\n\t}\n}\n","undoManager":{"mark":57,"position":100,"stack":[[{"start":{"row":50,"column":10},"end":{"row":50,"column":11},"action":"insert","lines":["t"],"id":1120}],[{"start":{"row":50,"column":11},"end":{"row":50,"column":12},"action":"insert","lines":["o"],"id":1121}],[{"start":{"row":50,"column":12},"end":{"row":50,"column":13},"action":"insert","lines":["t"],"id":1122}],[{"start":{"row":50,"column":13},"end":{"row":50,"column":14},"action":"insert","lines":["a"],"id":1123}],[{"start":{"row":50,"column":14},"end":{"row":50,"column":15},"action":"insert","lines":["l"],"id":1124}],[{"start":{"row":50,"column":15},"end":{"row":50,"column":16},"action":"insert","lines":["R"],"id":1125}],[{"start":{"row":50,"column":16},"end":{"row":50,"column":17},"action":"insert","lines":["e"],"id":1126}],[{"start":{"row":50,"column":17},"end":{"row":50,"column":18},"action":"insert","lines":["s"],"id":1127}],[{"start":{"row":50,"column":18},"end":{"row":50,"column":19},"action":"insert","lines":["u"],"id":1128}],[{"start":{"row":50,"column":19},"end":{"row":50,"column":20},"action":"insert","lines":["l"],"id":1129}],[{"start":{"row":50,"column":20},"end":{"row":50,"column":21},"action":"insert","lines":["t"],"id":1130}],[{"start":{"row":50,"column":21},"end":{"row":50,"column":23},"action":"insert","lines":["()"],"id":1131}],[{"start":{"row":50,"column":23},"end":{"row":50,"column":24},"action":"insert","lines":[" "],"id":1132}],[{"start":{"row":50,"column":24},"end":{"row":50,"column":25},"action":"insert","lines":["r"],"id":1133}],[{"start":{"row":50,"column":25},"end":{"row":50,"column":26},"action":"insert","lines":["e"],"id":1134}],[{"start":{"row":50,"column":26},"end":{"row":50,"column":27},"action":"insert","lines":["u"],"id":1135}],[{"start":{"row":50,"column":27},"end":{"row":50,"column":28},"action":"insert","lines":["t"],"id":1136}],[{"start":{"row":50,"column":27},"end":{"row":50,"column":28},"action":"remove","lines":["t"],"id":1137}],[{"start":{"row":50,"column":26},"end":{"row":50,"column":27},"action":"remove","lines":["u"],"id":1138}],[{"start":{"row":50,"column":26},"end":{"row":50,"column":27},"action":"insert","lines":["t"],"id":1139}],[{"start":{"row":50,"column":27},"end":{"row":50,"column":28},"action":"insert","lines":["u"],"id":1140}],[{"start":{"row":50,"column":28},"end":{"row":50,"column":29},"action":"insert","lines":["r"],"id":1141}],[{"start":{"row":50,"column":29},"end":{"row":50,"column":30},"action":"insert","lines":["n"],"id":1142}],[{"start":{"row":50,"column":30},"end":{"row":50,"column":31},"action":"insert","lines":["s"],"id":1143}],[{"start":{"row":50,"column":31},"end":{"row":50,"column":32},"action":"insert","lines":[" "],"id":1144}],[{"start":{"row":50,"column":31},"end":{"row":50,"column":32},"action":"remove","lines":[" "],"id":1145}],[{"start":{"row":50,"column":31},"end":{"row":50,"column":33},"action":"insert","lines":["()"],"id":1146}],[{"start":{"row":50,"column":31},"end":{"row":50,"column":33},"action":"remove","lines":["()"],"id":1147}],[{"start":{"row":50,"column":31},"end":{"row":50,"column":32},"action":"insert","lines":[" "],"id":1148}],[{"start":{"row":50,"column":32},"end":{"row":50,"column":34},"action":"insert","lines":["()"],"id":1149}],[{"start":{"row":50,"column":33},"end":{"row":50,"column":34},"action":"insert","lines":["i"],"id":1150}],[{"start":{"row":50,"column":34},"end":{"row":50,"column":35},"action":"insert","lines":["n"],"id":1151}],[{"start":{"row":50,"column":35},"end":{"row":50,"column":36},"action":"insert","lines":["t"],"id":1152}],[{"start":{"row":50,"column":35},"end":{"row":50,"column":36},"action":"remove","lines":["t"],"id":1153}],[{"start":{"row":50,"column":34},"end":{"row":50,"column":35},"action":"remove","lines":["n"],"id":1154}],[{"start":{"row":50,"column":33},"end":{"row":50,"column":34},"action":"remove","lines":["i"],"id":1155}],[{"start":{"row":50,"column":33},"end":{"row":50,"column":34},"action":"insert","lines":["u"],"id":1156}],[{"start":{"row":50,"column":34},"end":{"row":50,"column":35},"action":"insert","lines":["i"],"id":1157}],[{"start":{"row":50,"column":35},"end":{"row":50,"column":36},"action":"insert","lines":["n"],"id":1158}],[{"start":{"row":50,"column":36},"end":{"row":50,"column":37},"action":"insert","lines":["t"],"id":1159}],[{"start":{"row":50,"column":37},"end":{"row":50,"column":38},"action":"insert","lines":[" "],"id":1160}],[{"start":{"row":50,"column":38},"end":{"row":50,"column":39},"action":"insert","lines":["r"],"id":1161}],[{"start":{"row":50,"column":39},"end":{"row":50,"column":40},"action":"insert","lines":["e"],"id":1162}],[{"start":{"row":50,"column":40},"end":{"row":50,"column":41},"action":"insert","lines":["s"],"id":1163}],[{"start":{"row":50,"column":41},"end":{"row":50,"column":42},"action":"insert","lines":["u"],"id":1164}],[{"start":{"row":50,"column":42},"end":{"row":50,"column":43},"action":"insert","lines":["l"],"id":1165}],[{"start":{"row":50,"column":43},"end":{"row":50,"column":44},"action":"insert","lines":["t"],"id":1166}],[{"start":{"row":50,"column":45},"end":{"row":50,"column":46},"action":"insert","lines":["{"],"id":1167}],[{"start":{"row":50,"column":45},"end":{"row":50,"column":46},"action":"remove","lines":["{"],"id":1168}],[{"start":{"row":50,"column":45},"end":{"row":50,"column":46},"action":"insert","lines":[" "],"id":1169}],[{"start":{"row":50,"column":46},"end":{"row":50,"column":47},"action":"insert","lines":["{"],"id":1170}],[{"start":{"row":50,"column":47},"end":{"row":52,"column":2},"action":"insert","lines":["","\t\t","\t}"],"id":1171}],[{"start":{"row":51,"column":2},"end":{"row":51,"column":33},"action":"insert","lines":["if( Now < endTime ) { return; }"],"id":1172}],[{"start":{"row":51,"column":33},"end":{"row":52,"column":0},"action":"insert","lines":["",""],"id":1173},{"start":{"row":52,"column":0},"end":{"row":52,"column":2},"action":"insert","lines":["\t\t"]}],[{"start":{"row":52,"column":2},"end":{"row":52,"column":3},"action":"insert","lines":["i"],"id":1174}],[{"start":{"row":52,"column":2},"end":{"row":52,"column":3},"action":"remove","lines":["i"],"id":1175}],[{"start":{"row":46,"column":0},"end":{"row":46,"column":29},"action":"remove","lines":["\t\tif(forVotes > againstVotes)"],"id":1176}],[{"start":{"row":45,"column":33},"end":{"row":46,"column":0},"action":"remove","lines":["",""],"id":1177}],[{"start":{"row":50,"column":33},"end":{"row":51,"column":0},"action":"insert","lines":["",""],"id":1178},{"start":{"row":51,"column":0},"end":{"row":51,"column":2},"action":"insert","lines":["\t\t"]}],[{"start":{"row":51,"column":2},"end":{"row":51,"column":3},"action":"insert","lines":["r"],"id":1179}],[{"start":{"row":51,"column":3},"end":{"row":51,"column":4},"action":"insert","lines":["e"],"id":1180}],[{"start":{"row":51,"column":4},"end":{"row":51,"column":5},"action":"insert","lines":["t"],"id":1181}],[{"start":{"row":51,"column":5},"end":{"row":51,"column":6},"action":"insert","lines":["u"],"id":1182}],[{"start":{"row":51,"column":6},"end":{"row":51,"column":7},"action":"insert","lines":["n"],"id":1183}],[{"start":{"row":51,"column":7},"end":{"row":51,"column":8},"action":"insert","lines":["r"],"id":1184}],[{"start":{"row":51,"column":8},"end":{"row":51,"column":9},"action":"insert","lines":[" "],"id":1185}],[{"start":{"row":51,"column":8},"end":{"row":51,"column":9},"action":"remove","lines":[" "],"id":1186}],[{"start":{"row":51,"column":7},"end":{"row":51,"column":8},"action":"remove","lines":["r"],"id":1187}],[{"start":{"row":51,"column":6},"end":{"row":51,"column":7},"action":"remove","lines":["n"],"id":1188}],[{"start":{"row":51,"column":6},"end":{"row":51,"column":7},"action":"insert","lines":["r"],"id":1189}],[{"start":{"row":51,"column":7},"end":{"row":51,"column":8},"action":"insert","lines":["n"],"id":1190}],[{"start":{"row":51,"column":8},"end":{"row":51,"column":9},"action":"insert","lines":[" "],"id":1191}],[{"start":{"row":51,"column":9},"end":{"row":51,"column":10},"action":"insert","lines":["f"],"id":1192}],[{"start":{"row":51,"column":10},"end":{"row":51,"column":11},"action":"insert","lines":["o"],"id":1193}],[{"start":{"row":51,"column":11},"end":{"row":51,"column":12},"action":"insert","lines":["r"],"id":1194}],[{"start":{"row":51,"column":12},"end":{"row":51,"column":13},"action":"insert","lines":["V"],"id":1195}],[{"start":{"row":51,"column":13},"end":{"row":51,"column":14},"action":"insert","lines":["o"],"id":1196}],[{"start":{"row":51,"column":14},"end":{"row":51,"column":15},"action":"insert","lines":["t"],"id":1197}],[{"start":{"row":51,"column":15},"end":{"row":51,"column":16},"action":"insert","lines":["e"],"id":1198}],[{"start":{"row":51,"column":16},"end":{"row":51,"column":17},"action":"insert","lines":["s"],"id":1199}],[{"start":{"row":51,"column":17},"end":{"row":51,"column":18},"action":"insert","lines":[" "],"id":1200}],[{"start":{"row":51,"column":18},"end":{"row":51,"column":19},"action":"insert","lines":["-"],"id":1201}],[{"start":{"row":51,"column":19},"end":{"row":51,"column":20},"action":"insert","lines":[" "],"id":1202}],[{"start":{"row":51,"column":20},"end":{"row":51,"column":21},"action":"insert","lines":["a"],"id":1203}],[{"start":{"row":51,"column":21},"end":{"row":51,"column":22},"action":"insert","lines":["g"],"id":1204}],[{"start":{"row":51,"column":22},"end":{"row":51,"column":23},"action":"insert","lines":["i"],"id":1205}],[{"start":{"row":51,"column":22},"end":{"row":51,"column":23},"action":"remove","lines":["i"],"id":1206}],[{"start":{"row":51,"column":22},"end":{"row":51,"column":23},"action":"insert","lines":["a"],"id":1207}],[{"start":{"row":51,"column":23},"end":{"row":51,"column":24},"action":"insert","lines":["i"],"id":1208}],[{"start":{"row":51,"column":24},"end":{"row":51,"column":25},"action":"insert","lines":["n"],"id":1209}],[{"start":{"row":51,"column":25},"end":{"row":51,"column":26},"action":"insert","lines":["s"],"id":1210}],[{"start":{"row":51,"column":26},"end":{"row":51,"column":27},"action":"insert","lines":["t"],"id":1211}],[{"start":{"row":51,"column":27},"end":{"row":51,"column":28},"action":"insert","lines":["V"],"id":1212}],[{"start":{"row":51,"column":28},"end":{"row":51,"column":29},"action":"insert","lines":["o"],"id":1213}],[{"start":{"row":51,"column":29},"end":{"row":51,"column":30},"action":"insert","lines":["t"],"id":1214}],[{"start":{"row":51,"column":30},"end":{"row":51,"column":31},"action":"insert","lines":["e"],"id":1215}],[{"start":{"row":51,"column":31},"end":{"row":51,"column":32},"action":"insert","lines":["s"],"id":1216}],[{"start":{"row":51,"column":32},"end":{"row":51,"column":33},"action":"insert","lines":[";"],"id":1217}],[{"start":{"row":52,"column":1},"end":{"row":52,"column":2},"action":"remove","lines":["\t"],"id":1218}],[{"start":{"row":52,"column":0},"end":{"row":52,"column":1},"action":"remove","lines":["\t"],"id":1219}],[{"start":{"row":51,"column":33},"end":{"row":52,"column":0},"action":"remove","lines":["",""],"id":1220}]]},"ace":{"folds":[],"scrolltop":574.5,"scrollleft":16.5,"selection":{"start":{"row":53,"column":19},"end":{"row":53,"column":19},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":40,"state":"no_regex","mode":"plugins/ethergit.solidity.language/solidity_mode"}},"timestamp":1449360554751}