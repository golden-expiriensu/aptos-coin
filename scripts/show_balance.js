import fetch from 'node-fetch';

const show_balance = (moduleAddress, account) => {
    const options = { method: 'GET', headers: { 'Content-Type': 'application/json' } };

    const tokenPhantom = moduleAddress + "::Token::Token";
    const resourceType = `0x1::coin::CoinStore<${tokenPhantom}>`

    fetch(`https://fullnode.testnet.aptoslabs.com/v1/accounts/${account}/resource/${resourceType}`, options)
        .then(response => response.json())
        .then(response => console.log(response.data.coin.value))
        .catch(err => console.error(err));
}

show_balance(process.argv[2], process.argv[3]);
