contract SchellingCoin{
  struct SchellingContest{
    address[] public allowedMembers;
    bytes32 public name;
    mapping (address => bytes32) HashedGuesses;
    mapping (address => int) Guesses;
    uint public guesscount;
    uint endTime;
  SchellingContest[] public SchellingContests;

 //Hash Submission
 function submitHash(){
   if ( (block.number % 100 < 50) && (Guessess[msg.sender] != 0;)) throw;{
     SchellingContest[].push;
   }
 }


  function GetResults (int8 type, uint32 contestNum) returns (int contestResult){

    //Mean
    if (type = 1){

    }

    //Median
    if (type = 2){

    }

    //Mode
    if (type = 3){

    }
    //Gemoetric Mean
    if (type = 1){
    }
  }

  function RedistributeCoins (int8 type, )
}
