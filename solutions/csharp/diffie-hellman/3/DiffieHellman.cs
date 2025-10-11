using System;
using System.Numerics;

public static class DiffieHellman
{
    public static BigInteger PrivateKey(BigInteger primeP) =>
        new Random().NextInt64((long)primeP - 1) + 1;

    public static BigInteger PublicKey(
           BigInteger primeP,
           BigInteger primeG,
           BigInteger privateKey) =>
        BigInteger.ModPow(primeG, privateKey, primeP);

    public static BigInteger Secret(
            BigInteger primeP,
            BigInteger publicKey,
            BigInteger privateKey) =>
        BigInteger.ModPow(publicKey, privateKey, primeP);
}
