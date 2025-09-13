# Scroll Ecosystem Contract Tests

This directory contains tests for various contracts deployed on the Scroll ecosystem to verify they are live and accessible.

## EAS (Ethereum Attestation Service) Test

**Contract**: EAS Demo Contract  
**Network**: Scroll Sepolia Testnet  
**RPC**: https://sepolia-rpc.scroll.io  
**EAS Address**: `0xaEF4103A04090071165F78D45D83A0C0782c2B2a`

### What it tests:
- ✅ EAS contract is deployed and accessible on Scroll Sepolia
- ✅ Scroll Sepolia testnet connection is working
- ✅ Demo contract can be deployed successfully

### Running the test:
```bash
forge test --match-contract EASDemoTest -vv
```

### Expected output:
- EAS contract code size: ~18,881 bytes
- Current block number: > 12,000,000
- All 3 tests passing

This test verifies that the EAS infrastructure is live and ready for developers to build attestation-based applications on Scroll.
