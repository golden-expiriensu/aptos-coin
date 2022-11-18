script {
    use owner::Token;

    fun main(account: signer, to: address, amount: u64) {
        Token::mint(&account, to, amount);
    }
}