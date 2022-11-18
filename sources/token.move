module owner::Token {
    use aptos_framework::coin;
    use std::string;
    use std::signer;

    struct Token {}

    struct Capabilities<phantom Token> has key {
        mint_capability: coin::MintCapability<Token>,
        burn_capability: coin::BurnCapability<Token>,
        freeze_capability: coin::FreezeCapability<Token>
    }

    const ERR_NEED_CAPABILITIES: u64 = 0;

    entry fun initialize(account: &signer) {
        let (burn_capability, freeze_capability, mint_capability) = coin::initialize<Token>(
            account,
            string::utf8(b"Token Name"),
            string::utf8(b"SYMB"),
            18,
            true,
        );

        move_to<Capabilities<Token>>(account, Capabilities<Token> {
            mint_capability,
            burn_capability,
            freeze_capability
        });
    }

    public fun mint(account: &signer, to: address, amount: u64) acquires Capabilities {
        assert!(exists<Capabilities<Token>>(signer::address_of(account)), ERR_NEED_CAPABILITIES);

        let capabilities = borrow_global<Capabilities<Token>>(signer::address_of(account));

        let resourse = coin::mint<Token>(amount, &capabilities.mint_capability);

        coin::deposit(to, resourse);
    }
}