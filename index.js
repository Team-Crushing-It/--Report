const operatorAccountId = "0.0.68201";
const operatorPrivateKey = "302e020100300506032b657004220420cd79d47095ce904cc08897bbfb59708a8876c7f26eddc185be1f1bba74d282b8";
const { Client, ConsensusTopicCreateTransaction } = require("@hashgraph/sdk");

async function main() {
    const operatorAccount = "0.0.68201";
    const operatorPrivateKey = "302e020100300506032b657004220420cd79d47095ce904cc08897bbfb59708a8876c7f26eddc185be1f1bba74d282b8";

    if (operatorPrivateKey == null || operatorAccount == null) {
        throw new Error("environment variables OPERATOR_KEY and OPERATOR_ID must be present");
    }

    const client = Client.forTestnet();
    client.setOperator(operatorAccount, operatorPrivateKey);

    const tx = await new ConsensusTopicCreateTransaction().execute(client);
    console.log("tx:", tx);

    const receipt = await tx.getReceipt(client);
    const newTopicId = receipt.getTopicId();
    console.log("new HCS topic ID:", newTopicId);
}

main();