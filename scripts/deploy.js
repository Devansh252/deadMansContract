async function main() {
  const DeadMansSwitch = await ethers.getContractFactory("DeadMansSwitch");

  // Start deployment, returning a promise that resolves to a contract object
  const dead_man = await DeadMansSwitch.deploy();
  console.log("Contract deployed to address:", dead_man.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
