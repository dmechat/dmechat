class TokenBalance {
  final String id;
  final double balance;
  final String tokenName;
  final String tokenContractAddress;

  TokenBalance({
    this.id,
    this.balance,
    this.tokenName,
    this.tokenContractAddress,
  });
}

class Wallet {
  final String address;
  final List<TokenBalance> balances;
  final TokenBalance nativeBalance;
  Wallet({this.address, this.balances, this.nativeBalance});
}
