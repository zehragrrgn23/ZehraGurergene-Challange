import { getFullnodeUrl } from "@mysten/sui/client";
import { createNetworkConfig } from "@mysten/dapp-kit";

/**
 * Package ID retrieved from transaction summary, after runnning `sui client publish`
 *
 * Example:
 * ```bash
 *  Published Objects:
 * ┌──
 * │ PackageID: 0xdbd32a4b9802fab3bca9f7c7cb339d9a88d3b271581280cb83df487ce87a65e6
 * │ Version: 1
 * │ Digest: bn8Vs7TgMzhyPN4GtjDdjTfufX67dErp4926bQeCSFr
 * │ Modules: arena, hero, marketplace
 * └──
 */
const PACKAGE_ID ="0x0a31f4a5fe44ce7eab76aeda04390c4df2de6517e52c94f8ba5e7d50192214f9";

const { networkConfig, useNetworkVariable, useNetworkVariables } =
  createNetworkConfig({
    devnet: {
      url: getFullnodeUrl("devnet"),
      variables: { packageId: PACKAGE_ID },
    },
    testnet: {
      url: getFullnodeUrl("testnet"),
      variables: { packageId: PACKAGE_ID },
    },
    mainnet: {
      url: getFullnodeUrl("mainnet"),
      variables: { packageId: PACKAGE_ID },
    },
  });

export { useNetworkVariable, useNetworkVariables, networkConfig };
