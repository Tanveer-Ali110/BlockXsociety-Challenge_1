//pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;


contract Chalange_1 {
    
    uint256 public count;
    mapping (uint256 => User) Users;

    struct User {
        string name;
        address userAddress;
        uint256 age;
    }
    constructor() public {
        count = 0;
    }
    
    function addUser(string memory _name, uint256 _age) public {
        Users[count].name = _name;
        Users[count].age = _age;
        Users[count].userAddress = msg.sender;
        count = count +1;
    }
    function getAge(uint256 _index) view public returns (uint256 _age){
        _age = Users[_index].age;
    }
    function getName(uint256 _index) view public returns (string memory _name){
        _name = Users[_index].name;
    }
    function getuserAddress(uint256 _index) view public returns (address _address){
        _address = Users[_index].userAddress;
    }
    function getUsers() view public returns(address[] memory, string[] memory, uint256[] memory){
       
        address[] memory _userAddress = new address[](count);
        string[] memory _name = new string[](count);
        uint256[] memory _age = new uint256[](count);
        
        
        for(uint i=0;i<count;i++){
        _userAddress[i]= Users[i].userAddress;
        _name[i] = Users[i].name;
        _age[i] = Users[i].age;
        }
        return (_userAddress,_name,_age);
    }
}