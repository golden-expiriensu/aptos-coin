script {
    use std::coin;
    use owner::Token;

    fun main(account: signer, to: address, amount: u64) {
        coin::transfer<Token::Token>(&account, to, amount);
    }
}