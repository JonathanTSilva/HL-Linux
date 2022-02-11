# Dicionário do Linux

## Criptografia

No universo da criptografia, existem pelo menos 3 tipos de tecnologias básicas: algoritmos de Digest, de encriptação reversível

### Digest

Literalmente digerem qualquer blob de bits e devolvem uma impressão digital de tamanho fixo. Ex:

- MD5;
- SHA1;
- SHA512;
- BCRYPT;
- HMAC.

Pode ser passados para eles uma palavra ou diversas e sempre será retornado uma string de tamanho fixo (variando para cada tipo).

### Symmetric Encryption

- Triple DES;
- Blowfish;
- AES.

### Asymmetric Encryption

Geração de duas chaves (que costumam ser dois números primos relacionados). Uma é chamada de chave privada e a outra de chave pública.
