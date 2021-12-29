const deploy = async () => {
    const [deployer] = await ethers.getSigners();
    
    console.log("deploying contract with the account:", deployer.address);

    const VitalikPunks = await ethers.getContractFactory("VitalikPunks");
    const deployed = await VitalikPunks.deploy();

    console.log("Vitalik Punks is deployed at:", deployed.address);
};  


deploy () 
    .then (() => process.exit(0))
    .catch ((error) => {
        console.log(error);
        process.exit(1);
    });