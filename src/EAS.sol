//////////////////////////////////////////////////////////////////
//EAS
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { IEAS, AttestationRequest, AttestationRequestData, RevocationRequest, RevocationRequestData } from "@ethereum-attestation-service/eas-contracts/contracts/IEAS.sol";
import { NO_EXPIRATION_TIME, EMPTY_UID } from "@ethereum-attestation-service/eas-contracts/contracts/Common.sol";

contract EAS
{
    address easAddress = 0xaEF4103A04090071165F78D45D83A0C0782c2B2a;
    bytes32 schema = 0x27d06e3659317e9a4f8154d1e849eb53d43d91fb4f219884d1684f86d797804a;
    
    // check at https://scroll-sepolia.easscan.org/schema/view/0x27d06e3659317e9a4f8154d1e849eb53d43d91fb4f219884d1684f86d797804a

    function sendIsFriend(address to, bool isFriend) public returns(bytes32)
    {
        return IEAS(easAddress).attest(
                AttestationRequest({
                    schema: schema,
                    data: AttestationRequestData({
                        recipient: to,
                        expirationTime: NO_EXPIRATION_TIME,
                        revocable: false,
                        refUID: EMPTY_UID,
                        data: abi.encode(isFriend),
                        value: 0 // No value/ETH
                    })
                })
            );
    }
}
