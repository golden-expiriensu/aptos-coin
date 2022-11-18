script {
    use std::coin;
    use owner::Token;

    fun main(account: signer) {
        coin::register<Token::Token>(&account)
    }
}