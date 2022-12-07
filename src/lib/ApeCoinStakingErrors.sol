// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

error DepositMoreThanOneAPE();
error InvalidPoolId();
error StartMustBeGreaterThanEnd();
error StartNotWholeHour();
error EndNotWholeHour();
error StartMustEqualLastEnd();
error CallerNotOwner();
error MainTokenNotOwnedOrPaired();
error BAKCNotOwnedOrPaired();
error BAKCAlreadyPaired();
error ExceededCapAmount();
error NotOwnerOfMain();
error NotOwnerOfBAKC();
error ProvidedTokensNotPaired();
error ExceededStakedAmount();
error NeitherTokenInPairOwnedByCaller();
error SplitPairCantPartiallyWithdraw();
error UncommitWrongParameters();
