// This code is generated automatically using deployer's(console.hashingsystems.com) interface generator
// @createdDate : Fri May 08 2020 13:48:58 GMT-0700 (Pacific Daylight Time) 
// @dependencies : hash-sdk 
// @language : JavaScript
// hash-sdk should be installed 
// # npm i hash-sdk 
// # yarn add hash-sdk 

const hash = require("hash-sdk"); 
          
(function(exports) { 
  /**
    * Initializes an account for interacting with below functions
    */
    exports.init = async() => {
        try{
            // Setting it default to software it talks to sdk directly
            await hash.setProvider('software');
            const accountData = {
                    accountId: "0.0.68350" /*<accountId(0.0.1234)>*/,
                    network: "testnet" /*<mainnet | testnet>*/,
                    keys: {
                      privateKey: "302e020100300506032b657004220420b9cdcce9a18bcefa21f332a968ffec63c0d727f318c474763420e3f7bbf02e97" /*<alphanumeric user privatekey>*/
                    }
                  };
            await hash.setAccount(accountData);
        }catch(e){
            console.log('Error in intializing account:::',e);
            throw e;
        }
    };
exports.scHelloWorld = {
	update : async(newMessage) => {
      const data  = {
          memo: "smart contract call",
          contractid: "0.0.41538",
          abi:[{"constant":false,"inputs":[{"name":"newMessage","type":"string"}],"name":"update","payable":false,"stateMutability":"nonpayable","type":"function","contractId":{"contract":41538,"realm":0,"shard":0},"contractName":"HelloWorld"}],
          params:[newMessage],
          amount: 0
      }
      return await hash.triggerSmartContract(data);
    },

    message : async() => {
      const data  = {
          memo: "smart contract call",
          contractid: "0.0.41538",
          abi:[{"constant":true,"name":"message","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function","contractId":{"contract":41538,"realm":0,"shard":0},"contractName":"HelloWorld"}],
          params:[],
          amount: 0
      }
      return await hash.triggerSmartContract(data);
    }
};
  
  exports.scSimpleSender = {
	addTwoNumber : async() => {
      const data  = {
          memo: "smart contract call",
          contractid: "0.0.58699",
          abi:[{"constant":false,"inputs":[{"name":"a","type":"uint"},{"name":"b","type":"uint256"}],"name":"addTwoNumber","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function","contractId":{"contract":58699,"realm":0,"shard":0},"contractName":"SimpleSender"}],
          params:["1", "2"],
          amount: 0
      }
      return await hash.triggerSmartContract(data);
    }
}; 
  
  exports.scSimpleTester = {
	addTwoNumber : async(a, b) => {
      const data  = {
          memo: "smart contract call",
          contractid: "0.0.63414",
          abi:[{"constant":false,"inputs":[{"name":"a","type":"uint256"},{"name":"b","type":"uint256"}],"name":"addTwoNumber","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function","contractId":{"contract":63414,"realm":0,"shard":0},"contractName":"SimpleTester"}],
          params:[a, b],
          amount: 0
      }
      return await hash.triggerSmartContract(data);
    }
}; 


exports.topicThisIsMyTestTopic = {
      topicUpdate : async(updatedData) => {
          const data = {
              topicId:"0.0.41536"
          }
          if(updatedData.topicName){
              data.memo = updatedData.topicName;
          }
          if(updatedData.submitKeyList){
            data.submitKeyList = updatedData.submitKeyList;
          }
          if(updatedData.expirationTime){
            data.expirationTime = updatedData.expirationTime;
          }
          return await hash.triggerTopicUpdate(data);
      },
      

      topicInfo : async() => {
          const data  = {
              memo: "consensus topic info",
              topicId:"0.0.41536"
          }
          return await hash.triggerTopicInfo(data);
      },
      

      topicDelete : async() => {
          const data = {
              memo: "consensus topic delete",
              topicId:"0.0.41536"
          }
          return await hash.triggerTopicDelete(data);
      },
      

      messageSubmit : async(message=" ") => {
          const data = {
              memo: "consensus message submit",
              topicId:"0.0.41536",
              message
          }
          return await hash.triggerMessageSubmit(data);
      }
    }; 
        exports.hashSdk = hash;
        })(typeof exports === 'undefined'? module.exports: exports);
    
   