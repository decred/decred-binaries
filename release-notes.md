## 2018-09-21


## Install

To install the command line tools, please see [dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run [decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.3.0/decrediton-v1.3.0.tar.gz) or [decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.3.0/decrediton-v1.3.0.dmg) or [decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.3.0/decrediton-v1.3.0.exe).

See manifest-v1.3.0.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v130)
* [dcrwallet](#dcrwallet-v130)
* [decrediton](#decrediton-v130)


# dcrd v1.3.0

This release of dcrd contains significant performance enhancements for startup
speed, validation, and network operations that directly benefit lightweight
clients, such as SPV (Simplified Payment Verification) wallets, a policy change
to reduce the default minimum transaction fee rate, a new public test network
version, removal of bloom filter support, infrastructure improvements, and other
quality assurance changes.

**It is highly recommended that everyone upgrade to this latest release as it
contains many important scalability improvements and is required to be able to
use the new public test network.**

## Downgrade Warning

The database format in v1.3.0 is not compatible with previous versions of the
software.  This only affects downgrades as users upgrading from previous
versions will see a one time database migration.

Once this migration has been completed, it will no longer be possible to
downgrade to a previous version of the software without having to delete the
database and redownload the chain.

## Notable Changes

### Reduction of Default Minimum Transaction Fee Rate Policy

The default setting for the policy which specifies the minimum transaction fee
rate that will be accepted and relayed to the rest of the network has been
reduced to 0.0001 DCR/kB (10,000 atoms/kB) from the previous value of 0.001
DCR/kB (100,000 atoms/kB).

Transactions should not attempt to use the reduced fee rate until the majority
of the network has upgraded to this release as otherwise the transactions will
likely have issues relaying through the network since old nodes that have not
updated their policy will reject them due to not paying a high enough fee.

### Several Speed Optimizations

This release contains several enhancements to improve speed for startup,
the initial sync process, validation, and network operations.

In order to achieve these speedups, there is a one time database migration, as
previously mentioned, that typically only takes a few seconds to complete on
most hardware.

#### Further Improved Startup Speed

The startup time has been improved by roughly 2x on both slower hard disk drives
(HDDs) and solid state drives (SSDs) as compared to v1.2.0.

#### Significantly Faster Network Operations

The ability to serve information to other peers on the network has received
several optimizations which, in addition to generally improving the overall
scalability and throughput of the network, also directly benefits SPV
(Simplified Payment Verification) clients by delivering the block headers they
require roughly 3x to 4x faster.

#### Signature Hash Calculation Optimization

Part of validating that transactions are only spending coins that the owner has
authorized involves ensuring the validity of cryptographic signatures.  This
release provides a speedup of about 75% to a key portion of that validation
which results in a roughly 20% faster initial sync process.

### Bloom Filters Removal

Bloom filters were deprecated as of the last release in favor of the more recent
privacy-preserving GCS committed filters.  Consequently, this release removes
support for bloom filters completely.  There are no known clients which use
bloom filters, however, if there are any unknown clients which use them, those
clients will need to be updated to use the GCS committed filters accordingly.

### Public Test Network Version 3

The public test network has been reset and bumped to version 3.  All of the new
consensus rules voted in by version 2 of the public test network have been
retained and are therefore active on the new version 3 test network without
having to vote them in again.

## Changelog

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v1.2.0...release-v1.3.0).

### Protocol and network:

- chaincfg: Add checkpoints for 1.3.0 release ([decred/dcrd#1385](https://github.com/decred/dcrd/pull/1385))
- multi: Remove everything to do about bloom filters ([decred/dcrd#1162](https://github.com/decred/dcrd/pull/1162))
- wire: Remove TxSerializeWitnessSigning ([decred/dcrd#1180](https://github.com/decred/dcrd/pull/1180))
- addrmgr: Skip low quality addresses for getaddr ([decred/dcrd#1135](https://github.com/decred/dcrd/pull/1135))
- addrmgr: Fix race in save peers ([decred/dcrd#1259](https://github.com/decred/dcrd/pull/1259))
- server: Only respond to getaddr once per conn ([decred/dcrd#1257](https://github.com/decred/dcrd/pull/1257))
- peer: Rework version negotiation ([decred/dcrd#1250](https://github.com/decred/dcrd/pull/1250))
- peer: Allow OnVersion callback to reject peer ([decred/dcrd#1251](https://github.com/decred/dcrd/pull/1251))
- server: Reject outbound conns to non-full nodes ([decred/dcrd#1252](https://github.com/decred/dcrd/pull/1252))
- peer: Improve net address service adverts ([decred/dcrd#1253](https://github.com/decred/dcrd/pull/1253))
- addrmgr: Expose method to update services ([decred/dcrd#1254](https://github.com/decred/dcrd/pull/1254))
- server: Update addrmgr services on outbound conns ([decred/dcrd#1254](https://github.com/decred/dcrd/pull/1254))
- server: Use local inbound var in version handler ([decred/dcrd#1255](https://github.com/decred/dcrd/pull/1255))
- server: Only advertise local addr when current ([decred/dcrd#1256](https://github.com/decred/dcrd/pull/1256))
- server: Use local addr var in version handler ([decred/dcrd#1258](https://github.com/decred/dcrd/pull/1258))
- chaincfg: split params into per-network files ([decred/dcrd#1265](https://github.com/decred/dcrd/pull/1265))
- server: Always reply to getheaders with headers ([decred/dcrd#1295](https://github.com/decred/dcrd/pull/1295))
- addrmgr: skip never-successful addresses ([decred/dcrd#1313](https://github.com/decred/dcrd/pull/1313))
- multi: Introduce default coin type for SLIP0044 ([decred/dcrd#1293](https://github.com/decred/dcrd/pull/1293))
- blockchain: Modify diff redux logic for testnet ([decred/dcrd#1387](https://github.com/decred/dcrd/pull/1387))
- multi: Reset testnet and bump to version 3 ([decred/dcrd#1387](https://github.com/decred/dcrd/pull/1387))
- multi: Remove testnet version 2 defs and refs ([decred/dcrd#1387](https://github.com/decred/dcrd/pull/1387))

### Transaction relay (memory pool):

- policy: Lower default relay fee to 0.0001/kB ([decred/dcrd#1202](https://github.com/decred/dcrd/pull/1202))
- mempool: Use blockchain for tx expiry check ([decred/dcrd#1199](https://github.com/decred/dcrd/pull/1199))
- mempool: use secp256k1 functions directly ([decred/dcrd#1213](https://github.com/decred/dcrd/pull/1213))
- mempool: Make expiry pruning self contained ([decred/dcrd#1378](https://github.com/decred/dcrd/pull/1378))
- mempool: Stricter orphan evaluation and eviction ([decred/dcrd#1207](https://github.com/decred/dcrd/pull/1207))
- mempool: use secp256k1 functions directly ([decred/dcrd#1213](https://github.com/decred/dcrd/pull/1213))
- multi: add specialized rebroadcast handling for stake txs ([decred/dcrd#979](https://github.com/decred/dcrd/pull/979))
- mempool: Make expiry pruning self contained ([decred/dcrd#1378](https://github.com/decred/dcrd/pull/1378))

### RPC:

- rpcserver: Improve JSON-RPC compatibility ([decred/dcrd#1150](https://github.com/decred/dcrd/pull/1150))
- rpcserver: Correct rebroadcastwinners handler ([decred/dcrd#1234](https://github.com/decred/dcrd/pull/1234))
- dcrjson: Add Expiry field to CreateRawTransactionCmd ([decred/dcrd#1149](https://github.com/decred/dcrd/pull/1149))
- dcrjson: add estimatesmartfee ([decred/dcrd#1201](https://github.com/decred/dcrd/pull/1201))
- rpc: Use upstream gorilla/websocket ([decred/dcrd#1218](https://github.com/decred/dcrd/pull/1218))
- dcrjson: add createvotingaccount and dropvotingaccount rpc methods ([decred/dcrd#1217](https://github.com/decred/dcrd/pull/1217))
- multi: Change NoSplitTransaction param to SplitTx ([decred/dcrd#1231](https://github.com/decred/dcrd/pull/1231))
- rpcclient: pass default value for NewPurchaseTicketCmd's comment param ([decred/dcrd#1232](https://github.com/decred/dcrd/pull/1232))
- multi: No winning ticket ntfns for big reorg depth ([decred/dcrd#1235](https://github.com/decred/dcrd/pull/1235))
- multi: modify PurchaseTicketCmd ([decred/dcrd#1241](https://github.com/decred/dcrd/pull/1241))
- multi: move extension commands into associated normal command files ([decred/dcrd#1238](https://github.com/decred/dcrd/pull/1238))
- dcrjson: Fix NewCreateRawTransactionCmd comment ([decred/dcrd#1262](https://github.com/decred/dcrd/pull/1262))
- multi: revert TicketChange addition to PurchaseTicketCmd ([decred/dcrd#1278](https://github.com/decred/dcrd/pull/1278))
- rpcclient: Implement fmt.Stringer for Client ([decred/dcrd#1298](https://github.com/decred/dcrd/pull/1298))
- multi: add amount field to TransactionInput ([decred/dcrd#1297](https://github.com/decred/dcrd/pull/1297))
- dcrjson: Ready GetStakeInfoResult for SPV wallets ([decred/dcrd#1333](https://github.com/decred/dcrd/pull/1333))
- dcrjson: add fundrawtransaction command ([decred/dcrd#1316](https://github.com/decred/dcrd/pull/1316))
- dcrjson: Make linter happy by renaming Id to ID ([decred/dcrd#1374](https://github.com/decred/dcrd/pull/1374))
- dcrjson: Remove unused vote bit concat codec funcs ([decred/dcrd#1384](https://github.com/decred/dcrd/pull/1384))
- rpcserver: Cleanup cfilter handling ([decred/dcrd#1398](https://github.com/decred/dcrd/pull/1398))

### dcrd command-line flags and configuration:

- multi: Correct clean and expand path handling ([decred/dcrd#1186](https://github.com/decred/dcrd/pull/1186))

### dcrctl utility changes:

- dcrctl: Fix --skipverify failing if rpc.cert not found ([decred/dcrd#1163](https://github.com/decred/dcrd/pull/1163))

### Documentation:

- hdkeychain: Correct hash algorithm in comment ([decred/dcrd#1171](https://github.com/decred/dcrd/pull/1171))
- Fix typo in blockchain ([decred/dcrd#1185](https://github.com/decred/dcrd/pull/1185))
- docs: Update node.js example for v8.11.1 LTS ([decred/dcrd#1209](https://github.com/decred/dcrd/pull/1209))
- docs: Update txaccepted method in json_rpc_api.md ([decred/dcrd#1242](https://github.com/decred/dcrd/pull/1242))
- docs: Correct blockmaxsize and blockprioritysize ([decred/dcrd#1339](https://github.com/decred/dcrd/pull/1339))
- server: Correct comment in getblocks handler ([decred/dcrd#1269](https://github.com/decred/dcrd/pull/1269))
- config: Fix typo ([decred/dcrd#1274](https://github.com/decred/dcrd/pull/1274))
- multi: Fix badges in README ([decred/dcrd#1277](https://github.com/decred/dcrd/pull/1277))
- stake: Correct comment in connectNode ([decred/dcrd#1325](https://github.com/decred/dcrd/pull/1325))
- txscript: Update comments for removal of flags ([decred/dcrd#1336](https://github.com/decred/dcrd/pull/1336))
- docs: Update docs for versioned modules ([decred/dcrd#1391](https://github.com/decred/dcrd/pull/1391))
- mempool: Correct min relay tx fee comment to DCR ([decred/dcrd#1396](https://github.com/decred/dcrd/pull/1396))

### Developer-related package and module changes:

- blockchain: CheckConnectBlockTemplate with tests ([decred/dcrd#1086](https://github.com/decred/dcrd/pull/1086))
- addrmgr: Simplify package API ([decred/dcrd#1136](https://github.com/decred/dcrd/pull/1136))
- txscript: Remove unused strict multisig flag ([decred/dcrd#1203](https://github.com/decred/dcrd/pull/1203))
- txscript: Move sig hash logic to separate file ([decred/dcrd#1174](https://github.com/decred/dcrd/pull/1174))
- txscript: Remove SigHashAllValue ([decred/dcrd#1175](https://github.com/decred/dcrd/pull/1175))
- txscript: Decouple and optimize sighash calc ([decred/dcrd#1179](https://github.com/decred/dcrd/pull/1179))
- wire: Remove TxSerializeWitnessValueSigning ([decred/dcrd#1176](https://github.com/decred/dcrd/pull/1176))
- hdkeychain: Satisfy fmt.Stringer interface ([decred/dcrd#1168](https://github.com/decred/dcrd/pull/1168))
- blockchain: Validate tx expiry in block context ([decred/dcrd#1187](https://github.com/decred/dcrd/pull/1187))
- blockchain: rename ErrRegTxSpendStakeOut to ErrRegTxCreateStakeOut ([decred/dcrd#1195](https://github.com/decred/dcrd/pull/1195))
- multi: Break coinbase dep on standardness rules ([decred/dcrd#1196](https://github.com/decred/dcrd/pull/1196))
- txscript: Cleanup code for the substr opcode ([decred/dcrd#1206](https://github.com/decred/dcrd/pull/1206))
- multi: use secp256k1 types and fields directly ([decred/dcrd#1211](https://github.com/decred/dcrd/pull/1211))
- dcrec: add Pubkey func to secp256k1 and edwards elliptic curves ([decred/dcrd#1214](https://github.com/decred/dcrd/pull/1214))
- blockchain: use secp256k1 functions directly ([decred/dcrd#1212](https://github.com/decred/dcrd/pull/1212))
- multi: Replace btclog with slog ([decred/dcrd#1216](https://github.com/decred/dcrd/pull/1216))
- multi: Define vgo modules ([decred/dcrd#1223](https://github.com/decred/dcrd/pull/1223))
- chainhash: Define vgo module ([decred/dcrd#1224](https://github.com/decred/dcrd/pull/1224))
- wire: Refine vgo deps ([decred/dcrd#1225](https://github.com/decred/dcrd/pull/1225))
- addrmrg: Refine vgo deps ([decred/dcrd#1226](https://github.com/decred/dcrd/pull/1226))
- chaincfg: Refine vgo deps ([decred/dcrd#1227](https://github.com/decred/dcrd/pull/1227))
- multi: Return fork len from ProcessBlock ([decred/dcrd#1233](https://github.com/decred/dcrd/pull/1233))
- blockchain: Panic on fatal assertions ([decred/dcrd#1243](https://github.com/decred/dcrd/pull/1243))
- blockchain: Convert to full block index in mem ([decred/dcrd#1229](https://github.com/decred/dcrd/pull/1229))
- blockchain: Optimize checkpoint handling ([decred/dcrd#1230](https://github.com/decred/dcrd/pull/1230))
- blockchain: Optimize block locator generation ([decred/dcrd#1237](https://github.com/decred/dcrd/pull/1237))
- multi: Refactor and optimize inv discovery ([decred/dcrd#1239](https://github.com/decred/dcrd/pull/1239))
- peer: Minor function definition order cleanup ([decred/dcrd#1247](https://github.com/decred/dcrd/pull/1247))
- peer: Remove superfluous dup version check ([decred/dcrd#1248](https://github.com/decred/dcrd/pull/1248))
- txscript: export canonicalDataSize ([decred/dcrd#1266](https://github.com/decred/dcrd/pull/1266))
- blockchain: Add BuildMerkleTreeStore alternative for MsgTx ([decred/dcrd#1268](https://github.com/decred/dcrd/pull/1268))
- blockchain: Optimize exported header access ([decred/dcrd#1273](https://github.com/decred/dcrd/pull/1273))
- txscript: Cleanup P2SH and stake opcode handling ([decred/dcrd#1318](https://github.com/decred/dcrd/pull/1318))
- txscript: Significantly improve errors ([decred/dcrd#1319](https://github.com/decred/dcrd/pull/1319))
- txscript: Remove pay-to-script-hash flag ([decred/dcrd#1321](https://github.com/decred/dcrd/pull/1321))
- txscript: Remove DER signature verification flag ([decred/dcrd#1323](https://github.com/decred/dcrd/pull/1323))
- txscript: Remove verify minimal data flag ([decred/dcrd#1326](https://github.com/decred/dcrd/pull/1326))
- txscript: Remove script num require minimal flag ([decred/dcrd#1328](https://github.com/decred/dcrd/pull/1328))
- txscript: Make PeekInt consistent with PopInt ([decred/dcrd#1329](https://github.com/decred/dcrd/pull/1329))
- build: Add experimental support for vgo ([decred/dcrd#1215](https://github.com/decred/dcrd/pull/1215))
- build: Update some vgo dependencies to use tags ([decred/dcrd#1219](https://github.com/decred/dcrd/pull/1219))
- stake: add ExpiredByBlock to stake.Node ([decred/dcrd#1221](https://github.com/decred/dcrd/pull/1221))
- server: Minor function definition order cleanup ([decred/dcrd#1271](https://github.com/decred/dcrd/pull/1271))
- server: Convert CF code to use new inv discovery ([decred/dcrd#1272](https://github.com/decred/dcrd/pull/1272))
- multi: add valueIn parameter to wire.NewTxIn ([decred/dcrd#1287](https://github.com/decred/dcrd/pull/1287))
- txscript: Remove low S verification flag ([decred/dcrd#1308](https://github.com/decred/dcrd/pull/1308))
- txscript: Remove unused old sig hash type ([decred/dcrd#1309](https://github.com/decred/dcrd/pull/1309))
- txscript: Remove strict encoding verification flag ([decred/dcrd#1310](https://github.com/decred/dcrd/pull/1310))
- blockchain: Combine block by hash functions ([decred/dcrd#1330](https://github.com/decred/dcrd/pull/1330))
- multi: Continue conversion from chainec to dcrec ([decred/dcrd#1304](https://github.com/decred/dcrd/pull/1304))
- multi: Remove unused secp256k1 sig parse parameter ([decred/dcrd#1335](https://github.com/decred/dcrd/pull/1335))
- blockchain: Refactor db main chain idx to blk idx ([decred/dcrd#1332](https://github.com/decred/dcrd/pull/1332))
- blockchain: Remove main chain index from db ([decred/dcrd#1334](https://github.com/decred/dcrd/pull/1334))
- blockchain: Implement new chain view ([decred/dcrd#1337](https://github.com/decred/dcrd/pull/1337))
- blockmanager: remove unused Pause() API ([decred/dcrd#1340](https://github.com/decred/dcrd/pull/1340))
- chainhash: Remove dup code from hash funcs ([decred/dcrd#1342](https://github.com/decred/dcrd/pull/1342))
- connmgr: Fix the ConnReq print out causing panic ([decred/dcrd#1345](https://github.com/decred/dcrd/pull/1345))
- gcs: Pool MatchAny data allocations ([decred/dcrd#1348](https://github.com/decred/dcrd/pull/1348))
- blockchain: Faster chain view block locator ([decred/dcrd#1338](https://github.com/decred/dcrd/pull/1338))
- blockchain: Refactor to use new chain view ([decred/dcrd#1344](https://github.com/decred/dcrd/pull/1344))
- blockchain: Remove unnecessary genesis block check ([decred/dcrd#1368](https://github.com/decred/dcrd/pull/1368))
- chainhash: Update go build module support ([decred/dcrd#1358](https://github.com/decred/dcrd/pull/1358))
- wire: Update go build module support ([decred/dcrd#1359](https://github.com/decred/dcrd/pull/1359))
- addrmgr: Update go build module support ([decred/dcrd#1360](https://github.com/decred/dcrd/pull/1360))
- chaincfg: Update go build module support ([decred/dcrd#1361](https://github.com/decred/dcrd/pull/1361))
- connmgr: Refine go build module support ([decred/dcrd#1363](https://github.com/decred/dcrd/pull/1363))
- secp256k1: Refine go build module support ([decred/dcrd#1362](https://github.com/decred/dcrd/pull/1362))
- dcrec: Refine go build module support ([decred/dcrd#1364](https://github.com/decred/dcrd/pull/1364))
- certgen: Update go build module support ([decred/dcrd#1365](https://github.com/decred/dcrd/pull/1365))
- dcrutil: Refine go build module support ([decred/dcrd#1366](https://github.com/decred/dcrd/pull/1366))
- hdkeychain: Refine go build module support ([decred/dcrd#1369](https://github.com/decred/dcrd/pull/1369))
- txscript: Refine go build module support ([decred/dcrd#1370](https://github.com/decred/dcrd/pull/1370))
- multi: Remove go modules that do not build ([decred/dcrd#1371](https://github.com/decred/dcrd/pull/1371))
- database: Refine go build module support ([decred/dcrd#1372](https://github.com/decred/dcrd/pull/1372))
- build: Refine build module support ([decred/dcrd#1384](https://github.com/decred/dcrd/pull/1384))
- blockmanager: make pruning transactions consistent ([decred/dcrd#1376](https://github.com/decred/dcrd/pull/1376))
- blockchain: Optimize reorg to use known status ([decred/dcrd#1367](https://github.com/decred/dcrd/pull/1367))
- blockchain: Make block index flushable ([decred/dcrd#1375](https://github.com/decred/dcrd/pull/1375))
- blockchain: Mark fastadd block valid ([decred/dcrd#1392](https://github.com/decred/dcrd/pull/1392))
- release: Bump module versions and deps ([decred/dcrd#1390](https://github.com/decred/dcrd/pull/1390))
- blockchain: Mark fastadd block valid ([decred/dcrd#1392](https://github.com/decred/dcrd/pull/1392))
- gcs: use dchest/siphash ([decred/dcrd#1395](https://github.com/decred/dcrd/pull/1395))
- dcrec: Make function defs more consistent ([decred/dcrd#1432](https://github.com/decred/dcrd/pull/1432))

### Testing and Quality Assurance:

- addrmgr: Simplify tests for KnownAddress ([decred/dcrd#1133](https://github.com/decred/dcrd/pull/1133))
- blockchain: move block validation rule tests into fullblocktests ([decred/dcrd#1141](https://github.com/decred/dcrd/pull/1141))
- addrmgr: Test timestamp update during AddAddress ([decred/dcrd#1137](https://github.com/decred/dcrd/pull/1137))
- txscript: Consolidate tests into txscript package ([decred/dcrd#1177](https://github.com/decred/dcrd/pull/1177))
- txscript: Add JSON-based signature hash tests ([decred/dcrd#1178](https://github.com/decred/dcrd/pull/1178))
- txscript: Correct JSON-based signature hash tests ([decred/dcrd#1181](https://github.com/decred/dcrd/pull/1181))
- txscript: Add benchmark for sighash calculation ([decred/dcrd#1179](https://github.com/decred/dcrd/pull/1179))
- mempool: Refactor pool membership test logic ([decred/dcrd#1188](https://github.com/decred/dcrd/pull/1188))
- blockchain: utilize CalcNextReqStakeDifficulty in fullblocktests ([decred/dcrd#1189](https://github.com/decred/dcrd/pull/1189))
- fullblocktests: add additional premine and malformed tests ([decred/dcrd#1190](https://github.com/decred/dcrd/pull/1190))
- txscript: Improve substr opcode test coverage ([decred/dcrd#1205](https://github.com/decred/dcrd/pull/1205))
- txscript: Convert reference tests to new format ([decred/dcrd#1320](https://github.com/decred/dcrd/pull/1320))
- txscript: Remove P2SH flag from test data ([decred/dcrd#1322](https://github.com/decred/dcrd/pull/1322))
- txscript: Remove DERSIG flag from test data ([decred/dcrd#1324](https://github.com/decred/dcrd/pull/1324))
- txscript: Remove MINIMALDATA flag from test data ([decred/dcrd#1327](https://github.com/decred/dcrd/pull/1327))
- fullblocktests: Add expired stake tx test ([decred/dcrd#1184](https://github.com/decred/dcrd/pull/1184))
- travis: simplify Docker files ([decred/dcrd#1275](https://github.com/decred/dcrd/pull/1275))
- docker: Add dockerfiles for running dcrd nodes ([decred/dcrd#1317](https://github.com/decred/dcrd/pull/1317))
- blockchain: Improve spend journal tests ([decred/dcrd#1246](https://github.com/decred/dcrd/pull/1246))
- txscript: Cleanup and add tests for left opcode ([decred/dcrd#1281](https://github.com/decred/dcrd/pull/1281))
- txscript: Cleanup and add tests for right opcode ([decred/dcrd#1282](https://github.com/decred/dcrd/pull/1282))
- txscript: Cleanup and add tests for the cat opcode ([decred/dcrd#1283](https://github.com/decred/dcrd/pull/1283))
- txscript: Cleanup and add tests for rotr opcode ([decred/dcrd#1285](https://github.com/decred/dcrd/pull/1285))
- txscript: Cleanup and add tests for rotl opcode ([decred/dcrd#1286](https://github.com/decred/dcrd/pull/1286))
- txscript: Cleanup and add tests for lshift opcode ([decred/dcrd#1288](https://github.com/decred/dcrd/pull/1288))
- txscript: Cleanup and add tests for rshift opcode ([decred/dcrd#1289](https://github.com/decred/dcrd/pull/1289))
- txscript: Cleanup and add tests for div opcode ([decred/dcrd#1290](https://github.com/decred/dcrd/pull/1290))
- txscript: Cleanup and add tests for mod opcode ([decred/dcrd#1291](https://github.com/decred/dcrd/pull/1291))
- txscript: Update CSV to match tests in DCP0003 ([decred/dcrd#1292](https://github.com/decred/dcrd/pull/1292))
- txscript: Introduce repeated syntax to test data ([decred/dcrd#1299](https://github.com/decred/dcrd/pull/1299))
- txscript: Allow multi opcode test data repeat ([decred/dcrd#1300](https://github.com/decred/dcrd/pull/1300))
- txscript: Improve and correct some script tests ([decred/dcrd#1303](https://github.com/decred/dcrd/pull/1303))
- main: verify network pow limits ([decred/dcrd#1302](https://github.com/decred/dcrd/pull/1302))
- txscript: Remove STRICTENC flag from test data ([decred/dcrd#1311](https://github.com/decred/dcrd/pull/1311))
- txscript: Cleanup plus tests for checksig opcodes ([decred/dcrd#1315](https://github.com/decred/dcrd/pull/1315))
- blockchain: Add negative tests for forced reorg ([decred/dcrd#1341](https://github.com/decred/dcrd/pull/1341))
- dcrjson: Consolidate tests into dcrjson package ([decred/dcrd#1373](https://github.com/decred/dcrd/pull/1373))
- txscript: add additional data push op code tests ([decred/dcrd#1346](https://github.com/decred/dcrd/pull/1346))
- txscript: add/group control op code tests ([decred/dcrd#1349](https://github.com/decred/dcrd/pull/1349))
- txscript: add/group stack op code tests ([decred/dcrd#1350](https://github.com/decred/dcrd/pull/1350))
- txscript: group splice opcode tests ([decred/dcrd#1351](https://github.com/decred/dcrd/pull/1351))
- txscript: add/group bitwise logic, comparison & rotation op code tests ([decred/dcrd#1352](https://github.com/decred/dcrd/pull/1352))
- txscript: add/group numeric related opcode tests ([decred/dcrd#1353](https://github.com/decred/dcrd/pull/1353))
- txscript: group reserved op code tests ([decred/dcrd#1355](https://github.com/decred/dcrd/pull/1355))
- txscript: add/group crypto related op code tests ([decred/dcrd#1354](https://github.com/decred/dcrd/pull/1354))
- multi: Reduce testnet2 refs in unit tests ([decred/dcrd#1387](https://github.com/decred/dcrd/pull/1387))
- blockchain: Avoid deployment expiration in tests ([decred/dcrd#1450](https://github.com/decred/dcrd/pull/1450))

### Misc:

- release: Bump for v1.3.0 ([decred/dcrd#1388](https://github.com/decred/dcrd/pull/1388))
- multi: Correct typos found by misspell ([decred/dcrd#1197](https://github.com/decred/dcrd/pull/1197))
- main: Correct mem profile error message ([decred/dcrd#1183](https://github.com/decred/dcrd/pull/1183))
- multi: Use saner permissions saving certs ([decred/dcrd#1263](https://github.com/decred/dcrd/pull/1263))
- server: only call time.Now() once ([decred/dcrd#1313](https://github.com/decred/dcrd/pull/1313))
- multi: linter cleanup ([decred/dcrd#1305](https://github.com/decred/dcrd/pull/1305))
- multi: Remove unnecessary network name funcs ([decred/dcrd#1387](https://github.com/decred/dcrd/pull/1387))
- config: Warn if testnet2 database exists ([decred/dcrd#1389](https://github.com/decred/dcrd/pull/1389))

### Code Contributors (alphabetical order):

- Dave Collins
- David Hill
- Dmitry Fedorov
- Donald Adu-Poku
- harzo
- hypernoob
- J Fixby
- Jonathan Chappelow
- Josh Rickmar
- Markus Richter
- matadormel
- Matheus Degiovani
- Michael Eze
- Orthomind
- Shuai Qi
- Tibor Bősze
- Victor Oliveira

# dcrwallet v1.3.0

This release focuses on bringing initial simplified payment verification (SPV)
and committed filter (CF) support to dcrwallet as an optional, experimental
synchronization mode.  As usual, the release also contains various other
improvements and bug fixes, iterated below.

This release contains a database upgrade and once upgraded it is not possible to
downgrade to previous wallet releases without performing a seed restore with the
old version.

## Bug fixes

* When code executing under a database transaction panics, the transaction is
  now rolled back.  Closing the transaction avoids a deadlock when closing the
  database in the case that the panic is recovered instead of crashing the
  process.

* Deleting private keys from the database no longer modifies the database with
  an active bucket cursor.  Doing so is unsafe and has been the cause of
  database corruption in the past.

* The JSON-RPC method `version` no longer panics dereferencing a nil dcrd RPC
  client when one does not exist or has not been associated with the server.

* Callers of an internal method to return unencrypted scripts have been fixed
  for a breaking API change in the case that the script was not present.  This
  subsequently fixes synchronization from exiting prematurely when various
  scripts were not recorded.

* The JSON-RPC method `signrawtransaction` has been fixed to avoid a panic in
  cases where an unknown input must have been fetched from dcrd, and the input
  is already spent in the main chain.

* Fee estimation when spending a P2SH output has been fixed by considering the
  nested script length instead of using the same size estimation performed when
  spending a P2PKH output.

* gRPC transaction notifications now handle the case of a transaction being
  invalidated by voters in the next block.  An invalidated transaction is
  considered to have -1 confirmations, but in most cases the transaction (if not
  double spent) will reappear in mempool with a confirmation count of 0.

## New features

* A SPV synchronization mode has been introduced.  SPV may be enabled with the
  --spv config option.  The SPV sync mode uses local committed filter matching
  (as opposed to remote filtering as commonly done in other SPV implementations)
  to provide greater privacy and security guarantees by only fetching complete
  blocks on matches.  SPV mode uses the Decred wire protocol and peer-to-peer
  network to sync to a target 8 outbound peers.  The --spvconnect option is
  provided to manually specify the addresses of outbound peers rather than
  discovering these over DNS and from other peers.

* A new ticket buyer implementation has been added.  This buyer does not rely on
  any features unavailable to SPV mode.  All config options which only apply to
  the original ticket buyer are now deprecated, and using only options available
  to the new buyer will cause the new buyer to be run instead.  It is not
  possible to use the deprecated ticket buyer with SPV.

* The gRPC method `CreateWatchingOnlyWallet` has been added to allow the
  creation of a watching-only wallet for an account extended pubkey.

* The gRPC method `SignTransactions` has been added to sign multiple
  transactions in a single method.

* The gRPC method `ConstructTransaction` now returns the index of any added
  change output, or -1 if no change was added.

* The gRPC method `GetAccountExtendedKey` has been added to return an account's
  extended pubkey.

* The gRPC method `SpvSync` has been added to execute the SPV synchronizer.
  This RPC returns a message stream used to notify clients of the syncer's
  activity.

* A new config option --accountgaplimit allows the number of unused accounts to
  be user-configurable.  The default has been dropped from 100 unused accounts
  to 10 to improve performance of account rediscovery.  This option may be set
  to 100 to restore the previous behavior.

* The JSON-RPC `getstakeinfo` result has been modified to include two new
  fields.  `unspent` returns the number of tickets that have not been spent by a
  vote or revocation, and `unspentexpired` returns the number of unspent tickets
  that are past ticket expiry and cannot possibly be live.  Unlike the `missed`
  and `expired` fields, these new fields are populated when running in SPV mode.

## Other improvements

* Unnecessarily-verbose debug logs have been removed when filtering ticket
  hashes for owned tickets.

* The walletdb and snacl packages have been made internal packages to prevent
  these from being exposed by the public API.  This is part of an ongoing effort
  to support module-aware builds with vgo and Go 1.11.

* The error message for the unsupported operation of calling the JSON-RPC method
  `listtransactions` with an account name been improved by adding a hint to use
  `*` instead.

* `go vet` is now tested by the CI infrastructure and several string formatting
  issues discovered by `vet` have been resolved.

* The operating system and machine architecture are now logged at process
  startup together with the wallet release and Go versions.

* The description for the --createtemp config option now references the
  requirement of additionally setting --appdata rather than the deprecated
  --datadir option.

* Input amounts of previous outputs are now set before signing transactions.
  This will be required as proposed signature hash algorithms commit to the
  input amount.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/v1.2.0...release-v1.3.0).


# decrediton v1.3.0

This release of Decrediton marks the dawn of a large milestone in development.
SPV (simple payment verification) has been added in dcrwallet which allows
wallets to connect directly to peers and not required a fully synced node to be
connected.  For now this feature will be turned OFF by default, then when we 
have gotten thorough feedback and a confident in the usage, it will be turned
on by default.

While it's hard to give details of speed increases due to variances in systems,
we've seen roughly a 5x increase in syncing a previously used seed to tip on 
mainnet.  Previously, syncing the chain would take roughly 1hr plus another 5-10
mins for the wallet to become synced.  Now, we're seeing about 20mins total time
to being able to fully use a wallet to send or purchase tickets.

In the coming releases, we are going to work on further speeding this process up,
as well as providing more feedback from dcrwallet to Decrediton to make a
richer user experience.

*Note: Automatic ticket purchasing has been disabled for SPV.  We will be
implementing a way to start and stop the new v2 ticketbuyer in dcrwallet.  This
new version is much simpler and really only has 1 option to set which would
be an absolute balance to maintain.  This new version will also allow users to
run multiple ticket purchases for each account.

This release also has been audited by our design team at Eeter, LLC.  Most of the
pages have received an update to the styling to add more polish and be more 
resilient to various sizing and displays.  In the near future, we will be 
focusing on color themes and window sizing for small, medium and large displays.  

We are also proud to announce the intial release of the Politeia integration.
While this functionality is still in beta-testing, what you see will be roughly
the final form.  Proposals up for vote will be shown and your possible tickets
will be compared to the proposal's allowed tickets to vote.  If there are
tickets available to vote, you simply make your choice, enter your passphrase
and your tickets are used to send the Politeia server your cryptographic proof
of ownership.

## New Features

* SPV integration - *Note: This integration is currently hidden from normal 
usage, if you would like to test it, please set `"spv_mode": true`, in your 
`config.json` file.  With this new integration, there has been a new way of 
syncing that has been added.  Now instead of needing to do all of the wallet 
loader processes in the proper order, one can simply call the SpvSync grpc and
that will handle everything within dcrwallet.  This will lead to much less
errors and other headaches down the road.  We have also added an
`"spv_connect": [],` option in the `config.json` file, which will allow users to
connect directly to a known peer instead of relying on the DNS seeders to find
peers.

* Whitelisting and Proxy - We have added new support to control the connections
to domains that are used for various information.  We have also added proxy
support for those that choose to have the extra security.  These were both
necessary since the addition of Politeia wallet's communicating with the outside
world.  We felt the users should have full control over where the wallet is
communicating.  This support will be further improved upon in future releases
and requests for things are made.

* Initial Politeia Integration - *Note: This integration is currently hidden
from normal usage, but can be accessed by setting `"politeia_beta": true`, in
your `config.json` file.  When activated the user is shown a new page on the
side bar menu, reading "Governance."  This will show them the Politeia
information, of which is pulled from a request to the proposals site. 
They will be shown currently live and past votes.  

* Animated Onboarding Slides - All new animated slides were added.  Big thanks
for all the hard work from @kyleFirethought and everyone at Eeter! They really
make the wallet shine.

## Other improvements

* Launcher - The launcher UI was audited and has most of its issues smoothed
out.  There were some lingering issues and possible ways of users to get "stuck"
while loading up their wallets.

* Inputs and Errors - All inputs have been audited for consistency and proper
input error states are now being used.  We are very pleased with the look and
feel of the input errors and believe they are not too intrusive for users while
being very clear of what needs to be corrected.

* Max Wallet Option - Users are now able to set the max wallets that are
shown on the launcher screen.  The default is currently set to 3.  But keep in
mind that it was styled assuming only 3 would be shown, so there may be some
distortions as the number shown grows.  

* Refined About Modal - The additional window was removed in favor of a React
modal.  This allowed us to clean up the code and remove a redundant menu bar
group.

* Long Form Translations - Due issues translating large pieces of text that were
split up into partial sentences, we are now keeping large sections of
documentation that need to be translated together.  This is for things like the
onboarding slides and various informational modals. 

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/v1.2.1...release-v1.3.0).


## 2018-05-01


## Install

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.2.1/decrediton-1.2.1.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.2.1/decrediton-1.2.1.dmg) or
[decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.2.1/decrediton-1.2.1.exe).

See  manifest-decrediton-v1.2.1.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


# decrediton v1.2.1

This decrediton patch release covers a few commonly reported issues shortly
after v1.2.0 was released.  Most importantly this fixes an issue causing 
balances to show 0 after new blocks connect.

## Bug Fixes

* Fix an issue that was causing non-dirs to be discovered as valid legacy wallets.
  This would cause "config.json" incompletely setup wallet on first load of v1.2.0

* Fix balance showing 0 after ticket/votes calculated for maturity.  

* Seed pasting was not showing errors and would just blank out the words.  Now
  an error is shown when that occurs.

* Fix various PT-Br translation errors.

* Due to dcrd v1.2.0 database upgrade, users would be shown "Waiting for RPC..." 
  for a very long time with no other information.  Now the first lines of both
  dcrd and dcrwallet logs are shown to hopefully give the user more information
  about the current state of the daemon upgrade.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/v1.2.0...release-v1.2.1).


# 2018-04-26


## Install

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.2.0/decrediton-v1.2.0.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.2.0/decrediton-v1.2.0.dmg) or
[decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.2.0/decrediton-v1.2.0.exe).

See manifest-v1.2.0.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v120)
* [dcrwallet](#dcrwallet-v120)
* [decrediton](#decrediton-v120)


# dcrd v1.2.0

This release of dcrd contains significant performance enhancements,
infrastructure improvements, improved access to chain-related information for
providing better SPV (Simplified Payment Verification) support, and other
quality assurance changes.

A significant amount of infrastructure work has also been done this release
cycle towards being able to support several planned scalability optimizations.

## Downgrade Warning

The database format in v1.2.0 is not compatible with previous versions of the
software.  This only affects downgrades as users upgrading from previous
versions will see a one time database migration.

Once this migration has been completed, it will no longer be possible to
downgrade to a previous version of the software without having to delete the
database and redownload the chain.

## Notable Changes

### Significantly Faster Startup

The startup time has been improved by roughly 17x on slower hard disk drives
(HDDs) and 8x on solid state drives (SSDs).

In order to achieve these speedups, there is a one time database migration, as
previously mentioned, that will likely take a while to complete (typically
around 5 to 6 minutes on HDDs and 2 to 3 minutes on SSDs).

### Support For DNS Seed Filtering

In order to better support the forthcoming SPV wallets, support for finding
other peers based upon their enabled services has been added.  This is useful
for both SPV wallets and full nodes since SPV wallets will require access to
full nodes in order to retrieve the necessary proofs and full nodes are
generally not interested in making outgoing connections to SPV wallets.

### Committed Filters

With the intention of supporting light clients, such as SPV wallets, in a
privacy-preserving way while still minimizing the amount of data that needs to
be downloaded, this release adds support for committed filters.  A committed
filter is a combination of a probalistic data structure that is used to test
whether an element is a member of a set with a predetermined collision
probability along with a commitment by consensus-validating full nodes to that
data.

A committed filter is created for every block which allows light clients to
download the filters and match against them locally rather than uploading
personal data to other nodes.

A new service flag is also provided to allow clients to discover nodes that
provide access to filters.

There is a one time database update to build and store the filters for all
existing historical blocks which will likely take a while to complete (typically
around 2 to 3 minutes on HDDs and 1 to 1.5 minutes on SSDs).

### Updated Atomic Swap Contracts

The standard checks for atomic swap contracts have been updated to ensure the
contracts enforce the secret size for safer support between chains with
disparate script rules.

### RPC Server Changes

#### New `getchaintips` RPC

A new RPC named `getchaintips` has been added which allows callers to query
information about the status of known side chains and their branch lengths.
It currently only provides support for side chains that have been seen while the
current instance of the process is running.  This will be further improved in
future releases.

## Changelog

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/v1.1.2...v1.2.0).

### Protocol and network:

- chaincfg: Add checkpoints for 1.2.0 release ([decred/dcrd#1139](https://github.com/decred/dcrd/pull/1139))
- chaincfg: Introduce new type DNSSeed ([decred/dcrd#961](https://github.com/decred/dcrd/pull/961))
- blockmanager: sync with the most updated peer ([decred/dcrd#984](https://github.com/decred/dcrd/pull/984))
- multi: remove MsgAlert ([decred/dcrd#1161](https://github.com/decred/dcrd/pull/1161))
- multi: Add initial committed filter (CF) support ([decred/dcrd#1151](https://github.com/decred/dcrd/pull/1151))

### Transaction relay (memory pool):

- txscript: Correct nulldata standardness check ([decred/dcrd#935](https://github.com/decred/dcrd/pull/935))
- mempool: Optimize orphan map limiting ([decred/dcrd#1117](https://github.com/decred/dcrd/pull/1117))
- mining: Fix duplicate txns in the prio heap ([decred/dcrd#1108](https://github.com/decred/dcrd/pull/1108))
- mining: Stop transactions losing their dependants ([decred/dcrd#1109](https://github.com/decred/dcrd/pull/1109))

### RPC:

- rpcserver: skip cert create when RPC is disabled ([decred/dcrd#949](https://github.com/decred/dcrd/pull/949))
- rpcserver: remove redundant checks in blockTemplateResult ([decred/dcrd#826](https://github.com/decred/dcrd/pull/826))
- rpcserver: assert network for validateaddress rpc ([decred/dcrd#963](https://github.com/decred/dcrd/pull/963))
- rpcserver: Do not rebroadcast stake transactions ([decred/dcrd#973](https://github.com/decred/dcrd/pull/973))
- dcrjson: add ticket fee field to PurchaseTicketCmd ([decred/dcrd#902](https://github.com/decred/dcrd/pull/902))
- dcrwalletextcmds: remove getseed ([decred/dcrd#985](https://github.com/decred/dcrd/pull/985))
- dcrjson: Add SweepAccountCmd & SweepAccountResult ([decred/dcrd#1027](https://github.com/decred/dcrd/pull/1027))
- rpcserver: add sweepaccount to the wallet list of commands ([decred/dcrd#1028](https://github.com/decred/dcrd/pull/1028))
- rpcserver: add batched request support (json 2.0) ([decred/dcrd#841](https://github.com/decred/dcrd/pull/841))
- dcrjson: include summary totals in GetBalanceResult ([decred/dcrd#1062](https://github.com/decred/dcrd/pull/1062))
- multi: Implement getchaintips JSON-RPC ([decred/dcrd#1098](https://github.com/decred/dcrd/pull/1098))
- rpcserver: Add dcrd version info to getversion RPC ([decred/dcrd#1097](https://github.com/decred/dcrd/pull/1097))
- rpcserver: Correct getblockheader result text ([decred/dcrd#1104](https://github.com/decred/dcrd/pull/1104))
- dcrjson: add StartAutoBuyerCmd & StopAutoBuyerCmd ([decred/dcrd#903](https://github.com/decred/dcrd/pull/903))
- dcrjson: fix typo for StartAutoBuyerCmd ([decred/dcrd#1146](https://github.com/decred/dcrd/pull/1146))
- dcrjson: require passphrase for StartAutoBuyerCmd ([decred/dcrd#1147](https://github.com/decred/dcrd/pull/1147))
- dcrjson: fix StopAutoBuyerCmd registration bug ([decred/dcrd#1148](https://github.com/decred/dcrd/pull/1148))
- blockchain: Support testnet stake diff estimation ([decred/dcrd#1115](https://github.com/decred/dcrd/pull/1115))
- rpcserver: fix jsonRPCRead data race ([decred/dcrd#1157](https://github.com/decred/dcrd/pull/1157))
- dcrjson: Add VerifySeedCmd ([decred/dcrd#1160](https://github.com/decred/dcrd/pull/1160))

### dcrd command-line flags and configuration:

- mempool: Rename RelayNonStd config option ([decred/dcrd#1024](https://github.com/decred/dcrd/pull/1024))
- sampleconfig: Update min relay fee ([decred/dcrd#959](https://github.com/decred/dcrd/pull/959))
- sampleconfig: Correct comment ([decred/dcrd#1063](https://github.com/decred/dcrd/pull/1063))
- multi: Expand ~ to correct home directory on all OSes ([decred/dcrd#1041](https://github.com/decred/dcrd/pull/1041))

### checkdevpremine utility changes:

- checkdevpremine: Remove --skipverify option ([decred/dcrd#969](https://github.com/decred/dcrd/pull/969))
- checkdevpremine: Implement --notls option ([decred/dcrd#969](https://github.com/decred/dcrd/pull/969))
- checkdevpremine: Make file naming consistent ([decred/dcrd#969](https://github.com/decred/dcrd/pull/969))
- checkdevpremine: Fix comment ([decred/dcrd#969](https://github.com/decred/dcrd/pull/969))
- checkdevpremine: Remove utility ([decred/dcrd#1068](https://github.com/decred/dcrd/pull/1068))

### Documentation:

- fullblocktests: Add missing doc.go file ([decred/dcrd#956](https://github.com/decred/dcrd/pull/956))
- docs: Add fullblocktests entry and make consistent ([decred/dcrd#956](https://github.com/decred/dcrd/pull/956))
- docs: Add mempool entry to developer tools section ([decred/dcrd#1058](https://github.com/decred/dcrd/pull/1058))
- mempool: Add docs.go and flesh out README.md ([decred/dcrd#1058](https://github.com/decred/dcrd/pull/1058))
- docs: document packages and fix typo  ([decred/dcrd#965](https://github.com/decred/dcrd/pull/965))
- docs: rpcclient is now part of the main dcrd repo ([decred/dcrd#970](https://github.com/decred/dcrd/pull/970))
- dcrjson: Update README.md ([decred/dcrd#982](https://github.com/decred/dcrd/pull/982))
- docs: Remove carriage return ([decred/dcrd#1106](https://github.com/decred/dcrd/pull/1106))
- Adjust README.md for new Go version ([decred/dcrd#1105](https://github.com/decred/dcrd/pull/1105))
- docs: document how to use go test -coverprofile ([decred/dcrd#1107](https://github.com/decred/dcrd/pull/1107))
- addrmgr: Improve documentation ([decred/dcrd#1125](https://github.com/decred/dcrd/pull/1125))
- docs: Fix links for internal packages ([decred/dcrd#1144](https://github.com/decred/dcrd/pull/1144))

### Developer-related package changes:

- chaingen: Add revocation generation infrastructure ([decred/dcrd#1120](https://github.com/decred/dcrd/pull/1120))
- txscript: Add null data script creator ([decred/dcrd#943](https://github.com/decred/dcrd/pull/943))
- txscript: Cleanup and improve NullDataScript tests ([decred/dcrd#943](https://github.com/decred/dcrd/pull/943))
- txscript: Allow external signature hash calc ([decred/dcrd#951](https://github.com/decred/dcrd/pull/951))
- secp256k1: update func signatures ([decred/dcrd#934](https://github.com/decred/dcrd/pull/934))
- txscript: enforce MaxDataCarrierSize for GenerateProvablyPruneableOut ([decred/dcrd#953](https://github.com/decred/dcrd/pull/953))
- txscript: Remove OP_SMALLDATA ([decred/dcrd#954](https://github.com/decred/dcrd/pull/954))
- blockchain: Accept header in CheckProofOfWork ([decred/dcrd#977](https://github.com/decred/dcrd/pull/977))
- blockchain: Make func definition style consistent ([decred/dcrd#983](https://github.com/decred/dcrd/pull/983))
- blockchain: only fetch the parent block in BFFastAdd ([decred/dcrd#972](https://github.com/decred/dcrd/pull/972))
- blockchain: Switch to FindSpentTicketsInBlock ([decred/dcrd#915](https://github.com/decred/dcrd/pull/915))
- stake: Add Hash256PRNG init vector support ([decred/dcrd#986](https://github.com/decred/dcrd/pull/986))
- blockchain/stake: Use Hash256PRNG init vector ([decred/dcrd#987](https://github.com/decred/dcrd/pull/987))
- blockchain: Don't store full header in block node ([decred/dcrd#988](https://github.com/decred/dcrd/pull/988))
- blockchain: Reconstruct headers from block nodes ([decred/dcrd#989](https://github.com/decred/dcrd/pull/989))
- stake/multi: Don't return errors for IsX functions ([decred/dcrd#995](https://github.com/decred/dcrd/pull/995))
- blockchain: Rename block index to main chain index ([decred/dcrd#996](https://github.com/decred/dcrd/pull/996))
- blockchain: Refactor main block index logic ([decred/dcrd#990](https://github.com/decred/dcrd/pull/990))
- blockchain: Use hash values in structs ([decred/dcrd#992](https://github.com/decred/dcrd/pull/992))
- blockchain: Remove unused dump function ([decred/dcrd#1001](https://github.com/decred/dcrd/pull/1001))
- blockchain: Generalize and optimize chain reorg ([decred/dcrd#997](https://github.com/decred/dcrd/pull/997))
- blockchain: Pass parent block in connection code ([decred/dcrd#998](https://github.com/decred/dcrd/pull/998))
- blockchain: Explicit block fetch semanticss ([decred/dcrd#999](https://github.com/decred/dcrd/pull/999))
- blockchain: Use next detach block in reorg chain ([decred/dcrd#1002](https://github.com/decred/dcrd/pull/1002))
- blockchain: Limit header sanity check to header ([decred/dcrd#1003](https://github.com/decred/dcrd/pull/1003))
- blockchain: Validate num votes in header sanity ([decred/dcrd#1005](https://github.com/decred/dcrd/pull/1005))
- blockchain: Validate max votes in header sanity ([decred/dcrd#1006](https://github.com/decred/dcrd/pull/1006))
- blockchain: Validate stake diff in header context ([decred/dcrd#1004](https://github.com/decred/dcrd/pull/1004))
- blockchain: No votes/revocations in header sanity ([decred/dcrd#1007](https://github.com/decred/dcrd/pull/1007))
- blockchain: Validate max purchases in header sanity ([decred/dcrd#1008](https://github.com/decred/dcrd/pull/1008))
- blockchain: Validate early votebits in header sanity ([decred/dcrd#1009](https://github.com/decred/dcrd/pull/1009))
- blockchain: Validate block height in header context ([decred/dcrd#1010](https://github.com/decred/dcrd/pull/1010))
- blockchain: Move check block context func ([decred/dcrd#1011](https://github.com/decred/dcrd/pull/1011))
- blockchain: Block sanity cleanup and consistency ([decred/dcrd#1012](https://github.com/decred/dcrd/pull/1012))
- blockchain: Remove dup ticket purchase value check ([decred/dcrd#1013](https://github.com/decred/dcrd/pull/1013))
- blockchain: Only tickets before SVH in block sanity ([decred/dcrd#1014](https://github.com/decred/dcrd/pull/1014))
- blockchain: Remove unused vote bits function ([decred/dcrd#1015](https://github.com/decred/dcrd/pull/1015))
- blockchain: Move upgrade-only code to upgrade.go ([decred/dcrd#1016](https://github.com/decred/dcrd/pull/1016))
- stake: Static assert of vote commitment ([decred/dcrd#1020](https://github.com/decred/dcrd/pull/1020))
- blockchain: Remove unused error code ([decred/dcrd#1021](https://github.com/decred/dcrd/pull/1021))
- blockchain: Improve readability of parent approval ([decred/dcrd#1022](https://github.com/decred/dcrd/pull/1022))
- peer: rename mruinvmap, mrunoncemap to lruinvmap, lrunoncemap ([decred/dcrd#976](https://github.com/decred/dcrd/pull/976))
- peer: rename noncemap to noncecache ([decred/dcrd#976](https://github.com/decred/dcrd/pull/976))
- peer: rename inventorymap to inventorycache ([decred/dcrd#976](https://github.com/decred/dcrd/pull/976))
- connmgr: convert state to atomic ([decred/dcrd#1025](https://github.com/decred/dcrd/pull/1025))
- blockchain/mining: Full checks in CCB ([decred/dcrd#1017](https://github.com/decred/dcrd/pull/1017))
- blockchain: Validate pool size in header context ([decred/dcrd#1018](https://github.com/decred/dcrd/pull/1018))
- blockchain: Vote commitments in block sanity ([decred/dcrd#1023](https://github.com/decred/dcrd/pull/1023))
- blockchain: Validate early final state is zero ([decred/dcrd#1031](https://github.com/decred/dcrd/pull/1031))
- blockchain: Validate final state in header context ([decred/dcrd#1034](https://github.com/decred/dcrd/pull/1033))
- blockchain: Max revocations in block sanity ([decred/dcrd#1034](https://github.com/decred/dcrd/pull/1034))
- blockchain: Allowed stake txns in block sanity ([decred/dcrd#1035](https://github.com/decred/dcrd/pull/1035))
- blockchain: Validate allowed votes in block context ([decred/dcrd#1036](https://github.com/decred/dcrd/pull/1036))
- blockchain: Validate allowed revokes in blk contxt ([decred/dcrd#1037](https://github.com/decred/dcrd/pull/1037))
- blockchain/stake: Rename tix spent to tix voted ([decred/dcrd#1038](https://github.com/decred/dcrd/pull/1038))
- txscript: Require atomic swap contracts to specify the secret size ([decred/dcrd#1039](https://github.com/decred/dcrd/pull/1039))
- blockchain: Remove unused struct ([decred/dcrd#1043](https://github.com/decred/dcrd/pull/1043))
- blockchain: Store side chain blocks in database ([decred/dcrd#1000](https://github.com/decred/dcrd/pull/1000))
- blockchain: Simplify initial chain state ([decred/dcrd#1045](https://github.com/decred/dcrd/pull/1045))
- blockchain: Rework database versioning ([decred/dcrd#1047](https://github.com/decred/dcrd/pull/1047))
- blockchain: Don't require chain for db upgrades ([decred/dcrd#1051](https://github.com/decred/dcrd/pull/1051))
- blockchain/indexers: Allow interrupts ([decred/dcrd#1052](https://github.com/decred/dcrd/pull/1052))
- blockchain: Remove old version information ([decred/dcrd#1055](https://github.com/decred/dcrd/pull/1055))
- stake: optimize FindSpentTicketsInBlock slightly ([decred/dcrd#1049](https://github.com/decred/dcrd/pull/1049))
- blockchain: Do not accept orphans/genesis block ([decred/dcrd#1057](https://github.com/decred/dcrd/pull/1057))
- blockchain: Separate node ticket info population ([decred/dcrd#1056](https://github.com/decred/dcrd/pull/1056))
- blockchain: Accept parent in blockNode constructor ([decred/dcrd#1056](https://github.com/decred/dcrd/pull/1056))
- blockchain: Combine ErrDoubleSpend & ErrMissingTx ([decred/dcrd#1064](https://github.com/decred/dcrd/pull/1064))
- blockchain: Calculate the lottery IV on demand ([decred/dcrd#1065](https://github.com/decred/dcrd/pull/1065))
- blockchain: Simplify add/remove node logic ([decred/dcrd#1067](https://github.com/decred/dcrd/pull/1067))
- blockchain: Infrastructure to manage block index ([decred/dcrd#1044](https://github.com/decred/dcrd/pull/1044))
- blockchain: Add block validation status to index ([decred/dcrd#1044](https://github.com/decred/dcrd/pull/1044))
- blockchain: Migrate to new block indexuse it ([decred/dcrd#1044](https://github.com/decred/dcrd/pull/1044))
- blockchain: Lookup child in force head reorg ([decred/dcrd#1070](https://github.com/decred/dcrd/pull/1070))
- blockchain: Refactor block idx entry serialization ([decred/dcrd#1069](https://github.com/decred/dcrd/pull/1069))
- blockchain: Limit GetStakeVersions count ([decred/dcrd#1071](https://github.com/decred/dcrd/pull/1071))
- blockchain: Remove dry run flag ([decred/dcrd#1073](https://github.com/decred/dcrd/pull/1073))
- blockchain: Remove redundant stake ver calc func ([decred/dcrd#1087](https://github.com/decred/dcrd/pull/1087))
- blockchain: Reduce GetGeneration to TipGeneration ([decred/dcrd#1083](https://github.com/decred/dcrd/pull/1083))
- blockchain: Add chain tip tracking ([decred/dcrd#1084](https://github.com/decred/dcrd/pull/1084))
- blockchain: Switch tip generation to chain tips ([decred/dcrd#1085](https://github.com/decred/dcrd/pull/1085))
- blockchain: Simplify voter version calculation ([decred/dcrd#1088](https://github.com/decred/dcrd/pull/1088))
- blockchain: Remove unused threshold serialization ([decred/dcrd#1092](https://github.com/decred/dcrd/pull/1092))
- blockchain: Simplify chain tip tracking ([decred/dcrd#1092](https://github.com/decred/dcrd/pull/1092))
- blockchain: Cache tip and parent at init ([decred/dcrd#1100](https://github.com/decred/dcrd/pull/1100))
- mining: Obtain block by hash instead of top block ([decred/dcrd#1094](https://github.com/decred/dcrd/pull/1094))
- blockchain: Remove unused GetTopBlock function ([decred/dcrd#1094](https://github.com/decred/dcrd/pull/1094))
- multi: Rename BIP0111Version to NodeBloomVersion ([decred/dcrd#1112](https://github.com/decred/dcrd/pull/1112))
- mining/mempool: Move priority code to mining pkg ([decred/dcrd#1110](https://github.com/decred/dcrd/pull/1110))
- mining: Use single uint64 coinbase extra nonce ([decred/dcrd#1116](https://github.com/decred/dcrd/pull/1116))
- mempool/mining: Clarify tree validity semantics ([decred/dcrd#1118](https://github.com/decred/dcrd/pull/1118))
- mempool/mining: TxSource separation ([decred/dcrd#1119](https://github.com/decred/dcrd/pull/1119))
- connmgr: Use same Dial func signature as net.Dial ([decred/dcrd#1113](https://github.com/decred/dcrd/pull/1113))
- addrmgr: Declutter package API ([decred/dcrd#1124](https://github.com/decred/dcrd/pull/1124))
- mining: Correct initial template generation ([decred/dcrd#1122](https://github.com/decred/dcrd/pull/1122))
- cpuminer: Use header for extra nonce ([decred/dcrd#1123](https://github.com/decred/dcrd/pull/1123))
- addrmgr: Make writing of peers file safer ([decred/dcrd#1126](https://github.com/decred/dcrd/pull/1126))
- addrmgr: Save peers file only if necessary ([decred/dcrd#1127](https://github.com/decred/dcrd/pull/1127))
- addrmgr: Factor out common code ([decred/dcrd#1138](https://github.com/decred/dcrd/pull/1138))
- addrmgr: Improve isBad() performance ([decred/dcrd#1134](https://github.com/decred/dcrd/pull/1134))
- dcrutil: Disallow creation of hybrid P2PK addrs ([decred/dcrd#1154](https://github.com/decred/dcrd/pull/1154))
- chainec/dcrec: Remove hybrid pubkey support ([decred/dcrd#1155](https://github.com/decred/dcrd/pull/1155))
- blockchain: Only fetch inputs once in connect txns ([decred/dcrd#1152](https://github.com/decred/dcrd/pull/1152))
- indexers: Provide interface for index removal ([decred/dcrd#1158](https://github.com/decred/dcrd/pull/1158))

### Testing and Quality Assurance:

- travis: set GOVERSION environment properly ([decred/dcrd#958](https://github.com/decred/dcrd/pull/958))
- stake: Override false positive vet error ([decred/dcrd#960](https://github.com/decred/dcrd/pull/960))
- docs: make example code compile ([decred/dcrd#970](https://github.com/decred/dcrd/pull/970))
- blockchain: Add median time tests ([decred/dcrd#991](https://github.com/decred/dcrd/pull/991))
- chaingen: Update vote commitments on hdr updates ([decred/dcrd#1023](https://github.com/decred/dcrd/pull/1023))
- fullblocktests: Add tests for early final state ([decred/dcrd#1031](https://github.com/decred/dcrd/pull/1031))
- travis: test in docker container ([decred/dcrd#1053](https://github.com/decred/dcrd/pull/1053))
- blockchain: Correct error stringer tests ([decred/dcrd#1066](https://github.com/decred/dcrd/pull/1066))
- blockchain: Remove superfluous reorg tests ([decred/dcrd#1072](https://github.com/decred/dcrd/pull/1072))
- blockchain: Use chaingen for forced reorg tests ([decred/dcrd#1074](https://github.com/decred/dcrd/pull/1074))
- blockchain: Remove superfluous test checks ([decred/dcrd#1075](https://github.com/decred/dcrd/pull/1075))
- blockchain: move block validation rule tests into fullblocktests ([decred/dcrd#1060](https://github.com/decred/dcrd/pull/1060))
- fullblocktests: Cleanup after refactor ([decred/dcrd#1080](https://github.com/decred/dcrd/pull/1080))
- chaingen: Prevent dup block names in NextBlock ([decred/dcrd#1079](https://github.com/decred/dcrd/pull/1079))
- blockchain: Remove duplicate val tests ([decred/dcrd#1082](https://github.com/decred/dcrd/pull/1082))
- chaingen: Break dependency on blockchain ([decred/dcrd#1076](https://github.com/decred/dcrd/pull/1076))
- blockchain: Consolidate tests into the main package ([decred/dcrd#1077](https://github.com/decred/dcrd/pull/1077))
- chaingen: Export vote commitment script function ([decred/dcrd#1081](https://github.com/decred/dcrd/pull/1081))
- fullblocktests: Improve vote on wrong block tests ([decred/dcrd#1081](https://github.com/decred/dcrd/pull/1081))
- chaingen: Export func to check if block is solved ([decred/dcrd#1089](https://github.com/decred/dcrd/pull/1089))
- fullblocktests: Use new exported IsSolved func ([decred/dcrd#1089](https://github.com/decred/dcrd/pull/1089))
- chaingen: Accept mungers for create premine block ([decred/dcrd#1090](https://github.com/decred/dcrd/pull/1090))
- blockchain: Add tests for chain tip tracking ([decred/dcrd#1096](https://github.com/decred/dcrd/pull/1096))
- blockchain: move block validation rule tests into fullblocktests (2/x) ([decred/dcrd#1095](https://github.com/decred/dcrd/pull/1095))
- addrmgr: Remove obsolete coverage script ([decred/dcrd#1103](https://github.com/decred/dcrd/pull/1103))
- chaingen: Track expected blk heights separately ([decred/dcrd#1101](https://github.com/decred/dcrd/pull/1101))
- addrmgr: Improve test coverage ([decred/dcrd#1111](https://github.com/decred/dcrd/pull/1111))
- chaingen: Add revocation generation infrastructure ([decred/dcrd#1120](https://github.com/decred/dcrd/pull/1120))
- fullblocktests: Add some basic revocation tests ([decred/dcrd#1121](https://github.com/decred/dcrd/pull/1121))
- addrmgr: Test removal of corrupt peers file ([decred/dcrd#1129](https://github.com/decred/dcrd/pull/1129))

### Misc:

- release: Bump for v1.2.0 ([decred/dcrd#1140](https://github.com/decred/dcrd/pull/1140))
- goimports -w . ([decred/dcrd#968](https://github.com/decred/dcrd/pull/968))
- dep: sync ([decred/dcrd#980](https://github.com/decred/dcrd/pull/980))
- multi: Simplify code per gosimple linter ([decred/dcrd#993](https://github.com/decred/dcrd/pull/993))
- multi: various cleanups ([decred/dcrd#1019](https://github.com/decred/dcrd/pull/1019))
- multi: release the mutex earlier ([decred/dcrd#1026](https://github.com/decred/dcrd/pull/1026))
- multi: fix some maligned linter warnings ([decred/dcrd#1025](https://github.com/decred/dcrd/pull/1025))
- blockchain: Correct a few log statements ([decred/dcrd#1042](https://github.com/decred/dcrd/pull/1042))
- mempool: cleaner ([decred/dcrd#1050](https://github.com/decred/dcrd/pull/1050))
- multi: fix misspell linter warnings ([decred/dcrd#1054](https://github.com/decred/dcrd/pull/1054))
- dep: sync ([decred/dcrd#1091](https://github.com/decred/dcrd/pull/1091))
- multi: Properly capitalize Decred ([decred/dcrd#1102](https://github.com/decred/dcrd/pull/1102))
- build: Correct semver build handling ([decred/dcrd#1097](https://github.com/decred/dcrd/pull/1097))
- main: Make func definition style consistent ([decred/dcrd#1114](https://github.com/decred/dcrd/pull/1114))
- main: Allow semver prerel via linker flags ([decred/dcrd#1128](https://github.com/decred/dcrd/pull/1128))

### Code Contributors (alphabetical order):

- Andrew Chiw
- Daniel Krawsiz
- Dave Collins
- David Hill
- Donald Adu-Poku
- Javed Khan
- Jolan Luff
- Jon Gillham
- Josh Rickmar
- Markus Richter
- Matheus Degiovani
- Ryan Vacek


# dcrwallet 1.2.0

This release provides bug fixes for issues reported by users as well as new RPC
features and additions which are required for Decrediton and Politeia.  SPV work
is ongoing but these changes will not land until a future release and after most
of the network nodes are running with committed filter support.

This release contains a database upgrade and once upgraded it is not possible
to downgrade to previous wallet releases without performing a seed restore with
the old version.

## Bug fixes

* Orphan votes (votes which have become invalid for the new main chain tip block
  after a reorg or missed vote) are now rejected from reentering the wallet if
  still notified by dcrd.

* Watching only wallets are now usable again, after a breaking change to them
  introduced in the 1.1.2 release.

* The transaction fee when purchasing tickets with the `purchaseticket` JSON-RPC
  and `WalletService.PurchaseTickets` gRPC methods will now fallback to the
  wallet's configured fee rate if not specified by the RPC request.

* Various gRPC methods which allowed specifying 0 DCR as a target amount (e.g.
  `WalletService.FundTransaction`) now follow their documentation and will
  return or use as many unspent outputs as possible.

* Outputs of transactions with an expiry set are not spendable by consensus
  rules until having reached coinbase maturity.  These outputs are no longer
  returned or used when selecting previous outputs to create new transactions.

## New features

* A new gRPC method `WalletService.UnspentOutputs` has been added to return a
  stream of all wallet unspent outputs.  Outputs may be filtered by their
  associated account and required confirmations, as well as stopping once a
  total target amount has been reached or exceeded.

* A new gRPC method `WalletService.BestBlock` has been added which will return
  the hash and height of the current main chain tip block.  Previously, this
  information was only available as a unary RPC with the
  `WalletService.Accounts` method.

* The gRPC method `WalletService.GetTickets` will paginate results if called
  with a new target ticket count parameter.

* A new gRPC method `WalletService.CommittedTickets` has been added to find
  ticket purchase hashes specified by the request where the largest P2PKH
  commitment amount is controlled by the wallet.  The commitment address is
  additionally returned by the result.

* A new gRPC method `WalletService.SignMessages` has been added to sign multiple
  messages at a time without needing to unlock and lock the wallet before and
  after each call.

* The gRPC `BlockDetails` and `BlockInfoResponse` messages now include a new
  field which specifies whether votes in the block disapprove of the parent
  block.

* A new JSON-RPC method `publishunminedtransactions` has been added which
  resends all unmined transactions of the wallet.

* A new JSON-RPC method `sweepaccount` has been added which can be used to move
  as much value as possible from an account to either (possibly the same)
  account or an address.  This RPC can be used in place of the `consolidate`
  method but without knowing and specifying exactly how many inputs to use.

* The new JSON-RPC methods `startautobuyer` and `stopautobuyer` have been added
  which can start and stop the automatic ticket purchaser over JSON-RPC, similar
  to the already existing `StartAutoBuyer` and `StopAutoBuyer` gRPC methods of
  the `TicketBuyerService`.

* The JSON-RPC method `getbalance` now returns aggregate balances for all
  accounts if called with the special `*` account name.

## Other improvements

* The sendtosstx, sendtossgen, and sendtossrtx JSON-RPC methods have been
  removed.  These RPCs were intended to manually send ticket purchases, votes,
  and revocations manually, but were unimplemented and would cause crashes if
  used.

* Transaction size estimation has been improved to more accurately estimate
  fees, in particular when redeeming with pay-to-script-hash redeem scripts.

* The `help` JSON-RPC method text for the `getbalance` RPC has been updated to
  reflect the changes made to the returned object.

* Users are now informed with log messages to configure their public passphrase
  or enter it on startup if the wallet is encrypted with one but it was not
  specified.

* Script execution errors during sanity checks after signing inputs now record
  additional information about the failure including the previous output and
  script being spent and the signature script used by the input.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/v1.1.2...v1.2.0).


# decrediton 1.2.0

This release of decrediton adds some major changes to the wallet startup,
overview page and adds the first round of statistics for better user
information.  Now that the overall look and feel designed by Eeter has been
impletmented we will be focusing on refinement and adding improved
responsiveness (eg dark mode, resolving to various media widths).

Launcher has been redesigned to provide the user with a more intuitive startup
experience.  In normal working mode, the daemon (of the chosen network) will
begin to sync and become operational while the user completes wallet
creation/selection.  Then once both the wallet is ready and the daemon has
synced the wallet will fully load.

A tutorial, release notes, settings and logs have all been added to the
launcher for the user to utilize whilst they may be waiting for their daemon
to sync.  Hopefully this will allow the user to more seamlessly create wallets
with less confusion or require any additional support.

The wallet creation by seed has received a substantial update as well.  We now
allow the user to copy seeds (if they complete a warning screen) and also paste
seeds.  And for confirmation for new wallets only requires the user to complete
1/3 of the words to confirm storage of wallet's seed.

Overview has beed redesigned to give the user more information about their
wallet's current situation and to guide them where to find various features
of their wallet.  Basic graphs covering balances, tickets and transactions have
been added.  All recent transactions and recent ticket activity can be found
below the overview graphs.  We will be adding more features to the overview page
as we gauge user interest and feedback on existing additions.

Introductory data prepartion and statistics have been implemented for this
release.  For now we are providing a small window of lookback for transactions,
staking and other information.  The reduced window size is mostly an issue
with unsatisfactory performance.  When this performance improves, we will be
adding custom windows and window lengths for custom graphing and exporting
options.

## New Features


* Validate Addresses - a form to validate addresses has been added to the
  Security Center.  This will allow users to test addresses to confirm address
  ownership and/or validity.

* Filter by address - now transactions can be filtered by address in History.
  When the user enters a string into the address filter form, it will show any
  address that has an output with a matching address.

* Charts - we have decided to use [recharts](https://recharts.org) as our first
  charting solution.

* Import wallet from hex seed - instead of entering in the 33 word
  mnemonic, they are now able to use the hex representation of their seed.

* Export data to CSV - we now all users to export various types of data to csv.
  These options are found under the Transactions page.

* Show logs - logs can now be found on the launcher and on the help page.
  For now, we only show the logs of the current instance of wallet and daemon.
  This is mostly due to performance with pulling in thousands of lines of text.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/v1.1.3...v1.2.0).


## 2017-12-21


## Install

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.1.3/decrediton-1.1.3.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.1.3/decrediton-1.1.3.dmg) or
[decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.1.3/decrediton-1.1.3.exe).

See  manifest-decrediton-v1.1.3.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


# decrediton v1.1.3

This decrediton patch release covers a few commonly reported issues shortly
after v1.1.2 was released.  Most importantly this fixes a random issue on
the Windows version that was causing an unavoidable crash on startup.

## Bug Fixes

* Rollback electron-store/conf version to avoid asar/json Windows issue.

* Remove "Revoke tickets..." alert from Overview.  Due to a deeper issue in
  dcrwallet the notification whether there are tickets to revoke is being
  incorrectly announced.  Until that fix is available, it seems better to avoid
  showing the alert which confuses the user.

* Fix errors on adding Stakepool API.  On failed Stakepool API requests, the
  Stakey bounce animation would remain and the user would be unable to proceed.

* Fix sorting of voted/revoked tickets in My Tickets.

* Fix Account Key display

* Fix issue with using "Enter" to complete any Get Started form.  Doing so
  would previously make Decrediton shut down instead of submitting the action.

* Hide Paginator when <= 1 page

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/v1.1.2...v1.1.3).


# 2017-12-14


## Install

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.1.2/decrediton-v1.1.2.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.1.2/decrediton-v1.1.2.dmg) or
[decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.1.2/decrediton-v1.1.2.exe).

See manifest-v1.1.2.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v112)
* [dcrwallet](#dcrwallet-v112)
* [decrediton](#decrediton-v112)


# dcrd v1.1.2

This release of dcrd primarily contains performance enhancements, infrastructure
improvements, and other quality assurance changes.

While it is not visible in this release, significant infrastructure work has
also been done this release cycle towards porting the Lightning Network (LN)
daemon which will ultimately allow LN payments to be backed by Decred.

## Notable Changes

### Faster Block Validation

A significant portion of block validation involves handling the stake tickets
which form an integral part of Decred's hybrid proof-of-work and proof-of-stake
system.  The code which handles this portion of validation has been
significantly optimized in this release such that overall block validation is
up to approximately 3 times faster depending on the specific underlying hardware
configuration.  This also has a noticeable impact on the speed of the initial
block download process as well as how quickly votes for winning tickets are
submitted to the network.

### Data Carrier Transaction Standardness Policy

The standard policy for transaction relay of data carrier transaction outputs
has been modified to support canonically-encoded small data pushes.  These
outputs are also known as `OP_RETURN` or `nulldata` outputs.  In particular,
single byte small integers data pushes (0-16) are now supported.

## Changelog

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/v1.1.0...v1.1.2).

### Protocol and network:
- chaincfg: update checkpoints for 1.1.2 release [decred/dcrd#946](https://github.com/decred/dcrd/pull/946)
- chaincfg: Rename one of the testnet seeders [decred/dcrd#873](https://github.com/decred/dcrd/pull/873)
- stake: treap index perf improvement [decred/dcrd#853](https://github.com/decred/dcrd/pull/853)
- stake: ticket expiry perf improvement [decred/dcrd#853](https://github.com/decred/dcrd/pull/853)

### Transaction relay (memory pool):

- txscript: Correct nulldata standardness check [decred/dcrd#935](https://github.com/decred/dcrd/pull/935)

### RPC:

- rpcserver: searchrawtransactions skip first input for vote tx [decred/dcrd#859](https://github.com/decred/dcrd/pull/859)
- multi: update stakebase tx vin[0] structure [decred/dcrd#859](https://github.com/decred/dcrd/pull/859)
- rpcserver: Fix empty ssgen verbose results [decred/dcrd#871](https://github.com/decred/dcrd/pull/871)
- rpcserver: check for error in getwork request [decred/dcrd#898](https://github.com/decred/dcrd/pull/898)
- multi: Add NoSplitTransaction to purchaseticket [decred/dcrd#904](https://github.com/decred/dcrd/pull/904)
- rpcserver: avoid nested decodescript p2sh addrs [decred/dcrd#929](https://github.com/decred/dcrd/pull/929)
- rpcserver: skip generating certs when nolisten set [decred/dcrd#932](https://github.com/decred/dcrd/pull/932)
- rpc: Add localaddr and relaytxes to getpeerinfo [decred/dcrd#933](https://github.com/decred/dcrd/pull/933)
- rpcserver: update handleSendRawTransaction error handling [decred/dcrd#939](https://github.com/decred/dcrd/pull/939)

### dcrd command-line flags:

- config: add --nofilelogging option [decred/dcrd#872](https://github.com/decred/dcrd/pull/872)

### Documentation

- rpcclient: Remove docker info from README.md [decred/dcrd#886](https://github.com/decred/dcrd/pull/886)
- bloom: Fix link in README [decred/dcrd#922](https://github.com/decred/dcrd/pull/922)
- doc: tiny fix url [decred/dcrd#928](https://github.com/decred/dcrd/pull/928)
- doc: update go version for example test run in readme [decred/dcrd#936](https://github.com/decred/dcrd/pull/936)

### Developer-related package changes:

- multi: Drop glide, use dep [decred/dcrd#818](https://github.com/decred/dcrd/pull/818)
- txsort: Implement stable tx sorting package  [decred/dcrd#940](https://github.com/decred/dcrd/pull/940)
- coinset: Remove package [decred/dcrd#888](https://github.com/decred/dcrd/pull/888)
- base58: Use new github.com/decred/base58 package [decred/dcrd#888](https://github.com/decred/dcrd/pull/888)
- certgen: Move self signed certificate code into package [decred/dcrd#879](https://github.com/decred/dcrd/pull/879)
- certgen: Add doc.go and README.md [decred/dcrd#883](https://github.com/decred/dcrd/pull/883)
- rpcclient: Allow request-scoped cancellation during Connect [decred/dcrd#880](https://github.com/decred/dcrd/pull/880)
- rpcclient: Import dcrrpcclient repo into rpcclient directory [decred/dcrd#880](https://github.com/decred/dcrd/pull/880)
- rpcclient: json unmarshal into unexported embedded pointer  [decred/dcrd#941](https://github.com/decred/dcrd/pull/941)
- bloom: Copy github.com/decred/dcrutil/bloom to bloom package [decred/dcrd#881](https://github.com/decred/dcrd/pull/881)
- Improve gitignore [decred/dcrd#887](https://github.com/decred/dcrd/pull/887)
- dcrutil: Import dcrutil repo under dcrutil directory [decred/dcrd#888](https://github.com/decred/dcrd/pull/888)
- hdkeychain: Move to github.com/decred/dcrd/hdkeychain [decred/dcrd#892](https://github.com/decred/dcrd/pull/892)
- stake: Add IsStakeSubmission [decred/dcrd#907](https://github.com/decred/dcrd/pull/907)
- txscript: Require SHA256 secret hashes for atomic swaps [decred/dcrd#930](https://github.com/decred/dcrd/pull/930)

### Testing and Quality Assurance:

- gometalinter: run on subpkgs too [decred/dcrd#878](https://github.com/decred/dcrd/pull/878)
- travis: test Gopkg.lock [decred/dcrd#889](https://github.com/decred/dcrd/pull/889)
- hdkeychain: Work around go vet issue with examples [decred/dcrd#890](https://github.com/decred/dcrd/pull/890)
- bloom: Add missing import to examples [decred/dcrd#891](https://github.com/decred/dcrd/pull/891)
- bloom: workaround go vet issue in example [decred/dcrd#895](https://github.com/decred/dcrd/pull/895)
- tests: make lockfile test work locally [decred/dcrd#894](https://github.com/decred/dcrd/pull/894)
- peer: Avoid goroutine leaking during handshake timeout [decred/dcrd#909](https://github.com/decred/dcrd/pull/909)
- travis: add gosimple linter [decred/dcrd#897](https://github.com/decred/dcrd/pull/897)
- multi: Handle detected data race conditions [decred/dcrd#920](https://github.com/decred/dcrd/pull/920)
- travis: add ineffassign linter [decred/dcrd#896](https://github.com/decred/dcrd/pull/896)
- rpctest: Choose flags based on provided params [decred/dcrd#937](https://github.com/decred/dcrd/pull/937)

### Misc:

- gofmt [decred/dcrd#876](https://github.com/decred/dcrd/pull/876)
- dep: sync third-party deps [decred/dcrd#877](https://github.com/decred/dcrd/pull/877)
- Bump for v1.1.2 [decred/dcrd#916](https://github.com/decred/dcrd/pull/916)
- dep: Use upstream jrick/bitset [decred/dcrd#899](https://github.com/decred/dcrd/pull/899)
- blockchain: removed unused funcs and vars [decred/dcrd#900](https://github.com/decred/dcrd/pull/900)
- blockchain: remove unused file [decred/dcrd#900](https://github.com/decred/dcrd/pull/900)
- rpcserver: nil pointer dereference when submit orphan block [decred/dcrd#906](https://github.com/decred/dcrd/pull/906)
- multi: remove unused funcs and vars [decred/dcrd#901](https://github.com/decred/dcrd/pull/901)

### Code Contributors (alphabetical order):

- Alex Yocom-Piatt
- Dave Collins
- David Hill
- detailyang
- Donald Adu-Poku
- Federico Gimenez
- Jason Zavaglia
- John C. Vernaleo
- Jonathan Chappelow
- Jolan Luff
- Josh Rickmar
- Maninder Lall
- Matheus Degiovani
- Nicola Larosa
- Samarth Hattangady
- Ugwueze Onyekachi Michael


# dcrwallet v1.1.2

This release focuses on internal improvements to the wallet to increase code
quality, thereby making it easier to add optional support for SPV syncing in a
future release.  As always, it also comes with bug fixes, new features and other
improvements, which are detailed below.

### Bug fixes

* Vote transactions that become invalid when the main chain tip block changes
  are now removed from the wallet.  This allows the invalid vote to be double
  spent by another vote later if the ticket is picked again on a different
  chain.

* Ticket buyer now attempts to avoid purchasing tickets for old blocks if it is
  enabled while the wallet is catching up to the network.

* The application now exits cleanly if an interrupt signal (e.g. ^C or SIGINT)
  is received while at a prompt (such as during wallet creation, or with
  `--promptpass`) instead of hanging at the prompt.

* The application no longer refuses to start when duplicate RPC listener
  addresses which bind to port 0 are specified in the config.

* The `listtransactions` JSON-RPC has been fixed so that the order and amount
  values of all results match the results returned by Bitcoin Core.

* The `gettransaction` JSON-RPC has been fixed to return fees as negative
  numbers instead of positive, which matches the behavior of Bitcoin Core.

### New features

* A new gRPC method `WalletService.GetTickets` has been introduced to return all
  wallet ticket purchases between a block range.  The results are streamed to
  the client.

* A new gRPC method `WalletService.ValidateAddress` has been added with similar
  semantics and usage to the `validateaddress` JSON-RPC method.  It can be used
  to decode an address string, ensuring that it is a valid address, as well as
  returning whether the address is owned by the wallet.

* A new gRPC service `DecodeMessageService` has been introduced to make it
  easier for clients not able to decode raw Decred wire messages themselves to
  decode a message into a gRPC message.  Currently, one method exists in the
  service, `DecodeRawTransaction`, which decodes a Decred transaction.

* Pagination support has been added to the `WalletService.GetTransactions`
  method through the introduction of a new `target_transaction_count` parameter
  in the request.  Responses are immediately streamed to the client when the
  target is reached.

* The TX IPC pipe has been added (enabled with the `pipetx` option) to receive
  messages from the application by a parent process.  When combined with the
  `rpclistenerevents` option, this allows the application to inform the parent
  process of the listener addresses used by the gRPC and JSON-RPC servers.  This
  is especially useful when binding listeners to port 0 as the application is
  able to report the actual port chosen by the operating system to the parent
  process.

### Other improvements

* Vendoring management of dependency source code has been switched from `glide`
  to `dep`.  See the README.md for new build instructions.

* The BIP0044 coin type has been seamlessly upgraded from the old Decred value
  of 20 to 42.  The new coin type is the coin type reserved for Decred in
  [SLIP0044](https://github.com/satoshilabs/slips/blob/master/slip-0044.md) and
  will allow greater compatibility with third party wallets.  New wallets are
  always created with the new coin type, but for legacy compatibility old
  wallets and seed restores which have address usage with the old coin type will
  not be upgraded.

* The address discovery algorithm has been made more concurrent and should see
  performance improvements, especially on CPUs with high core counts.

* Performance improvements were made to the `WalletService.GetTransactions` gRPC
  method by avoiding unnecessary JSON-RPC calls to dcrd.

* The `ticketaddress` option has been deprecated and replaced by the
  `ticketbuyer.votingaddress` option.

* Publishing duplicate vote transactions in a redundant voting wallet setup no
  longer logs an error for a rejected duplicate transaction.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/v1.1.0...v1.1.2).


# decrediton v1.1.2

This release marks a major turning point in our overall look and feel of
Decrediton. We have introduced consistent header areas with a new subpage/tab
interface.  React-motion has been added to give a better feel for transitions
from page to page and expanded area reveals.  All information modals and
passphrase modals have been consolidated to have a consistent feel whenever they
are used.

As part of the design overhaul, the Tickets page has begun its transformation
to provide a much better user experience.  My Tickets subpage is the first step
into giving users a clearer picture into their current staking situation.  In
the upcoming release, we will be adding extensive statistics and graphing to
further help visualize a given users' balance and staking history.  Overall,
we aim to continue to add more tools that will help users' staking experience
be much more enjoyable and carefree.

We have also added advanced daemon setup abilities for users that want to use
remote daemons or use a different location for their blockchain data.  In the
next release, we plan on also adding the ability to handle advanced back-end
wallet setups: easily switch between different wallet files on the same machine,
connecting to a remote wallet and other possible situations.  But these advanced
options will also be completely transparent for users that choose to run with
the default settings.

We have added a Security Center page that will be a catch-all place to
store tools that we feel have utility, but aren't needed for everyday normal
wallet operation.  The first 2 tools that have been added are for Signing and
Verifying messages using addresses and private keys to prove ownership of a
given address.  Here is a typical use case:  User A wants to prove to User B
that they control a given address.  With the Sign Message tool, User A enters
the address, a message and their wallet's private passphrase.  The tool produces
a hash that was created based on that address' private key and the given
message.  With the Verify Message tool, User B can use the address in question,
the hash and the message from User A to verify that it was signed using that
address' private key.

We are also happy to announce the introduction of internationalization.
Brazilian Portuguese has been added for the first pass and we will be slowly
adding more languages on every new release.

Things to expect in the next release:

- New overview page design
- Rich historical Statistics/Graphs
- New staking account user experience
- Advanced wallet settings
- More languages translated

## Bug fixes

* Fix issue on Windows caused by using "Aux" as a filename.  Aux is a restricted
  filename with Windows and a simple filename change fixed it.

* Fix shutdown issue with macOS.  When cmd-Q or quitting Decrediton from the
  dock caused dcrd and dcrwallet to not be shutdown in the background.  By
  adding a final closeClis() in app.on("before-quit",...) it ensures that
  everything is closed on any shutdown.

* Removed Skip Sync button due to the new slip44 change in dcrwallet.  With the
  new coin type change, dcrwallet needs to check if there has been any address
  usage up to that point in the chain for a given wallet.

* Shorten account names in various areas to avoid obnoxious overflow.

* Fix issue that was occuring when clearing out stakepool configurations.  This
  would cause users to possibly have incorrect stakepool setups.

* Change functionality of the space key during seed entry.  Previously, when the
  user would enter the space key they would end up not "selecting" a word and
  then just type the whole seed.  Now the space "selects" the word just as
  pressing tab does.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/v1.1.1...v1.1.2).  Also see
all changes to dcrwallet
[here](https://github.com/decred/dcrwallet/compare/v1.1.0...v1.1.2).


# [v1.1.1](https://github.com/decred/decred-binaries/releases/tag/v1.1.1)

## 2017-09-29


## Install

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.1.1/decrediton-1.1.1.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.1.1/decrediton-1.1.1.dmg) or
[decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.1.1/decrediton-1.1.1.exe).

See  manifest-decrediton-v1.1.1.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


# decrediton v1.1.1

This patch release primarily fixes Windows version from not allowing dcrd and
dcrwallet to be shutdown gracefully.  Upon decrediton close, shutdown requests
are given to the 2 child-processes to cleanly shutdown now.

This commit also marks the first unit test of the React components we are
including.   In the upcoming releases we plan on expanding test coverage to
hopefully ensure that each release is as bug free as possible.

We can now get transaction details for pending transactions and the
transaction notifactions are clickable to see that details page.

App versions are now pulled directly from the binaries themselves instead
of any hardcoding so users can be assured they are running specific versions
of dcrd and dcrwallet underneath.

## Bug Fixes

- Disable rescan, add ApiKey and Import Script buttons if there is an
  outstanding rescan request processing.  Otherwise you can issue multiple
  requests at the same time and it will lead to unsightly UX.

- Fix Stakepools Overview link that was resulting in a 404 previously.

- Add total subsidy to the tickets page.

- Fix Add Stakepool Button in Stakepool Config page.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/v1.1.0...v1.1.1).


# [v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0)

## 2017-09-22


## Install

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v1.0.8/decred_1.1.0-release_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v1.0.8/decred_1.1.0-release_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.1.0/decrediton-1.1.0.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.1.0/decrediton-1.1.0.dmg) or
[decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.1.0/decrediton-1.1.0.exe).

See manifest-v1.1.0.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v110)
* [dcrwallet](#dcrwallet-v110)
* [Paymetheus](#paymetheus-v110)
* [decrediton](#decrediton-v110)


# dcrd v1.1.0

This release of dcrd primarily introduces a new consensus vote agenda which
allows the stakeholders to decide whether or not to activate the features needed
for providing full support for Lightning Network.  For those unfamiliar with the
voting process in Decred, this means that all code in order to support these
features is already included in this release, however its enforcement will
remain dormant until the stakeholders vote to activate it.

The following Decred Change Proposals (DCPs) describe the proposed changes in detail:
- [DCP0002](https://github.com/decred/dcps/blob/master/dcp-0002/dcp-0002.mediawiki)
- DCP0003 (This documentation is not complete yet.  It will be available soon after release and before the vote begins)

It is important for everyone to upgrade their software to this latest release
even if you don't intend to vote in favor of the agenda.

## Notable Changes

### Lightning Network Features Vote

In order to fully support many of the benefits that the Lightning Network will
bring, there are some primitives that involve changes to the current consensus
that need to be enabled.  A new vote with the id "lnfeatures" is now available
as of this release.  After upgrading, stakeholders may set their preferences
through their wallet or stake pool's website.

### Transaction Finality Policy

The standard policy for transaction relay has been changed to use the median
time of the past several blocks instead of the current network adjusted time
when examining lock times to determine if a transaction is final.  This provides
a more deterministic check across all peers and prevents the possibility of
miners attempting to game the timestamps in order to include more transactions.

Consensus enforcement of this change relies on the result of the aforementioned
'lnfeatures' vote.

### Relative Time Locks Policy

The standard policy for transaction relay has been modified to enforce relative
lock times for version 2 transactions via their sequence numbers and a new
`OP_CHECKSEQUENCEVERIFY` opcode.

Consensus enforcement of this change relies on the result of the aforementioned
'lnfeatures' vote.

### OP_SHA256 Opcode

In order to better support cross-chain interoperability, a new opcode to compute
the SHA-256 hash is being proposed.  Since this opcode is implemented as a hard
fork, it will not be available for use in scripts unless the aforementioned
'lnfeatures' vote passes.

## Changelog

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/v1.0.7...v1.1.0).

### Protocol and network:
- chaincfg: update checkpoints for 1.1.0 release [decred/dcrd#850](https://github.com/decred/dcrd/pull/850)
- chaincfg: Introduce agenda for v5 lnfeatures vote [decred/dcrd#848](https://github.com/decred/dcrd/pull/848)
- txscript: Introduce OP_SHA256 [decred/dcrd#851](https://github.com/decred/dcrd/pull/851)
- wire: Decrease num allocs when decoding headers [decred/dcrd#861](https://github.com/decred/dcrd/pull/861)
- blockchain: Implement enforced relative seq locks [decred/dcrd#864](https://github.com/decred/dcrd/pull/864)
- txscript: Implement CheckSequenceVerify [decred/dcrd#864](https://github.com/decred/dcrd/pull/864)
- multi: Enable vote for DCP0002 and DCP0003 [decred/dcrd#855](https://github.com/decred/dcrd/pull/855)

### Transaction relay (memory pool):
- mempool: Use median time for tx finality checks [decred/dcrd#860](https://github.com/decred/dcrd/pull/860)
- mempool: Enforce relative sequence locks [decred/dcrd#864](https://github.com/decred/dcrd/pull/864)
- policy/mempool: Enforce CheckSequenceVerify opcode [decred/dcrd#864](https://github.com/decred/dcrd/pull/864)

### RPC:
- rpcserver: check whether ticketUtx was found [decred/dcrd#824](https://github.com/decred/dcrd/pull/824)
- rpcserver: return rule error on rejected raw tx [decred/dcrd#808](https://github.com/decred/dcrd/pull/808)

### dcrd command-line flags:
- config: Extend --profile cmd line option to allow interface to be specified [decred/dcrd#838](https://github.com/decred/dcrd/pull/838)

### Documentation
- docs: rpcapi format update [decred/dcrd#807](https://github.com/decred/dcrd/pull/807)
- config: export sampleconfig for use by dcrinstall [decred/dcrd#834](https://github.com/decred/dcrd/pull/834)
- sampleconfig: Add package README and doc.go [decred/dcrd#835](https://github.com/decred/dcrd/pull/835)
- docs: create entry for getstakeversions in rpcapi [decred/dcrd#819](https://github.com/decred/dcrd/pull/819)
- docs: crosscheck and update all rpc doc entries [decred/dcrd#847](https://github.com/decred/dcrd/pull/847)
- docs: update git commit messages section heading [decred/dcrd#863](https://github.com/decred/dcrd/pull/863)

### Developer-related package changes:
- Fix and regenerate precomputed secp256k1 curve [decred/dcrd#823](https://github.com/decred/dcrd/pull/823)
- dcrec: use hardcoded datasets in tests [decred/dcrd#822](https://github.com/decred/dcrd/pull/822)
- Use dchest/blake256  [decred/dcrd#827](https://github.com/decred/dcrd/pull/827)
- glide: use jessevdk/go-flags for consistency [decred/dcrd#833](https://github.com/decred/dcrd/pull/833)
- multi: Error descriptions are in lower case [decred/dcrd#842](https://github.com/decred/dcrd/pull/842)
- txscript: Rename OP_SHA256 to OP_BLAKE256 [decred/dcrd#840](https://github.com/decred/dcrd/pull/840)
- multi: Abstract standard verification flags [decred/dcrd#852](https://github.com/decred/dcrd/pull/852)
- chain: Remove memory block node pruning [decred/dcrd#858](https://github.com/decred/dcrd/pull/858)
- txscript: Add API to parse atomic swap contracts [decred/dcrd#862](https://github.com/decred/dcrd/pull/862)

### Testing and Quality Assurance:
- Test against go 1.9 [decred/dcrd#836](https://github.com/decred/dcrd/pull/836)
- dcrec: remove testify dependency [decred/dcrd#829](https://github.com/decred/dcrd/pull/829)
- mining_test: add edge conditions from btcd [decred/dcrd#831](https://github.com/decred/dcrd/pull/831)
- stake: Modify ticket tests to use chaincfg params [decred/dcrd#844](https://github.com/decred/dcrd/pull/844)
- blockchain: Modify tests to use chaincfg params [decred/dcrd#845](https://github.com/decred/dcrd/pull/845)
- blockchain: Cleanup various tests [decred/dcrd#843](https://github.com/decred/dcrd/pull/843)
- Ensure run_tests.sh local fails correctly when gometalinter errors [decred/dcrd#846](https://github.com/decred/dcrd/pull/846)
- peer: fix logic race in peer connection test [decred/dcrd#865](https://github.com/decred/dcrd/pull/865)

### Misc:
- glide: sync deps [decred/dcrd#837](https://github.com/decred/dcrd/pull/837)
- Update decred deps for v1.1.0 [decred/dcrd#868](https://github.com/decred/dcrd/pull/868)
- Bump for v1.1.0 [decred/dcrd#867](https://github.com/decred/dcrd/pull/867)

### Code Contributors (alphabetical order):

- Alex Yocom-Piatt
- Dave Collins
- David Hill
- Donald Adu-Poku
- Jason Zavaglia
- Jean-Christophe Mincke
- Jolan Luff
- Josh Rickmar


# dcrwallet v1.1.0

This release focuses on adding voting agendas for the hard forks described in
[DCP0002](https://github.com/decred/dcps/blob/master/dcp-0002/dcp-0002.mediawiki) and [DCP0003]().  It also comes with the normal set of bug fixes and
improvements.

## Bug fixes

* Revocations can now be created which double spend an unmined vote, as long as
  the vote is not voting on the most recent block.  This allows revocations to
  be created for votes that were made but not included in the block by miners.

* Tickets manually added through the `addticket` JSON-RPC method are now
  included in the `gettickets` results.  This is required for correct stakepool
  functionality.

* An off-by-one was fixed when logging the number of watched addresses at wallet
  startup.

* A divide-by-zero error has been fixed when attempting to use the integrated
  ticket buyer starting from the genesis block on simnet.

## New features

* A new gRPC method `WalletService.CreateSignature` has been added to create a
  raw transaction input signature.  This is useful for clients that need to
  include signatures in non-standard scripts without resorting to dumping a
  private key and signing in the client.

* The gRPC `WalletService.Balance` result has been updated to include the
  unconfirmed balance.  This unconfirmed balance has the same semantics as the
  unconfirmed field from the `getbalance` JSON-RPC result.

## Other improvements

* The help text for the `addticket` JSON-RPC method has been updated to reflect
  that fact that manually added tickets are not reported in the statistics
  returned by the `getstakeinfo` method.

* Added support for Go 1.9.  Release binaries are now created using this Go
  version.

* The sample config has been updated for the current configuration defaults.
  This sample config had not been updated in the past when default config
  options were changed.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/v1.0.8...v1.1.0).


# decrediton v1.1.0

This release decrediton is significant for a few newly added features and
improvements.  With the help of jrick, we are now able to control child
processes properly in Windows and are now able to add Windows support.

The entire startup process has been refined to help users understand what is
happening behind the scenes.  Now it should be clear to users when the
blockchain is downloading and what the consequences are for skipping initial
sync.

We have also completed work on the initial phases of the React/Redux refactor.
All inline styles have been replaced with Less styling and all components
have been broken up into logic and presentation portions.  The next step will
be to audit and refactor the Redux state and ensure that everything is
immutable and recording proper state.

The following release will include a completely redesigned UX for staking.  We
hope that this will make staking more approachable to new users.  We will also
be adding complete ticket status information and basic graphs for users to
visualize their accumulated returns from staking.

## New Features

* An "About" window now shows current decrediton version, plus versions of
  packaged dcrd and dcrwallet binaries. This should help debug users' issues
  going forward.

* New startup procedure.  We now wait for dcrd's rpc connection to be available
  and subsequently check block count.  We can now show users an estimated time
  for full blockchain download.  This done by using a best guess according to
  5 minutes per block and when the chain launched.  We plan on using more
  intelligent methods of checking current block height in the future.

* Send all.  Users can now construct transactions that will completely drain an
  account.  Simply select the account you would like to send from, click "Send
  All" then enter you destination address.  You will then be shown the
  amount to be sent and the estimated fee.  Click send and enter your
  private passphrase to complete the transaction.

* Show rescan progress in sidebar.  This should help users avoid confusion
  after linking ApiKeys or importing scripts.

* Allow for basic resizing of the application window.  We are currently
  designing fully implemented media size break points.  But in the meantime
  this fix should allow users with low PPI screens to see the entire
  application view.

## Bug fixes

* Clear stakepool configurations when creating a new wallet.  Otherwise, users
  could get into unintended situations with stakepool settings from one wallet
  being attempted on another.  Other checks were still in place to avoid major
  issues, but this led to undesirable UX.

* Show pending transactions of all types in the overview and the history page.

* Fix erroneous reloads and form submission in get started pages.

* Settings were being saved on field change instead of Save Setting submit.

* When using testnet, use different background color in SideBar to accentuate
  that is is a different network.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/v1.0.8...v1.1.0).  Also see
all changes to dcrwallet
[here](https://github.com/decred/dcrwallet/compare/v1.0.8...v1.1.0).

# Paymetheus v1.1.0

This release is likely to be the last, or one of the last, Paymetheus releases.
We have decided to unifiy efforts into development of our cross-platform GUI,
decrediton.  We will continue to search for interested WPF/xaml developers
that would like to continue development of this native Windows GUI. Users are
encouraged to migrate to the Windows release of Decrediton by importing your
Paymetheus seed.  In the meantime, this release of Paymetheus contains the
updates for voting on DCP0002 and DCP0003 and is intended as an interim release
to smooth the migration process.


# [v1.0.8](https://github.com/decred/decred-binaries/releases/tag/v1.0.8)

## 2017-08-25


## Install

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v1.0.8/decred_1.0.8-release_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v1.0.8/decred_1.0.8-release_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.0.8/decrediton-1.0.8.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.0.8/decrediton-1.0.8.dmg).

See manifest-v1.0.8.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrwallet](#dcrwallet-v108)
* [Paymetheus](#paymetheus-v108)
* [decrediton](#decrediton-v108)


# dcrwallet v1.0.8

This release focused on minor bug fixes.  No new features have been added.

## Bug fixes

* Tickets that are not owned by the wallet but are still recorded for spend
  tracking purposes are skipped when generating the stake information and acting
  on selected ticket notifications.  This prevents misreporting a high missed
  count in the stake information and avoids trying to create and send unsigned
  votes or revocations for tickets that can't be spent by the wallet.

* gRPC transaction notifications for mined transactions now use the earliest of
  the seen time and block time as their timestamp.  This prevents seed-restored
  wallets from using the time of restore as the transaction time as well as
  using the block time for any transactions received while the wallet was
  offline.

* gRPC services are no longer registered with the server after it has begun
  serving and listening for clients.  This is a correctness fix for a data race
  and a misuse of the gRPC package.  Delayed services such as the WalletService
  still require a loaded wallet to be used and users of the API shouldn't notice
  any difference.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/v1.0.7...v1.0.8).


## Paymetheus v1.0.8

This release focused on under-the-hood improvements to the backend (dcrwallet)
instead of new features or UI changes.

## Bug fixes

* Mined transactions now use the earliest of the seen time and the block time
  for a timestamp.  This avoids simply showing every transaction arriving at the
  time of restore when a wallet is seed restored, and also corrects the
  timestamp for transactions received while the wallet was not running.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/Paymetheus/compare/v1.0.7...v1.0.8).  Also see
all changes to dcrwallet
[here](https://github.com/decred/dcrwallet/compare/v1.0.7...v1.0.8).


## decrediton v1.0.8

This patch release fixes a critical bug that effected users that had multiple
stakepools configured at the same time.  Periodically some stakepool settings
would get overwritten onto others which would cause pool fees to be incorrectly
set for a given ticket.  If the pool fees were too low according to the stakepool,
they would be considered invalid.  If you believe you could have been effected
by this issue, please check on your stakepool tickets page to see if you have
any invalid tickets.  Then please contact your stakepool operator about getting
the tickets added and ready to be voted on.

Upon upgrading to 1.0.8 it is recommended to delete your existing config.json
located in your decrediton application directory.  Then restart your decrediton
and re-enter your apikeys.  You may need to restart decrediton an extra time
for your stakepool list to populate.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/v1.0.7...v1.0.8).  Also see
all changes to dcrwallet
[here](https://github.com/decred/dcrwallet/compare/v1.0.7...v1.0.8).


# [v1.0.7](https://github.com/decred/decred-binaries/releases/tag/v1.0.7)

## 2017-08-17


## Install

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v1.0.7/decred_1.0.7-release_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v1.0.7/decred_1.0.7-release_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.0.7/decrediton-1.0.7.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.0.7/decrediton-1.0.7.dmg).

See manifest-v1.0.7.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v107)
* [dcrwallet](#dcrwallet-v107)
* [Paymetheus](#paymetheus-v107)
* [decrediton](#decrediton-v107)


## dcrd v1.0.7

This release of dcrd primarily contains improvements to the infrastructure and other quality assurance changes
that are bringing us closer to providing full support for Lightning Network.

A lot of work required for Lightning Network support went into getting the required code merged into the upstream
project, btcd, which now fully supports it.  These changes also must be synced and integrated with dcrd as well and
therefore many of the changes in this release are related to that process.


## Notable Changes

### Dust check removed from stake transactions

The standard policy for regular transactions is to reject any transactions that have outputs so small that
they cost more to the network than their value.  This behavior is desirable for regular transactions, however
it was also being applied to vote and revocation transactions which could lead to a situation where stake pools
with low fees could result in votes and revocations having difficulty being mined.

This check has been changed to only apply to regular transactions now in order to prevent any issues.  Stake
transactions have several other checks that make this one unnecessary for them.

### New `feefilter` peer-to-peer message

A new optional peer-to-peer message named `feefilter` has been added that allows peers to inform others about the
minimum transaction fee rate they are willing to accept.  This will enable peers to avoid notifying others about
transactions they will not accept anyways and therefore can result in a significant bandwith savings.

### Bloom filter service bit enforcement

Peers that are configured to disable bloom filter support will now disconnect remote peers that send bloom
filter related commands rather than simply ignoring them.  This allows any light clients that do not observe
the service bit to potentially find another peer that provides the service.  Additionally, remote peers that
have negotiated a high enough protocol version to observe the service bit and still send bloom filter
related commands anyways will now be banned.


## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/v1.0.5...v1.0.7).

### Protocol and network:
- Allow reorg of block one [decred/dcrd#745](https://github.com/decred/dcrd/pull/745)
- blockchain: use the time source [decred/dcrd#747](https://github.com/decred/dcrd/pull/747)
- peer: Strictly enforce bloom filter service bit [decred/dcrd#768](https://github.com/decred/dcrd/pull/768)
- wire/peer: Implement feefilter p2p message [decred/dcrd#779](https://github.com/decred/dcrd/pull/779)
- chaincfg: update checkpoints for 1.0.7 release  [decred/dcrd#816](https://github.com/decred/dcrd/pull/816)

### Transaction relay (memory pool):
- mempool: Break dependency on chain instance [decred/dcrd#754](https://github.com/decred/dcrd/pull/754)
- mempool: unexport the mutex [decred/dcrd#755](https://github.com/decred/dcrd/pull/755)
- mempool: Add basic test harness infrastructure [decred/dcrd#756](https://github.com/decred/dcrd/pull/756)
- mempool: Improve tx input standard checks [decred/dcrd#758](https://github.com/decred/dcrd/pull/758)
- mempool: Update comments for dust calcs [decred/dcrd#764](https://github.com/decred/dcrd/pull/764)
- mempool: Only perform standard dust checks on regular transactions  [decred/dcrd#806](https://github.com/decred/dcrd/pull/806)

### RPC:
- Fix gettxout includemempool handling [decred/dcrd#738](https://github.com/decred/dcrd/pull/738)
- Improve help text for getmininginfo [decred/dcrd#748](https://github.com/decred/dcrd/pull/748)
- rpcserverhelp: update TicketFeeInfo help [decred/dcrd#801](https://github.com/decred/dcrd/pull/801)
- blockchain: Improve getstakeversions efficiency [decred/dcrd#81](https://github.com/decred/dcrd/pull/813)

### dcrd command-line flags:
- config: introduce new flags to accept/reject non-std transactions [decred/dcrd#757](https://github.com/decred/dcrd/pull/757)
- config: Add --whitelist option [decred/dcrd#352](https://github.com/decred/dcrd/pull/352)
- config: Improve config file handling [decred/dcrd#802](https://github.com/decred/dcrd/pull/802)
- config: Improve blockmaxsize check [decred/dcrd#810](https://github.com/decred/dcrd/pull/810)

### dcrctl:
- Add --walletrpcserver option [decred/dcrd#736](https://github.com/decred/dcrd/pull/736)

### Documentation
- docs: add commit prefix notes  [decred/dcrd#788](https://github.com/decred/dcrd/pull/788)

### Developer-related package changes:
- blockchain: check errors and remove ineffectual assignments [decred/dcrd#689](https://github.com/decred/dcrd/pull/689)
- stake: less casting [decred/dcrd#705](https://github.com/decred/dcrd/pull/705)
- blockchain: chainstate only needs prev block hash [decred/dcrd#706](https://github.com/decred/dcrd/pull/706)
- remove dead code [decred/dcrd#715](https://github.com/decred/dcrd/pull/715)
- Use btclog for determining valid log levels [decred/dcrd#738](https://github.com/decred/dcrd/pull/738)
- indexers: Minimize differences with upstream code [decred/dcrd#742](https://github.com/decred/dcrd/pull/742)
- blockchain: Add median time to state snapshot [decred/dcrd#753](https://github.com/decred/dcrd/pull/753)
- blockmanager: remove unused GetBlockFromHash function [decred/dcrd#761](https://github.com/decred/dcrd/pull/761)
- mining: call CheckConnectBlock directly [decred/dcrd#762](https://github.com/decred/dcrd/pull/762)
- blockchain: add missing error code entries [decred/dcrd#763](https://github.com/decred/dcrd/pull/763)
- blockchain: Sync main chain flag on ProcessBlock [decred/dcrd#767](https://github.com/decred/dcrd/pull/767)
- blockchain: Remove exported CalcPastTimeMedian func [decred/dcrd#770](https://github.com/decred/dcrd/pull/770)
- blockchain: check for error [decred/dcrd#772](https://github.com/decred/dcrd/pull/772)
- multi: Optimize by removing defers [decred/dcrd#782](https://github.com/decred/dcrd/pull/782)
- blockmanager: remove unused logBlockHeight [decred/dcrd#787](https://github.com/decred/dcrd/pull/787)
- dcrutil: Replace DecodeNetworkAddress with DecodeAddress [decred/dcrd#746](https://github.com/decred/dcrd/pull/746)
- txscript: Force extracted addrs to compressed [decred/dcrd#775](https://github.com/decred/dcrd/pull/775)
- wire: Remove legacy transaction decoding [decred/dcrd#794](https://github.com/decred/dcrd/pull/794)
- wire: Remove dead legacy tx decoding code [decred/dcrd#796](https://github.com/decred/dcrd/pull/796)
- mempool/wire: Don't make policy decisions in wire [decred/dcrd#797](https://github.com/decred/dcrd/pull/797)
- dcrjson: Remove unused cmds & types [decred/dcrd#795](https://github.com/decred/dcrd/pull/795)
- dcrjson: move cmd types [decred/dcrd#799](https://github.com/decred/dcrd/pull/799)
- multi: Separate tx serialization type from version [decred/dcrd#798](https://github.com/decred/dcrd/pull/798)
- dcrjson: add Unconfirmed field to dcrjson.GetAccountBalanceResult [decred/dcrd#812](https://github.com/decred/dcrd/pull/812)
- multi: Error descriptions should be lowercase [decred/dcrd#771](https://github.com/decred/dcrd/pull/771)
- blockchain: cast to int64  [decred/dcrd#817](https://github.com/decred/dcrd/pull/817)

### Testing and Quality Assurance:
- rpcserver: Upstream sync to add basic RPC tests [decred/dcrd#750](https://github.com/decred/dcrd/pull/750)
- rpctest: Correct several issues tests and joins [decred/dcrd#751](https://github.com/decred/dcrd/pull/751)
- rpctest: prevent process leak due to panics [decred/dcrd#752](https://github.com/decred/dcrd/pull/752)
- rpctest: Cleanup resources on failed setup [decred/dcrd#759](https://github.com/decred/dcrd/pull/759)
- rpctest: Use ports based on the process id [decred/dcrd#760](https://github.com/decred/dcrd/pull/760)
- rpctest/deps: Update dependencies and API [decred/dcrd#765](https://github.com/decred/dcrd/pull/765)
- rpctest: Gate rpctest-based behind a build tag [decred/dcrd#766](https://github.com/decred/dcrd/pull/766)
- mempool: Add test for max orphan entry eviction [decred/dcrd#769](https://github.com/decred/dcrd/pull/769)
- fullblocktests: Add more consensus tests [decred/dcrd#77](https://github.com/decred/dcrd/pull/773)
- fullblocktests: Sync upstream block validation [decred/dcrd#774](https://github.com/decred/dcrd/pull/774)
- rpctest: fix a harness range bug in syncMempools [decred/dcrd#778](https://github.com/decred/dcrd/pull/778)
- secp256k1: Add regression tests for field.go [decred/dcrd#781](https://github.com/decred/dcrd/pull/781)
- secp256k1: Sync upstream test consolidation [decred/dcrd#783](https://github.com/decred/dcrd/pull/783)
- txscript: Correct p2sh hashes in json test data  [decred/dcrd#785](https://github.com/decred/dcrd/pull/785)
- txscript: Replace CODESEPARATOR json test data [decred/dcrd#786](https://github.com/decred/dcrd/pull/786)
- txscript: Remove multisigdummy from json test data [decred/dcrd#789](https://github.com/decred/dcrd/pull/789)
- txscript: Remove max money from json test data [decred/dcrd#790](https://github.com/decred/dcrd/pull/790)
- txscript: Update signatures in json test data [decred/dcrd#791](https://github.com/decred/dcrd/pull/791)
- txscript: Use native encoding in json test data [decred/dcrd#792](https://github.com/decred/dcrd/pull/792)
- rpctest: Store logs and data in same path [decred/dcrd#780](https://github.com/decred/dcrd/pull/780)
- txscript: Cleanup reference test code  [decred/dcrd#793](https://github.com/decred/dcrd/pull/793)

### Misc:
- Update deps to pull in additional logging changes [decred/dcrd#734](https://github.com/decred/dcrd/pull/734)
- Update markdown files for GFM changes [decred/dcrd#744](https://github.com/decred/dcrd/pull/744)
- blocklogger: Show votes, tickets, & revocations [decred/dcrd#784](https://github.com/decred/dcrd/pull/784)
- blocklogger: Remove STransactions from transactions calculation [decred/dcrd#811](https://github.com/decred/dcrd/pull/811)

### Contributors (alphabetical order):

- Alex Yocomm-Piatt
- Atri Viss
- Chris Martin
- Dave Collins
- David Hill
- Donald Adu-Poku
- Jimmy Song
- John C. Vernaleo
- Jolan Luff
- Josh Rickmar
- Olaoluwa Osuntokun
- Marco Peereboom


## dcrwallet v1.0.7

This release focused on fixing several issues related to corrupted spend
tracking that would cause double spend errors when sending transactions.  All
users are recommended to upgrade.

This release also lays the groundwork for more staking features to be
implemented in future releases.  The wallet now tracks more details about all
tickets and the votes or revocations that spend them.  In future releases, this
can be used to implement highly requested features such as detailed listings of
all tickets, votes, and revocations and subsidy calculations.

### Database upgrade notice

This release contains a wallet database upgrade.  Once upgraded, the database
can not be used on older releases and downgrading will require restoring from
seed or backup.  The Decred project recommends ensuring you have access to your
wallet seed before upgrading in case a downgrade is necessary.

### Bug fixes

* Gaps are no longer created between watched addresses.  This in turn fixes
  issues where incoming transactions were not received by the wallet and
  subsequently fixes various double spending and orphan transaction errors when
  sending transactions or purchasing tickets.  Users affected by these issues
  are asked to rescan or restore from seed after upgrading.

* Adding multiple double spending unconfirmed transactions to the wallet no
  longer corrupts spend tracking.
 
* Database usage has been altered to avoid known data corruption issues caused
  by Bolt cursors.
 
* Wrapped address child indexes now continue to stay wrapped across wallet
  restarts instead of returning to the highest returned child index.  This may
  avoid unintended address reuse issues.
 
* The first address of newly-created accounts is no longer skipped over when
  generating addresses.
 
* Handling of stake transactions has been rewritten to keep data consistent with
  missed votes and blockchain reorganizations.
 
* Balance reporting has been corrected for the voting authority and locked by
  tickets balances by taking the ticket purchase's transaction fee into account.
 
* The `sendtoaddress`, `sendfrom`, and `sendmany` JSON-RPC methods now verify
  that the intended network of addresses in the request match the active
  network.
 
* Missing an explicitly specified config file now errors instead of only logging
  a warning.
 
### New features
 
* The `signrawtransaction` JSON-RPC and `WalletService.SignTransaction` gRPC
  methods are now capable of being used on offline wallets.
 
* The `WalletService.SignMessage` and `MessageVerificationService.VerifyMessage`
  gRPC methods have been introduced to add message signing and verification
  features to the gRPC API.  These methods operate similarly to the
  `signmessage` and `verifymessage` JSON-RPC methods.
 
* The `getbalance` JSON-RPC method now includes fields for unconfirmed balances
  of each account.  These balances are calculated as the spendable (by
  consensus) balance which is not already included under the `spendable` field,
  which is the spendable balance by both consensus rules and the minimum number
  of required confirmations.  The addition of both fields equals the total
  spendable-by-consensus balance.
 
* Private passphrases can now be specified on the command line or in a config
  file with the `--pass` option.  When used, the passphrase prompt at startup is
  avoided when the auto ticket buyer is enabled.
 
### Other improvements
 
* The auto ticket buyer takes better advantage of the improved ticket price
  algorithm by reducing the default maximum ticket purchase fee from 0.1/kB to
  0.01/kB and reducing the maximum number of tickets purchased per block from 5
  to 1.
 
* Ticket purchases are now removed from the wallet once the ticket price
  changes. As a result, the `--prunetickets` config option is no longer required
  or useful and has been deprecated.
 
* Performance enhancements have been made for the `getstakeinfo` JSON-RPC and
  `WalletService.StakeInfo` gRPC methods.
 
* The logger has been rewritten for improved performance.  Rolled log files are
  now gzipped.
 
* Error logs for duplicate script imports when the wallet is locked have been
  removed.
 
* Code quality has improved over several areas.
 
### Changelog
 
All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/v1.0.5...v1.0.7).
 
 
## Paymetheus v1.0.7
 
This release focused on under-the-hood improvements to the backend (dcrwallet)
instead of new features or UI changes.  Users should no longer encounter double
spend or orphan transaction errors sending transactions due to fixes for wallet
spend tracking corruption, but a seed restore is necessary to fix
already-corrupted wallets.

### Database upgrade notice
 
This release contains a wallet database upgrade.  Once upgraded, the database
can not be used on older releases and downgrading will require restoring from
seed or backup.  The Decred project recommends ensuring you have access to your
wallet seed before upgrading in case a downgrade is necessary.
 
### Bug fixes
 
* Gaps are no longer created between watched addresses.  This in turn fixes
  issues where incoming transactions were not received by the wallet and
  subsequently fixes various double spending and orphan transaction errors when
  sending transactions or purchasing tickets.  Users affected by these issues
  are asked to restore from seed after upgrading.
 
* Adding multiple double spending unconfirmed transactions to the wallet no
  longer corrupts spend tracking.
 
* Database usage has been altered to avoid known data corruption issues caused
  by Bolt cursors.
 
* Wrapped address child indexes now continue to stay wrapped across wallet
  restarts instead of returning to the highest returned child index.  This may
  avoid unintended address reuse issues.
 
* The first address of newly-created accounts is no longer skipped over when
  generating addresses.
 
* Handling of stake transactions has been rewritten to keep data consistent with
  missed votes and blockchain reorganizations.
 
### Other improvements
 
* Performance enhancements have been made for querying stake statistics in the
  "Stake mining" view.
 
### Changelog
 
All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/Paymetheus/compare/v1.0.5...v1.0.7).  Also see
all changes to dcrwallet
[here](https://github.com/decred/dcrwallet/compare/v1.0.5...v1.0.7).
 

## decrediton v1.0.7
 
This release of decrediton aims to smooth out various issues that users have
consistently reported since the release of v1.0.6.  Extra care has been taken
to ensure that users get as much information as possible to understand some
of the innerworks of Decred.  But at the same time, ticket purchasing and other
features are actively being simplified and refined.  We have also added
some basic animations instead of the default loading screens.  We hope to
integrate several pieces of art and animations from our amazing community of 
artists.

In the coming releases we are expecting the following: Windows releases and
a completely revamped onboarding procedure.  This release is a step toward
realizng those goals.

We have also begun a complete refactor and reorganization of the React 
components.  This [issue](https://github.com/decred/decrediton/issues/528) describes the end goal of this project.
Ideally, we will be able to make the UX/UI development open to all designers,
which will allow for a true collborative effort.

### Database upgrade notice
 
This release contains a wallet database upgrade.  Once upgraded, the database
can not be used on older releases and downgrading will require restoring from
seed or backup.  The Decred project recommends ensuring you have access to your
wallet seed before upgrading in case a downgrade is necessary.
 
### Bug fixes
 
* Gaps are no longer created between watched addresses.  This in turn fixes
  issues where incoming transactions were not received by the wallet and
  subsequently fixes various double spending and orphan transaction errors when
  sending transactions or purchasing tickets.  Users affected by these issues
  are asked to restore from seed after upgrading.
 
* Adding multiple double spending unconfirmed transactions to the wallet no
  longer corrupts spend tracking.
 
* Database usage has been altered to avoid known data corruption issues caused
  by Bolt cursors.
 
* Wrapped address child indexes now continue to stay wrapped across wallet
  restarts instead of returning to the highest returned child index.  This may
  avoid unintended address reuse issues.
 
* The first address of newly-created accounts is no longer skipped over when
  generating addresses.
 
* Handling of stake transactions has been rewritten to keep data consistent with
  missed votes and blockchain reorganizations.
 
* Ticket autobuyer was not properly starting and stopping. Now user is
  properly notified when the ticket buyer has started. In the coming releases,
  we will be adding even more feedback from ticket buyer so the the user
  is able to see some of the decision making happening each block.

* Autobuyer settings are now properly set on config updates and have confirmed
  that dcrwallet receives all settings as expected configuration changes.

* Under strange circumstances, users with multiple stakepools reported that
  settings were being overwritten. Now, only the pool fees field is updated if
  necessary.

* Revocations are now shown in the transaction History page.

* Small display fixes now allow clear rendering on Windows.  We are in the
  process of fully releasing on Windows in the next release.
 
* Font files were previously configured incorrectly due to not have the
  corresponding font files for request font weight.  It made all fonts look
  fuzzy and unclear.
 
* Some fields have been fixed to allow expected double-click-to-select
  functionality. We are auditting and trying to fix all of them soon.
 
* Testnet2 Wallets weren't properly being located.
 
* Update to use current network minfees by default (0.001 DCR/kB).
 
* New account creation and account renaming are now shown immediately after
  successful response from wallet.  Previously it would take an extra render
  for them to be updated in the accounts list.
 
### New features:
 
* Transaction details page has been revamped to provide the used inputs and new
  outputs that each transaction creates. We will be adding more to this page
  as new information is added to be received from dcrwallet.
 
* Transaction notifications have been moved to the bottom of the screen and
  now contain a much clearer idea of each new transaction received.  We will
  be adding the ability to click on these notifications to show the full
  transaction details page.
 
* Implement new seed entry system (react-select).  Now users can use the
  bubble entry system to ensure they have proper spellings and length when
  entering existing seed or confirming new ones.
 
* We have started to add tooltips to various fields with the react-tooltip
  package.  We are trying to avoid putting tooltips on everything.  We mostly
  try to follow feedback we're getting from users as to where tooltips might
  clear up confusion in terms of the UX.
 
* Add copy-to-clipboard functionality to address generation on the Receive page.
  We're currently auditing other places that it would make sense to add these
  buttons (or some other trigger to copy).  Most likely, tx and block hashes,
  scripts and other long strings that are annoying to highlight to copy.
 
* Add logging with winston package.  This is the first step at revamping the
  startup procedure for decrediton.  The more instances where users are can
  see where something wrong, the better we can fix/diagnose further issues.
 
* Introduce custrom animations for loading times.  Currently we have a simple
  rotating DCR logo and a sprite animated Stakey.  We are planning on adding
  a few more from various artists to showcase some of the great art being
  created by our community.
 
### Other improvements:
 
* Add working wallet/account buttons to go to Accounts page for better UX.
 
* Move stakeinfo to an expandable div on tickets page.
 
* Overhaul of various styling according to designer input.
 
* Refactor redux actions for cleaner reading.
 
* Add better instructions for stakepool apikey entry.
 
* Begin complete react component/container refactor.  This is the first step
  towards fixing component structure and reuse.
 
* Begin removing inline styles and Radium, replaced with Less styling.
 
* Add config option to use a remote daemon set up.
 
* Update README.md to include quirk about installing decrediton for the first
  time for development.
 
* Add core-decorators library and utilize @autobind annotation.
 
* Update to use webpack 3.
 
* Add rpm and deb linux builds.
 
* Fixes to DockerFile support.
 
### Changelog
 
All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/v1.0.6...v1.0.7).  Also see
all changes to dcrwallet
[here](https://github.com/decred/dcrwallet/compare/v1.0.5...v1.0.7).


# [v1.0.6](https://github.com/decred/decred-binaries/releases/tag/v1.0.6)

## 2017-06-29

This is a patch release of decrediton only.  Decrediton users are encouraged to upgrade.

### decrediton

Updates to decredtiton v1.0.6:
- Fix issue with send amounts validation that was causing decimals to fail entry.
- Add show/hide non-zero Account functionality.  If an account has a zero balance it can be hidden from being seen in dropdowns, etc.
- Add Immature tickets to StakeInfo on Tickets page.
- Add currency switching in various dropdowns.
- Make sure to request updated StakeInfo upon successful PurchaseTicket request so correct current values are shown to the user.
- More design tweaks as requested by @linnutee.

## Install

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.0.6/decrediton-1.0.6.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.0.6/decrediton-1.0.6.dmg).

See manifest-v1.0.6.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Don't try to set permissions with rsync in build script. | [decred/decrediton#461](https://github.com/decred/decrediton/pull/461) |
| Update cli tools to v1.0.5 | [decred/decrediton#463](https://github.com/decred/decrediton/pull/463) |
| Update to please PropTypes movement | [decred/decrediton#464](https://github.com/decred/decrediton/pull/464) |
| Fix various bugs that have been found in 1.0.5 | [decred/decrediton#466](https://github.com/decred/decrediton/pull/466) |
| Add show/hide account functionality | [decred/decrediton#468](https://github.com/decred/decrediton/pull/468) |
| Add Immature tickets to stake info | [decred/decrediton#469](https://github.com/decred/decrediton/pull/469) |
| Add currency type switching to dropdowns | [decred/decrediton#470](https://github.com/decred/decrediton/pull/470) |
| Add getStakeInfoAttempt on successful purchase tickets attempt | [decred/decrediton#471](https://github.com/decred/decrediton/pull/471) |
| A few remaining design fixes for v1.0.6 release | [decred/decrediton#473](https://github.com/decred/decrediton/pull/473) |
| Bump for v1.0.6 | [decred/decrediton#472](https://github.com/decred/decrediton/pull/472) |
| Fix function references | [decred/decrediton#475](https://github.com/decred/decrediton/pull/475) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/decrediton | 6eb4c2bcaba7217c7d370d342babee423565d6ca |

## Known Issues

---


# [v1.0.5](https://github.com/decred/decred-binaries/releases/tag/v1.0.5)

## 2017-06-21

This is a patch release primarily focusing on wallet issues and usability.  All users of the GUI wallets and command line tools are encouraged to update.  Mining software is not impacted.

### dcrwallet

This release focuses on fixing an issue that could result in address reuse after restarting the application.  If a previously created address was not publically used, it could be returned again after restarting.  This issue has been corrected by always deriving the next address based on the last created one.

A database upgrade has been added to record the additional info needed to fix the above issue.  Due to the database being forwards-compatible only, wallet software can not be reverted to older versions after running a new version.  If a wallet must be reverted back to old software, a seed restore should be performed.

Two new RPCs have been added to this release.  The first is a revoketickets RPC for the JSON-RPC server.  This RPC models the WalletService.RevokeTickets RPC from the gRPC server and its usage is preferable to using rebroadcastmissed, which may be removed at a later time.  The second is a WalletService.GetTransaction RPC for the gRPC server.  This RPC queries the wallet for details regarding a particular transaction using the transaction hash as a lookup key.  Previously, transaction details were only available in the gRPC server by watching block notifications or querying for all transactions in a range of blocks.

### Paymetheus

This release focuses on fixing an issue that could result in address reuse after restarting the application.  If a previously created address was not publically used, it could be returned again after restarting.  This issue has been corrected by always deriving the next address based on the last created one.

A database upgrade has been added to record the additional info needed to fix the above issue.  Due to the database being forwards-compatible only, wallet software can not be reverted to older versions after running a new version.  If a wallet must be reverted back to old software, a seed restore should be performed.

### decrediton

This patch release includes quite a few bug fixes as well as revealing more information to the user to avoid situations where the lack of information can lead to confusion.

The Accounts, Send and Receive pages have all received a large revamp to attempt to approach the designers' vision.  There are still some remaining nits to fix, but the far majority of the work has been completed.

The Accounts page now includes a balance overview for each account and that account's properties.  The Send page received the largest change, in that, it no longer has a seperate transaction confirmation view.  Instead, whenever a user completes a output or amount field they are checked for validity and then sent to dcrwallet for tx construction.  With this set up the user can now see the estimated size, fee and total amount in the lower right instead of having to wait until the next page.  Also upon clicking the Send button, the user is shown a passphrase confirmation modal.

Various other small bug fixes and visual tweaks were included in this release as well.
- Revamp Accounts page to be more like the designers' wireframes. Show balances and properties below each.
- Revamp Send functionality to avoid having to show a seperate confirmation page, instead immediately request the transaction to be constructed upon field update then the send button simple shows a passphrase modal to confirm.
- Revamp Receive page to be more like the designers' wireframes.
- Various other visual tweaks as pointed out by the designers.

### dcrd

dcrd changes were primarily infrastructure related (logs) or test related.

## Install

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v1.0.5/decred_1.0.5-release_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v1.0.5/decred_1.0.5-release_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.0.5/decrediton-1.0.5.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.0.5/decrediton-1.0.5.dmg).

See manifest-v1.0.5.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Bump for v1.0.5 | [decred/Paymetheus#300](https://github.com/decred/Paymetheus/pull/300) |
| Label go builds with release | [decred/decred-windows-installer#51](https://github.com/decred/decred-windows-installer/pull/51) |
| Updates for v1.0.5 | [decred/decred-windows-installer#53](https://github.com/decred/decred-windows-installer/pull/53) |
| Add RevokeTickets handlers | [decred/dcrrpcclient#81](https://github.com/decred/dcrrpcclient/pull/81) |
| Track btclog API updates. | [decred/dcrrpcclient#82](https://github.com/decred/dcrrpcclient/pull/82) |
| Avoid address reuse after restarting. | [decred/dcrwallet#804](https://github.com/decred/dcrwallet/pull/804) |
| Fixes #806 Prompt accepts "ok" | [decred/dcrwallet#807](https://github.com/decred/dcrwallet/pull/807) |
| json-rpc: Add revoketickets | [decred/dcrwallet#811](https://github.com/decred/dcrwallet/pull/811) |
| Log the correct next child index. | [decred/dcrwallet#812](https://github.com/decred/dcrwallet/pull/812) |
| Fix calculations of whether to write updated child indexes. | [decred/dcrwallet#814](https://github.com/decred/dcrwallet/pull/814) |
| Update port in clientusage.md | [decred/dcrwallet#816](https://github.com/decred/dcrwallet/pull/816) |
| Add WalletService.GetTransaction RPC. | [decred/dcrwallet#817](https://github.com/decred/dcrwallet/pull/817) |
| Update project dependencies. | [decred/dcrwallet#818](https://github.com/decred/dcrwallet/pull/818) |
| Bump for v1.0.5 | [decred/dcrwallet#819](https://github.com/decred/dcrwallet/pull/819) |
| secp256k1: Consolidate tests into the main package. | [decred/dcrd#722](https://github.com/decred/dcrd/pull/722) |
| secp256k1: Unexport idents that do not need to be. | [decred/dcrd#723](https://github.com/decred/dcrd/pull/723) |
| secp256k1: Optimize normalize and NAF, correct normalize, and add tests. | [decred/dcrd#724](https://github.com/decred/dcrd/pull/724) |
| dcrjson: add RevokeTicketsCmd | [decred/dcrd#726](https://github.com/decred/dcrd/pull/726) |
| Add -j/json option to dcrctl. | [decred/dcrd#728](https://github.com/decred/dcrd/pull/728) |
| all: Remove seelog logger. | [decred/dcrd#730](https://github.com/decred/dcrd/pull/730) |
| Bump for v1.0.5 | [decred/dcrd#731](https://github.com/decred/dcrd/pull/731) |
| chaincfg: update checkpoints for 1.0.5 release | [decred/dcrd#732](https://github.com/decred/dcrd/pull/732) |
| Make docker script use latest dcrd release | [decred/decrediton#429](https://github.com/decred/decrediton/pull/429) |
| Add balance overview page | [decred/decrediton#438](https://github.com/decred/decrediton/pull/438) |
| Correctly update spendlimit on ticket purchasing | [decred/decrediton#439](https://github.com/decred/decrediton/pull/439) |
| Add balance checks to send page | [decred/decrediton#441](https://github.com/decred/decrediton/pull/441) |
| Fix incorrect get for Spendable balance | [decred/decrediton#442](https://github.com/decred/decrediton/pull/442) |
| Set the seedError check to be !== null | [decred/decrediton#443](https://github.com/decred/decrediton/pull/443) |
| Make sure cursor is a pointer on buttons | [decred/decrediton#444](https://github.com/decred/decrediton/pull/444) |
| Add different styling for overview transactions | [decred/decrediton#445](https://github.com/decred/decrediton/pull/445) |
| Fix expiry not getting set properly | [decred/decrediton#451](https://github.com/decred/decrediton/pull/451) |
| Implement some of the requested changes from designer | [decred/decrediton#452](https://github.com/decred/decrediton/pull/452) |
| Bump for v1.0.5 | [decred/decrediton#454](https://github.com/decred/decrediton/pull/454) |
| Fix bugs found during patch release testing | [decred/decrediton#457](https://github.com/decred/decrediton/pull/457) |
| Correctly set the expiry for purchase tickets | [decred/decrediton#458](https://github.com/decred/decrediton/pull/458) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/Paymetheus | 11240d1354c7328b8e875cd0ce965901d9d2b9f8 |
| decred/decred-windows-installer | f8a1cd7b838ab899076075a890709640a0238f27 |
| decred/dcrwallet | 6a50ff0b9188af4b2dec68e42add0028c97fb11c |
| decred/dcrd | 0d406ffde87da224466ba5c83548941e15179872 |
| decred/decrediton | 8c2a2fdda2847d590fd2c9e2426defb1eb6865a1 |

## Known Issues

---


# [v1.0.4](https://github.com/decred/decred-binaries/releases/tag/v1.0.4)

## 2017-06-09

This release contains a fix for an error that caused Paymetheus to be unable to talk to the
dcrwallet process.  Occasionally, HTTP/2 parsing error messages would be displayed and Paymetheus
would need to be closed.  Under certain instances it was possible that the wallet would begin to work
after restarting, but some users continued to hit the issue even after restarting.  The bug was caused
by an integer overflow in the grpc-go version imported by dcrwallet 1.0.3 and was fixed by upgrading
the grpc-go dependency to the latest 1.4.0 release.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v1.0.4/decred_1.0.4-release_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v1.0.4/decred_1.0.4-release_x86.msi)
depending on your version of Windows.

See manifest-v1.0.4.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Bump for v1.0.4 | [decred/Paymetheus#296](https://github.com/decred/Paymetheus/pull/296) |
| Updates for v1.0.4 | [decred/decred-windows-installer#52](https://github.com/decred/decred-windows-installer/pull/52) |
| Add other balance fields to BalanceResponse to match json/rpc | [decred/dcrwallet#801](https://github.com/decred/dcrwallet/pull/801) |
| Change to use immature_stake_generation instead | [decred/dcrwallet#802](https://github.com/decred/dcrwallet/pull/802) |
| Update all dependencies. | [decred/dcrwallet#803](https://github.com/decred/dcrwallet/pull/803) |
| Bump for v1.0.4 | [decred/dcrwallet#805](https://github.com/decred/dcrwallet/pull/805) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/Paymetheus | dfb2cc73eb20464a0775e3771b287cd2d54939b7 |
| decred/decred-windows-installer | db7d5b814954bcdbf2bffde7db075011a0710a25 |
| decred/dcrwallet | 277226313c5b69d713e954673f12db1514e3a69a |

## Known Issues

---

# [v1.0.3](https://github.com/decred/decred-binaries/releases/tag/v1.0.3)

## 2017-06-08

This patch release mainly addresses wallet issues (both in the command line and GUI wallets).  For full list of changes and fixes, see below.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v1.0.3/decred_1.0.3-release_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v1.0.3/decred_1.0.3-release_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.0.3/decrediton-1.0.3.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.0.3/decrediton-1.0.3.dmg).

See manifest-v1.0.3.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Make the "Manage pools" button executable again. | [decred/Paymetheus#259](https://github.com/decred/Paymetheus/pull/259) |
| Allow ticket fees up to 10 DCR/kB. | [decred/Paymetheus#260](https://github.com/decred/Paymetheus/pull/260) |
| Update NuGet dependencies. | [decred/Paymetheus#265](https://github.com/decred/Paymetheus/pull/265) |
| Add checkbox to rescan for imported scripts. | [decred/Paymetheus#266](https://github.com/decred/Paymetheus/pull/266) |
| Do not prompt for the public passphrase when unset. | [decred/Paymetheus#269](https://github.com/decred/Paymetheus/pull/269) |
| Do not set a public passphrase for newly created wallets. | [decred/Paymetheus#270](https://github.com/decred/Paymetheus/pull/270) |
| Allow removal of the public passphrase. | [decred/Paymetheus#271](https://github.com/decred/Paymetheus/pull/271) |
| Add missing file. | [decred/Paymetheus#273](https://github.com/decred/Paymetheus/pull/273) |
| Update dcrwallet arguments for --grpclisten change. | [decred/Paymetheus#276](https://github.com/decred/Paymetheus/pull/276) |
| Add button to create ticket revocations. | [decred/Paymetheus#278](https://github.com/decred/Paymetheus/pull/278) |
| Improve UX of the purchase ticket view. | [decred/Paymetheus#282](https://github.com/decred/Paymetheus/pull/282) |
| Drop relay fee to 0.001 DCR/kB. | [decred/Paymetheus#283](https://github.com/decred/Paymetheus/pull/283) |
| Sync for 4.11.0 RPC API. | [decred/Paymetheus#286](https://github.com/decred/Paymetheus/pull/286) |
| Verify stakepool multisig script and p2sh voting addresses. | [decred/Paymetheus#287](https://github.com/decred/Paymetheus/pull/287) |
| Always use wrapping policy when generating addresses. | [decred/Paymetheus#291](https://github.com/decred/Paymetheus/pull/291) |
| Update gRPC to the latest patch release. | [decred/Paymetheus#292](https://github.com/decred/Paymetheus/pull/292) |
| Bump for v1.0.3 | [decred/Paymetheus#293](https://github.com/decred/Paymetheus/pull/293) |
| Revert Xunit.net update which has broken msbuild config. | [decred/Paymetheus#294](https://github.com/decred/Paymetheus/pull/294) |
| Update for v1.0.3 | [decred/decred-windows-installer#49](https://github.com/decred/decred-windows-installer/pull/49) |
| Pick up one more Paymetheus commit | [decred/decred-windows-installer#50](https://github.com/decred/decred-windows-installer/pull/50) |
| getvoteinfo doc fix | [decred/dcrrpcclient#60](https://github.com/decred/dcrrpcclient/pull/60) |
| Add GetBlockHeader and GetBlockHeaderVerbose | [decred/dcrrpcclient#62](https://github.com/decred/dcrrpcclient/pull/62) |
| Fix GetBlockHeader unmarshal. | [decred/dcrrpcclient#63](https://github.com/decred/dcrrpcclient/pull/63) |
| Remove accountfetchaddresses support. | [decred/dcrrpcclient#66](https://github.com/decred/dcrrpcclient/pull/66) |
| notify: Fix new tickets notification type. | [decred/dcrrpcclient#69](https://github.com/decred/dcrrpcclient/pull/69) |
| Add existsmissedtickets support. | [decred/dcrrpcclient#71](https://github.com/decred/dcrrpcclient/pull/71) |
| Update README.md for new github markdown parser | [decred/dcrrpcclient#73](https://github.com/decred/dcrrpcclient/pull/73) |
| Use docker containers for tests and linters. | [decred/dcrrpcclient#76](https://github.com/decred/dcrrpcclient/pull/76) |
| Track dcrjson API changes to remove unneeded verbose flags. | [decred/dcrrpcclient#77](https://github.com/decred/dcrrpcclient/pull/77) |
| Tell travis not to run install step. | [decred/dcrrpcclient#79](https://github.com/decred/dcrrpcclient/pull/79) |
| Add client APIs to control the gap limit policy. | [decred/dcrrpcclient#80](https://github.com/decred/dcrrpcclient/pull/80) |
| Remove blockHeight from Block struct. | [decred/dcrutil#17](https://github.com/decred/dcrutil/pull/17) |
| Remove incorrect assignment | [decred/dcrutil#39](https://github.com/decred/dcrutil/pull/39) |
| Remove unused API. | [decred/dcrutil#40](https://github.com/decred/dcrutil/pull/40) |
| travis-ci: Do not test vendored packages | [decred/dcrutil#41](https://github.com/decred/dcrutil/pull/41) |
| travis-ci: Actually install and use glide. | [decred/dcrutil#42](https://github.com/decred/dcrutil/pull/42) |
| Add Block.Height() helper function. | [decred/dcrutil#43](https://github.com/decred/dcrutil/pull/43) |
| Revert "Remove incorrect assignment (#39)" | [decred/dcrutil#45](https://github.com/decred/dcrutil/pull/45) |
| Update README.md files for new github md parser | [decred/dcrutil#47](https://github.com/decred/dcrutil/pull/47) |
| Use docker containers for tests and linters. | [decred/dcrutil#49](https://github.com/decred/dcrutil/pull/49) |
| Tell travis not to run install step. | [decred/dcrutil#52](https://github.com/decred/dcrutil/pull/52) |
| Fix old DB serialization code that caused panics. | [decred/dcrwallet#696](https://github.com/decred/dcrwallet/pull/696) |
| Use GetBlockHeader when only the header is needed. | [decred/dcrwallet#697](https://github.com/decred/dcrwallet/pull/697) |
| travis: test against go 1.8.x (again) | [decred/dcrwallet#698](https://github.com/decred/dcrwallet/pull/698) |
| ticketbuyer: float64 -> dcrutil.Amount conversions | [decred/dcrwallet#699](https://github.com/decred/dcrwallet/pull/699) |
| Update all dependencies to latest versions. | [decred/dcrwallet#702](https://github.com/decred/dcrwallet/pull/702) |
| Remove --unsafemainnet option and getseed JSON-RPC. | [decred/dcrwallet#703](https://github.com/decred/dcrwallet/pull/703) |
| Remove seeds from wallet databases. | [decred/dcrwallet#705](https://github.com/decred/dcrwallet/pull/705) |
| Improve getstakeinfo performance. | [decred/dcrwallet#709](https://github.com/decred/dcrwallet/pull/709) |
| Improve startup performance when loading addresses. | [decred/dcrwallet#710](https://github.com/decred/dcrwallet/pull/710) |
| Make account renaming work again. | [decred/dcrwallet#713](https://github.com/decred/dcrwallet/pull/713) |
| Remove automatic rescans for discovered scripts. | [decred/dcrwallet#714](https://github.com/decred/dcrwallet/pull/714) |
| Remove accountfetchaddresses JSON-RPC. | [decred/dcrwallet#715](https://github.com/decred/dcrwallet/pull/715) |
| Exclude expired tickets in missed count. | [decred/dcrwallet#716](https://github.com/decred/dcrwallet/pull/716) |
| legacyrpc: mark expired tickets as such | [decred/dcrwallet#719](https://github.com/decred/dcrwallet/pull/719) |
| Check errors and remove ineffectual assignments. | [decred/dcrwallet#720](https://github.com/decred/dcrwallet/pull/720) |
| Access loaded wallets through the Loader. | [decred/dcrwallet#722](https://github.com/decred/dcrwallet/pull/722) |
| use millisecond time resolution in logger | [decred/dcrwallet#723](https://github.com/decred/dcrwallet/pull/723) |
| Upgrade created watching only DBs to latest version. | [decred/dcrwallet#726](https://github.com/decred/dcrwallet/pull/726) |
| Only prioritize vote handling. | [decred/dcrwallet#730](https://github.com/decred/dcrwallet/pull/730) |
| Remove WalletService.SpentnessNotification RPC. | [decred/dcrwallet#731](https://github.com/decred/dcrwallet/pull/731) |
| Handle changing empty public passphrases in gRPC server. | [decred/dcrwallet#735](https://github.com/decred/dcrwallet/pull/735) |
| Allow --createwatchingonly without --create. | [decred/dcrwallet#736](https://github.com/decred/dcrwallet/pull/736) |
| Refactor test to avoid data race. | [decred/dcrwallet#738](https://github.com/decred/dcrwallet/pull/738) |
| Rollback DB updates for failed tx publishing. | [decred/dcrwallet#740](https://github.com/decred/dcrwallet/pull/740) |
| Replace unnecessary DB update with view. | [decred/dcrwallet#741](https://github.com/decred/dcrwallet/pull/741) |
| Enable the gRPC server by default. | [decred/dcrwallet#744](https://github.com/decred/dcrwallet/pull/744) |
| Add RPC to revoke missed and/or expired tickets. | [decred/dcrwallet#746](https://github.com/decred/dcrwallet/pull/746) |
| Comment out EstimateStakeDiff request | [decred/dcrwallet#747](https://github.com/decred/dcrwallet/pull/747) |
| Bump required dcrd JSON-RPC API semver. | [decred/dcrwallet#748](https://github.com/decred/dcrwallet/pull/748) |
| Drop default relay fee to 0.001 DCR/kB. | [decred/dcrwallet#750](https://github.com/decred/dcrwallet/pull/750) |
| Improve error messages for failed address lookups. | [decred/dcrwallet#751](https://github.com/decred/dcrwallet/pull/751) |
| Correct a comment. | [decred/dcrwallet#753](https://github.com/decred/dcrwallet/pull/753) |
| Deprecate SpreadTicketPurchases, add NoSpreadTicketPurchases | [decred/dcrwallet#754](https://github.com/decred/dcrwallet/pull/754) |
| Rework db tx handling for chain notifiations. | [decred/dcrwallet#756](https://github.com/decred/dcrwallet/pull/756) |
| Add warning message when vote version is older than blockheader's StakeVersion | [decred/dcrwallet#758](https://github.com/decred/dcrwallet/pull/758) |
| Save published transactions if relevant. | [decred/dcrwallet#761](https://github.com/decred/dcrwallet/pull/761) |
| Add RPC to watch for transaction notifications. | [decred/dcrwallet#763](https://github.com/decred/dcrwallet/pull/763) |
| Replace all grpc.Errorf occurences with status.Errorf. | [decred/dcrwallet#764](https://github.com/decred/dcrwallet/pull/764) |
| tickets: use async/a map to speedup LiveTicketHashes | [decred/dcrwallet#767](https://github.com/decred/dcrwallet/pull/767) |
| Update README.md files for new github parser. | [decred/dcrwallet#773](https://github.com/decred/dcrwallet/pull/773) |
| Use docker containers for tests and linters. | [decred/dcrwallet#775](https://github.com/decred/dcrwallet/pull/775) |
| Add coinbase type to TransactionDetails message. | [decred/dcrwallet#777](https://github.com/decred/dcrwallet/pull/777) |
| remove deadcode | [decred/dcrwallet#778](https://github.com/decred/dcrwallet/pull/778) |
| gometalinter: enable ineffassign | [decred/dcrwallet#779](https://github.com/decred/dcrwallet/pull/779) |
| Provide means to confirm imported scripts are redeemable. | [decred/dcrwallet#780](https://github.com/decred/dcrwallet/pull/780) |
| Add block identifiers to confirmation notifications. | [decred/dcrwallet#781](https://github.com/decred/dcrwallet/pull/781) |
| Add BlockInfo RPC to query block info by height or hash. | [decred/dcrwallet#782](https://github.com/decred/dcrwallet/pull/782) |
| Fix the gRPC API version. | [decred/dcrwallet#783](https://github.com/decred/dcrwallet/pull/783) |
| Add wallet APIs for controlling the gap limit policy. | [decred/dcrwallet#785](https://github.com/decred/dcrwallet/pull/785) |
| Update estimateTxSize consts | [decred/dcrwallet#788](https://github.com/decred/dcrwallet/pull/788) |
| README.md updates for grpc server going default. | [decred/dcrwallet#791](https://github.com/decred/dcrwallet/pull/791) |
| Allow specification of gap limit policy as RPC parameter. | [decred/dcrwallet#792](https://github.com/decred/dcrwallet/pull/792) |
| Tell travis not to run install step. | [decred/dcrwallet#795](https://github.com/decred/dcrwallet/pull/795) |
| Fix off by one in active address loading. | [decred/dcrwallet#796](https://github.com/decred/dcrwallet/pull/796) |
| Remove verbose options from getnewaddress/getrawchangeaddress. | [decred/dcrwallet#797](https://github.com/decred/dcrwallet/pull/797) |
| Allow specification of gap policy as JSON-RPC parameter.  | [decred/dcrwallet#798](https://github.com/decred/dcrwallet/pull/798) |
| Bump for v1.0.3 | [decred/dcrwallet#800](https://github.com/decred/dcrwallet/pull/800) |
| rpcserver: Support larger block sizes. | [decred/dcrd#675](https://github.com/decred/dcrd/pull/675) |
| Log the actual error as well. | [decred/dcrd#676](https://github.com/decred/dcrd/pull/676) |
| dcrjson: getblocksubsidy support. | [decred/dcrd#679](https://github.com/decred/dcrd/pull/679) |
| Concurrently handle websocket client JSON-RPC requests. | [decred/dcrd#684](https://github.com/decred/dcrd/pull/684) |
| rpcserver: Always read wsclient filter with mutex held. | [decred/dcrd#686](https://github.com/decred/dcrd/pull/686) |
| dcrjson: Remove accountfetchaddresses support. | [decred/dcrd#688](https://github.com/decred/dcrd/pull/688) |
| log: Use millisecond time resolution. | [decred/dcrd#690](https://github.com/decred/dcrd/pull/690) |
| blockmanager: Fix new tickets notification. | [decred/dcrd#694](https://github.com/decred/dcrd/pull/694) |
| rpcwebsocket: Fix formatted error logging. | [decred/dcrd#696](https://github.com/decred/dcrd/pull/696) |
| rpcserver: Add existsmissedtickets RPC. | [decred/dcrd#698](https://github.com/decred/dcrd/pull/698) |
| rpcserver: Bump semver for existsmissedtickets addition. | [decred/dcrd#699](https://github.com/decred/dcrd/pull/699) |
| adjust for dcrutil Block changes. | [decred/dcrd#700](https://github.com/decred/dcrd/pull/700) |
| docs: update json examples | [decred/dcrd#701](https://github.com/decred/dcrd/pull/701) |
| blockchain: drop hash param from newBlockNode() | [decred/dcrd#704](https://github.com/decred/dcrd/pull/704) |
| Do testing and linting in a Dockerfile. | [decred/dcrd#708](https://github.com/decred/dcrd/pull/708) |
| multi: Update markdown in README files to match change in github parser. | [decred/dcrd#712](https://github.com/decred/dcrd/pull/712) |
| glide: move to upstream agl/ed25519 | [decred/dcrd#714](https://github.com/decred/dcrd/pull/714) |
| dcrjson: Remove unnecessary verbose optional parameters. | [decred/dcrd#716](https://github.com/decred/dcrd/pull/716) |
| Tell travis not to run install step. | [decred/dcrd#718](https://github.com/decred/dcrd/pull/718) |
| dcrjson: Add gap policy option to getnewaddress. | [decred/dcrd#719](https://github.com/decred/dcrd/pull/719) |
| Bump for v1.0.3 | [decred/dcrd#720](https://github.com/decred/dcrd/pull/720) |
| chaincfg: update checkpoints for 1.0.3 release | [decred/dcrd#721](https://github.com/decred/dcrd/pull/721) |
| Dockerized build environment | [decred/decrediton#349](https://github.com/decred/decrediton/pull/349) |
| Add a new modal for import script | [decred/decrediton#376](https://github.com/decred/decrediton/pull/376) |
| Only ask for discover addresses for existing seed creation | [decred/decrediton#378](https://github.com/decred/decrediton/pull/378) |
| Add rescan on any non-new wallet fetched headers | [decred/decrediton#382](https://github.com/decred/decrediton/pull/382) |
| Update spendlimit state on new getBalanceResponse | [decred/decrediton#383](https://github.com/decred/decrediton/pull/383) |
| Update dcrwallet args for --grpclisten. | [decred/decrediton#389](https://github.com/decred/decrediton/pull/389) |
| Use non-standard ports. | [decred/decrediton#391](https://github.com/decred/decrediton/pull/391) |
| Add checks, options, and docs to docker builds. | [decred/decrediton#393](https://github.com/decred/decrediton/pull/393) |
| Enable travis. | [decred/decrediton#394](https://github.com/decred/decrediton/pull/394) |
| Get branch correctly when building master on travis | [decred/decrediton#396](https://github.com/decred/decrediton/pull/396) |
| Update to version 4.10.0 rpc and add RevokeTickets functionality | [decred/decrediton#398](https://github.com/decred/decrediton/pull/398) |
| Speed up docker builds. | [decred/decrediton#401](https://github.com/decred/decrediton/pull/401) |
| Add change private passphrase to settings view | [decred/decrediton#401](https://github.com/decred/decrediton/pull/401) |
| Update wallet api. | [decred/decrediton#405](https://github.com/decred/decrediton/pull/405) |
| Move docker image to decred org. | [decred/decrediton#407](https://github.com/decred/decrediton/pull/407) |
| Add grpc-tools to devDependencies and use those bins for regen.sh | [decred/decrediton#409](https://github.com/decred/decrediton/pull/409) |
| Update API to check new ImportScript response fields | [decred/decrediton#411](https://github.com/decred/decrediton/pull/411) |
| Show decodeSeedError when applicable | [decred/decrediton#413](https://github.com/decred/decrediton/pull/413) |
| Make menu items more consistant between prod and dev mode. | [decred/decrediton#416](https://github.com/decred/decrediton/pull/416) |
| Add menu item to open log files. | [decred/decrediton#418](https://github.com/decred/decrediton/pull/418) |
| Tell travis not to run install step. | [decred/decrediton#422](https://github.com/decred/decrediton/pull/422) |
| Fix 2 minor bugs on the purchase ticket page | [decred/decrediton#423](https://github.com/decred/decrediton/pull/423) |
| Bump for v1.0.3 | [decred/decrediton#424](https://github.com/decred/decrediton/pull/424) |
| Update to 4.16.0 dcrwallet rpc version | [decred/decrediton#426](https://github.com/decred/decrediton/pull/426) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/Paymetheus | 03d651dfb16f9b0e6a3690d8f1b451f9b78047ce |
| decred/decred-windows-installer | f0fda6122235c49001fc5c497a37acc63b29cf28 |
| decred/dcrwallet | c7f2e5b3f6de07c5c2f950ea82914ecf0d46a2f0 |
| decred/dcrd | b90ee0c98a4cabf78084a897d8837eb970f0f5bf |
| decred/decrediton | 81e6e73c41806a124acd6758c75679be3bd4189e |

## Known Issues

---

# [v1.0.2](https://github.com/decred/decred-binaries/releases/tag/v1.0.2_decrediton)

## 2017-05-02

This is a patch release for decrediton only.  All users are encouraged to upgrade.  This release addresses several startup issues as well as adding the ability to rescan the chain.

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.0.2_decrediton/decrediton-1.0.2.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.0.2_decrediton/decrediton-1.0.2.dmg).

See manifest-v1.0.2.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Add some extra text for user clarity | [decred/decrediton#364](https://github.com/decred/decrediton/pull/364) |
| Transaction history address length with no box overflow and help page links | [decred/decrediton#367](https://github.com/decred/decrediton/pull/367) |
| Add a retry start rpc connection button | [decred/decrediton#369](https://github.com/decred/decrediton/pull/369) |
| Add rescan button and remove old RescanForm | [decred/decrediton#370](https://github.com/decred/decrediton/pull/370) |
| Handle output of dcrd/wallet better | [decred/decrediton#372](https://github.com/decred/decrediton/pull/372) |
| Fix rescan header div area | [decred/decrediton#373](https://github.com/decred/decrediton/pull/373) |
| Bump for v1.0.2 | [decred/decrediton#374](https://github.com/decred/decrediton/pull/374) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrwallet | b4cd1304d3c1273cafea6b584e98f69217bfbdce |
| decred/dcrd | 5bed758f85159b2ee76240207ba775c40000a4c1 |
| decred/decrediton | 93277e6c435276f106f03667ad8e83d643e63041 |

## Known Issues

---

# [v1.0.1](https://github.com/decred/decred-binaries/releases/tag/v1.0.1)

## 2017-04-28

This is a patch release.  All users are encourages to update.  A bug in the installer has been addressed which prevented upgrades from 0.8.2 or earlier.  Paymetheus and decrediton have been updated to work with both v1 and v2 stakepools and there were branding updates for Paymetheus.  Default fees were returned to the previous values.  See Changes for list of all bugs fixed.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v1.0.1/decred_1.0.1-release_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v1.0.1/decred_1.0.1-release_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.0.1/decrediton-1.0.1.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.0.1/decrediton-1.0.1.dmg).

See manifest-v1.0.1.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Make startup more async friendly | [decred/decrediton#359](https://github.com/decred/decrediton/pull/359) |
| Fix various bugs and allow v1 pools to be used | [decred/decrediton#362](https://github.com/decred/decrediton/pull/362) |
| Bump for v1.0.1 | [decred/decrediton#363](https://github.com/decred/decrediton/pull/363) |
| Add some extra text for user clarity | [decred/decrediton#364](https://github.com/decred/decrediton/pull/364) |
| Be backwards compatible with v1 API pools | [decred/Paymetheus#248](https://github.com/decred/Paymetheus/pull/248) |
| Use the correct sdiff retarget value on mainnet. | [decred/Paymetheus#250](https://github.com/decred/Paymetheus/pull/250) |
| Switch to the new icon. | [decred/Paymetheus#252](https://github.com/decred/Paymetheus/pull/252) |
| Prepare for release 1.0.1. | [decred/Paymetheus#253](https://github.com/decred/Paymetheus/pull/253) |
| Raise default fees back to 0.01/kB. | [decred/Paymetheus#256](https://github.com/decred/Paymetheus/pull/256) |
| Log fee as an amount, not atoms. | [decred/dcrwallet#689](https://github.com/decred/dcrwallet/pull/689) |
| Allow reading passphases from piped input. | [decred/dcrwallet#691](https://github.com/decred/dcrwallet/pull/691) |
| Raise default fees back to 0.01/kB. | [decred/dcrwallet#693](https://github.com/decred/dcrwallet/pull/693) |
| Prepare for release 1.0.1. | [decred/dcrwallet#692](https://github.com/decred/dcrwallet/pull/692) |
| Bump Protocol Version | [decred/dcrd#673](https://github.com/decred/dcrd/pull/673) |
| wire: Cleanup blockheader.go. | [decred/dcrd#669](https://github.com/decred/dcrd/pull/669) |
| rpcserver: Return handler errors to RPC client. | [decred/dcrd#671](https://github.com/decred/dcrd/pull/671) |
| rpcserver: Disable getblocktemplate. | [decred/dcrd#672](https://github.com/decred/dcrd/pull/672) |
| Bump for v1.0.1 | [decred/dcrd#674](https://github.com/decred/dcrd/pull/674) |
| Updates for v1.0.1 | [decred/decred-windows-installer#45](https://github.com/decred/decred-windows-installer/pull/45) |
| new logo, fix copyright and move resource into decred | [decred/decred-windows-installer#47](https://github.com/decred/decred-windows-installer/pull/47) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/Paymetheus | d69be0fec0a069acf7baf370ac77c28fe6c07300 |
| decred/decred-windows-installer | 9e931b81d866ff114b128009bf0bea8895502da7 |
| decred/dcrwallet | b4cd1304d3c1273cafea6b584e98f69217bfbdce |
| decred/dcrd | 5bed758f85159b2ee76240207ba775c40000a4c1 |
| decred/decrediton | f0f21e216e9b9935a600bc53ca17b4f4afe2ad3b |

## Known Issues

---

# [v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)

## 2017-04-26

This release contains improvements, additions, and bugfixes for all of the decred software components.  All users are strongly encouraged to upgrade.  New features include the initial voting on mainnet (for new sdiff algorithm and for work on lightning network), voting additions to Paymetheus, ticket purchasing and voting (with pool integration) for decrediton, and the replacement of the old test network with a new test network.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v1.0.0/decred_1.0.0-release_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v1.0.0/decred_1.0.0-release_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.0.0/decrediton-1.0.0.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v1.0.0/decrediton-1.0.0.dmg).

See manifest-v1.0.0.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Update to use testnet2 | [decred/Paymetheus#231](https://github.com/decred/Paymetheus/pull/231) |
| Add vote preference stakepool integration. | [decred/Paymetheus#241](https://github.com/decred/Paymetheus/pull/241) |
| Refresh ticket price and retarget without refresh button.  | [decred/Paymetheus#244](https://github.com/decred/Paymetheus/pull/244) |
| Lower default fees to 0.001 DCR/kB. | [decred/Paymetheus#243](https://github.com/decred/Paymetheus/pull/243) |
| Use the term "ticket price" instead of difficulty. | [decred/Paymetheus#245](https://github.com/decred/Paymetheus/pull/245) |
| Bump for v1.0.0 | [decred/Paymetheus#242](https://github.com/decred/Paymetheus/pull/242) |
| Fix copyright date. | [decred/decred-windows-installer#42](https://github.com/decred/decred-windows-installer/pull/42) |
| Update for v1.0.0 | [decred/decred-windows-installer#44](https://github.com/decred/decred-windows-installer/pull/44) |
| Handle non-int pool difficulties better. | [decred/gominer#141](https://github.com/decred/gominer/pull/141) |
| Add check on json to prevent panic. | [decred/gominer#142](https://github.com/decred/gominer/pull/142) |
| Differentiate dev and release in -V | [decred/gominer#144](https://github.com/decred/gominer/pull/144) |
| Add go version to version info | [decred/gominer#146](https://github.com/decred/gominer/pull/146) |
| Some file location updates for linux. | [decred/gominer#147](https://github.com/decred/gominer/pull/147) |
| Update README.md | [decred/gominer#150](https://github.com/decred/gominer/pull/150) |
| stratum: include stake version | [decred/gominer#153](https://github.com/decred/gominer/pull/153) |
| Bump for v1.0.0 | [decred/gominer#152](https://github.com/decred/gominer/pull/152) |
| Update create.html | [decred/copay#48](https://github.com/decred/copay/pull/48) |
| Another try to fix copay in FF48+ | [decred/copay#51](https://github.com/decred/copay/pull/51) |
| Use the main network by default. | [decred/copay#53](https://github.com/decred/copay/pull/53) |
| Differentiate dev and release in -V | [decred/decred-release#89](https://github.com/decred/decred-release/pull/89) |
| Install promptsecret tool | [decred/decred-release#92](https://github.com/decred/decred-release/pull/92) |
| Make links to old wiki point to local resources | [decred/decred-release#94](https://github.com/decred/decred-release/pull/94) |
| Bump for v1.0.0 | [decred/decred-release#97](https://github.com/decred/decred-release/pull/97) |
| Remove glide lockfile. | [decred/dcrrpcclient#51](https://github.com/decred/dcrrpcclient/pull/51) |
| Add GetStakeVersionInfo | [decred/dcrrpcclient#52](https://github.com/decred/dcrrpcclient/pull/52) |
| Add Go 1.8 support, remove Go 1.6. | [decred/dcrrpcclient#53](https://github.com/decred/dcrrpcclient/pull/53) |
| add missing state copies | [decred/dcrrpcclient#55](https://github.com/decred/dcrrpcclient/pull/55) |
| travis: enable unconvert | [decred/dcrrpcclient#56](https://github.com/decred/dcrrpcclient/pull/56) |
| add generatevote and remove some unused pieces | [decred/dcrrpcclient#57](https://github.com/decred/dcrrpcclient/pull/57) |
| Add getvotechoices/setvotechoice support. | [decred/dcrrpcclient#58](https://github.com/decred/dcrrpcclient/pull/58) |
| Use sha256 instead of fastsha256 | [decred/dcrutil#32](https://github.com/decred/dcrutil/pull/32) |
| travis: test against golang 1.7.x and 1.8.x | [decred/dcrutil#33](https://github.com/decred/dcrutil/pull/33) |
| Switch to upstream golang.org/x/crypto | [decred/dcrutil#35](https://github.com/decred/dcrutil/pull/35) |
| Switch dcrutil to testnet2. | [decred/dcrutil#37](https://github.com/decred/dcrutil/pull/37) |
| Preallocate the exact number of bytes if known. | [decred/dcrutil#38](https://github.com/decred/dcrutil/pull/38) |
| loader: Move Loader to new pkg loader | [decred/dcrwallet#532](https://github.com/decred/dcrwallet/pull/532) |
| refined spreadtickets calculations | [decred/dcrwallet#537](https://github.com/decred/dcrwallet/pull/537) |
| wtxmgr: fix getbalance calculations | [decred/dcrwallet#544](https://github.com/decred/dcrwallet/pull/544) |
| Add --promptpublicpass command parameter (#545) | [decred/dcrwallet#553](https://github.com/decred/dcrwallet/pull/553) |
| Add illumos support. | [decred/dcrwallet#557](https://github.com/decred/dcrwallet/pull/557) |
| getbalance: additional balance fixes | [decred/dcrwallet#565](https://github.com/decred/dcrwallet/pull/565) |
| Add stakePoolEnabled check | [decred/dcrwallet#567](https://github.com/decred/dcrwallet/pull/567) |
| Update dependencies to latest versions. | [decred/dcrwallet#571](https://github.com/decred/dcrwallet/pull/571) |
| Add Go 1.8 support, remove 1.6. | [decred/dcrwallet#573](https://github.com/decred/dcrwallet/pull/573) |
| use minfee if purchase slots are not full | [decred/dcrwallet#575](https://github.com/decred/dcrwallet/pull/575) |
| depreciate maxpricescale | [decred/dcrwallet#576](https://github.com/decred/dcrwallet/pull/576) |
| Differentiate dev and release in -V | [decred/dcrwallet#578](https://github.com/decred/dcrwallet/pull/578) |
| Fix extended vote bit setting for stakepool wallets | [decred/dcrwallet#583](https://github.com/decred/dcrwallet/pull/583) |
| Remove sync bucket with waddrmgr db upgrade. | [decred/dcrwallet#586](https://github.com/decred/dcrwallet/pull/586) |
| rpc: add Start/Stop ticket buyer RPCs | [decred/dcrwallet#587](https://github.com/decred/dcrwallet/pull/587) |
| Unify the database management code into a single package. | [decred/dcrwallet#591](https://github.com/decred/dcrwallet/pull/591) |
| Switch to upstream golang.org/x/crypto package. | [decred/dcrwallet#596](https://github.com/decred/dcrwallet/pull/596) |
| Update Decred dependencies. | [decred/dcrwallet#597](https://github.com/decred/dcrwallet/pull/597) |
| ticketbuyer: Add RPC calls to get/set config | [decred/dcrwallet#598](https://github.com/decred/dcrwallet/pull/598) |
| add more status fields to walletinfo | [decred/dcrwallet#599](https://github.com/decred/dcrwallet/pull/599) |
| Add method to retrieve an account branch xpub. | [decred/dcrwallet#604](https://github.com/decred/dcrwallet/pull/604) |
| Add method to return the account's actual xpub as well. | [decred/dcrwallet#605](https://github.com/decred/dcrwallet/pull/605) |
| remove deprecated enablestakemining ticket buyer and related RPCs | [decred/dcrwallet#606](https://github.com/decred/dcrwallet/pull/606) |
| Display Go version next to application versions.  | [decred/dcrwallet#607](https://github.com/decred/dcrwallet/pull/607) |
| Testnet reset | [decred/dcrwallet#610](https://github.com/decred/dcrwallet/pull/610) |
| Fix RPC ping/pong deadlock and timeout issue. | [decred/dcrwallet#612](https://github.com/decred/dcrwallet/pull/612) |
| Use newer ubuntu release for travis | [decred/dcrwallet#614](https://github.com/decred/dcrwallet/pull/614) |
| ensure calculated avg ticket price is at least MinimumStakeDiff | [decred/dcrwallet#616](https://github.com/decred/dcrwallet/pull/616) |
| Always commit database transaction when buying tickets. | [decred/dcrwallet#618](https://github.com/decred/dcrwallet/pull/618) |
| Update dcrd to pull in stakebase sigscript fix for testnet2. | [decred/dcrwallet#621](https://github.com/decred/dcrwallet/pull/621) |
| Remove old testnet v1 variables. | [decred/dcrwallet#622](https://github.com/decred/dcrwallet/pull/622) |
| Preallocate the exact number of bytes if known. | [decred/dcrwallet#623](https://github.com/decred/dcrwallet/pull/623) |
| gometallinter: gosimple fixes | [decred/dcrwallet#624](https://github.com/decred/dcrwallet/pull/624) |
| gometalinter: use --vendor to skip ./vendor/ | [decred/dcrwallet#625](https://github.com/decred/dcrwallet/pull/625) |
| Add warning on startup about old testnet data. | [decred/dcrwallet#629](https://github.com/decred/dcrwallet/pull/629) |
| Move log setup to before first use of logger | [decred/dcrwallet#631](https://github.com/decred/dcrwallet/pull/631) |
| Drop fastsha256 usage in favor of crypto/sha256 | [decred/dcrwallet#632](https://github.com/decred/dcrwallet/pull/632) |
| Fix an obvious nil pointer check error. | [decred/dcrwallet#634](https://github.com/decred/dcrwallet/pull/634) |
| Reimplement address pools. | [decred/dcrwallet#636](https://github.com/decred/dcrwallet/pull/636) |
| wallet: Change PurchaseTickets to return []*chainhash.Hash | [decred/dcrwallet#637](https://github.com/decred/dcrwallet/pull/637) |
| udb: fetchAccountInfo only returns *dbBIP0044AccountRow (or nil) | [decred/dcrwallet#638](https://github.com/decred/dcrwallet/pull/638) |
| Return default SimulationPassphrase when SimNet | [decred/dcrwallet#639](https://github.com/decred/dcrwallet/pull/639) |
| rpc: StartConsesusRpc - set loader chain client | [decred/dcrwallet#640](https://github.com/decred/dcrwallet/pull/640) |
| ticketbuyer: Fix shadowed feeToUse | [decred/dcrwallet#641](https://github.com/decred/dcrwallet/pull/641) |
| Fix derivation of discovered accounts. | [decred/dcrwallet#643](https://github.com/decred/dcrwallet/pull/643) |
| Flush loggers before running wallet creation. | [decred/dcrwallet#644](https://github.com/decred/dcrwallet/pull/644) |
| Revert to old wraparound behavior. | [decred/dcrwallet#645](https://github.com/decred/dcrwallet/pull/645) |
| add generatevote | [decred/dcrwallet#647](https://github.com/decred/dcrwallet/pull/647) |
| ticketbuyer: Use the adjustable options. | [decred/dcrwallet#648](https://github.com/decred/dcrwallet/pull/648) |
| Define vote bits through agenda choices. | [decred/dcrwallet#649](https://github.com/decred/dcrwallet/pull/649) |
| Prevent panic in JSON-RPC server. | [decred/dcrwallet#652](https://github.com/decred/dcrwallet/pull/652) |
| derive stake pool payment addresses properly | [decred/dcrwallet#655](https://github.com/decred/dcrwallet/pull/655) |
| Log RPC method invocations. | [decred/dcrwallet#656](https://github.com/decred/dcrwallet/pull/656) |
| Prevent OOM when syncing to addresess already watched. | [decred/dcrwallet#657](https://github.com/decred/dcrwallet/pull/657) |
| Add transaction type to TransactionSummary and TransactionDetails | [decred/dcrwallet#659](https://github.com/decred/dcrwallet/pull/659) |
| Bump API version in documentation. | [decred/dcrwallet#660](https://github.com/decred/dcrwallet/pull/660) |
| Fix comment. | [decred/dcrwallet#661](https://github.com/decred/dcrwallet/pull/661) |
| Dereference the correct RPC client variable. | [decred/dcrwallet#662](https://github.com/decred/dcrwallet/pull/662) |
| Fix an off by one in the address buffer. | [decred/dcrwallet#663](https://github.com/decred/dcrwallet/pull/663) |
| Require walletlock for persistent unlocks. | [decred/dcrwallet#665](https://github.com/decred/dcrwallet/pull/665) |
| Add the actual votebits to the gRPC APIs. | [decred/dcrwallet#666](https://github.com/decred/dcrwallet/pull/666) |
| Remove a silly error from accountsyncaddressindex. | [decred/dcrwallet#667](https://github.com/decred/dcrwallet/pull/667) |
| ticketbuyer: Fix deadlock in TicketBuyer Config() | [decred/dcrwallet#668](https://github.com/decred/dcrwallet/pull/668) |
| Watch addresses of newly created accounts. | [decred/dcrwallet#669](https://github.com/decred/dcrwallet/pull/669) |
| handle missed tickets even when not voting | [decred/dcrwallet#671](https://github.com/decred/dcrwallet/pull/671) |
| Update TicketBuyer to no longer use float64 for Amounts | [decred/dcrwallet#672](https://github.com/decred/dcrwallet/pull/672) |
| Remove an unnecessary mutex grab in stakepooluserinfo. | [decred/dcrwallet#673](https://github.com/decred/dcrwallet/pull/673) |
| Fix panic in getaddressesbyaccount. | [decred/dcrwallet#678](https://github.com/decred/dcrwallet/pull/678) |
| Fix ticket buyer log messages after int64 changes | [decred/dcrwallet#679](https://github.com/decred/dcrwallet/pull/679) |
| ticketbuyer: use dcrutil.Amount more | [decred/dcrwallet#680](https://github.com/decred/dcrwallet/pull/680) |
| Lower default fees to 0.001 DCR/kB. | [decred/dcrwallet#681](https://github.com/decred/dcrwallet/pull/681) |
| Bump required dcrd JSON-RPC API version. | [decred/dcrwallet#682](https://github.com/decred/dcrwallet/pull/682) |
| Remove DB updates from generatevote JSON-RPC. | [decred/dcrwallet#683](https://github.com/decred/dcrwallet/pull/683) |
| Update to latest dcrd. | [decred/dcrwallet#686](https://github.com/decred/dcrwallet/pull/686) |
| Bump stake versions for 1.0.0 release agendas | [decred/dcrwallet#685](https://github.com/decred/dcrwallet/pull/685) |
| Bump for v1.0.0 | [decred/dcrwallet#676](https://github.com/decred/dcrwallet/pull/676) |
| Add new getstakeversioninfo command | [decred/dcrd#568](https://github.com/decred/dcrd/pull/568) |
| Update dependencies to latest versions. | [decred/dcrd#571](https://github.com/decred/dcrd/pull/571) |
| Test with latest Go patch releases on Travis-CI. | [decred/dcrd#574](https://github.com/decred/dcrd/pull/574) |
| Don't keep double vote information in blockNode | [decred/dcrd#568](https://github.com/decred/dcrd/pull/575) |
| Fix nits on getstakeversioninfo | [decred/dcrd#577](https://github.com/decred/dcrd/pull/577) |
| dcrctl: Remove --terminal feature | [decred/dcrd#580](https://github.com/decred/dcrd/pull/580) |
| Add Go 1.8 support, remove 1.6. | [decred/dcrd#581](https://github.com/decred/dcrd/pull/581) |
| rpcserver: No progress info from getvoteinfo when not started. | [decred/dcrd#582](https://github.com/decred/dcrd/pull/582) |
| Differentian dev and release in -V | [decred/dcrd#583](https://github.com/decred/dcrd/pull/583) |
| Tupleize version:bits | [decred/dcrd#586](https://github.com/decred/dcrd/pull/586) |
| chaingen: Significantly optimize test generation. | [decred/dcrd#587](https://github.com/decred/dcrd/pull/587) |
| blockchain: Always run fullblock tests. | [decred/dcrd#588](https://github.com/decred/dcrd/pull/588) |
| TravisCI: Only run tests once. | [decred/dcrd#589](https://github.com/decred/dcrd/pull/589) |
| blockchain: Make node creation in tests consistent. | [decred/dcrd#590](https://github.com/decred/dcrd/pull/590) |
| blockchain: Optimize stake and vote lookups. | [decred/dcrd#591](https://github.com/decred/dcrd/pull/591) |
| blockchain: use next block stake version. | [decred/dcrd#599](https://github.com/decred/dcrd/pull/599) |
| blockchain: add expiration test during voting. | [decred/dcrd#602](https://github.com/decred/dcrd/pull/602) |
| travis: enable gometalinter | [decred/dcrd#603](https://github.com/decred/dcrd/pull/603) |
| chaingen: Allow 32-bit compile. | [decred/dcrd#605](https://github.com/decred/dcrd/pull/605) |
| Switch to upstream golang.org/x/crypto | [decred/dcrd#608](https://github.com/decred/dcrd/pull/608) |
| chaincfg: strictly enforce agenda assumptions. | [decred/dcrd#609](https://github.com/decred/dcrd/pull/609) |
| add more walletinfo fields | [decred/dcrd#610](https://github.com/decred/dcrd/pull/610) |
| remove walletinfo fields related to stakemining purchaser | [decred/dcrd#612](https://github.com/decred/dcrd/pull/612) |
| server: send some vote hashes | [decred/dcrd#613](https://github.com/decred/dcrd/pull/613) |
| rpcserver: Confirmations -1 when a block is orphan | [decred/dcrd#615](https://github.com/decred/dcrd/pull/615) |
| Display Go version next to application versions. | [decred/dcrd#616](https://github.com/decred/dcrd/pull/616) |
| Testnet reset | [decred/dcrd#617](https://github.com/decred/dcrd/pull/617) |
| rpcserver: always reply with an RPC error. | [decred/dcrd#623](https://github.com/decred/dcrd/pull/623) |
| fix StakeBaseSigScript and a comment | [decred/dcrd#625](https://github.com/decred/dcrd/pull/625) |
| chaincfg: Allow non-std transactions on testnet2. | [decred/dcrd#627](https://github.com/decred/dcrd/pull/627) |
| TravisCI: Remove a couple of linters. | [decred/dcrd#628](https://github.com/decred/dcrd/pull/628) |
| Remove variables for testnet v1. | [decred/dcrd#629](https://github.com/decred/dcrd/pull/629) |
| Preallocate the exact number of bytes if known. | [decred/dcrd#630](https://github.com/decred/dcrd/pull/630) |
| connmgr: Refactor connection management into pkg | [decred/dcrd#631](https://github.com/decred/dcrd/pull/631) |
| txscript: Update signing tests to use params var. | [decred/dcrd#632](https://github.com/decred/dcrd/pull/632) |
| wire: Lower MaxUserAgentLen to 256. | [decred/dcrd#633](https://github.com/decred/dcrd/pull/633) |
| gometalinter: use --vendor to skip ./vendor/ | [decred/dcrd#634](https://github.com/decred/dcrd/pull/634) |
| rpcserver/chain: Bounds check getstakeversions. | [decred/dcrd#636](https://github.com/decred/dcrd/pull/636) |
| rpcserver: Make function definitions consistent. | [decred/dcrd#637](https://github.com/decred/dcrd/pull/637) |
| dcrctl: Be smarter about automatic configuration. | [decred/dcrd#640](https://github.com/decred/dcrd/pull/640) |
| Add example service files. | [decred/dcrd#642](https://github.com/decred/dcrd/pull/642) |
| Add warning on startup about old testnet data. | [decred/dcrd#643](https://github.com/decred/dcrd/pull/643) |
| dcrd: Remove unused old chainindexer file. | [decred/dcrd#644](https://github.com/decred/dcrd/pull/644) |
| dcrd: Remove unnecessary upstream deps.txt. | [decred/dcrd#645](https://github.com/decred/dcrd/pull/645) |
| blockchain: various code cleanups | [decred/dcrd#647](https://github.com/decred/dcrd/pull/647) |
| addrmgr/wire: various fixes from btcd | [decred/dcrd#648](https://github.com/decred/dcrd/pull/648) |
| Add new tool, promptsecret | [decred/dcrd#649](https://github.com/decred/dcrd/pull/649) |
| glide: sync | [decred/dcrd#650](https://github.com/decred/dcrd/pull/650) |
| dcrjson: add generatevote and remove some unused pieces | [decred/dcrd#652](https://github.com/decred/dcrd/pull/652) |
| Remove a bunch of dead code. | [decred/dcrd#653](https://github.com/decred/dcrd/pull/653) |
| dcrjson: Add getvotechoices/setvotechoice types. | [decred/dcrd#657](https://github.com/decred/dcrd/pull/6057) |
| chaincfg: update checkpoints for 1.0.0 release | [decred/dcrd#661](https://github.com/decred/dcrd/pull/661) |
| policy: Lower default relay fee to 0.001/kB. | [decred/dcrd#659](https://github.com/decred/dcrd/pull/659) |
| Increase the high fee multiplier to keep same threshold. | [decred/dcrd#662](https://github.com/decred/dcrd/pull/662) |
| multi: Rename vote choice IsIgnore to IsAbstain. | [decred/dcrd#656](https://github.com/decred/dcrd/pull/656) |
| blockchain: Remove dead code from diff tests | [decred/dcrd#664](https://github.com/decred/dcrd/pull/664) |
| mempool: Remove the hardcoded minimum ticket fee. | [decred/dcrd#663](https://github.com/decred/dcrd/pull/663) |
| rpcserver: Use a real value for fee estimates. | [decred/dcrd#665](https://github.com/decred/dcrd/pull/665) |
| multi: Implement stake difficulty change and vote | [decred/dcrd#666](https://github.com/decred/dcrd/pull/666) |
| chaincfg: Add agenda for LN support vote. | [decred/dcrd#668](https://github.com/decred/dcrd/pull/668) |
| Bump for v1.0.0 | [decred/dcrd#660](https://github.com/decred/dcrd/pull/660) |
| Start to clean up old components and reorganize | [decred/decrediton#258](https://github.com/decred/decrediton/pull/258) |
| Fix up some of the logging | [decred/decrediton#259](https://github.com/decred/decrediton/pull/259) |
| Fix bug in logging code. | [decred/decrediton#261](https://github.com/decred/decrediton/pull/261) |
| Add --extrawalletargs option. | [decred/decrediton#263](https://github.com/decred/decrediton/pull/263) |
| Clean up/remove useless grpc functions | [decred/decrediton#264](https://github.com/decred/decrediton/pull/264) |
| Fix startup of procedures | [decred/decrediton#272](https://github.com/decred/decrediton/pull/272) |
| Use same cfg path in dev and production. | [decred/decrediton#275](https://github.com/decred/decrediton/pull/275) |
| Carry over settings from past instances | [decred/decrediton#276](https://github.com/decred/decrediton/pull/276) |
| Remove unnecessary ping state updates | [decred/decrediton#277](https://github.com/decred/decrediton/pull/277) |
| Add network to settings page. | [decred/decrediton#279](https://github.com/decred/decrediton/pull/279) |
| Integrate Stakepools' API | [decred/decrediton#280](https://github.com/decred/decrediton/pull/280) |
| Update grpc for new version (4.5.0) | [decred/decrediton#281](https://github.com/decred/decrediton/pull/281) |
| Fixes to send page | [decred/decrediton#282](https://github.com/decred/decrediton/pull/282) |
| Add all possible errors to header in GetStarted | [decred/decrediton#283](https://github.com/decred/decrediton/pull/283) |
| Clarify where to download Decretion in the README | [decred/decrediton#285](https://github.com/decred/decrediton/pull/285) |
| Fix various nits with SideBar | [decred/decrediton#286](https://github.com/decred/decrediton/pull/286) |
| Update pagination buttons to be more clear | [decred/decrediton#287](https://github.com/decred/decrediton/pull/287) |
| Update testnet network magic number. Formatting cleanup | [decred/decrediton#289](https://github.com/decred/decrediton/pull/289) |
| Fix timeSince in lower sidebar | [decred/decrediton#291](https://github.com/decred/decrediton/pull/291) |
| Another fix for timeSince in sideBar | [decred/decrediton#294](https://github.com/decred/decrediton/pull/294) |
| Add account management page | [decred/decrediton#295](https://github.com/decred/decrediton/pull/295) |
| Add functionality to clear account error/success messages | [decred/decrediton#299](https://github.com/decred/decrediton/pull/299) |
| Apply similiar changes to other clearing success/error messages | [decred/decrediton#300](https://github.com/decred/decrediton/pull/300) |
| Purchase View. | [decred/decrediton#301](https://github.com/decred/decrediton/pull/301) |
| Transaction history and notification fixes | [decred/decrediton#302](https://github.com/decred/decrediton/pull/302) |
| Combine ticket purchasing and stake pool configuration | [decred/decrediton#304](https://github.com/decred/decrediton/pull/304) |
| Fixes/improvements for config loading | [decred/decrediton#307](https://github.com/decred/decrediton/pull/307) |
| Add --testnet and --mainnet flags | [decred/decrediton#309](https://github.com/decred/decrediton/pull/309) |
| Final audit/fixing of currently transaction history/pagination | [decred/decrediton#310](https://github.com/decred/decrediton/pull/310) |
| Rig in importScriptRequest to purchaseTicketsAttempt | [decred/decrediton#311](https://github.com/decred/decrediton/pull/311) |
| Add seperate help page | [decred/decrediton#312](https://github.com/decred/decrediton/pull/312) |
| Add ticket price to purchase ticket page | [decred/decrediton#313](https://github.com/decred/decrediton/pull/313) |
| Write config files for cmd line tools | [decred/decrediton#314](https://github.com/decred/decrediton/pull/314) |
| Check StakePool purchaseInformation on app load | [decred/decrediton#315](https://github.com/decred/decrediton/pull/315) |
| Add stakeinfo area at the top of Purchase Tickets page | [decred/decrediton#316](https://github.com/decred/decrediton/pull/316) |
| First style consolidation | [decred/decrediton#318](https://github.com/decred/decrediton/pull/318) |
| Update to the latest wallet grpc api | [decred/decrediton#320](https://github.com/decred/decrediton/pull/320) |
| Layout update to match Paymetheus design | [decred/decrediton#321](https://github.com/decred/decrediton/pull/321) |
| Add show/hide advanced options on purchase ticket view | [decred/decrediton#322](https://github.com/decred/decrediton/pull/322) |
| Add new copy and advanced fields to purchase tickets | [decred/decrediton#324](https://github.com/decred/decrediton/pull/324) |
| Add basic autobuyer start/stop | [decred/decrediton#325](https://github.com/decred/decrediton/pull/325) |
| Input validation for purchase tickets form | [decred/decrediton#326](https://github.com/decred/decrediton/pull/326) |
| Update validation for the Account page | [decred/decrediton#327](https://github.com/decred/decrediton/pull/327) |
| Add input validation to send/sign tx  | [decred/decrediton#328](https://github.com/decred/decrediton/pull/328) |
| Only ask for private passphrase on startup for newly created wallets | [decred/decrediton#329](https://github.com/decred/decrediton/pull/329) |
| Finish basic input validation for remaining views | [decred/decrediton#330](https://github.com/decred/decrediton/pull/330) |
| Update to recent grpc changes | [decred/decrediton#332](https://github.com/decred/decrediton/pull/332) |
| Add voting gui to purchase tickets page | [decred/decrediton#333](https://github.com/decred/decrediton/pull/333) |
| Update to grpc bindings to get transaction type | [decred/decrediton#334](https://github.com/decred/decrediton/pull/334) |
| Tranasction type selection on History | [decred/decrediton#335](https://github.com/decred/decrediton/pull/335) |
| Styling update to Purchase Tickets view | [decred/decrediton#336](https://github.com/decred/decrediton/pull/336) |
| Update to recent api.proto changes for votebits | [decred/decrediton#337](https://github.com/decred/decrediton/pull/337) |
| Shutdown fixes | [decred/decrediton#338](https://github.com/decred/decrediton/pull/338) |
| Ignore .DS_store files | [decred/decrediton#340](https://github.com/decred/decrediton/pull/340) |
| Add Ticketbuyer GUI and reusble passphrase modal | [decred/decrediton#342](https://github.com/decred/decrediton/pull/342) |
| Show different tx types in TxHistory | [decred/decrediton#343](https://github.com/decred/decrediton/pull/343) |
| Switch version from alpha to beta | [decred/decrediton#344](https://github.com/decred/decrediton/pull/344) |
| Force specific version of electron | [decred/decrediton#346](https://github.com/decred/decrediton/pull/346) |
| Don't break if no StakePool is defined yet | [decred/decrediton#348](https://github.com/decred/decrediton/pull/348) |
| Added grpc commits to dev instructions | [decred/decrediton#350](https://github.com/decred/decrediton/pull/350) |
| Confirm working votebits setting to stakepool api | [decred/decrediton#352](https://github.com/decred/decrediton/pull/352) |
| Check for undefined in tx rows | [decred/decrediton#354](https://github.com/decred/decrediton/pull/354) |
| Small css tweak so Snackbar is fully shown | [decred/decrediton#355](https://github.com/decred/decrediton/pull/355) |
| Update stakepool config to load APIVersionSupported and only show v2 | [decred/decrediton#356](https://github.com/decred/decrediton/pull/356) |
| Bump for v1.0.0 | [decred/decrediton#351](https://github.com/decred/decrediton/pull/351) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/gominer | d2503a9d0d3533cbceac970414f6f7f457faceb3 |
| decred/Paymetheus | 6e49fb22b4e3c4d769e2dbc446d87f311aa4437d |
| decred/decred-windows-installer | 253f343e736eb377a6cba29e16aead0162f82e51 |
| decred/dcrwallet | a642114a124c6174130d528d9d33fe69128d2688 |
| decred/dcrd | 5c3e0d6454001c8d14fcf06be94381d93991aaea |
| decred/decrediton | 0272bf894c3c89b573034dd7a18f47e697194cbf |

## Known Issues

---

# [v1.0.0_gominer](https://github.com/decred/decred-binaries/releases/tag/v1.0.0_gominer)

## 2017-04-24

This is an early release of gominer v1.0.0 to address an issue with pool mining software.  ALL users should upgrade.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Handle non-int pool difficulties better. | [decred/gominer#141](https://github.com/decred/gominer/pull/141) |
| Add check on json to prevent panic. | [decred/gominer#142](https://github.com/decred/gominer/pull/142) |
| Differentiate dev and release in -V | [decred/gominer#144](https://github.com/decred/gominer/pull/144) |
| Add go version to version info | [decred/gominer#146](https://github.com/decred/gominer/pull/146) |
| Some file location updates for linux. | [decred/gominer#147](https://github.com/decred/gominer/pull/147) |
| Update README.md | [decred/gominer#150](https://github.com/decred/gominer/pull/150) |
| stratum: include stake version | [decred/gominer#153](https://github.com/decred/gominer/pull/153) |
| Bump for v1.0.0 | [decred/gominer#152](https://github.com/decred/gominer/pull/152) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/gominer | d2503a9d0d3533cbceac970414f6f7f457faceb3 |

---

# [v0.8.2](https://github.com/decred/decred-binaries/releases/tag/v0.8.2)

## 2017-02-16

This is a patch release to fix bugs related to HF voting demo on testnet.  It is only needed if you are running on testnet and want to participate in the demo.  This release should not impact mainnet.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v0.8.2/decred_0.8.2-beta_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v0.8.2/decred_0.8.2-beta_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v0.8.2/decrediton-0.8.2.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v0.8.2/decrediton-0.8.2.dmg).

See manifest-v0.8.2.txt, manifest-paymetheus-v0.8.2.txt, manifest-decrediton-0.8.2.txt, and manifest-dcrinstaller-v0.8.2.txt for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Bump for v0.8.2 | [decred/Paymetheus#224](https://github.com/decred/Paymetheus/pull/224) |
| Update for v0.8.2 | [decred/decred-windows-installer#40](https://github.com/decred/decred-windows-installer/pull/40) |
| Bump for v0.8.2 | [decred/decred-release#86](https://github.com/decred/decred-release/pull/86) |
| Bump for v0.8.2 | [decred/dcrwallet#556](https://github.com/decred/dcrwallet/pull/556) |
| Strictly enforce version check when tallying votes. | [decred/dcrd#565](https://github.com/decred/dcrd/pull/565) |
| Correct the units on the testnet HF description. | [decred/dcrd#566](https://github.com/decred/dcrd/pull/566) |
| blockchain: Add more fullblock voting tests. | [decred/dcrd#569](https://github.com/decred/dcrd/pull/569) |
| Bump for v0.8.2 | [decred/dcrd#570](https://github.com/decred/dcrd/pull/570) |
| Improve cmd line parsing. | [decred/decrediton#254](https://github.com/decred/decrediton/pull/254) |
| Bump for v0.8.2 | [decred/decrediton#256](https://github.com/decred/decrediton/pull/256) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/Paymetheus | 5d8793148313f9fc41f6fb03dc7bc6f0ae1f0b50 |
| decred/decred-windows-installer | 0d4e58d13f9de3f241a1218c89f37b53815a9cfe |
| decred/dcrwallet | 44096d10f92af2923030967d118a8555fcae35f9 |
| decred/dcrd | 4af97d2d705bba9df963cf147979deb1b06d85f6 |
| decred/decrediton | 256e1b4e0460e1468db531953ad0fb88d76359ac |

## Known Issues

---

# [v0.8.1](https://github.com/decred/decred-binaries/releases/tag/v0.8.1)

## 2017-02-14

This is a patch release to fix bugs related to stakepool usage in Paymetheus:

1. Purchasing tickets for stakepools with the API integration resulted in too low pool fees and this would cause correctly-configured stakepools to never vote with the ticket.
1. Manual stakepool configuration was unusable due to an input validation error that always reset the pool fees value back to zero.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v0.8.1/decred_0.8.1-beta_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v0.8.1/decred_0.8.1-beta_x86.msi)
depending on your version of Windows.

See manifest-paymetheus-v0.8.1.txt for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

## Changes

| Description | Pull Request |
| --- | ---- |
| Fix units on stake pool fees. | [decred/Paymetheus#221](https://github.com/decred/Paymetheus/pull/221) |
| Fix pool fee entry box for manual stakepool entry. | [decred/Paymetheus#222](https://github.com/decred/Paymetheus/pull/222) |
| Bump for v0.8.1 | [decred/Paymetheus#223](https://github.com/decred/Paymetheus/pull/223) |
| Update for new PM build | [decred/decred-windows-installer#38](https://github.com/decred/decred-windows-installer/pull/38) |
| bump version in one more place | [decred/decred-windows-installer#39](https://github.com/decred/decred-windows-installer/pull/39) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/Paymetheus | 10a74c8467a541fee972aa1b1735b61c9b26e8b2 |
| decred/decred-windows-installer | a8a60f4f9b935cac6e43372650a7c79961099a6c |
| decred/dcrwallet | 786f15a11b82c53a8023ca8f81def5307cb36051 |
| decred/dcrd | 1196130cbce1872788f572e252379c8c90ef528e |

## Known Issues

---

## 2017-02-13

This release contains updates and bugfixes to all componenets of Decred.  Some noteable changes include:

1. dcrd contains a demo of hardfork voting for use on testnet.

1. dcrwallet has improvements to the builtin ticketbuyer.  It also has an improved getbalance command.

1. Paymetheus contains the intial stakepool integration.

1. decrediton now works as a self-contained app which does not require a separate download of the command line tools.  It has been updated with an entirely new visual style.  All pages have been updated or revamped so decrediton should now properly handle all basic wallet functions.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v0.8.0/decred_0.8.0-beta_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v0.8.0/decred_0.8.0-beta_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v0.8.0/decrediton-0.8.0.tar.gz) or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v0.8.0/decrediton-0.8.0.dmg).

See manifest-v0.8.0.txt, manifest-paymetheus-v0.8.0.txt,
manifest-decrediton-0.8.0.txt, and manifest-dcrinstaller-v0.8.0.txt
for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

## Notes

As of this release, dcrticketbuyer is no long included.  dcrwallet contains all the automatic ticketbuyer features that the standalone program used to have and should be used instead.

## Changes

| Description | Pull Request |
| --- | ---- |
| only initialize device libraries once | [decred/gominer#132](https://github.com/decred/gominer/pull/132) |
| give an example for both path types | [decred/gominer#136](https://github.com/decred/gominer/pull/136) |
| Switch to standalone upstream CUDA libs. | [decred/gominer#137](https://github.com/decred/gominer/pull/137) |
| Bump for v0.8.0 | [decred/gominer#139](https://github.com/decred/gominer/pull/139) |
| Bump required wallet API version. | [decred/Paymetheus#218](https://github.com/decred/Paymetheus/pull/218) |
| Integrate stakepools through the HTTP API | [decred/Paymetheus#216](https://github.com/decred/Paymetheus/pull/216) |
| Bump for v0.8.0 | [decred/Paymetheus#217](https://github.com/decred/Paymetheus/pull/217) |
| The getbalance family now returns dcrjson.GetBalanceResult | [decred/dcrrpcclient#45](https://github.com/decred/dcrrpcclient/pull/45) |
| Log Client connection errors. | [decred/dcrrpcclient#47](https://github.com/decred/dcrrpcclient/pull/47) |
| Add GetStakeVersions | [decred/dcrrpcclient#48](https://github.com/decred/dcrrpcclient/pull/48) |
| Add GetVoteInfo dcrd call | [decred/dcrrpcclient#50](https://github.com/decred/dcrrpcclient/pull/50) |
| Display DCR instead of Coin in Amount stringer. | [decred/dcrutil#31](https://github.com/decred/dcrutil/pull/31) |
| Do not install standalone ticketbuyer. | [decred/decred-release#81](https://github.com/decred/decred-release/pull/81) |
| Bump for v0.8.0 | [decred/decred-release#82](https://github.com/decred/decred-release/pull/82) |
| ticketbuyer: Fix panic on shutdown | [decred/dcrwallet#483](https://github.com/decred/dcrwallet/pull/483) |
| Slightly improve logging formatting. | [decred/dcrwallet#484](https://github.com/decred/dcrwallet/pull/484) |
| Update 3rd party glide deps (and some internal ones) for 0.8.0 | [decred/dcrwallet#493](https://github.com/decred/dcrwallet/pull/493) |
| Remove spew install from Travis-CI script. | [decred/dcrwallet#495](https://github.com/decred/dcrwallet/pull/495) |
| Use latest Go patch releases on Travis-CI. | [decred/dcrwallet#498](https://github.com/decred/dcrwallet/pull/498) |
| travis: switch to gometalinter | [decred/dcrwallet#499](https://github.com/decred/dcrwallet/pull/499) |
| travis: enable gosimple | [decred/dcrwallet#500](https://github.com/decred/dcrwallet/pull/500) |
| add dynamic max price default, remove highpricepenalty queue | [decred/dcrwallet#501](https://github.com/decred/dcrwallet/pull/501) |
| spread buys evenly throughout window, new default behavior | [decred/dcrwallet#502](https://github.com/decred/dcrwallet/pull/502) |
| ticketbuyer: better log levels for purchase result | [decred/dcrwallet#503](https://github.com/decred/dcrwallet/pull/503) |
| travis: enable unconvert | [decred/dcrwallet#504](https://github.com/decred/dcrwallet/pull/504) |
| Prevent panic caused by nil output destinations. | [decred/dcrwallet#506](https://github.com/decred/dcrwallet/pull/506) |
| Remove duplicated and unused ticketbuyer config options. | [decred/dcrwallet#507](https://github.com/decred/dcrwallet/pull/507) |
| config: cleanup | [decred/dcrwallet#508](https://github.com/decred/dcrwallet/pull/508) |
| fix wallet creation due to new votebitsextended limits. | [decred/dcrwallet#514](https://github.com/decred/dcrwallet/pull/514) |
| config: set pricetarget to 0 (disabled) by default. | [decred/dcrwallet#515](https://github.com/decred/dcrwallet/pull/515) |
| config: deprecate ticketbuyfreq. use ticketbuyer.maxperblock instead. | [decred/dcrwallet#517](https://github.com/decred/dcrwallet/pull/517) |
| make maxfee behavior sane | [decred/dcrwallet#518](https://github.com/decred/dcrwallet/pull/518) |
| config: deprecate --ticketmaxprice | [decred/dcrwallet#520](https://github.com/decred/dcrwallet/pull/520) |
| Write --help output to stdout | [decred/dcrwallet#522](https://github.com/decred/dcrwallet/pull/522) |
| config: initialize var to avoid panic | [decred/dcrwallet#523](https://github.com/decred/dcrwallet/pull/523) |
| Add main chain return values to FetchHeaders | [decred/dcrwallet#524](https://github.com/decred/dcrwallet/pull/524) |
| Change 'getbalance <account>' to output the new format. | [decred/dcrwallet#527](https://github.com/decred/dcrwallet/pull/527) |
| Add output script, amount and address to TransactionSummaryOutput | [decred/dcrwallet#528](https://github.com/decred/dcrwallet/pull/528) |
| Continued getbalance cleanup. | [decred/dcrwallet#530](https://github.com/decred/dcrwallet/pull/530) |
| Ignore unspent stake tree outputs in WalletService.FundTransaction. | [decred/dcrwallet#531](https://github.com/decred/dcrwallet/pull/531) |
| Remove unused funcs | [decred/dcrwallet#534](https://github.com/decred/dcrwallet/pull/534) |
| make balance to maintain absolute and relative | [decred/dcrwallet#536](https://github.com/decred/dcrwallet/pull/536) |
| remove defunct minpricescale | [decred/dcrwallet#538](https://github.com/decred/dcrwallet/pull/538) |
| wallet: resend any unmined txs after rescan. | [decred/dcrwallet#542](https://github.com/decred/dcrwallet/pull/542) |
| Update dcrrpcclient to pull in logging improvement | [decred/dcrwallet#546](https://github.com/decred/dcrwallet/pull/546) |
| Override version JSON-RPC to include wallet's API version. | [decred/dcrwallet#551](https://github.com/decred/dcrwallet/pull/551) |
| Set version in extended vote bits per network. | [decred/dcrwallet#552](https://github.com/decred/dcrwallet/pull/552) |
| Set extended vote bits version before branching for --create. | [decred/dcrwallet#554](https://github.com/decred/dcrwallet/pull/554) |
| Ignore dcrwallet binary in .gitignore. | [decred/dcrwallet#559](https://github.com/decred/dcrwallet/pull/559) |
| Bump for v0.8.0 | [decred/dcrwallet#548](https://github.com/decred/dcrwallet/pull/548) |
| Update internal glide repos for v0.8.0 | [decred/dcrwallet#561](https://github.com/decred/dcrwallet/pull/561) |
| dcrjson: Add negative DecodeConcatenatedHashes tests | [decred/dcrd#423](https://github.com/decred/dcrd/pull/423) |
| Typo correction | [decred/dcrd#501](https://github.com/decred/dcrd/pull/501) |
| Change maxShift from var to const | [decred/dcrd#502](https://github.com/decred/dcrd/pull/502) |
| Add one more consensus test | [decred/dcrd#520](https://github.com/decred/dcrd/pull/520) |
| Update 3rd party deps at the start of 0.8.0 dev | [decred/dcrd#536](https://github.com/decred/dcrd/pull/536) |
| stake: Add SSGenVoteBitsExtendedMaxSize const | [decred/dcrd#541](https://github.com/decred/dcrd/pull/541) |
| blocklogger: fix singular case for stake transactions | [decred/dcrd#545](https://github.com/decred/dcrd/pull/545) |
| dcrjson: Add GetAccountBalanceResult and GetBalanceResult | [decred/dcrd#547](https://github.com/decred/dcrd/pull/547) |
| dcrjson: Remove balance type from getbalance API | [decred/dcrd#548](https://github.com/decred/dcrd/pull/548) |
| glide: sync with latest dcrrpcclient | [decred/dcrd#549](https://github.com/decred/dcrd/pull/549) |
| add checkpoints for 0.8.0 release | [decred/dcrd#550](https://github.com/decred/dcrd/pull/550) |
| Add block version to getstakeversions | [decred/dcrd#556](https://github.com/decred/dcrd/pull/556) |
| blockchain: Remove impossible condition checks. | [decred/dcrd#557](https://github.com/decred/dcrd/pull/557) |
| chaingen: Add package for generating test chains. | [decred/dcrd#560](https://github.com/decred/dcrd/pull/560) |
| blockchain: Implement configurable voting on top of PoS. | [decred/dcrd#542](https://github.com/decred/dcrd/pull/542) |
| blockchain: Add fullblock tests for voting. | [decred/dcrd#562](https://github.com/decred/dcrd/pull/562) |
| multi: Implement block size hard fork demo voting. | [decred/dcrd#558](https://github.com/decred/dcrd/pull/558) |
| Bump for v0.8.0 | [decred/dcrd#554](https://github.com/decred/dcrd/pull/554) |
| Update internal glide repos for v0.8.0 | [decred/dcrd#563](https://github.com/decred/dcrd/pull/563) |
| grpc: Switch to pregenerated javascript bindings instead of dynamic loading of api.proto | [decred/decrediton#118](https://github.com/decred/decrediton/pull/118) |
| Generate tarball for linux builds. | [decred/decrediton#126](https://github.com/decred/decrediton/pull/126) |
| Include dcr* binaries when packaging. | [decred/decrediton#127](https://github.com/decred/decrediton/pull/127) |
| Close when all windows are closed on OSX. | [decred/decrediton#129](https://github.com/decred/decrediton/pull/129) |
| Fix history page loading | [decred/decrediton#130](https://github.com/decred/decrediton/pull/130) |
| don't assume the certificate exists and print error if it doesn't | [decred/decrediton#132](https://github.com/decred/decrediton/pull/132) |
| css/html: Clean Receive page and add css provided by designers | [decred/decrediton#139](https://github.com/decred/decrediton/pull/139) |
| add missing radium dep | [decred/decrediton#145](https://github.com/decred/decrediton/pull/145) |
| More css\layout from designers | [decred/decrediton#146](https://github.com/decred/decrediton/pull/146) |
| Link transaction subscription and updating client information | [decred/decrediton#147](https://github.com/decred/decrediton/pull/147) |
| Fix lots more lint issues | [decred/decrediton#149](https://github.com/decred/decrediton/pull/149) |
| Update the send form to allow for multiple outputs/recipients | [decred/decrediton#150](https://github.com/decred/decrediton/pull/150) |
| Fix display when balance is zero. | [decred/decrediton#153](https://github.com/decred/decrediton/pull/153) |
| Cleanup to make lint happy | [decred/decrediton#154](https://github.com/decred/decrediton/pull/154) |
| Fix typo so correct prop is checked | [decred/decrediton#155](https://github.com/decred/decrediton/pull/155) |
| Add debug mode to production. | [decred/decrediton#156](https://github.com/decred/decrediton/pull/156) |
| Give user some feedback for daemon syncing | [decred/decrediton#157](https://github.com/decred/decrediton/pull/157) |
| Make sure dcrd and dcrwallet shutdown when app closes. | [decred/decrediton#158](https://github.com/decred/decrediton/pull/158) |
| Improve packaging instructions. | [decred/decrediton#160](https://github.com/decred/decrediton/pull/160) |
| Use single directory for saved items. | [decred/decrediton#161](https://github.com/decred/decrediton/pull/161) |
| display RPC errors | [decred/decrediton#163](https://github.com/decred/decrediton/pull/163) |
| Improve the documentation. | [decred/decrediton#164](https://github.com/decred/decrediton/pull/164) |
| print config path in error | [decred/decrediton#167](https://github.com/decred/decrediton/pull/167) |
| Fix a few lint issues that got in. | [decred/decrediton#169](https://github.com/decred/decrediton/pull/169) |
| Simplify grpc build instructions. | [decred/decrediton#171](https://github.com/decred/decrediton/pull/171) |
| Sidebar/Header revamp, plus error page on wallet ping error | [decred/decrediton#172](https://github.com/decred/decrediton/pull/172) |
| Fixed for Windows. | [decred/decrediton#173](https://github.com/decred/decrediton/pull/173) |
| Add bin/ to gitignore | [decred/decrediton#174](https://github.com/decred/decrediton/pull/174) |
| Update grpc bindings for updated FetchHeaders response | [decred/decrediton#175](https://github.com/decred/decrediton/pull/175) |
| Update to use fetchHeadersResponse instead of curBlocks | [decred/decrediton#176](https://github.com/decred/decrediton/pull/176) |
| Force all wallet created from existing seeds to rescan from 0 | [decred/decrediton#177](https://github.com/decred/decrediton/pull/177) |
| implement proper semver check | [decred/decrediton#178](https://github.com/decred/decrediton/pull/178) |
| use password type on passwords | [decred/decrediton#180](https://github.com/decred/decrediton/pull/180) |
| Handle dcrd or dcrwallet startup errors. | [decred/decrediton#181](https://github.com/decred/decrediton/pull/181) |
| Style tx history and add first few Icon svg components | [decred/decrediton#184](https://github.com/decred/decrediton/pull/184) |
| Update icons for macOS and Windows to match new logo. | [decred/decrediton#186](https://github.com/decred/decrediton/pull/186) |
| Update grpc bindings for new fields in Credits | [decred/decrediton#187](https://github.com/decred/decrediton/pull/187) |
| Basic match of upcoming design docs | [decred/decrediton#191](https://github.com/decred/decrediton/pull/191) |
| Add logic for mined and unmined transactions | [decred/decrediton#192](https://github.com/decred/decrediton/pull/192) |
| Add qr code to receive page. | [decred/decrediton#193](https://github.com/decred/decrediton/pull/193) |
| Use DCR as units on Send page instead of atoms. | [decred/decrediton#194](https://github.com/decred/decrediton/pull/194) |
| Add Pagination to transaction history | [decred/decrediton#196](https://github.com/decred/decrediton/pull/196) |
| Add help links to sidebar | [decred/decrediton#200](https://github.com/decred/decrediton/pull/200) |
| First pass new overview and sidebar design | [decred/decrediton#201](https://github.com/decred/decrediton/pull/201) |
| Load custom fonts from local files | [decred/decrediton#202](https://github.com/decred/decrediton/pull/202) |
| Add settings page and other styling improvements | [decred/decrediton#203](https://github.com/decred/decrediton/pull/203) |
| Add designer requested account balance hover on sidebar | [decred/decrediton#205](https://github.com/decred/decrediton/pull/205) |
| Show time since last block connected | [decred/decrediton#206](https://github.com/decred/decrediton/pull/206) |
| Implement Transaction Details and fix various stylings | [decred/decrediton#207](https://github.com/decred/decrediton/pull/207) |
| Fix up help links styling | [decred/decrediton#210](https://github.com/decred/decrediton/pull/210) |
| Improvements in Send Page. | [decred/decrediton#212](https://github.com/decred/decrediton/pull/212) |
| use formsy material ui for form validation | [decred/decrediton#214](https://github.com/decred/decrediton/pull/214) |
| Open help links in Default Browser. | [decred/decrediton#216](https://github.com/decred/decrediton/pull/216) |
| Add links to insight testnet/mainnet in tx details | [decred/decrediton#217](https://github.com/decred/decrediton/pull/217) |
| Rig to remove public password on wallet creation for now | [decred/decrediton#219](https://github.com/decred/decrediton/pull/219) |
| Move to componentDidMount | [decred/decrediton#221](https://github.com/decred/decrediton/pull/221) |
| Major refinement to match designers' views | [decred/decrediton#222](https://github.com/decred/decrediton/pull/222) |
| Add testnet to sidebar | [decred/decrediton#224](https://github.com/decred/decrediton/pull/224) |
| Make Send page honor units setting. | [decred/decrediton#225](https://github.com/decred/decrediton/pull/225) |
| Match designer spec for getstarted views | [decred/decrediton#227](https://github.com/decred/decrediton/pull/227) |
| Update node version required. | [decred/decrediton#229](https://github.com/decred/decrediton/pull/229) |
| Fix minor typo for running on OSX | [decred/decrediton#231](https://github.com/decred/decrediton/pull/231) |
| Fix sidebar account balances | [decred/decrediton#242](https://github.com/decred/decrediton/pull/242) |
| Change to use mainnet as default | [decred/decrediton#244](https://github.com/decred/decrediton/pull/244) |
| Bump for v0.8.0 | [decred/decrediton#239](https://github.com/decred/decrediton/pull/239) |
| Do not use pipe for dcrd. | [decred/decrediton#246](https://github.com/decred/decrediton/pull/246) |
| Add testnet shortcuts. | [decred/decred-windows-installer#35](https://github.com/decred/decred-windows-installer/pull/35) |
| bye bye ticketbuyer | [decred/decred-windows-installer#37](https://github.com/decred/decred-windows-installer/pull/37) |
| Update digests and versions for v0.8.0 | [decred/decred-windows-installer#36](https://github.com/decred/decred-windows-installer/pull/36) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/gominer | e967abd8ecae4b05f5fa45b8fce602008cc94a0b |
| decred/Paymetheus | 446117e8e6bc9a8d22b5db61b47f7f4439798276 |
| decred/decred-windows-installer | eb511d81574b7511277c98328d64054d80916c41 |
| decred/dcrwallet | 786f15a11b82c53a8023ca8f81def5307cb36051 |
| decred/dcrd | 1196130cbce1872788f572e252379c8c90ef528e |
| decred/decrediton | cbea4062a1967d20121a8cba4bf273b13c26ef07 |

## Known Issues

---

# [v0.7.0](https://github.com/decred/decred-binaries/releases/tag/v0.7.0)

## 2016-12-26

This release contains bug fixes and improvements for dcrd, dcrwallet,
and Paymetheus.

This includes the first release of decrediton, a new, cross-platform
GUI for decred.  This is not a feature complete version of
decrediton.  Simple operations (creating wallet, importing a seed,
sending and receiving decred) are supported.  This is primarily a demo
of decrediton rather than a production ready tool.  Please try it and
report any issues or additional features you would like on the
[github page](https://github.com/decred/decrediton/issues).  Currently
binaries are only provided for 64 bit Linux and OSX.

Paymetheus has added seed restoration as well as the ability to show
rescan progress.

A new rpc command to resync has been added to dcrwallet.  The
functionality from dcrticketbuyer has been added to dcrwallet.  See
[this commit](https://github.com/decred/dcrwallet/commit/879e0689b539852315b2e311681a6b879fa77f3c)
for details on using the new functionality instead of the seperate
dcrticketbuyer binary.

dcrd has various bugfixes and infrastructure improvements for voting
in a future release.

gominer and copay are unchanged so there are no new binaries for
them.  You should use the previous release for either of them.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v0.7.0/decred_0.7.0-beta_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v0.7.0/decred_0.7.0-beta_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run
[decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v0.7.0/decrediton-0.7.0-linux-amd64.tar.gz)
or
[decrediton OSX](https://github.com/decred/decred-binaries/releases/download/v0.7.0/decrediton-0.7.0.dmg)

See manifest-v0.7.0.txt, manifest-paymetheus-v0.7.0.txt,
manifest-decrediton-0.7.0.txt, and manifest-dcrinstaller-v0.7.0.txt
for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

| Description | Pull Request |
| --- | ---- |
| Updates to goclean.sh | [decred/gominer#129](https://github.com/decred/gominer/pull/129) |
| Bump for v0.7.0 | [decred/gominer#130](https://github.com/decred/gominer/pull/130) |
| Bump for v0.6.1 | [decred/dcrticketbuyer#77](https://github.com/decred/dcrticketbuyer/pull/77) |
| Remove -v from go test. | [decred/dcrticketbuyer#80](https://github.com/decred/dcrticketbuyer/pull/80) |
| Bump for v0.7.0 | [decred/dcrticketbuyer#81](https://github.com/decred/dcrticketbuyer/pull/81) |
| Updates for dcrd JSON-RPC websocket API changes. | [decred/dcrrpcclient#40](https://github.com/decred/dcrrpcclient/pull/40) |
| Fix return result type for Version(Async) RPCs. | [decred/dcrrpcclient#41](https://github.com/decred/dcrrpcclient/pull/41) |
| Switch goclean to use metalinter. | [decred/dcrrpcclient#43](https://github.com/decred/dcrrpcclient/pull/43) |
| Remove TxTree definitions in favor of wire defs. | [decred/dcrutil#18](https://github.com/decred/dcrutil/pull/18) |
| docs: Make various README.md files consistent. | [decred/dcrutil#20](https://github.com/decred/dcrutil/pull/20) |
| Add p384 cert needed for boringssl | [decred/dcrutil#21](https://github.com/decred/dcrutil/pull/21) |
| Fix range check in bloom filter false positive rate | [decred/dcrutil#22](https://github.com/decred/dcrutil/pull/22) |
| bloom: Correct merkle block test error print. | [decred/dcrutil#23](https://github.com/decred/dcrutil/pull/23) |
| bloom: Avoid a few unnecessary hash copies. | [decred/dcrutil#24](https://github.com/decred/dcrutil/pull/24) |
| Update for recent chainhash-related API changes. | [decred/dcrutil#25](https://github.com/decred/dcrutil/pull/25) |
| license: add title | [decred/dcrutil#26](https://github.com/decred/dcrutil/pull/26) |
| Remove -v from go test. | [decred/dcrutil#28](https://github.com/decred/dcrutil/pull/28) |
| Pass elliptic.Curve as parameter to NewTLSCertPair. | [decred/dcrutil#30](https://github.com/decred/dcrutil/pull/30) |
| Updates for controlled wallet startup RPCs | [decred/Paymetheus#192](https://github.com/decred/Paymetheus/pull/192) |
| Add seed restoring option when no wallet is detected. | [decred/Paymetheus#193](https://github.com/decred/Paymetheus/pull/193) |
| Add -extrawalletargs flag. | [decred/Paymetheus#194](https://github.com/decred/Paymetheus/pull/194) |
| Abstract out wizard activity tasks. | [decred/Paymetheus#197](https://github.com/decred/Paymetheus/pull/197) |
| Don't make open wallet button clickable again after success.  | [decred/Paymetheus#198](https://github.com/decred/Paymetheus/pull/198) |
| Add additional startup activity views. | [decred/Paymetheus#201](https://github.com/decred/Paymetheus/pull/201) |
| Catch up version on main branch | [decred/Paymetheus#203](https://github.com/decred/Paymetheus/pull/203) |
| Update RPC client code for API 4.0.0. | [decred/Paymetheus#205](https://github.com/decred/Paymetheus/pull/205) |
| Add HTTP clients for stakepool API integration. | [decred/Paymetheus#206](https://github.com/decred/Paymetheus/pull/206) |
| Remove an unneeded extra statement. | [decred/Paymetheus#209](https://github.com/decred/Paymetheus/pull/209) |
| Update Paymetheus.StakePoolIntegration for v1 API. | [decred/Paymetheus#212](https://github.com/decred/Paymetheus/pull/212) |
| Bump for v0.7.0 | [decred/Paymetheus#213](https://github.com/decred/Paymetheus/pull/213) |
| Bump for v0.6.1 | [decred/decred-release#76](https://github.com/decred/decred-release/pull/76) |
| Release | [decred/decred-release#77](https://github.com/decred/decred-release/pull/77) |
| Updates for v0.7.0 | [decred/decred-release#78](https://github.com/decred/decred-release/pull/78) |
| Update digests for v0.6.1 | [decred/decred-decred-windows-installer#30](https://github.com/decred/decred-windows-installer/pull/30) |
| prepare for 0.6.1 release | [decred/decred-decred-windows-installer#31](https://github.com/decred/decred-windows-installer/pull/31) |
| Update digests and versions for 0.7.0 | [decred/decred-decred-windows-installer#33](https://github.com/decred/decred-windows-installer/pull/33) |
| Refactor to integrate pkg ticketbuyer for automated ticket purchases | [decred/dcrwallet#374](https://github.com/decred/dcrwallet/pull/374) |
| Remove Wallet.ChainSynced/SetChainSynced APIs. | [decred/dcrwallet#378](https://github.com/decred/dcrwallet/pull/378) |
| Fix a bug in the semver compatibility check. | [decred/dcrwallet#380](https://github.com/decred/dcrwallet/pull/380) |
| Update dependencies. | [decred/dcrwallet#381](https://github.com/decred/dcrwallet/pull/381) |
| Add Rescan RPC to the gRPC server. | [decred/dcrwallet#382](https://github.com/decred/dcrwallet/pull/382) |
| Marginally clean up acct/addr discovery code. | [decred/dcrwallet#383](https://github.com/decred/dcrwallet/pull/383) |
| Update gRPC client doco for changed requirements. | [decred/dcrwallet#391](https://github.com/decred/dcrwallet/pull/391) |
| Fix an improperly formatted error found by Travis. | [decred/dcrwallet#396](https://github.com/decred/dcrwallet/pull/396) |
| Update dcrutil version  | [decred/dcrwallet#398](https://github.com/decred/dcrwallet/pull/398) |
| Add controlled startup RPCs to the gRPC interface. | [decred/dcrwallet#399](https://github.com/decred/dcrwallet/pull/399) |
| Sp fix |  | [decred/dcrwallet#400](https://github.com/decred/dcrwallet/pull/400) |
| Move decision to send attached block notifications to caller. | [decred/dcrwallet#403](https://github.com/decred/dcrwallet/pull/403) |
| Catch up version on main branch | [decred/dcrwallet#408](https://github.com/decred/dcrwallet/pull/408) |
| Change WalletService.GetTransactions to return stream. | [decred/dcrwallet#409](https://github.com/decred/dcrwallet/pull/409) |
| Improve error handling by ignoring less errors. | [decred/dcrwallet#410](https://github.com/decred/dcrwallet/pull/410) |
| Correctly handle duplicate blocks in the main chain. | [decred/dcrwallet#413](https://github.com/decred/dcrwallet/pull/413) |
| Require seed parameter for LoaderService.CreateWallet RPC. | [decred/dcrwallet#415](https://github.com/decred/dcrwallet/pull/415) |
| Name WalletLoaderService correctly in documentation. | [decred/dcrwallet#417](https://github.com/decred/dcrwallet/pull/417) |
| Remove database if wallet.Loader.CreateNewWallet errors. | [decred/dcrwallet#419](https://github.com/decred/dcrwallet/pull/419) |
| Update JSON-RPC help. | [decred/dcrwallet#422](https://github.com/decred/dcrwallet/pull/422) |
| Disable broken tests so working tests can be run. | [decred/dcrwallet#423](https://github.com/decred/dcrwallet/pull/423) |
| Reenable tests on travis. | [decred/dcrwallet#424](https://github.com/decred/dcrwallet/pull/424) |
| Remove internal/legacy/* packages. | [decred/dcrwallet#427](https://github.com/decred/dcrwallet/pull/427) |
| Add links to WalletLoaderService Methods | [decred/dcrwallet#428](https://github.com/decred/dcrwallet/pull/428) |
| Pull in latest dcrd version. | [decred/dcrwallet#429](https://github.com/decred/dcrwallet/pull/429) |
| Implement the rescanwallet JSON-RPC. | [decred/dcrwallet#430](https://github.com/decred/dcrwallet/pull/430) |
| config: add --piperx | [decred/dcrwallet#432](https://github.com/decred/dcrwallet/pull/432) |
| Remove cmd/dropwtxmgr and doco references to it. | [decred/dcrwallet#434](https://github.com/decred/dcrwallet/pull/434) |
| Actually require the wtxmgr namespace to exist. | [decred/dcrwallet#435](https://github.com/decred/dcrwallet/pull/435) |
| Fix --create by creating the transaction manager. | [decred/dcrwallet#437](https://github.com/decred/dcrwallet/pull/437) |
| Remove -v from go test on travis. | [decred/dcrwallet#438](https://github.com/decred/dcrwallet/pull/438) |
| Update decred deps to pull in new dcrutil. | [decred/dcrwallet#440](https://github.com/decred/dcrwallet/pull/440) |
| Add tlscurve option to specify TLS curve. | [decred/dcrwallet#442](https://github.com/decred/dcrwallet/pull/442) |
| Fix possible exceptions in example gRPC clients. | [decred/dcrwallet#445](https://github.com/decred/dcrwallet/pull/445) |
| Use atoms, not Satoshis, in example clients. | [decred/dcrwallet#447](https://github.com/decred/dcrwallet/pull/447) |
| Add gRPC SeedService. | [decred/dcrwallet#449](https://github.com/decred/dcrwallet/pull/449) |
| Change --profile to take a listen address (or many). | [decred/dcrwallet#450](https://github.com/decred/dcrwallet/pull/450) |
| Allow --piperx=0 (stdin). | [decred/dcrwallet#452](https://github.com/decred/dcrwallet/pull/452) |
| Add WalletService.ConstructTransaction RPC. | [decred/dcrwallet#455](https://github.com/decred/dcrwallet/pull/455) |
| Verify that addresses are intended for the active net. | [decred/dcrwallet#457](https://github.com/decred/dcrwallet/pull/457) |
| ticketbuyer: Stop purchaser on client shutdown | [decred/dcrwallet#469](https://github.com/decred/dcrwallet/pull/469) |
| Allow running either the new or old ticket buyer. | [decred/dcrwallet#470](https://github.com/decred/dcrwallet/pull/470) |
| Serialize calls to ticketbuyer Purchase. | [decred/dcrwallet#472](https://github.com/decred/dcrwallet/pull/472) |
| Revert change to default ticketmaxprice option. | [decred/dcrwallet#475](https://github.com/decred/dcrwallet/pull/475) |
| ticketbuyer: Fix set split tx, ticket fees  | [decred/dcrwallet#478](https://github.com/decred/dcrwallet/pull/478) |
| ticketbuyer: Fix use of maxpriceaabsolute, txfee | [decred/dcrwallet#479](https://github.com/decred/dcrwallet/pull/479) |
| Improve efficiency of triggering the ticket buyer. | [decred/dcrwallet#480](https://github.com/decred/dcrwallet/pull/480) |
| bump wallet vote version to 3 | [decred/dcrwallet#461](https://github.com/decred/dcrwallet/pull/461) |
| Update internal glide deps for 0.7.0 | [decred/dcrwallet#486](https://github.com/decred/dcrwallet/pull/486) |
| Bump for v0.7.0 | [decred/dcrwallet#459](https://github.com/decred/dcrwallet/pull/459) |
| blockchain: simplify logic in checkCoinbaseUniqueHeight | [decred/dcrd#440](https://github.com/decred/dcrd/pull/440) |
| ErrBadStakevaseScrVal -> ErrBadStakebaseScrVal | [decred/dcrd#444](https://github.com/decred/dcrd/pull/444) |
| blockchain: remove redundant check  | [decred/dcrd#449](https://github.com/decred/dcrd/pull/449) |
| blockchain: pruneStakeNodes never returns an error | [decred/dcrd#450](https://github.com/decred/dcrd/pull/450) |
| Glide update at the beginning of 0.7.0 | [decred/dcrd#458](https://github.com/decred/dcrd/pull/458) |
| blockchain: Remove unnecessary RuleError.GetCode. | [decred/dcrd#459](https://github.com/decred/dcrd/pull/459) |
| travis: 1.7 -> 1.7.3 | [decred/dcrd#460](https://github.com/decred/dcrd/pull/460) |
| peer: use atomics instead of mutexes | [decred/dcrd#461](https://github.com/decred/dcrd/pull/461) |
| peer: Extract protocol negotiation from main read and write loops | [decred/dcrd#462](https://github.com/decred/dcrd/pull/462) |
| blockchain: Associate time src with chain instance. | [decred/dcrd#463](https://github.com/decred/dcrd/pull/463) |
| wire: Export transaction tree constants. | [decred/dcrd#464](https://github.com/decred/dcrd/pull/464) |
| blockchain: optimize HaveBlock | [decred/dcrd#465](https://github.com/decred/dcrd/pull/465) |
| wire: Consolidate tests into the wire pkg. | [decred/dcrd#466](https://github.com/decred/dcrd/pull/466) |
| multi: Upstream chainhash abstraction sync | [decred/dcrd#467](https://github.com/decred/dcrd/pull/467) |
| blockchain: LogBlockHeight only needs a wire.MsgBlock.. | [decred/dcrd#471](https://github.com/decred/dcrd/pull/471) |
| multi: Upstream parameter abstraction sync | [decred/dcrd#473](https://github.com/decred/dcrd/pull/473) |
| dcrd: Simplify shutdown signal handling logic sync. | [decred/dcrd#474](https://github.com/decred/dcrd/pull/474) |
| license: add title | [decred/dcrd#475](https://github.com/decred/dcrd/pull/475) |
| txscript: Expose AddOps on ScriptBuilder. | [decred/dcrd#476](https://github.com/decred/dcrd/pull/476) |
| docs: Add chainhash to README.md | [decred/dcrd#477](https://github.com/decred/dcrd/pull/477) |
| server: Remove superfluous check in OnMemPool. | [decred/dcrd#478](https://github.com/decred/dcrd/pull/478) |
| mempool: Optimize the votes map slices. | [decred/dcrd#479](https://github.com/decred/dcrd/pull/479) |
| stake/dcrjson: Simplify code with gofmt -s. | [decred/dcrd#480](https://github.com/decred/dcrd/pull/480) |
| server: Optimize get mining state code. | [decred/dcrd#482](https://github.com/decred/dcrd/pull/482) |
| mempool: Remove exported InsertVote function. | [decred/dcrd#483](https://github.com/decred/dcrd/pull/483) |
| mempool: Rename GetVoteHashesForBlock & remove err. | [decred/dcrd#484](https://github.com/decred/dcrd/pull/484) |
| mempool: Decouple mining-specific logic. | [decred/dcrd#486](https://github.com/decred/dcrd/pull/486) |
| stake: Convert TxType constants to enum syntax. | [decred/dcrd#488](https://github.com/decred/dcrd/pull/488) |
| multi: Restore correct upstream majority version code. | [decred/dcrd#490](https://github.com/decred/dcrd/pull/490) |
| Bump to v0.6.1 | [decred/dcrd#492](https://github.com/decred/dcrd/pull/492) |
| rpcserver: Return RPC errors from block template. | [decred/dcrd#494](https://github.com/decred/dcrd/pull/494) |
| mempool: Refactor mempool code to its own package. | [decred/dcrd#496](https://github.com/decred/dcrd/pull/496) |
| dcrjson: Add rescanwallet JSON-RPC request. | [decred/dcrd#500](https://github.com/decred/dcrd/pull/500) |
| Add unit tests. | [decred/dcrd#504](https://github.com/decred/dcrd/pull/504) |
| Fix typo. | [decred/dcrd#505](https://github.com/decred/dcrd/pull/505) |
| Remove -v from go test. | [decred/dcrd#507](https://github.com/decred/dcrd/pull/507) |
| Pull in latest dcrutil. | [decred/dcrd#508](https://github.com/decred/dcrd/pull/508) |
| add more checkpoints for upcoming release | [decred/dcrd#509](https://github.com/decred/dcrd/pull/509) |
| Test another failing condition in validate.go | [decred/dcrd#511](https://github.com/decred/dcrd/pull/511) |
| Fix output formatting in a unit test. | [decred/dcrd#513](https://github.com/decred/dcrd/pull/513) |
| blockchain: Make params used in tests match. | [decred/dcrd#517](https://github.com/decred/dcrd/pull/517) |
| fullblocktests: Limit tickets to target pool size. | [decred/dcrd#518](https://github.com/decred/dcrd/pull/518) |
| fullblocktests: Generate subsidy for voted block. | [decred/dcrd#519](https://github.com/decred/dcrd/pull/519) |
| Implement stake voter version interrogation command. | [decred/dcrd#522](https://github.com/decred/dcrd/pull/522) |
| rpc: Add missing StakeVersion to getblock verbose | [decred/dcrd#529](https://github.com/decred/dcrd/pull/529) |
| Implement softfork mechanism. | [decred/dcrd#524](https://github.com/decred/dcrd/pull/524) |
| Validate softforking consensus rules | [decred/dcrd#526](https://github.com/decred/dcrd/pull/526) |
| Bump for v0.7.0 | [decred/dcrd#515](https://github.com/decred/dcrd/pull/515) |
| Decrediton hello world, from electron-quick-start example on github | [decred/decrediton#2](https://github.com/decred/decrediton/pull/2) |
| Add in basic rigging and some button PoC | [decred/decrediton#4](https://github.com/decred/decrediton/pull/4) |
| Fix README.md typos and errors. | [decred/decrediton#6](https://github.com/decred/decrediton/pull/6) |
| Initial framework commit. | [decred/decrediton#7](https://github.com/decred/decrediton/pull/7) |
| Fix grpc client connectivity and get balance button click PoC | [decred/decrediton#9](https://github.com/decred/decrediton/pull/9) |
| Update README.md for accurate deving | [decred/decrediton#10](https://github.com/decred/decrediton/pull/10) |
| Add rough cut of LoginForm and rigging in place to share grpcClient | [decred/decrediton#11](https://github.com/decred/decrediton/pull/11) |
| Strip down react/redux to basic components to build up from | [decred/decrediton#12](https://github.com/decred/decrediton/pull/12) |
| Add webpack configs from electron-react-boilerplate | [decred/decrediton#16](https://github.com/decred/decrediton/pull/16) |
| First major introduction of bootstrap and various other front end pieces | [decred/decrediton#17](https://github.com/decred/decrediton/pull/17) |
| Update package.json for decrediton and packaging | [decred/decrediton#18](https://github.com/decred/decrediton/pull/18) |
| Update .gitignore | [decred/decrediton#23](https://github.com/decred/decrediton/pull/23) |
| Add sidebar and proper login/getbalance state handling | [decred/decrediton#25](https://github.com/decred/decrediton/pull/25) |
| Add WalletLoaderService functionality to prepare wallet for actions | [decred/decrediton#35](https://github.com/decred/decrediton/pull/35) |
| Reenable ssl for grpc. | [decred/decrediton#38](https://github.com/decred/decrediton/pull/38) |
| Use .decrediton instead of .dcrwallet | [decred/decrediton#41](https://github.com/decred/decrediton/pull/41) |
| Launch dcrd and dcrwallet on startup. | [decred/decrediton#43](https://github.com/decred/decrediton/pull/43) |
| Fix possible exception in cert load. | [decred/decrediton#46](https://github.com/decred/decrediton/pull/46) |
| Correct app name and menu links. | [decred/decrediton#47](https://github.com/decred/decrediton/pull/47) |
| Set version to something more reasonable. | [decred/decrediton#48](https://github.com/decred/decrediton/pull/48) |
| Use decred icon instead of default in packages. | [decred/decrediton#49](https://github.com/decred/decrediton/pull/49) |
| Combine duplicate code for rpc cert loading. | [decred/decrediton#51](https://github.com/decred/decrediton/pull/51) |
| Finish boilerplate for redux/grpc calls | [decred/decrediton#2](https://github.com/decred/decrediton/pull/52) |
| Change babel-core version back to 6.18.2 due to 6.20.0 breaking | [decred/decrediton#53](https://github.com/decred/decrediton/pull/53) |
| Add basic boilerplate/impl of grpc notifications to actions | [decred/decrediton#54](https://github.com/decred/decrediton/pull/54) |
| Add final boilerplate for grpc control | [decred/decrediton#55](https://github.com/decred/decrediton/pull/55) |
| Various fixes for control api and first pass on receive page | [decred/decrediton#56](https://github.com/decred/decrediton/pull/56) |
| Move config options to file instead of hardcoding. | [decred/decrediton#58](https://github.com/decred/decrediton/pull/58) |
| Explicitly set rpc ports for dcrd. | [decred/decrediton#62](https://github.com/decred/decrediton/pull/62) |
| Add eslint with basic rules. | [decred/decrediton#63](https://github.com/decred/decrediton/pull/63) |
| Add material-ui React component implementation remove react-bootstrap | [decred/decrediton#66](https://github.com/decred/decrediton/pull/66) |
| Remove leftover grpc binary | [decred/decrediton#67](https://github.com/decred/decrediton/pull/67) |
| Add eslint-formatter-pretty back. | [decred/decrediton#69](https://github.com/decred/decrediton/pull/69) |
| Start on cleaning up based on eslint. | [decred/decrediton#72](https://github.com/decred/decrediton/pull/72) |
| Address more lint issues. | [decred/decrediton#74](https://github.com/decred/decrediton/pull/74) |
| Add some basic instructions to the README | [decred/decrediton#77](https://github.com/decred/decrediton/pull/77) |
| Use the same license all over. | [decred/decrediton#79](https://github.com/decred/decrediton/pull/79) |
| Add constructTransaction and loadActiveDataFilters gRPC | [decred/decrediton#80](https://github.com/decred/decrediton/pull/80) |
| Make port in README.md match defaults in code. | [decred/decrediton#88](https://github.com/decred/decrediton/pull/88) |
| GetStarted funnel revamp, plus lots of other fixes | [decred/decrediton#89](https://github.com/decred/decrediton/pull/89) |
| Remove passphrases from redux state | [decred/decrediton#90](https://github.com/decred/decrediton/pull/90) |
| Construct/Sign/Publish tx split apart and given proper forms | [decred/decrediton#91](https://github.com/decred/decrediton/pull/91) |
| Adds button on Home page to allow for users to start rescan | [decred/decrediton#95](https://github.com/decred/decrediton/pull/95) |
| Add CircularProgress components | [decred/decrediton#97](https://github.com/decred/decrediton/pull/97) |
| Add SeedService to allow for new seed generation and existing seed processing | [decred/decrediton#98](https://github.com/decred/decrediton/pull/98) |
| Add VersionService to ensure that decrediton is running on expected dcrwallet version | [decred/decrediton#99](https://github.com/decred/decrediton/pull/99) |
| Rough first pass to display getTransactions | [decred/decrediton#103](https://github.com/decred/decrediton/pull/103) |
| Add disclaimer for initial release | [decred/decrediton#111](https://github.com/decred/decrediton/pull/111) |
| Allow packaged app to find api.proto. | [decred/decrediton#115](https://github.com/decred/decrediton/pull/115) |
| Update README for mac. | [decred/decrediton#117](https://github.com/decred/decrediton/pull/117) |
| Bump for v0.7.0 (initial release) | [decred/decrediton#92](https://github.com/decred/decrediton/pull/92) |
| Fix path to dcrd directory on macOS and windows. | [decred/decrediton#120](https://github.com/decred/decrediton/pull/120) |

## Notes

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/gominer | 64044f254e42c5efe4dd0f51d5b87c3b4509c500 |
| decred/dcrticketbuyer | 3b06866ff0c55a53f933e2187d82aa1e6a2252d4 |
| decred/Paymetheus | 02099729a4fcb867f3bcb0ecaf7b04e605aa53ae |
| decred/decred-windows-installer | ea1faaecb9d252ef62b9efd9b58f98222cd4c51e |
| decred/dcrwallet | 77da9f475ac5d7cb2a259134f60ed0b37a1fae9e |
| decred/dcrd | a4de23553143174ee9ab263e12fb7051e5d8581d |
| decred/copay | 9b12e42e22374811d0f602bd54c85f3f203e2f77 |
| decred/decrediton | 776c227da6aec3d5ea50a0029d45e3f554e50514 |

## Known Issues

---

# [v0.6.1](https://github.com/decred/decred-binaries/releases/tag/v0.6.1)

## 2016-11-25

This release contains bug fixes and improvements for dcrd and
dcrwallet.

A new block test framework has been added to simplify adding new
tests.  380 new block tests have been added with it.

Several RPC improvements have been made.  A number of voting related
fixed and improvements have been made to support future voting
changes.

dcrwallet now processes transactions atomically.

gominer and copay are unchanged.  Paymetheus is unchanged but should
be updated for the updated dcrd and dcrwallet dependancies.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v0.6.1/decred_0.6.1-beta_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v0.6.1/decred_0.6.1-beta_x86.msi)
depending on your version of Windows.

To install a the local Copay GUI download and run
[Copay OSX](https://github.com/decred/decred-binaries/releases/download/v0.6.0/decred-copay-darwin-v0.6.0.dmg)
or
[Copay Linux](https://github.com/decred/decred-binaries/releases/download/v0.6.0/decred-copay-linux-v0.6.0.zip).

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See manifest-v0.6.1.txt, manifest-gominer-v0.6.0.txt,
manifest-paymetheus-v0.6.1.txt, and manifest-copay-0.6.0.txt,
manifest--dcrinstaller-v0.6.1.txt for sha256 sums and the associated
.asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

| Description | Pull Request |
| --- | ---- |
| Bump for v0.6.0 | [decred/gominer#127](https://github.com/decred/gominer/pull/127) |
| Bump for v0.6.0 | [decred/dcrticketbuyer#72](https://github.com/decred/dcrticketbuyer/pull/72) |
| Update onBlockConnected to match upcoming change in dcrd | [decred/dcrticketbuyer#73](https://github.com/decred/dcrticketbuyer/pull/73) |
| Bump for v0.6.0 | [decred/Paymetheus#187](https://github.com/decred/Paymetheus/pull/187) |
| Add SetBalanceToMaintain | [decred/dcrrpcclient#35](https://github.com/decred/dcrrpcclient/pull/35) |
| Add ExistsExpiredTickets to dcrrpcclient | [decred/dcrrpcclient#36](https://github.com/decred/dcrrpcclient/pull/36) |
| Add methods to use the new version and getheaders RPCs.  | [decred/dcrrpcclient#37](https://github.com/decred/dcrrpcclient/pull/37) |
| Setticketsvotebits | [decred/dcrrpcclient#39](https://github.com/decred/dcrrpcclient/pull/39) |
| Updates for dcrd JSON-RPC websocket API changes. | [decred/dcrrpcclient#40](https://github.com/decred/dcrrpcclient/pull/40) |
| bump version and settings for v0.6.0 | [decred/decred-release#73](https://github.com/decred/decred-release/pull/73) |
| bring dcrctl.exe back, fixes #26 | [decred/decred-windows-installer#27](https://github.com/decred/decred-windows-installer/pull/27) |
| bump for 0.6.0 | [decred/decred-windows-installer#28](https://github.com/decred/decred-windows-installer/pull/28) |
| straglers | [decred/decred-windows-installer#29](https://github.com/decred/decred-windows-installer/pull/29) |
| Add expired to getstakeinfo command | [decred/dcrwallet#360](https://github.com/decred/dcrwallet/pull/360) |
| Update dependencies, including 3rd party ones. | [decred/dcrwallet#361](https://github.com/decred/dcrwallet/pull/361) |
| Update the wallet to begin allowing extended votebits setting | [decred/dcrwallet#362](https://github.com/decred/dcrwallet/pull/362) |
| Fully update PoolTickets when using AddTicket rpc | [decred/dcrwallet#365](https://github.com/decred/dcrwallet/pull/365) |
| RFP-10 milestone 3 | [decred/dcrwallet#369](https://github.com/decred/dcrwallet/pull/369) |
| Bump for v0.6.0 | [decred/dcrwallet#373](https://github.com/decred/dcrwallet/pull/373) |
| Correctly handle both p2sh and p2pkh addrs in wstakemgr. | [decred/dcrwallet#376](https://github.com/decred/dcrwallet/pull/376) |
| Process transactions atomically with connected blocks. | [decred/dcrwallet#372](https://github.com/decred/dcrwallet/pull/372) |
| Remove Wallet.ChainSynced/SetChainSynced APIs. | [decred/dcrwallet#378](https://github.com/decred/dcrwallet/pull/378) |
| Output of --help/-h should go to os.Stdout rather than os.Stderr | [decred/dcrd#386](https://github.com/decred/dcrd/pull/386) |
| Fix the dumpblockchain function | [decred/dcrd#405](https://github.com/decred/dcrd/pull/405) |
| Use correct function to fetch blocks from the blockchain for RPC | [decred/dcrd#407](https://github.com/decred/dcrd/pull/407) |
| Remove unused files | [decred/dcrd#408](https://github.com/decred/dcrd/pull/408) |
| Prevent high memory usage when turning txindex on first time | [decred/dcrd#412](https://github.com/decred/dcrd/pull/412) |
| Add a block pruner that only prunes occassionally | [decred/dcrd#415](https://github.com/decred/dcrd/pull/415) |
| dcrctl: fix output in --terminal mode | [decred/dcrd#416](https://github.com/decred/dcrd/pull/416) |
| Add existsexpiredtickets to rpcserver | [decred/dcrd#418](https://github.com/decred/dcrd/pull/418) |
| Replace some unnecessary dcrutil.Tx usage with wire.MsgTx. | [decred/dcrd#419](https://github.com/decred/dcrd/pull/419) |
| Add voting version parsing function | [decred/dcrd#420](https://github.com/decred/dcrd/pull/420) |
| Add dcrjson decode func for concatenated hex hashes. | [decred/dcrd#421](https://github.com/decred/dcrd/pull/421) |
| Add new setticketsvotebits command | [decred/dcrd#422](https://github.com/decred/dcrd/pull/422) |
| Add func to decode string hashes to a passed destination. | [decred/dcrd#425](https://github.com/decred/dcrd/pull/425) |
| Add getheaders JSON-RPC extension command. | [decred/dcrd#426](https://github.com/decred/dcrd/pull/426) |
| Add EncodeConcatenatedHashes with test. | [decred/dcrd#432](https://github.com/decred/dcrd/pull/432) |
| dcrctl: Set width to max in --terminal | [decred/dcrd#436](https://github.com/decred/dcrd/pull/436) |
| blockchain: Add block validation infrastructure | [decred/dcrd#437](https://github.com/decred/dcrd/pull/437) |
| Bump for v0.6.0 | [decred/dcrd#438](https://github.com/decred/dcrd/pull/438) |
| Update 3rd party deps in glide | [decred/dcrd#439](https://github.com/decred/dcrd/pull/439) |
| Add StakeVersion to header. | [decred/dcrd#441](https://github.com/decred/dcrd/pull/441) |
| Use same notification for mined transactions and blocks. | [decred/dcrd#434](https://github.com/decred/dcrd/pull/434) |
| Update dcrrpcclient for dcrctl. | [decred/dcrd#445](https://github.com/decred/dcrd/pull/445) |
| update checkpoints | [decred/dcrd#446](https://github.com/decred/dcrd/pull/446) |
| Notify only relevant stake txs, not all. | [decred/dcrd#447](https://github.com/decred/dcrd/pull/447) |
| multi: Restore correct upstream majority version code. | [decred/dcrd#490](https://github.com/decred/dcrd/pull/490) |

## Notes

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/gominer | 13cecddb128cd67f6d4249205122eda255f3c221 |
| decred/dcrticketbuyer | e5f16a5cf1a8f765bd34800225adff902dfe0fdf |
| decred/Paymetheus | 9d54c93f304dc0bd42dba9327917ecddd834b237 |
| decred/decred-windows-installer | bf17ab16b6957d835f57eebcbe20980c479a4590 |
| decred/dcrwallet | f694721186b96bd2a26d1282eae94c14c672c123 |
| decred/dcrd | 4ce2279c4ad1c8b0ef3d8e914701ebcbdeb243da |
| decred/copay | 9b12e42e22374811d0f602bd54c85f3f203e2f77 |

## Known Issues

---

# [v0.5.1](https://github.com/decred/decred-binaries/releases/tag/v0.5.1)

## 2016-10-10

This release addresses a bug when upgrading very old wallets with
dcrwallet.  All other tools are unchanged.

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrticketbuyer | 33a2b0cfffe67d81e16abb78ae806be20326aac8 |
| decred/dcrwallet | 726012471ceb6ed61025395d43d624b37a0417c0 |
| decred/dcrd | 3527346c43ed4f904d559763daab0f7f53b19069 |

---

# [v0.5.0](https://github.com/decred/decred-binaries/releases/tag/v0.5.0)

## 2016-10-10

All users are strongly encouraged to upgrade to this release.

This release contains bugfixes and improvements to all of the decred
tools (dcrd, dcrwallet, gominer, Copay, and Paymetheus).  A new
unified database for tickets and blocks has been added to dcrd.  This
provides significant performance and reliability improvements.
gominer now supports NVIDIA GPUs using CUDA.  gominer can now monitor
temperatures and fan speeds on supported AMD or NVIDIA GPUs.  The dcrd
codebase has been modified to track the upstream btcd project more
closely, allowing for easier copying of code between the two projects.
Additional rpc tests have been added to dcrwallet (RFP-10).  All
changes since the last release are listed below.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v0.5.0/decred_0.5.0-beta_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v0.5.0/decred_0.5.0-beta_x86.msi)
depending on your version of Windows.

To install a the local Copay GUI download and run
[Copay OSX](https://github.com/decred/decred-binaries/releases/download/v0.5.0/decred-copay-darwin-v0.5.0.dmg)
or
[Copay Linux](https://github.com/decred/decred-binaries/releases/download/v0.5.0/decred-copay-linux-v0.5.0.zip).

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See manifest-v0.5.0.txt, manifest-gominer-v0.5.0.txt,
manifest-paymetheus-v0.5.0.txt, and manifest-copay-0.5.0.txt,
manifest--dcrinstaller-v0.5.0.txt for sha256 sums and the associated
.asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

| Description | Pull Request |
| --- | ---- |
| Hook up travis | [decred/gominer#75](https://github.com/decred/gominer/pull/75) |
| Print leading zeros in target difficulty. | [decred/gominer#79](https://github.com/decred/gominer/pull/79) |
| Initial support for cuda mining. | [decred/gominer#81](https://github.com/decred/gominer/pull/81) |
| Bump for v0.4.1 | [decred/gominer#85](https://github.com/decred/gominer/pull/85) |
| Small optimization for CUDA. | [decred/gominer#88](https://github.com/decred/gominer/pull/88) |
| adjust various headers so windows builds | [decred/gominer#89](https://github.com/decred/gominer/pull/89) |
| add result field so errors are unmarshaled properly | [decred/gominer#90](https://github.com/decred/gominer/pull/90) |
| gofmt | [decred/gominer#91](https://github.com/decred/gominer/pull/91) |
| fix cgo Go pointers issue  | [decred/gominer#92](https://github.com/decred/gominer/pull/92) |
| move deviceListIndex increment back to the right spot | [decred/gominer#93](https://github.com/decred/gominer/pull/93) |
| Clean up some old or incorrect comments. | [decred/gominer#95](https://github.com/decred/gominer/pull/95) |
| use nvml to fetch fan and temperature information | [decred/gominer#96](https://github.com/decred/gominer/pull/96) |
| Fix the size of data copied from device. | [decred/gominer#99](https://github.com/decred/gominer/pull/99) |
| implement amdgpu sysfs support to fetch fan and temperature information | [decred/gominer#100](https://github.com/decred/gominer/pull/100) |
| fix using a device on the second OpenCL platform | [decred/gominer#102](https://github.com/decred/gominer/pull/102) |
| use a slice of submitIDs instead of a single submitID | [decred/gominer#103](https://github.com/decred/gominer/pull/103) |
| Jcv split | [decred/gominer#105](https://github.com/decred/gominer/pull/105) |
| implement ADL support to fetch fan/temperature information | [decred/gominer#106](https://github.com/decred/gominer/pull/106) |
| Implement CUDA on windows, Fixes #108 | [decred/gominer#109](https://github.com/decred/gominer/pull/109) |
| Remove some unused and unneeded code | [decred/gominer#112](https://github.com/decred/gominer/pull/112) |
| Remove unneeded word in INFO log line | [decred/gominer#114](https://github.com/decred/gominer/pull/114) |
| add automatic fan control to maintain a target temperature | [decred/gominer#115](https://github.com/decred/gominer/pull/115) |
| Improve cpu usage with CUDA. | [decred/gominer#116](https://github.com/decred/gominer/pull/116) |
| add some default Windows CFLAGS/LDFLAGS and remove unixy code | [decred/gominer#117](https://github.com/decred/gominer/pull/117) |
| Update sample config with all new options. | [decred/gominer#119](https://github.com/decred/gominer/pull/119) |
| add more Windows details and some general improvements | [decred/gominer#120](https://github.com/decred/gominer/pull/120) |
| Bump for v0.5.0 | [decred/gominer#126](https://github.com/decred/gominer/pull/126) |
| Add additional code to fix ticket left in window check | [decred/dcrticketbuyer#53](https://github.com/decred/dcrticketbuyer/pull/53) |
| purchase: handle updated balance in purchase window | [decred/dcrticketbuyer#55](https://github.com/decred/dcrticketbuyer/pull/55) |
| Bump for v0.5.0 | [decred/dcrticketbuyer#61](https://github.com/decred/dcrticketbuyer/pull/61) |
| Update dcr* deps for 0.5.0 | [decred/dcrticketbuyer#65](https://github.com/decred/dcrticketbuyer/pull/65) |
| Fix quickstart for v0.4.0 | [decred/Paymetheus#172](https://github.com/decred/Paymetheus/pull/172) |
| Revert path hack to support https://github.com/decred/decred-windows-installer/issues/13 | [decred/Paymetheus#173](https://github.com/decred/Paymetheus/pull/173) |
| Do not ignore errors when starting dcrd. | [decred/Paymetheus#174](https://github.com/decred/Paymetheus/pull/174) |
| fix path, fixes #176 | [decred/Paymetheus#177](https://github.com/decred/Paymetheus/pull/177) |
| Bump for v0.5.0 | [decred/Paymetheus#183](https://github.com/decred/Paymetheus/pull/183) |
| ListUnspent docs: default maxconf missing a 9 digit. | [decred/dcrrpcclient#32](https://github.com/decred/dcrrpcclient/pull/32) |
| Add setticketmaxprice RPC, a few doc fixes. | [decred/dcrrpcclient#34](https://github.com/decred/dcrrpcclient/pull/34) |
| Update all logos and icons | [decred/copay#42](https://github.com/decred/copay/pull/42) |
| Update so backup confirmation sorts properly and shows uppercased words | [decred/copay#44](https://github.com/decred/copay/pull/44) |
| Fix several places where the desktop version conflicts with upstream. | [decred/copay#45](https://github.com/decred/copay/pull/45) |
| make dcrd not optional, fixes #13 and fixes #15 | [decred/decred-windows-installer#16](https://github.com/decred/decred-windows-installer/pull/16) |
| bring back conf file for now | [decred/decred-windows-installer#19](https://github.com/decred/decred-windows-installer/pull/19) |
| prep for 0.5.0 release | [decred/decred-windows-installer#20](https://github.com/decred/decred-windows-installer/pull/20) |
| catch pu | [decred/decred-windows-installer#21](https://github.com/decred/decred-windows-installer/pull/21) |
| new digests | [decred/decred-windows-installer#22](https://github.com/decred/decred-windows-installer/pull/22) |
| more stragglers | [decred/decred-windows-installer#23](https://github.com/decred/decred-windows-installer/pull/23) |
| Update one dep. | [decred/decred-windows-installer#24](https://github.com/decred/decred-windows-installer/pull/24) |
| update for real | [decred/decred-windows-installer#25](https://github.com/decred/decred-windows-installer/pull/25) |
| RFP-10 Milestone 2 | [decred/dcrwallet#336](https://github.com/decred/dcrwallet/pull/336) |
| Improve wallet atomicity. | [decred/dcrwallet#339](https://github.com/decred/dcrwallet/pull/339) |
| rpctest: fix appdata vs datadir issue | [decred/dcrwallet#342](https://github.com/decred/dcrwallet/pull/342) |
| Return previously-ignored errors in waddrmgr. | [decred/dcrwallet#346](https://github.com/decred/dcrwallet/pull/346) |
| Bump for v0.5.0 | [decred/dcrwallet#347](https://github.com/decred/dcrwallet/pull/347) |
| Fix namespace passed to wstakemgr API. | [decred/dcrwallet#348](https://github.com/decred/dcrwallet/pull/348) |
| Can't range over a slice being modified. | [decred/dcrwallet#349](https://github.com/decred/dcrwallet/pull/349) |
| Normalize addresses in all waddrmgr APIs. | [decred/dcrwallet#352](https://github.com/decred/dcrwallet/pull/352) |
| Update dcr* deps glide.lock for 0.5.0 | [decred/dcrwallet#356](https://github.com/decred/dcrwallet/pull/356) |
| Do not error if dcrctl can't find dcrd.conf. | [decred/dcrd#339](https://github.com/decred/dcrd/pull/339) |
| Reconcile btcd and dcrd auto generated config file semantics | [decred/dcrd#341](https://github.com/decred/dcrd/pull/341) |
| Fix a bug with invalidating blocks in new DB and add more sanity checks | [decred/dcrd#343](https://github.com/decred/dcrd/pull/343) |
| dcrd: Fix another upgrade issue. | [decred/dcrd#346](https://github.com/decred/dcrd/pull/346) |
| add another checkpoint for mainnet and testnet | [decred/dcrd#348](https://github.com/decred/dcrd/pull/348) |
| Replace the ticket database with an efficient, atomic implementation | [decred/dcrd#349](https://github.com/decred/dcrd/pull/349) |
| Fix a bug indexing addrindex when blocks are invalidated | [decred/dcrd#353](https://github.com/decred/dcrd/pull/353) |
| Synchronize to the merging of btcd PR 666 | [decred/dcrd#358](https://github.com/decred/dcrd/pull/358) |
| Sync to btcd commit '5a1e77bd2dd6f5302a82d3d27b4e3a60526918b1' | [decred/dcrd#359](https://github.com/decred/dcrd/pull/359) |
| Merge in btcd commit 3b39edcaa1e867efc4223d95ca1496aaadf8eca3 | [decred/dcrd#360](https://github.com/decred/dcrd/pull/360) |
| travis: goclean | [decred/dcrd#361](https://github.com/decred/dcrd/pull/361) |
| deps: Update to latest commits. | [decred/dcrd#362](https://github.com/decred/dcrd/pull/362) |
| Merge in btcd commit e15d3008cfd59756db9570da9e47da6831313196 | [decred/dcrd#364](https://github.com/decred/dcrd/pull/364) |
| Merge in btcd commit b87723cd94ea11c29e22c4372ba4fe96886e7c83 | [decred/dcrd#366](https://github.com/decred/dcrd/pull/366) |
| Merge in btcd commit 644570487f379e9856ae4025181ecc6293d86711 | [decred/dcrd#367](https://github.com/decred/dcrd/pull/367) |
| Merge in btcd commit de4fb243899fc988cb3f320bbec9bee95966691b | [decred/dcrd#368](https://github.com/decred/dcrd/pull/368) |
| Merge in btcd commit 27c0f9f8d1af6a44423b03a2e4f03d4a87a1ac40 | [decred/dcrd#369](https://github.com/decred/dcrd/pull/369) |
| Merge in btcd commit e7ddaa468e5a699a9c21136e3d453ce38034b98a | [decred/dcrd#370](https://github.com/decred/dcrd/pull/370) |
| Merge in btcd commit b14032487f67ac140606e7b5f4cd4781243c62c7 | [decred/dcrd#371](https://github.com/decred/dcrd/pull/371) |
| Merge in btcd commit 1b234102147901738bb79b2edf2d803225a36d57 | [decred/dcrd#372](https://github.com/decred/dcrd/pull/372) |
| Merge in btcd commit 0d7f52660096c5a22f2cb95c102e0693f773a593 | [decred/dcrd#373](https://github.com/decred/dcrd/pull/373) |
| Merge in btcd commit f893558d782396f10c2fe49a8bc73deff4a36d14 | [decred/dcrd#374](https://github.com/decred/dcrd/pull/374) |
| Merge in btcd 7f07fb1093dd80105d36d61c8fb8a16f6e9d9b29 | [decred/dcrd#375](https://github.com/decred/dcrd/pull/375) |
| Merge in btcd commit dc83f4ee6a127038dc0238600bdc745d239cf8b1 | [decred/dcrd#376](https://github.com/decred/dcrd/pull/376) |
| Merge in btcd commit f68cd7422dd5d0e0d6002647305c1fd663aee77d | [decred/dcrd#377](https://github.com/decred/dcrd/pull/377) |
| Merge in btcd commit 5de5b7354ca458d6e7677d6b4629214d3f871b59 | [decred/dcrd#379](https://github.com/decred/dcrd/pull/379) |
| Merge in btcd commit 2adfb3b56acd280e84451e94dd0c06203eef9832 | [decred/dcrd#380](https://github.com/decred/dcrd/pull/380) |
| Merge in btcd commit 6229e3583505a82d4514b1efa86f910b78693825 | [decred/dcrd#381](https://github.com/decred/dcrd/pull/381) |
| Remove unused ErrBIP0030 | [decred/dcrd#385](https://github.com/decred/dcrd/pull/385) |
| Bump for v0.5.0 | [decred/dcrd#390](https://github.com/decred/dcrd/pull/390) |
| add more checkpoints for release | [decred/dcrd#396](https://github.com/decred/dcrd/pull/396) |
| Fix a bug for forced reorganizations | [decred/dcrd#392](https://github.com/decred/dcrd/pull/392) |
| blockchain: remove unnecessary check. | [decred/dcrd#400](https://github.com/decred/dcrd/pull/400) |
| Update dcr* deps for 0.5.0 | [decred/dcrd#401](https://github.com/decred/dcrd/pull/401) |
| Fix a bug reloading the blockchain | [decred/dcrd#402](https://github.com/decred/dcrd/pull/402) |
| Version the JSON-RPC API with semantic versioning. | [decred/dcrd#387](https://github.com/decred/dcrd/pull/387) |
| stake: Correct prng uint32 rollover. | [decred/dcrd#403](https://github.com/decred/dcrd/pull/403) |
| Improve the order of the context free tests | [decred/dcrd#404](https://github.com/decred/dcrd/pull/404) |
| Optimize coinbase output tax check. | [decred/dcrd#409](https://github.com/decred/dcrd/pull/409) |

## Notes

The new database will require a full download of the blockchain.  Due
to the speed improvements it will be much quicker than previous
downloads but it is important to be aware that your dcrd will be
unavailable for other operations while this happens.

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/gominer | 8c540b325636b7e225e0a39ffcf99a64ec01c70b |
| decred/dcrticketbuyer | 1c7b048d11fdb7e0791529c4134bf040de765364 |
| decred/Paymetheus | c3cbd3956347c6082200239aaa3ffdc13a0c0409 |
| decred/copay | 9b12e42e22374811d0f602bd54c85f3f203e2f77 |
| decred/decred-windows-installer | fcb29292c838edbfc6d5714a10b1b6d5d1262c0a |
| decred/dcrwallet | 46739e16df88c7145be3a73500b8b2652472c32e |
| decred/dcrd | e4d2295fb2c56a0b6f5c0f99b6d6260581dcbfd6 |

## Known Issues

---

# [v0.4.0](https://github.com/decred/decred-binaries/releases/tag/v0.4.0)

## 2016-09-06

This release contains a variety of bugfixes and improvements to all of
the decred tools (dcrd, dcrwallet, gominer, and Paymetheus).  Desktop
binaries for Copay for OSX and Linux.  Paymetheus is now able to
launch dcrd in the background when it runs.  This is also the first
release built with the version 1.7 of the go compiler.  This produces
smaller and faster binaries than previous versions of go.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v0.4.0/decred_0.4.0-beta_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v0.4.0/decred_0.4.0-beta_x86.msi)
depending on your version of Windows.

To install a the local Copay GUI download and run
[Copay OSX](https://github.com/decred/decred-binaries/releases/download/v0.4.0/decred-copay-darwin-v0.4.0.dmg)
or
[Copay Linux](https://github.com/decred/decred-binaries/releases/download/v0.4.0/decred-copay-linux-v0.4.0.zip).

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See manifest-v0.4.0.txt, manifest-gominer-v0.4.0.txt,
manifest-paymetheus-v0.4.0.txt, and manifest--dcrinstaller-v0.4.0.txt
for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

Changes include:

| Description | Pull Request |
| --- | ---- |
| partial fix for proper invalid share accounting | [decred/gominer#60](https://github.com/decred/gominer/pull/60) |
| add license for OpenCL bindings | [decred/gominer#65](https://github.com/decred/gominer/pull/65) |
| make the autocalibration/device/intensity/worksize flags consistent | [decred/gominer#88](https://github.com/decred/gominer/pull/68) |
| some cleanups to appease go clean/go vet | [decred/gominer#69](https://github.com/decred/gominer/pull/69) |
| fix build on 32-bit platforms and properly error on too small worksizes | [decred/gominer#70](https://github.com/decred/gominer/pull/70) |
| properly account for multiple OpenCL platforms | [decred/gominer#71](https://github.com/decred/gominer/pull/71) |
| Cleanup atomic usage. | [decred/gominer#74](https://github.com/decred/gominer/pull/74) |
| Remove erroneous waitgroup Done in Stop | [decred/gominer#76](https://github.com/decred/gominer/pull/76) |
| Bump for v0.4.0 | [decred/gominer#77](https://github.com/decred/gominer/pull/77) |
| Make seed copyable, Fixes #154 | [decred/Paymetheus#160](https://github.com/decred/Paymetheus/pull/160) |
| Add Launcher project to start dcrd and open PM when finished. | [decred/Paymetheus#163](https://github.com/decred/Paymetheus/pull/163) |
| Remove help link since it links nowhere. | [decred/Paymetheus#164](https://github.com/decred/Paymetheus/pull/164) |
| Bump for v0.4.0 | [decred/Paymetheus#166](https://github.com/decred/Paymetheus/pull/166) |
| Update assembly info for Launcher. | [decred/Paymetheus#167](https://github.com/decred/Paymetheus/pull/167) |
| Fix arches for release builds | [decred/Paymetheus#168](https://github.com/decred/Paymetheus/pull/168) |
| Iconmania | [decred/Paymetheus#169](https://github.com/decred/Paymetheus/pull/169) |
| hack for finding correct paths for both wallet and dcrd. | [decred/Paymetheus#170](https://github.com/decred/Paymetheus/pull/170) |
| Fix typos | [decred/dcrticketbuyer#36](https://github.com/decred/dcrticketbuyer/pull/36) |
| Fix misses first buying opportunity | [decred/dcrticketbuyer#40](https://github.com/decred/dcrticketbuyer/pull/40) |
| make consistent with other dcr tools and repair web UI | [decred/dcrticketbuyer#41](https://github.com/decred/dcrticketbuyer/pull/41) |
| Update glide.yaml | [decred/dcrticketbuyer#43](https://github.com/decred/dcrticketbuyer/pull/43) |
| Add heightCheck to make sure that purchase is run once per height | [decred/dcrticketbuyer#44](https://github.com/decred/dcrticketbuyer/pull/44) |
| Document maxinmempool is the number of your, not all, tickets. | [decred/dcrticketbuyer#45](https://github.com/decred/dcrticketbuyer/pull/45) |
| Fix price mode issues | [decred/dcrticketbuyer#46](https://github.com/decred/dcrticketbuyer/pull/46) |
| Update MaxPerBlock check to match comment above | [decred/dcrticketbuyer#47](https://github.com/decred/dcrticketbuyer/pull/47) |
| Update couldBuy to reflect number of possible tickets left in window | [decred/dcrticketbuyer#48](https://github.com/decred/dcrticketbuyer/pull/48) |
| Load previously used toBuyDiffPeriod from purchased.csv | [decred/dcrticketbuyer#49](https://github.com/decred/dcrticketbuyer/pull/49) |
| Bump for v0.4.0 | [decred/dcrticketbuyer#50](https://github.com/decred/dcrticketbuyer/pull/50) |
| revert config file name change and add back in httpuipath for compat | [decred/dcrticketbuyer#51](https://github.com/decred/dcrticketbuyer/pull/51) |
| dcrd: Do not send a wakeup if not sleeping | [decred/dcrd#314](https://github.com/decred/dcrd/pull/314) |
| travis: Add go 1.7 and drop go 1.5 support. | [decred/dcrd#318](https://github.com/decred/dcrd/pull/318) |
| Add pipes for parent process IPC. | [decred/dcrd#311](https://github.com/decred/dcrd/pull/311) |
| Backport #333 (Use correct r.err in dcrdLog.Errorf msg) | [decred/dcrd#334](https://github.com/decred/dcrd/pull/334) |
| Bump for v0.4.0 | [decred/dcrd#335](https://github.com/decred/dcrd/pull/335) |
| add more checkpoints for upcoming release (#329) | [decred/dcrd#338](https://github.com/decred/dcrd/pull/338) |
| Add address argument to consolidate | [decred/dcrwallet#323](https://github.com/decred/dcrwallet/pull/323) |
| Add golang 1.7 and drop golang 1.5 support. | [decred/dcrwallet#324](https://github.com/decred/dcrwallet/pull/324) |
| RFP-10 Milestone 1 | [decred/dcrwallet#326](https://github.com/decred/dcrwallet/pull/326) |
| wallet: limit the tx size with compressWallet/consolidate. | [decred/dcrwallet#327](https://github.com/decred/dcrwallet/pull/327) |
| Update project dependencies. | [decred/dcrwallet#329](https://github.com/decred/dcrwallet/pull/329) |
| Update dcrd dependency. | [decred/dcrwallet#330](https://github.com/decred/dcrwallet/pull/330) |
| Fixes #146: added RWMutex on addrPools map | [decred/dcrwallet#331](https://github.com/decred/dcrwallet/pull/331) |
| Bump for v0.4.0 | [decred/dcrwallet#332](https://github.com/decred/dcrwallet/pull/332) |
| Update travis to test against golang 1.7 | [decred/dcrutil#14](https://github.com/decred/dcrutil/pull/14) |
| last last second pickups | [decred/decred-windows-installer#10](https://github.com/decred/decred-windows-installer/pull/10) |
| 040 | [decred/decred-windows-installer#11](https://github.com/decred/decred-windows-installer/pull/11) |
| 040 | [decred/decred-windows-installer#12](https://github.com/decred/decred-windows-installer/pull/12) |
| missed checkpoints | [decred/decred-windows-installer#14](https://github.com/decred/decred-windwos-installer/pull/14) |
| Comment out ionspinner and ion infinite scroll due to CPU/mem usage | [decred/copay#27](https://github.com/decred/copay/pull/27) |
| Update package.json and github release api URL | [decred/copay#30](https://github.com/decred/copay/pull/30) |
| Update icon and allow window resizing | [decred/copay#32](https://github.com/decred/copay/pull/32) |

## Notes

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | ef83145805dcbb898a2bcc419f114679cd004f18 |
| decred/dcrwallet | f626fdf123d1d2163cf70df48c9b20bd1d29e7bd |
| decred/dcrticketbuyer | 736f3fbd3c26ada655f37d6d42b307798d345186 |
| decred/paymetheus | fe5f4c771439aed231ba8cfb22ac2cabb2a083cd |
| decred/decred-windows-installer | d6bac0bc7092e0eae6921cabda1af5e93a2b64dd |
| decred/gominer | a2dec145590621b849c66e9445cb7713db99825a |

## Known Issues

---

# [v0.3.0](https://github.com/decred/decred-binaries/releases/tag/v0.3.0)

## 2016-08-15

This release is primarily to add voting/stake views to Paymetheus and
improvements to gominer.  Various bugfixes and improvements have also
been add to all the command line tools.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See manifest-v0.2.0.txt, manifest-gominer-v0.2.0.txt,
manifest-paymetheus-v0.2.0.txt, and manifest--dcrinstaller-v0.2.0.txt
for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

Changes include:

| Description | Pull Request |
| --- | ---- |
| Use glide to manage dependancies. | [decred/gominer#38](https://github.com/decred/gominer/pull/38) |
| Add all options to sample config. | [decred/gominer#39](https://github.com/decred/gominer/pull/39) |
| correct workdata comment | [decred/gominer#40](https://github.com/decred/gominer/pull/40) |
| Reconnect to pool if no usable target is provided. | [decred/gominer#42](https://github.com/decred/gominer/pull/42) |
| Create stratum and work packages. | [decred/gominer#43](https://github.com/decred/gominer/pull/43) |
| Add locks to racy data structures. | [decred/gominer#46](https://github.com/decred/gominer/pull/46) |
| Fix benchmark mode. | [decred/gominer#47](https://github.com/decred/gominer/pull/47) |
| Fix check for userSetWorkSize | [decred/gominer#51](https://github.com/decred/gominer/pull/51) |
| Clean up logging. | [decred/gominer#53](https://github.com/decred/gominer/pull/53) |
| add device selection/restriction | [decred/gominer#54](https://github.com/decred/gominer/pull/54) |
| Reorganize some functions/packages. | [decred/gominer#56](https://github.com/decred/gominer/pull/56) |
| Add import that wasn't seen after last rebase. | [decred/gominer#57](https://github.com/decred/gominer/pull/57) |
| Bump for v0.3.0 | [decred/gominer#58](https://github.com/decred/gominer/pull/58) |
| fix mining when no device is specified | [decred/gominer#59](https://github.com/decred/gominer/pull/59) |
| Make "add account" button nonexecutable when running. | [decred/Paymetheus#125](https://github.com/decred/Paymetheus/pull/125) |
| Point to correct repo for the binary release. | [decred/Paymetheus#134](https://github.com/decred/Paymetheus/pull/134) |
| Better error message for failed dcrd RPC connections. | [decred/Paymetheus#138](https://github.com/decred/Paymetheus/pull/138) |
| Run dcrwallet RPC server on non-standard ports. | [decred/Paymetheus#139](https://github.com/decred/Paymetheus/pull/139) |
| Kill any leftover wallet processes using the nonstandard port. | [decred/Paymetheus#140](https://github.com/decred/Paymetheus/pull/140) |
| Show "published" message directly in create tx view. | [decred/Paymetheus#141](https://github.com/decred/Paymetheus/pull/141) |
| Sync dcrwallet grpc protospec. | [decred/Paymetheus#143](https://github.com/decred/Paymetheus/pull/143) |
| Explain how fees are calculated since this isn't really obvious. | [decred/Paymetheus#144](https://github.com/decred/Paymetheus/pull/144) |
| Hide last generated address when opening request view. | [decred/Paymetheus#145](https://github.com/decred/Paymetheus/pull/145) |
| Protect access to the shared Wallet structure. | [decred/Paymetheus#146](https://github.com/decred/Paymetheus/pull/146) |
| Update to latest gRPC. | [decred/Paymetheus#147](https://github.com/decred/Paymetheus/pull/147) |
| Clean up shell view styles | [decred/Paymetheus#148](https://github.com/decred/Paymetheus/pull/148) |
| Fix the synchronization task to wait on the next tx/block event. | [decred/Paymetheus#149](https://github.com/decred/Paymetheus/pull/149) |
| Add new stake related views | [decred/Paymetheus#151](https://github.com/decred/Paymetheus/pull/151) |
| Bump for v0.3.0 | [decred/Paymetheus#152](https://github.com/decred/Paymetheus/pull/152) |
| Make it explicit that Paymetheus does not vote. | [decred/Paymetheus#153](https://github.com/decred/Paymetheus/pull/153) |
| Display pubkeys of generated addresses. | [decred/Paymetheus#155](https://github.com/decred/Paymetheus/pull/155) |
| Avoid crash after importing a script. | [decred/Paymetheus#156](https://github.com/decred/Paymetheus/pull/156) |
| Bump for v0.3.0 | [decred/dcrticketbuyer#33](https://github.com/decred/dcrticketbuyer/pull/33) |
| docs: Major update to home README | [decred/dcrd#278](https://github.com/decred/dcrd/pull/278) |
| dcrctl: fix reading from stdin in terminal mode | [decred/dcrd#294](https://github.com/decred/dcrd/pull/294) |
| rpcserver: Account for block votes in coin supply | [decred/dcrd#296](https://github.com/decred/dcrd/pull/296) |
| rpcserver: searchrawtx - update coinbase output | [decred/dcrd#299](https://github.com/decred/dcrd/pull/299) |
| blockmanager: current() for testnet should check blockchain timesource. | [decred/dcrd#302](https://github.com/decred/dcrd/pull/302) |
| Remove --addrindex option. | [decred/dcrd#305](https://github.com/decred/dcrd/pull/305) |
| add another mainnet checkpoint, add initial testnet checkpoints | [decred/dcrd#307](https://github.com/decred/dcrd/pull/307) |
| Fix the coin supply calculation | [decred/dcrd#309](https://github.com/decred/dcrd/pull/309) |
| Return from syncMiningStateAfterSync if peer disconnected. | [decred/dcrd#310](https://github.com/decred/dcrd/pull/310) |
| Bump for v0.3.0 | [decred/dcrd#312](https://github.com/decred/dcrd/pull/312) |
| Create appdata directory before writing config. | [decred/dcrd#313](https://github.com/decred/dcrd/pull/313) |
| rpc: Add blockheight to getstakeinfo results | [decred/dcrwallet#282](https://github.com/decred/dcrwallet/pull/282) |
| config: Add txfee and ticketfee to available config settings | [decred/dcrwallet#285](https://github.com/decred/dcrwallet/pull/285) |
| rpc: fixes high reported missed counts when sstrx are first issued | [decred/dcrwallet#287](https://github.com/decred/dcrwallet/pull/287) |
| Fix panic when getting StakeDifficulty if dcrd disconnected | [decred/dcrwallet#302](https://github.com/decred/dcrwallet/pull/302) |
| Add transaction hash to PublishTransactionResponse. | [decred/dcrwallet#304](https://github.com/decred/dcrwallet/pull/304) |
| Switch doco links to point to the Decred repo. | [decred/dcrwallet#306](https://github.com/decred/dcrwallet/pull/306) |
| Update to latest gRPC. | [decred/dcrwallet#308](https://github.com/decred/dcrwallet/pull/308) |
| Recommend the latest glide releases over the dev version. | [decred/dcrwallet#309](https://github.com/decred/dcrwallet/pull/309) |
| Save logs to the specified appdata directory. | [decred/dcrwallet#310](https://github.com/decred/dcrwallet/pull/310) |
| waddrmgr: check extended pubkey network when creating a WoW. | [decred/dcrwallet#312](https://github.com/decred/dcrwallet/pull/312) |
| rpctest - Fix wallet RPC port, and lots of docs and formatting. | [decred/dcrwallet#313](https://github.com/decred/dcrwallet/pull/313) |
| Bump for v0.3.0 | [decred/dcrwallet#316](https://github.com/decred/dcrwallet/pull/316) |
| Add public key address to next address response | [decred/dcrwallet#317](https://github.com/decred/dcrwallet/pull/317) |
| If tx fee increment is unset, it should be the default | [decred/dcrwallet#318](https://github.com/decred/dcrwallet/pull/318) |
| Fix lockup by breaking UTXO notifications | [decred/dcrwallet#319](https://github.com/decred/dcrwallet/pull/319) |

## Notes

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | 145065c87ff614f81e1d221693c0cf601f4423a7 |
| decred/dcrwallet | c2b4227947edaa2233f9bbe292aa2ba41b3e3bd6 |
| decred/dcrticketbuyer | a3d5464aae392f4878094cc720e0dc0443fd6dd6 |
| decred/paymetheus | ebc7a950dacd36c8987aa01c8439b2908f61bc5c |
| decred/decred-windows-installer | 5d0fad99eee1eb3afdd2ba9f1fe54f8a29fb8547 |
| gominer | 093470d6b738a290dff1e32905b1b82b6fd99b32 |

## Known Issues

### Paymetheus

* Spendable balance is incorrect and may even go negative after purchasing tickets. This is only a temporary accounting issue and will resolve itself after the tickets have been mined into a block.

### dcrwallet

* The [WalletService.SpentnessNotifications](https://github.com/decred/dcrwallet/blob/master/rpc/documentation/api.md#spentnessnotifications) gRPC API has been intentionally broken to avoid a deadlock situation. The RPC will appear to be working  but no responses will be streamed to the client.

---

# [v0.2.0](https://github.com/decred/decred-binaries/releases/tag/v0.2.0)

## 2016-07-28

This release contains the initial release of Paymetheus, the Decred
Windows GUI.  To install download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v0.2.0/decred_0.2.0-alpha_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v0.2.0/decred_0.2.0-alpha_x86.msi)
depending on your version of Windows.

To install the command line tools, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

This release contains various fixes and improvements, many of which
are required for the new Windows installer and
[GUI](https://github.com/decred/Paymetheus/).  It also includes the
first release of [gominer](https://github.com/decred/gominer/), the
Decred GPU miner with support for stratum pools.  Updated
[ccminer](https://github.com/decred/ccminer) binaries are also
provided.

See manifest-v0.2.0.txt, manifest-dcrinstall-v0.2.0.txt,
manifest-paymetheus-v0.2.0.txt, manifest-gominer-v0.2.0.txt, and
manifest-ccminer-v0.2.0.txt for sha256sums of the packages and
manifest-v0.2.0.txt.asc, manifest-dcrinstall-v0.2.0.txt.asc,
manifest-paymetheus-v0.2.0.txt.asc, manifest-gominer-v0.2.0.txt.asc,
and manifest-ccminer-v0.2.0.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

Changes include:

| Description | Pull Request |
| --- | ---- |
| Paymetheus Initial Release | [f307753](https://github.com/decred/Paymetheus/commit/f3077531ad3a8751caa2043e6b2f91e6a91c8776) |
| gominer Initial Release | [5b45938](https://github.com/decred/gominer/commit/5b459387914223e0dfe8d5f5cc032fe9e898fd4a) |
| sync with upstream (tpruvot/ccminer/windows) through 20160705 |[decred/ccminer#6](https://github.com/decred/ccminer/pull/6) |
| add a build workaround for arch and bump to 0.2.0 | [decred/ccminer#7](https://github.com/decred/ccminer/pull/7) |
| Quit when the specified configuration is file not found. | [decred/dcrd#273](https://github.com/decred/dcrd/pull/273) |
| Add BlockHeight field to getstakeinfo | [decred/dcrd#274](https://github.com/decred/dcrd/pull/274) |
| dcrctl: Remove help fallthrough so help will get passed to RPC | [decred/dcrd#275](https://github.com/decred/dcrd/pull/275) |
| dcrctl: Clear terminal history | [decred/dcrd#276](https://github.com/decred/dcrd/pull/276) |
| docs: Add/update doc.go in a few spots | [decred/dcrd#277](https://github.com/decred/dcrd/pull/277) |
| Add automatic RPC configuration. | [decred/dcrd#287](https://github.com/decred/dcrd/pull/287) |
| glide man | [decred/dcrd#288](https://github.com/decred/dcrd/pull/288) |
| Attempt to fix the broken paths in config autogen | [decred/dcrd#290](https://github.com/decred/dcrd/pull/290) |
| Bump version to v0.2.0 | [decred/dcrd#292](https://github.com/decred/dcrd/pull/292) |
| Replace chainec.Sign with secp256k1.SignCompact in SignMessge RPC | [decred/dcrwallet#258](https://github.com/decred/dcrwallet/pull/258) |
| Skip zero value outputs when making transactions | [decred/dcrwallet#278](https://github.com/decred/dcrwallet/pull/278) |
| Add back in strErrType for other possible chainClient.Notification types | [decred/dcrwallet#257](https://github.com/decred/dcrwallet/pull/257) |
| Check that nextToUseIdx is > 0, otherwise throw err since account is unused | [decred/dcrwallet#283](https://github.com/decred/dcrwallet/pull/283) |
| Remove unused const for ticket purchasing | [decred/dcrwallet#281](https://github.com/decred/dcrwallet/pull/281) |
| Change n in RangeTransactions to more closely track count param | [decred/dcrwallet#280](https://github.com/decred/dcrwallet/pull/280) |
| Prevent a hang in wallet.Loader.OpenExistingWallet. | [decred/dcrwallet#289](https://github.com/decred/dcrwallet/pull/289) |
| Add Tree to WalletService.FundTransaction RPC. | [decred/dcrwallet#290](https://github.com/decred/dcrwallet/pull/290) |
| Fix an unlikely panic if the bitset returned is empty | [decred/dcrwallet#291](https://github.com/decred/dcrwallet/pull/291) |
| watch-only: Delete created wallet.db if the WoW wasn't created | [decred/dcrwallet#286](https://github.com/decred/dcrwallet/pull/286) |
| Refer to correct version of the gRPC Go plugin. | [decred/dcrwallet#294](https://github.com/decred/dcrwallet/pull/294) |
| Fix balance bug in AccountBalances | [decred/dcrwallet#296](https://github.com/decred/dcrwallet/pull/296) |
| Add new stake-related RPCs to the gRPC interface | [decred/dcrwallet#293](https://github.com/decred/dcrwallet/pull/293) |
| glide: Update glide.lock to use current dcrd master version | [decred/dcrwallet#297](https://github.com/decred/dcrwallet/pull/297) |
| Fix gRPC account address index responses | [decred/dcrwallet#298](https://github.com/decred/dcrwallet/pull/298) |
| Add account notifications to the address pool | [decred/dcrwallet#300](https://github.com/decred/dcrwallet/pull/300) |
| Bump for v0.2.0 | [decred/dcrwallet#301](https://github.com/decred/dcrwallet/pull/301) |
| update description and example for highpricepenalty | [decred/dcrticketbuyer#19](https://github.com/decred/dcrticketbuyer/pull/19) |
| Bump for v0.2.0 | [decred/dcrticketbuyer#29](https://github.com/decred/dcrticketbuyer/pull/29) |

## Notes

As of this release, glide is required when building dcrd from source.
See the README in that repository for more details.

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | 7716a500fd211a8549a886eab4721a860a2c2a35 |
| decred/dcrwallet | a6f2e09b32bce054124b7e4714eaa52d5b450940 |
| decred/dcrticketbuyer | c6802acaabc0afc82a3801b91d885f28870b8b71 |
| decred/paymetheus | f3077531ad3a8751caa2043e6b2f91e6a91c8776 |
| decred/decred-windows-installer | c04134d1ad26ee9041e5defdf169faa7fa33f8c3 |
| gominer | 5b459387914223e0dfe8d5f5cc032fe9e898fd4a |
| ccminer | 340a069488a52941f65ef7a99c02328ceb3bc70e |

---

# [v0.1.6](https://github.com/decred/decred-binaries/releases/tag/v0.1.6)

## 2016-06-21

This release is primarily for compatibility with dcrinstaller.  For
more information and usage instructions, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See manifest-20160607-01.txt for sha256sums of the packages and
manifest-20160607-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| fix memory allignment for 32-bit architectures (#668) | [decred/dcrd#269](https://github.com/decred/dcrd/pull/269) |
| stake: New package for fast access to live tickets. | [decred/dcrd#266](https://github.com/decred/dcrd/pull/266) |
| Don't create .dcrd willy-nilly. | [decred/dcrd#270](https://github.com/decred/dcrd/pull/270) |
| Bump for v0.1.6 | [decred/dcrd#271](https://github.com/decred/dcrd/pull/271) |
| add simnet to config file | [decred/dcrd#272](https://github.com/decred/dcrd/pull/272) |
| Move prompting of passphrases and seed to prompt pkg. | [decred/dcrwallet#268](https://github.com/decred/dcrwallet/pull/268) |
| Import bdb driver from wallet package. | [decred/dcrwllet#269](https://github.com/decred/dcrwallet/pull/269) |
| Bump for v0.1.6 | [decred/dcrwallet#271](https://github.com/decred/dcrwallet/pull/271) |
| Add non-internal prompt package. | [decred/dcrwallet#273](https://github.com/decred/dcrwallet/pull/273) |
| Fix build err for rpcserver_test.go | [decred/dcrwallet#274](https://github.com/decred/dcrwallet/pull/274) |
| Update help docs so dcrctl --wallet help <command> works correclty | [decred/dcrwallet#275](https://github.com/decred/dcrwallet/pull/275) |
| Fix default directory. | [decred/dcrticketbuyer#10](https://github.com/decred/dcrticketbuyer/pull/10) |
| Use the same version code as the rest of dcr* | [decred/dcrticketbuyer#12](https://github.com/decred/dcrticketbuyer/pull/12) |
| .gitignore emacs ~ files | [decred/dcrticketbuyer#13](https://github.com/decred/dcrticketbuyer/pull/13) |
| update ticketbuyer-example.conf | [decred/dcrticketbuyer#14](https://github.com/decred/dcrticketbuyer/pull/14) |
| Update example format and readme | [decred/dcrticketbuyer#15](https://github.com/decred/dcrticketbuyer/pull/15) |

## Notes

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | e6beeb689b5ba725424e1b8a36be5cce80d4b692 |
| decred/dcrwallet | 7bdd976566814310ae3a06c256e3a2c42cac75f5 |
| decred/dcrrpcclient | f3c620d63cb02aec0c1152a72d3c8669b92a2fb5 |
| decred/dcrutil | 4a3bdb1cb08b49811674750998363b8b8ccfd66e |
| decred/dcrticketbuyer | 7c3b826d2db4ff09941718a76be8e42cc382698c |

---

# [v0.1.5](https://github.com/decred/decred-binaries/releases/tag/v0.1.5)

## 2016-06-07

This release contains updated binary files (dcrd, dcrctl, dcrwallet,
and dcrticketbuyer) for various platforms.

See manifest-20160607-01.txt for sha256sums of the packages and
manifest-201600607-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| peer: Unexport the mru inventory map. | [decred/dcrd#220](https://github.com/decred/dcrd/pull/220) |
| mempool/mining: Decouple and optimize priority calcs. | [decred/dcrd#223](https://github.com/decred/dcrd/pull/223) |
| database: Major redesign of database package | [decred/dcrd#91](https://github.com/decred/dcrd/pull/91) |
| mempool/mining: Introduce TxSource interface. | [decred/dcrd#225](https://github.com/decred/dcrd/pull/225) |
| mempool: Introduce mempoolConfig. | [decred/dcrd#226](https://github.com/decred/dcrd/pull/226) |
| mining: Create skeleton package. | [decred/dcrd#227](https://github.com/decred/dcrd/pull/227) |
| peer: Add DisableRelayTx to config. | [decred/dcrd#228](https://github.com/decred/dcrd/pull/228) |
| peer: Rename variable for consistency. | [decred/dcrd#229](https://github.com/decred/dcrd/pull/229) |
| Apply various upstream comment fixes. | [decred/dcrd#230](https://github.com/decred/dcrd/pull/230) |
| Merge upstream copyright date updates. | [decred/dcrd#231](https://github.com/decred/dcrd/pull/231) |
| peer: Simplify PushAddrMsg method loop. | [decred/dcrd#232](https://github.com/decred/dcrd/pull/232) |
| wire: Minor code clean up. | [decred/dcrd#233](https://github.com/decred/dcrd/pull/233) |
| txscript: Fix typo in README | [decred/dcrd#234](https://github.com/decred/dcrd/pull/234) |
| database: Merge through Implement cache layer. | [decred/dcrd#235](https://github.com/decred/dcrd/pull/235) |
| dcrjson/txscript: Merge arm-specific test updates. | [decred/dcrd#236](https://github.com/decred/dcrd/pull/236) |
| rpcserver: Optimize filteraddr code. | [decred/dcrd#237](https://github.com/decred/dcrd/pull/237) |
| Change Vin field AmountIn to display coins not int64 | [decred/dcrd#238](https://github.com/decred/dcrd/pull/238) |
| Fix median of slice of Amounts for ticketfeeinfo. | [decred/dcrd#239](https://github.com/decred/dcrd/pull/239) |
| Use atomic operations instead of mutexes. | [decred/dcrd#240](https://github.com/decred/dcrd/pull/240) |
| wire: Implement sendheaders command | [decred/dcrd#241](https://github.com/decred/dcrd/pull/241) |
| peer: Consolidate several public methods. | [decred/dcrd#242](https://github.com/decred/dcrd/pull/242) |
| server: Make consistent use of svr peer stringer. | [decred/dcrd#243](https://github.com/decred/dcrd/pull/243) |
| txscript: Comment improvements and fixes | [decred/dcrd#244](https://github.com/decred/dcrd/pull/244) |
| Implement banning based on dynamic ban scores | [decred/dcrd#245](https://github.com/decred/dcrd/pull/245) |
| wire: Export (read write)(VarInt VarBytes). | [decred/dcrd#246](https://github.com/decred/dcrd/pull/246) |
| Log block processing time in CHAN with debug on | [decred/dcrd#247](https://github.com/decred/dcrd/pull/247) |
| multi: Fix several misspellings in the comments. | [decred/dcrd#248](https://github.com/decred/dcrd/pull/248) |
| multi: Update with result of gofmt -s. | [decred/dcrd#249](https://github.com/decred/dcrd/pull/249) |
| server: Appropriately name inbound peers map in peerState. | [decred/dcrd#250](https://github.com/decred/dcrd/pull/250) |
| docs: Update READMEs with some current details. | [decred/dcrd#222](https://github.com/decred/dcrd/pull/252) |
| peer: declare QueueMessage()'s doneChan as send only. | [decred/dcrd#253](https://github.com/decred/dcrd/pull/253) |
| peer: Implement sendheaders support (BIP0130). | [decred/dcrd#254](https://github.com/decred/dcrd/pull/254) |
| server: Cleanup and optimize handleBroadcastMsg. | [decred/dcrd#255](https://github.com/decred/dcrd/pull/255) |
| config: New option --blocksonly | [decred/dcrd#256](https://github.com/decred/dcrd/pull/256) |
| Keep track of recently rejected transactions. | [decred/dcrd#257](https://github.com/decred/dcrd/pull/257) |
| mining: Export block template fields. | [decred/dcrd#258](https://github.com/decred/dcrd/pull/258) |
| server: Optimize map limiting in block manager. | [decred/dcrd#259](https://github.com/decred/dcrd/pull/259) |
| chaincfg: Register networks instead of hard coding. | [decred/dcrd#260](https://github.com/decred/dcrd/pull/260) |
| chaincfg: Consolidate tests into the chaincfg pkg. | [decred/dcrd#261](https://github.com/decred/dcrd/pull/261) |
| txscript: Correct comments on alt stack methods. | [decred/dcrd#262](https://github.com/decred/dcrd/pull/262) |
| mempool: Create and use mempoolPolicy. | [decred/dcrd#263](https://github.com/decred/dcrd/pull/263) |
| Asynchronously call TicketPoolValue to stop block manager blocking | [decred/dcrd#265](https://github.com/decred/dcrd/pull/265) |
| Add rescan and scanfrom options to importprivkey and importscript | [decred/dcrd#267](https://github.com/decred/dcrd/pull/267) |
| Bump for v0.1.5 | [decred/dcrd#268](https://github.com/decred/dcrd/pull/268) |
| Fix fee calculation for revocations and rebroastcast on start up | [decred/dcrwallet#254](https://github.com/decred/dcrwallet/pull/254) |
| rpctest behavioral test suite | [decred/dcrwallet#241](https://github.com/decred/dcrwallet/pull/241) |
| Remove unused SendRawTransaction func in StakeStore | [decred/dcrwallet#256](https://github.com/decred/dcrwallet/pull/256) |
| Remove transactions in reverse order when rolling back blocks | [decred/dcrwallet#263](https://github.com/decred/dcrwallet/pull/263) |
| Bump for v0.1.5 | [decred/dcrwallet#265](https://github.com/decred/dcrwallet/pull/265) |
| Add optional resyncing options to importscript and importprivkey | [decred/dcrwallet#264](https://github.com/decred/dcrwallet/pull/264) |
| Add gettickets to the wallet RPC client handlers | [decred/dcrrpcclient#26](https://github.com/decred/dcrrpcclient/pull/26) |
| Add rescan options for importprivkey and importscript | [decred/dcrrpcclient#27](https://github.com/decred/dcrrpcclient/pull/27) |
| Add AmountSorter, which implements the sort.Interface, for Amount. | [decred/dcrutil#12](https://github.com/decred/dcrutil/pull/12) |
| Bind to localhost only by default | [decred/dcrticketbuyer#3](https://github.com/decred/dcrticketbuyer/pull/3) |
| Fix bug where fee from difficulty window was 0 | [decred/dcrticketbuyer#5](https://github.com/decred/dcrticketbuyer/pull/5) |
| Add ability to choose which price average to use | [decred/dcrticketbuyer#6](https://github.com/decred/dcrticketbuyer/pull/6) |
| Warn the user on start up | [decred/dcrticketbuyer#7](https://github.com/decred/dcrticketbuyer/pull/7) |
| Update glide and fix unlikely simnet panic | [decred/dcrticketbuyer#8](https://github.com/decred/dcrticketbuyer/pull/8) |

## Notes

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | b86959378985f538288c5a8d5184244d4692e0e6 |
| decred/dcrwallet | 3942d8b165842285a24973bc2e42708a65ff66ff |
| decred/dcrrpcclient | f3c620d63cb02aec0c1152a72d3c8669b92a2fb5 |
| decred/dcrutil | 4a3bdb1cb08b49811674750998363b8b8ccfd66e |
| decred/dcrticketbuyer | 65641c4458624f5a9c76116b791d48e68fe98897 |

---

# [v0.1.4](https://github.com/decred/decred-binaries/releases/tag/v0.1.4)

## 2016-05-26

This release contains updated binary files (dcrd, dcrctl, dcrwallet,
and dcrticketbuyer) for various platforms.

See manifest-20160526-01.txt for sha256sums of the packages and
manifest-201600526-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| Sync upstream through July 1, 2015 | [decred/dcrd#163](https://github.com/decred/dcrd/pull/163) |
| Sync upstream through July 22, 2015  | [decred/dcrd#164](https://github.com/decred/dcrd/pull/164) |
| Sync upstream through August 9, 2015 | [decred/dcrd#166](https://github.com/decred/dcrd/pull/166) |
| Reject very old votes from the memory pool | [decred/dcrd#168](https://github.com/decred/dcrd/pull/168) |
| Adjust getblockheader result for Decred | [decred/dcrd#170](https://github.com/decred/dcrd/pull/170) |
| Check for hidden votes by ticket hash, not vote hash | [decred/dcrd#169](https://github.com/decred/dcrd/pull/169) |
| Sync upstream through Aug 23, 2015 | [decred/dcrd#172](https://github.com/decred/dcrd/pull/172) |
| Waste less memory if sighash optimizations are on | [decred/dcrd#171](https://github.com/decred/dcrd/pull/171) |
| Sync upstream through Sep 2, 2015. | [decred/dcrd#174](https://github.com/decred/dcrd/pull/174) |
| Sync upstream through Sep 17, 2015. | [decred/dcrd#175](https://github.com/decred/dcrd/pull/175) |
| Sync upstream through Sep 24, 2015. | [decred/dcrd#177](https://github.com/decred/dcrd/pull/177) |
| Remove legacy Bitcoin addr encoding bug | [decred/dcrd#179](https://github.com/decred/dcrd/pull/179) |
| Sync upstream through Sep 28, 2015. | [decred/dcrd#178](https://github.com/decred/dcrd/pull/178) |
| wire: Use ordered Service Flags. | [decred/dcrd#182](https://github.com/decred/dcrd/pull/182) |
| rpcserver: Optimize JSON raw tx input list create. | [decred/dcrd#180](https://github.com/decred/dcrd/pull/180) |
| txscript: Sync upstream makeScriptNum tests. | [decred/dcrd#181](https://github.com/decred/dcrd/pull/181) |
| Fix VinPrevOut fields for Decred | [decred/dcrd#183](https://github.com/decred/dcrd/pull/183) |
| Add reverse order option to searchrawtransactions rpc | [decred/dcrd#185](https://github.com/decred/dcrd/pull/185) |
| main: Limit garbage collection percentage. (#686) | [decred/dcrd#187](https://github.com/decred/dcrd/pull/187) |
| Integrate a valid ECDSA signature cache. | [decred/dcrd#189](https://github.com/decred/dcrd/pull/189) |
| Add a checkpoint for block 24480 | [decred/dcrd#190](https://github.com/decred/dcrd/pull/190) |
| dcrjson: Add errors to InfoChainResult | [decred/dcrd#191](https://github.com/decred/dcrd/pull/191) |
| Use same fee policies across all networks. | [decred/dcrd#160](https://github.com/decred/dcrd/pull/160) |
| rpcserver: Correct verifymessage hash generation. | [decred/dcrd#192](https://github.com/decred/dcrd/pull/192) |
| Correct a few style related issues found by golint. | [decred/dcrd#193](https://github.com/decred/dcrd/pull/193) |
| config: New option --minrelaytxfee | [decred/dcrd#194](https://github.com/decred/dcrd/pull/194) |
| Fix magic peer initial protocol value | [decred/dcrd#195](https://github.com/decred/dcrd/pull/195) |
| peer: Refactor peer code into its own package. | [decred/dcrd#197](https://github.com/decred/dcrd/pull/197) |
| docs: Make various README.md files consistent. | [decred/dcrd#201](https://github.com/decred/dcrd/pull/201) |
| peer: Sync upstream fixes and improvements. | [decred/dcrd#202](https://github.com/decred/dcrd/pull/202) |
| Use the correct heap sorting function | [decred/dcrd#199](https://github.com/decred/dcrd/pull/199) |
| Move non-mempool specific functions to new file. | [decred/dcrd#203](https://github.com/decred/dcrd/pull/203) |
| dcrjson: Add optional locktime to createrawtransaction | [decred/dcrd#204](https://github.com/decred/dcrd/pull/204) |
| Sync upstream blockmanager comments improvements. | [decred/dcrd#205](https://github.com/decred/dcrd/pull/205) |
| Sync upstream comment and error improvements. | [decred/dcrd#152](https://github.com/decred/dcrd/pull/206) |
| chaincfg: Move DNS Seeds to chaincfg. | [decred/dcrd#209](https://github.com/decred/dcrd/pull/209) |
| peer: Fix failing test case due to wrong TimeOffset | [decred/dcrd#210](https://github.com/decred/dcrd/pull/210) |
| peer/server: various fixes from upstream | [decred/dcrd#211](https://github.com/decred/dcrd/pull/211) |
| mempool/peer: Sync upstream comment updates. | [decred/dcrd#212](https://github.com/decred/dcrd/pull/212) |
| mempool: Move checkTransactionStandard to policy. | [decred/dcrd#214](https://github.com/decred/dcrd/pull/214) |
| dcrd: do not process empty getdata messages | [decred/dcrd#215](https://github.com/decred/dcrd/pull/215) |
| Bump for v0.1.4 | [decred/dcrd#221](https://github.com/decred/dcrd/pull/221) |
| rpcserver: Add filteraddrs param to srt API. | [decred/dcrd#216](https://github.com/decred/dcrd/pull/216) |
| peer: Combine stats struct into peer struct. | [decred/dcrd#217](https://github.com/decred/dcrd/pull/217) |
| Fix dropaddrindex flag usage message | [decred/dcrd#218](https://github.com/decred/dcrd/pull/218) |
| mining: Refactor policy into its own struct. | [decred/dcrd#219](https://github.com/decred/dcrd/pull/219) |
| peer: fix panic due to err in handleVersionMsg | [decred/dcrd#222](https://github.com/decred/dcrd/pull/222) |
| Use the block timestamp on block insertion, not local | [decred/dcrwallet#240](https://github.com/decred/dcrwallet/pull/240) |
| fix spelling in comment | [decred/dcrwallet#243](https://github.com/decred/dcrwallet/pull/243) |
| Disable ticket purchase by default | [decred/dcrwallet#244](https://github.com/decred/dcrwallet/pull/244) |
| Enable stakepool for mainnet | [decred/dcrwallet#245](https://github.com/decred/dcrwallet/pull/245) |
| Change "Notifying unmined tx .." to Tracef instead of Errorf | [decred/dcrwallet#246](https://github.com/decred/dcrwallet/pull/246) |
| Enable vendor experiment earlier in travis script. | [decred/dcrwallet#247](https://github.com/decred/dcrwallet/pull/247) |
| Add offline wallet guide and movefunds utility | [decred/dcrwallet#252](https://github.com/decred/dcrwallet/pull/252) |
| Bump for v0.1.4 | [decred/dcrwallet#253](https://github.com/decred/dcrwallet/pull/253) |
| Update SearchRawTransaction calls for latest API. | [decred/dcrrpcclient#22](https://github.com/decred/dcrrpcclient/pull/22) |
| Sync upstream through Aug. 23, 2015  | [decred/dcrrpcclient#20](https://github.com/decred/dcrrpcclient/pull/20) |
| Review and fix. Mostly typos. | [decred/dcrrpcclient#21](https://github.com/decred/dcrrpcclient/pull/21) |
| Fix ticket fee info command handling | [decred/dcrrpcclient#23](https://github.com/decred/dcrrpcclient/pull/23) |
| Add optional locktime parameter to CreateRawTransaction APIs. | [decred/dcrrpcclient#24](https://github.com/decred/dcrrpcclient/pull/24) |
| Add filteraddrs param to searchrawtransactions. | [decred/dcrrpcclient#25](https://github.com/decred/dcrrpcclient/pull/25) |
| Sync upstream through July 28, 2015 | [decred/dcrutil#10](https://github.com/decred/dcrutil/pull/10) |
| Update docs for NewAmount. | [decred/dcrutil#11](https://github.com/decred/dcrutil/pull/11) |
| Add HTTP server user interface | [decred/dcrticketbuyer#1](https://github.com/decred/dcrticketbuyer/pull/1) |

## Notes

This release contains the initial version of
[dcrticketbuyer](https://github.com/decred/dcrticketbuyer).    Please
follow the link to get more information about how to run our automated
ticket buying software.

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | 708b4007ac598e2f19fa15658b9450edd9a5f052 |
| decred/dcrwallet | c9476fab7067814497aac9692a4a8a4c98305ae8 |
| decred/dcrrpcclient | 231790f525623f78acc9a91bfd3845d52715aee5 |
| decred/dcrutil | 85fac3a15425f15408f1dcec28bfd4b18ea2f882 |
| decred/dcrticketbuyer | 471c747f656e30e951463bbca3bafbf5ecfd572f |

---

# [v0.1.3](https://github.com/decred/decred-binaries/releases/tag/v0.1.3)

## 2016-05-10

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160510-01.txt for sha256sums of the packages and
manifest-201600510-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| mempool: reduce lock contention | [decred/dcrd#152](https://github.com/decred/dcrd/pull/152) |
| Reject too low stake difficulty transactions and cache difficulty | [decred/dcrd#154](https://github.com/decred/dcrd/pull/154) |
| mempool: Synchronize btcd commits fixing orphan hang | [decred/dcrd#155](https://github.com/decred/dcrd/pull/155) |
| dcrd: handle signal SIGTERM (#688) | [decred/dcrd#156](https://github.com/decred/dcrd/pull/156) |
| Fix resyncing the ticket database after unexpected shutdown | [decred/dcrd#157](https://github.com/decred/dcrd/pull/157) |
| Add transaction type to listtransactions result | [decred/dcrd#158](https://github.com/decred/dcrd/pull/158) |
| Fix createrawssrtx command and logic | [decred/dcrd#159](https://github.com/decred/dcrd/pull/159) |
| Bump for v0.1.3 | [decred/dcrd#162](https://github.com/decred/dcrd/pull/162) |
| Remove btcd/wire dependency. | [decred/dcrwallet#229](https://github.com/decred/dcrwallet/pull/229) |
| Sync with upstream | [decred/dcrwallet#227](https://github.com/decred/dcrwallet/pull/227) |
| Fix glide.yaml hash in glide.lock. | [decred/dcrwallet#234](https://github.com/decred/dcrwallet/pull/234) |
| Add transaction type to listtransactions result | [decred/dcrwallet#231](https://github.com/decred/dcrwallet/pull/231) |
| Update glide repos | [decred/dcrwallet#6b2fbf8](https://github.com/decred/dcrwallet/commit/6b2fbf80a33fc52f20231fdd6e462419c2a27ff6) |
| Call the more reliable GetStakeDifficulty for ticket prices | [decred/dcrwallet#232](https://github.com/decred/dcrwallet/pull/232) |
| Fix bugs relating to reorganizations | [decred/dcrwallet#236](https://github.com/decred/dcrwallet/pull/236) |
| Update glide locks | [decred/dcrwallet#239](https://github.com/decred/dcrwallet/pull/239) |
| Bump for v0.1.3 | [decred/dcrwallet#238](https://github.com/decred/dcrwallet/pull/238) |
| Update for new createrawssrtx option | [decred/dcrrpcclient#17](https://github.com/decred/dcrrpcclient/pull/17) |
| Correct the return type for estimatestakediff | [decred/dcrrpcclient#18](https://github.com/decred/dcrrpcclient/pull/18) |
| Fix functionality of purchaseticket API | [decred/dcrrpcclient#19](https://github.com/decred/dcrrpcclient/pull/19) |

## Notes

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | 2aec09354a7263a31f6b5d3fe5906bc534613058 |
| decred/dcrwallet | 4215ccccceee037a7835721ca59a8c6327556f62 |
| decred/dcrrpcclient | e625cc131dc06129f56e0d472061c3e378ada396 |
| decred/dcrutil | 74563ea520b1215b9c10f96507b7a9984894c0b5 |

---

# [v0.1.2](https://github.com/decred/decred-binaries/releases/tag/v0.1.2)

## 2016-05-03

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160503-01.txt for sha256sums of the packages and
manifest-201600503-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| Fix mempool fees variables | [decred/dcrd#141](https://github.com/decred/dcrd/pull/141) |
| Add GetStakeDifficultyResult to dcrjson so getstakedifficulty command can return more | [decred/dcrd#137](https://github.com/decred/dcrd/pull/137) |
| Remove magic number and add const maxRelayFeeMultiplier | [decred/dcrd#139](https://github.com/decred/dcrd/pull/139) |
| Add estimatestakediff RPC command | [decred/dcrd#143](https://github.com/decred/dcrd/pull/143) |
| Add ticketvwap and txfeeinfo RPC server commands | [decred/dcrd#145](https://github.com/decred/dcrd/pull/145) |
| fix sample config per issue 116 | [decred/dcrd#147](https://github.com/decred/dcrd/pull/147) |
| Add stakepooluserinfo and addticket RPC handling | [decred/dcrd#144](https://github.com/decred/dcrd/pull/144) |
| Cherry pick btcd commit that moves some functions to policy.go | [decred/dcrd#140](https://github.com/decred/dcrd/pull/140) |
| Add the constructor for AddTicketCmd | [decred/dcrd#148](https://github.com/decred/dcrd/pull/148) |
| Bump for v0.1.2 | [decred/dcrd#150](https://github.com/decred/dcrd/pull/150) |
| Fix lockup relating to channel blocking | [decred/dcrwallet#219](https://github.com/decred/dcrwallet/pull/219) |
| Add stake pool mode to the wallet | [decred/dcrwallet#192](https://github.com/decred/dcrwallet/pull/192) |
| Make purchaseticket return the correct error | [decred/dcrwallet#224](https://github.com/decred/dcrwallet/pull/224) |
| Add wallet flag for allowhighfees | [decred/dcrwallet#214](https://github.com/decred/dcrwallet/pull/214) |
| Bump for v0.1.2 | [decred/dcrwallet#225](https://github.com/decred/dcrwallet/pull/225) |
| Add RPC client pass throughs for new daemon and wallet commands | [decred/dcrrpcclient#16](https://github.com/decred/dcrrpcclient/pull/16) |

## Notes

### Added stake pool fee functionality:

We have added new config flags for dcrwallet.  Let's go over each
option to make crystal clear its usage:

#### stakepoolcoldextkey

When this option is set it turns on stake pool functionality for
wallet.  When stake pool is enabled for wallet, there are a series of
transaction checks to verify whether this wallet will vote for a
ticket that has used this stake pool's address as the ticketaddress.

This option requires the extended public key of the stake pool's cold
wallet that will receive the pool's fees.  So on simnet for instance
this option looks like this:

```
--stakepoolcoldextkey=spubVWAdividNTiSM9SdLRA5JX6LYNwt58cd51TFnpnULGQ8oqNMNskfkQwU7rjWMCY7phBguVr4XTmAWyDVRKpo2dFyjFb6QG4ihB8w64UPNuu:1000
```

The first portion (spub..., or dpub... on mainnet) is the extended
public key and the second (1000) is the number of addresses to
derive. Every user of the pool gets their own cold fee wallet address
derived, so we recommend using at least 1000 in anticipation of the
relative number of users in the stake pool.

When a vote is created by the stake pool to vote on a ticket that has
been given voting rights, it pays the pool fee to the address derived
for the cold wallet from this extended public key.

#### pooladdress

This is for use by the stake pool user.  It will be an address
provided to the user by the stake pool.  If set, this address is used
during ticket purchase and will commit to a small output in the ticket
that gives the stake pool its required fees.


#### ticketaddress

Same as the old option. This is the address that the stake pool user
is giving the ticket's voting rights to.


#### poolfees

This is the required ticket fee as requested by the stake pool.  The
value set by the user needs to be greater than or equal to that of the
pool.  The fee is a percentage based fee, based on the stake subsidy.
Here is a concrete example from simnet:

The ticket price of this ticket was 46.0551008, and the ticket relay
fees were 0.00000100 per kB. The pool fees were set to 1.00%.  The
subsidy on simnet at this block height is approximately 29.40888 Coins
per vote.  This is the ticket as purchased by the user:

```javascript
"vin": [
	... ,
],
"vout": [
	{
		"value": 46.0551008,
		"n": 0,
		"version": 0,
		"scriptPubKey": {
			... ,
			"reqSigs": 1,
			"type": "stakesubmission",
			"addresses": [
				"SsYZMHeeixdNRTkk6afzHBPL4unYDsFNd4r"
			]
		}
	},
	{
		"value": 0,
		"n": 1,
		"version": 0,
		"scriptPubKey": {
			... ,
			"type": "sstxcommitment",
			"addresses": [
				"Ssghjx8PvQVV3FM3w5FcGi9kWGvDpDkQDTV"
			],
			"commitamt": 0.17948021
		}
	},
	{
		... ,
	},
	{
		"value": 0,
		"n": 3,
		"version": 0,
		"scriptPubKey": {
			... ,
			"type": "sstxcommitment",
			"addresses": [
				"SsYUi5tbXfqHnTPgvHcajNW4yiGeSP6n7Xq"
			],
			"commitamt": 45.87562609
		}
	},
	{
		... ,
	}
],
```

And here's the vote that the stake pool created for that user's
ticket:

```javascript
"vin": [
	{
		... ,
	},
	{
		... ,
	}
],
"vout": [
	{
		... ,
	},
	{
		... ,
	},
	{
	"value": 0.2940888,
	"n": 2,
	"version": 0,
		"scriptPubKey": {
			... ,
			"type": "stakegen",
			"addresses": [
				"Ssghjx8PvQVV3FM3w5FcGi9kWGvDpDkQDTV"
			]
		}
	},
	{
		"value": 75.16989347,
		"n": 3,
		"version": 0,
		"scriptPubKey": {
			... ,
			"type": "stakegen",
			"addresses": [
				"SsYUi5tbXfqHnTPgvHcajNW4yiGeSP6n7Xq"
			]
		}
	}
]
```

As you can see '"n": 2,', the third output, is the stake pool fee
of 0.2940888.  This is 1% of the vote reward at that point
(0.2940888/29.40888). The remaining subsidy and the original coins are
returned to the take pool user in output '"n": 3,'. For more
information about stake fees, please refer to
dcrwallet/wallet/txrules/doc.go.

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | f93cb9fd9fd7b471481e4cfb122186514f84e879 |
| decred/dcrwallet | e545bec0a3a1a3b8380224d12c9ede85bff58595 |
| decred/dcrrpcclient | a5a51f5ca4f0038e475239cfe3c635a21fd28111 |
| decred/dcrutil | 74563ea520b1215b9c10f96507b7a9984894c0b5 |
| google.golang.org/grpc | b062a3c003c22bfef58fa99d689e6a892b408f9d |

---

# [v0.1.1](https://github.com/decred/decred-binaries/releases/tag/v0.1.1)

## 2016-04-25

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160425-01.txt for sha256sums of the packages and
manifest-201600425-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| Catch missed error check | [decred/dcrd#127](https://github.com/decred/dcrd/pull/127) |
| fix typo | [decred/dcrd#128](https://github.com/decred/dcrd/pull/128) |
| Replace float64 and use int64 for feePerKB calculcation | [decred/dcrd#125](https://github.com/decred/dcrd/pull/125) |
| Use AllowHighFees in SendRawTransaction cmd to actually check tx fees | [decred/dcrd#124](https://github.com/decred/dcrd/pull/124) |
| Add ticketfeeinfo command | [decred/dcrd#132](https://github.com/decred/dcrd/pull/132) |
| Bump for v0.1.1 | [decred/dcrd#136](https://github.com/decred/dcrd/pull/136) |
| Regenerate walletrpc package. | [decred/dcrwallet#189](https://github.com/decred/dcrwallet/pull/189) |
| Isolate address pool to prevent excessive address creation | [decred/dcrwallet#191](https://github.com/decred/dcrwallet/pull/191) |
| Reinsert scan length variable | [decred/dcrwallet#196](https://github.com/decred/dcrwallet/pull/196) |
| Do not include zero value change outputs. | [decred/dcrwallet#193](https://github.com/decred/dcrwallet/pull/193) |
| Update help comments to show fee per kb instead of increment | [decred/dcrwallet#195](https://github.com/decred/dcrwallet/pull/195) |
| Add TicketFeeIncrementTestnet | [decred/dcrwallet#194](https://github.com/decred/dcrwallet/pull/194) |
| Allow passing an empty string for purchaseticket addresses | [decred/dcrwallet#198](https://github.com/decred/dcrwallet/pull/198) |
| Add ability to change autopurchase frequency | [decred/dcrwallet#201](https://github.com/decred/dcrwallet/pull/201) |
| Open and return wallet from CreateNewWallet. | [decred/dcrwallet#203](https://github.com/decred/dcrwallet/pull/203) |
| Avoid stdin passphrase prompt with --noinitialload. | [decred/dcrwallet#202](https://github.com/decred/dcrwallet/pull/202) |
| Regenerate JSON-RPC help descriptions. | [decred/dcrwallet#208](https://github.com/decred/dcrwallet/pull/208) |
| Bump for v0.1.1 | [decred/dcrwallet#209](https://github.com/decred/dcrwallet/pull/209) |
| use decred mainnet ports in examples | [decred/dcrrpcclient#15](https://github.com/decred/dcrrpcclient/pull/15) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | 4f8ad739a231a6ecf58ae899c595fba446ffe631 |
| decred/dcrwallet | c5e47fba1608854b0c43c367b14ced6df91a6d9e |
| decred/dcrrpcclient | c69fe513f9d6beeef0cad10412e3aa804ba3fe28 |
| decred/dcrutil | 74563ea520b1215b9c10f96507b7a9984894c0b5 |
| google.golang.org/grpc | 262ed2bd6d1c8cbaa14b43c3815d2e01e4f65ca8 |

---

# [v0.1.0](https://github.com/decred/decred-binaries/releases/tag/v0.1.0)

## 2016-04-18

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160418-01.txt for sha256sums of the packages and
manifest-201600418-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| Fix the constructors for new RPC account commands | [decred/dcrd#106](https://github.com/decred/dcrd/pull/106) |
| TravisCI: Remove external go vet reference. (#655)  | [decred/dcrd#107](https://github.com/decred/dcrd/pull/107) |
| Clean up and fix fallthrough on invalid tx types for getrawmempool rpc request | [decred/dcrd#11](https://github.com/decred/dcrd/pull/111) |
| Pull in policy.go changes from btcd to fix issues with fee calc in dcrd | [decred/dcrd#112](https://github.com/decred/dcrd/pull/112) |
| Updated config to allow the ability to change the home directory | [decred/dcrd#109](https://github.com/decred/dcrd/pull/109) |
| Fix the mining transaction selection algorithm | [decred/dcrd#113](https://github.com/decred/dcrd/pull/113) |
| Fix rpclisten and listen port references in documentation | [decred/dcrd#118](https://github.com/decred/dcrd/pull/118) |
| Properly handle attempting reorganization to an eligible block | [decred/dcrd#117](https://github.com/decred/dcrd/pull/117) |
| Display ticket commitments in getrawtransaction | [decred/dcrd#119](https://github.com/decred/dcrd/pull/119) |
| Check to see if missingParents != nil which means isOrphan | [decred/dcrd#122](https://github.com/decred/dcrd/pull/122) |
| Modify the purchaseticket RPC command | [decred/dcrd#121](https://github.com/decred/dcrd/pull/121) |
| Bump for v0.1.0 | [decred/dcrd#123](https://github.com/decred/dcrd/pull/123) |
| Update TravisCI configs. (#409) | [decred/dcrwallet#168](https://github.com/decred/dcrwallet/pull/168) |
| Fix a bug causes wallet lockup when making transactions | [decred/dcrwallet#167](https://github.com/decred/dcrwallet/pull/167) |
| Add sweepaccount tool.  | [decred/dcrwallet#173](https://github.com/decred/dcrwallet/pull/173) |
| Add .ToCoin() to GetWalletFee return val to be consistent | [decred/dcrwallet#172](https://github.com/decred/dcrwallet/pull/172) |
| Fix bug in syncing to address index | [decred/dcrwallet#176](https://github.com/decred/dcrwallet/pull/176) |
| fix off by one when initializing a wallet | [decred/dcrwallet#177](https://github.com/decred/dcrwallet/pull/177) |
| Clean UX so it is more clear that a pass is required | [decred/dcrwallet#180](https://github.com/decred/dcrwallet/pull/180) |
| Change default relay fees | [decred/dcrwallet#182](https://github.com/decred/dcrwallet/pull/182) |
| Ticket purchasing code overhaul | [decred/dcrwallet#183](https://github.com/decred/dcrwallet/pull/183) |
| Refactor address index syncing code | [decred/dcrwallet#184](https://github.com/decred/dcrwallet/pull/184) |
| Bump for v0.1.0 | [decred/dcrwallet#185](https://github.com/decred/dcrwallet/pull/185) |
| TravisCI: Update to latest configurations. (#76) | [decred/dcrrpcclient#13](https://github.com/decred/dcrrpcclient/pull/13) |
| Add client handling for new RPC calls | [decred/dcrrpcclient#12](https://github.com/decred/dcrrpcclient/pull/12) |
| Fix the purchaseticket caller | [decred/dcrrpcclient#14](https://github.com/decred/dcrrpcclient/pull/14) |
| TravisCI: Remove external go vet reference. (#74) | [decred/dcrutil#9](https://github.com/decred/dcrutil/pull/9) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | a33985293b19aab047f95d1f68d07d9625811d6d |
| decred/dcrwallet | b192834577b44602f8960bca3dcf9d35af32acb7 |
| decred/dcrrpcclient | f005c4a9466229520d7198ce1904065248f6cdd3 |
| decred/dcrutil | 74563ea520b1215b9c10f96507b7a9984894c0b5 |
| google.golang.org/grpc | 326d66361a4e305b03da4497d2c52d470f7fb584 |

---

# [v0.0.10](https://github.com/decred/decred-binaries/releases/tag/v0.0.10)

## 2016-04-06

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160406-01.txt for sha256sums of the packages and
manifest-201600406-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| Introduce a new utility to show dev premine taint. | [decred/dcrd#100](https://github.com/decred/dcrd/pull/100) |
| Bump for v0.0.10 | [decred/dcrd#101](https://github.com/decred/dcrd/pull/101) |
| Add new JSON handling for RPC commands and livetickets command | [decred/dcrd#102](https://github.com/decred/dcrd/pull/102) |
| Add stake txscript types in ListUnspent to be spendable | [decred/dcrwallet#151](https://github.com/decred/dcrwallet/pull/151) |
| Make dcrwallet pass all goclean.sh tests. | [decred/dcrwallet#155](https://github.com/decred/dcrwallet/pull/155) |
| Change initilialize to use proper index (extIdx) | [decred/dcrwallet#158](https://github.com/decred/dcrwallet/pull/158) |
| Bump for v0.0.10 | [decred/dcrwallet#159](https://github.com/decred/dcrwallet/pull/159) |
| Fix address pool syncing and add new RPC commands for the address pools | [decred/dcrwallet#161](https://github.com/decred/dcrwallet/pull/161) |
| Rollback namespace transactions when bucket is not found. | [decred/dcrwallet#163](https://github.com/decred/dcrwallet/pull/163) |
| Fix watching only wallets | [decred/dcrwallet#164](https://github.com/decred/dcrwallet/pull/164) |
| Fix case on comments | [decred/dcrwallet#165](https://github.com/decred/dcrwallet/pull/165) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | 5658c503c3ad9e8b6e7eaec5183f9fe4a2e32241 |
| decred/dcrwallet | f1d9bd630188da91f7e817c49830c29d365c615d |
| decred/dcrrpcclient | b3f48780a0d68e24ef6e915e930a1c1e58b69810 |
| decred/dcrutil | 9bb7f64962cee52bb46ce588aa91ef0e6e7bb1a9 |

---

# [v0.0.9](https://github.com/decred/decred-binaries/releases/tag/v0.0.9)

## 2016-04-01

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160401-01.txt for sha256sums of the packages and
manifest-201600401-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| txscript: New function IsUnspendable | [decred/dcrd#96](https://github.com/decred/dcrd/pull/96) |
| Get travis-ci to work again. | [decred/dcrd#97](https://github.com/decred/dcrd/pull/97) |
| peer: Remove extraneous hasTimestamp check. | [decred/dcrd#98](https://github.com/decred/dcrd/pull/98) |
| Bump to v0.0.9 for release. | [decred/dcrd#99](https://github.com/decred/dcrd/pull/99) |
| Print version string at startup. | [decred/dcrwallet#126](https://github.com/decred/dcrwallet/pull/126) |
| Sync with upstream | [decred/dcrwallet#127](https://github.com/decred/dcrwallet/pull/127) |
| Use wtxmgr for input selection. | [decred/dcrwallet#130](https://github.com/decred/dcrwallet/pull/130) |
| Fix updating the UTXO set for imported addresses | [decred/dcrwallet#133](https://github.com/decred/dcrwallet/pull/133) |
| Help prevent errors during initial sync by waiting for it to finish | [decred/dcrwallet#136](https://github.com/decred/dcrwallet/pull/136) |
| Remove voting pool package. | [decred/dcrwallet#135](https://github.com/decred/dcrwallet/pull/135) |
| Fix proportionmissed calc --> missed / missed + voted | [decred/dcrwallet#138](https://github.com/decred/dcrwallet/pull/138) |
| Refactor address pool code and automatically resync accounts from seed | [decred/dcrwallet#134](https://github.com/decred/dcrwallet/pull/134) |
| fix waddrmgr tests | [decred/dcrwallet#139](https://github.com/decred/dcrwallet/pull/139) |
| Modify the logic for password prompting | [decred/dcrwallet#142](https://github.com/decred/dcrwallet/pull/142) |
| Fix address pool panics on start up | [decred/dcrwallet#143](https://github.com/decred/dcrwallet/pull/143) |
| Add goclean.sh script from btcd. | [decred/dcrwallet#144](https://github.com/decred/dcrwallet/pull/144) |
| Bump to v0.0.9 for release. | [decred/dcrwallet#150](https://github.com/decred/dcrwallet/pull/150) |
| Update to all dcrutil tests so they successfully pass. | [decred/dcrutil#4](https://github.com/decred/dcrutil/pull/4) |
| Fix filter_test TestFilterInsertP2PubKeyOnly with correct info | [decred/dcrutil#6](https://github.com/decred/dcrutil/pull/6) |
| Fix a test output for go1.6. | [decred/dcrutil#8](https://github.com/decred/dcrutil/pull/8) |
| Enable travis-ci. | [decred/dcrutil#7](https://github.com/decred/dcrutil/pull/7) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | 0ed0e815b0cd59d48380d125d47ff0de833ec43c |
| decred/dcrwallet | 4387fa379d01d125db7c9e6fcada51f8316cb0f6 |
| decred/dcrrpcclient | b3f48780a0d68e24ef6e915e930a1c1e58b69810 |
| decred/dcrutil | 9bb7f64962cee52bb46ce588aa91ef0e6e7bb1a9 |

---

# [v0.0.8](https://github.com/decred/decred-binaries/releases/tag/v0.0.8)

## 2016-03-18

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160318-01.txt for sha256sums of the packages and
manifest-20160318-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| Update configuring_tor.md | [decred/dcrd#88](https://github.com/decred/dcrd/pull/88) |
| Add and implement the getticketpoolvalue JSON RPC command | [decred/dcrd#90](https://github.com/decred/dcrd/pull/90) |
| Add lookup of ticket commitments to addrindex | [decred/dcrd#92](https://github.com/decred/dcrd/pull/92) |
| Fix minor goclean issues. | [decred/dcrd#94](https://github.com/decred/dcrd/pull/94) |
| Add balancetomaintain rpc json parts | [decred/dcrd#93](https://github.com/decred/dcrd/pull/93) |
| Bump for 0.0.8 | [decred/dcrd#95](https://github.com/decred/dcrd/pull/95) |
| Fix a bug relating to relevantTx handling and uncaught error | [decred/dcrwallet#103](https://github.com/decred/dcrwallet/pull/103) |
| Overhaul accounts to function correctly | [decred/dcrwallet#104](https://github.com/decred/dcrwallet/pull/104) |
| Use a random address for 0-value outputs | [decred/dcrwallet#115](https://github.com/decred/dcrwallet/pull/115) |
| Fix all rpclisten references in documentation | [decred/dcrwallet#118](https://github.com/decred/dcrwallet/pull/118) |
| Fix wallet resyncing from seed and address index positioning | [decred/dcrwallet#121](https://github.com/decred/dcrwallet/pull/121) |
| Add err check for unchecked | [decred/dcrwallet#123](https://github.com/decred/dcrwallet/pull/123) |
| Catch vootingpool up with current apis | [decred/dcrwallet#122](https://github.com/decred/dcrwallet/pull/122) |
| Add new balancetomaintain rpc command | [decred/dcrwallet#120](https://github.com/decred/dcrwallet/pull/120) |
| Bump for 0.0.8 | [decred/dcrwallet#124](https://github.com/decred/dcrwallet/pull/124) |
| Set Tree field when converting wire.OutPoints. | [decred/dcrrpcclient#10](https://github.com/decred/dcrrpcclient/pull/10) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | 967952c7cbf23a622cf5ada5101658037f827a2f |
| decred/dcrwallet | a981017f624e27816c6aba21b00c2086b1b5d852 |
| decred/dcrrpcclient | b3f48780a0d68e24ef6e915e930a1c1e58b69810 |
| decred/dcrutil | ae0e66b98e49e836618c01cfa4d1b3d6077e5ae7 |

---

# [v0.0.7](https://github.com/decred/decred-binaries/releases/tag/v0.0.7)

## 2016-03-09

Patched release to allow multisig votes to be properly accepted by daemons with IsStandard

Changes include:

| Description | Pull Request |
| --- | ---- |
| Fix storing the ticket database to disk on close | [decred/dcrd#80](https://github.com/decred/dcrd/pull/80) |
| Reduce likelihood of vote spam | [decred/dcrd#82](https://github.com/decred/dcrd/pull/82) |
| Optimize mining checks for various stake transactions | [decred/dcrd#83](https://github.com/decred/dcrd/pull/83) |
| Sync to upstream 0280fa0 | [decred/dcrd#78](https://github.com/decred/dcrd/pull/78) |
| Revert sync merge | [decred/dcrd#85](https://github.com/decred/dcrd/pull/85) |
| Correct the expected number of inputs for stake P2SH outputs | [decred/dcrd#86](https://github.com/decred/dcrd/pull/86) |
| Bump version for release | [decred/dcrd#87](https://github.com/decred/dcrd/pull/87) |
| Only access isClosed inside the mutex in wtxmgr. | [decred/dcrwallet#94](https://github.com/decred/dcrwallet/pull/94) |
| Fixes to work with dcrd sync to 08/11/15 | [decred/dcrwallet#91](https://github.com/decred/dcrwallet/pull/91) |
| Switch from log.Debug to log.Debugf. | [decred/dcrwallet#96](https://github.com/decred/dcrwallet/pull/96) |
| Revert "Fixes to work with dcrd sync" | [decred/dcrwallet#100](https://github.com/decred/dcrwallet/pull/100) |
| Bump version for patch release | [decred/dcrwallet#101](https://github.com/decred/dcrwallet/pull/101) |
| Fix "Established connection" log message. | [decred/dcrrpcclient#8](https://github.com/decred/dcrrpcclient/pull/9) |
| Ayp sync 1c7f05 | [decred/dcrutil#1](https://github.com/decred/dcrutil/pull/1) |
| Revert sync commit | [decred/dcrutil#2](https://github.com/decred/dcrutil/pull/2) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | f2cc01cef2e58d788212dc28633c2d7b3cdf68e0 |
| decred/dcrwallet | d776d972f2f0c7b440dfbea5a10ba7ac4627cfbe |
| decred/dcrrpcclient | 4691756e416483e497d41f8883e5f432167983a2 |
| decred/dcrutil | ae0e66b98e49e836618c01cfa4d1b3d6077e5ae7 |

---

# [v0.0.6](https://github.com/decred/decred-binaries/releases/tag/v0.0.6)

## 2016-03-04

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160304-01.txt for sha256sums of the packages and
manifest-20160304-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release contains various fixes and improvements.

Changes include:

| Description | Pull Request |
| --- | ---- |
| Fix missing rpc help | [decred/dcrd#61](https://github.com/decred/dcrd/pull/61) |
| Fix a copy-paste error in chainsvrcmds.go | [decred/dcrd#63](https://github.com/decred/dcrd/pull/63) |
| Bug fix for checkBlockForHiddenVotes corrupting block templates | [decred/dcrd#68](https://github.com/decred/dcrd/pull/68) |
| Cherry pick commits required for wallet sync. | [decred/dcrd#69](https://github.com/decred/dcrd/pull/69) |
| Fix a panic caused by accessing unassigned pointer | [decred/dcrd#70](https://github.com/decred/dcrd/pull/70) |
| Add new RPC handlers for get/setticketfee | [decred/dcrd#71](https://github.com/decred/dcrd/pull/71) |
| Add getticketsvotebits batched command for wallet RPC | [decred/dcrd#72](https://github.com/decred/dcrd/pull/72) |
| Update default_ports.md | [decred/dcrd#75](https://github.com/decred/dcrd/pull/75) |
| Add consolidate cmd and response framework to the JSON RPC | [decred/dcrd#59](https://github.com/decred/dcrd/pull/59) |
| Add the new RPC function existsmempooltxs | [decred/dcrd#74](https://github.com/decred/dcrd/pull/74) |
| Fix bug displaying the wrong number of votes in getstakeinfo | [decred/dcrwallet#66](https://github.com/decred/dcrwallet/pull/66) |
| Merge upstream [btcsuite/btcwallet](https://github.com/btcsuite/btcwallet) code | [decred/dcrwllet#65](https://github.com/decred/dcrwallet/pull/65) |
| Add getstakeinfo online help. | [decred/dcrwallet#71](https://github.com/decred/dcrwallet/pull/71) |
| Change 'voted' in getstakeinfo to only return blockchain votes | [decred/dcrwallet#73](https://github.com/decred/dcrwallet/pull/73) |
| Get/SetTicketFee RPC and fix fee calculation in purchaseTicket | [decred/dcrwallet#72](https://github.com/decred/dcrwallet/pull/72) |
| Attempt to streamline getting/setting of fees for main/testnet | [decred/dcrwallet#74](https://github.com/decred/dcrwallet/pull/74) |
| Added getticketsvotebits functionality to the legacy RPC | [decred/dcrwallet#75](https://github.com/decred/dcrwallet/pull/75) |
| README.md: Update URL to releases | [decred/dcrwallet#78](https://github.com/decred/dcrwallet/pull/78) |
| Add wallet handling for getgenerate command. | [decred/dcrwallet#79](https://github.com/decred/dcrwallet/pull/79) |
| Correct TicketsForAddress returning pruned tickets | [decred/dcrwallet#80](https://github.com/decred/dcrwallet/pull/80) |
| Stop uses of database before closing db. | [decred/dcrwallet#87](https://github.com/decred/dcrwallet/pull/87) |
| Allow newlines and extra spaces when entering seed. | [decred/dcrwallet#88](https://github.com/decred/dcrwallet/pull/88) |
| Fix docs in grpc | [decred/dcrwallet#89](https://github.com/decred/dcrwallet/pull/89) |
| Prevent addresses from being shown more than once. | [decred/dcrwallet#89](https://github.com/decred/dcrwallet/pull/82) |
| Validate the address provided to --ticketaddress | [decred/dcrwallet#90](https://github.com/decred/dcrwallet/pull/90) |
| Add consolidate command handling to the wallet JSON RPC | [decred/dcrwallet#61](https://github.com/decred/dcrwallet/pull/61) |
| Update go versions used by travis. | [decred/dcrrpcclient#6](https://github.com/decred/dcrrpcclient/pull/6) |
| Add a hook for getticketsvotebits in wallet | [decred/dcrrpcclient#7](https://github.com/decred/dcrrpcclient/pull/7) |
| Add the existsmempooltxs command for daemon | [decred/dcrrpcclient#8](https://github.com/decred/dcrrpcclient/pull/8) |

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | 8f0d8f2d850edef4fa684ad872512ec9c0434f20 |
| decred/dcrwallet | 3d845de5a8650459db46251883a63b78fd55d404 |
| decred/dcrrpcclient | 7181e59ba727f8e6cb2f3919bc490549f81e4d54 |
| decred/dcrutil | 025b0fb50cfb446491a6988fab4cef333830e35c |

---

# [v0.0.5](https://github.com/decred/decred-binaries/releases/tag/v0.0.5)

## 2016-02-26

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160226-01.txt for sha256sums of the packages and
manifest-20160226-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release is primarily to add the ability for wallet to
automatically remove old tickets and expired transactions.

Other changes include:
* Add getstakeinfo to rpcAskWallet list to return proper error
* Correct version numbers
* Fix coin supply counter to reduce work and tax subsidy based on voters
* Fix a bug that caused votes and revocations not being stored
* Add listscripts RPC command handling

## Commits

This release was built from:

| Repository | Commit Hash |
| --- | ---- |
| decred/dcrd | fbede4978022f7121f80a1ec02a217b7498c4f5b |
| decred/dcrwallet | ee2a72abe35f690fcc54c3c6234e617c79a88d19 |
| decred/dcrrpcclient | 680d8ff9cd81c017c28fd867494e20deea08e48c |
| decred/dcrutil | 025b0fb50cfb446491a6988fab4cef333830e35c |

---

# [v0.0.4](https://github.com/decred/decred-binaries/releases/tag/v0.0.4)

## 2016-02-24

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160224-01.txt for sha256sums of the packages and
manifest-20160224-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

This release includes a number of fixes for both wallet and daemon as
well as several new rpc calls.

This includes (but is not limited to):
* Added getcoinsupply, get/setticketvotebits, existslivetickets, getstakeinfo
* First checkpoint added
* Several fee related issues
* Disable unsafe RPC calls on mainnet
* Corrected fee estimation for general transactions
* Allow wallet to accept hex or words as seed
* Other bug fixes and cleanups

---

# [v0.0.3](https://github.com/decred/decred-binaries/releases/tag/v0.0.3)

## 2016-02-09

This wallet only release resolves an upstream wallet bug (see
decred/dcrutil 8aae5a2dacf45b7f5ee9b59c393118bc48647861).

Platform specific files are attached.

See manifest-20160209-01.txt for sha256sums of the packages and
manifest-20160209-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

---

# [v0.0.2](https://github.com/decred/decred-binaries/releases/tag/v0.0.2)

## 2016-02-08

This release is an unencrypted version of the current mainnet enabled
code.

The packages below contain platform specific copies of drcd,
dcrwallet, and dcrctl.

See manifest-20160208-01.txt for sha256sums of the packages and
manifest-20160208-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

---

# [v0.0.1](https://github.com/decred/decred-binaries/releases/tag/v0.0.1)

## 2016-02-07

This is the initial mainnet binaries for Decred.

The packages below contain platform specific copies of drcd,
dcrwallet, and dcrctl.

See manifest-20160207-01.txt for sha256sums of the packages and
manifest-20160207-01.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.

The platform specific archives have been encrypted with 7zip. The key
will be made available when mainnet is launched.

To unencrypt on the command line you can do:

```bash
7za e FILENAME
```

then provide the password when asked.

Mainnet binary decryption key (password): yqJgFJUmQODUOWP2jJez5gt1

---

# [v0.0](https://github.com/decred/decred-binaries/releases/tag/v0.0)

## 2016-01-27

This is the testnet pre-release of Decred.

The packages below contain platform specific copies of drcd,
dcrwallet, and dcrctl.

See manifest-20160127-02.txt for sha256sums of the packages and
manifest-20160127-02.txt.asc to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.
