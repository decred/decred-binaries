# [v0.5.0](https://github.com/decred/decred-binaries/releases/tag/v0.5.0)

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

See [README.md](./README.md) for more info on
verifying the files.

## 2016-10-10

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

See [README.md](./README.md) for more info on
verifying the files.

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

See [README.md](./README.md) for more info on
verifying the files.

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

See [README.md](./README.md) for more info on
verifying the files.

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

# [v0.1.6](https://github.com/decred/decred-binaries/releases/tag/v0.1.6)

## 2016-06-21

This release is primarily for compatibility with dcrinstaller.  For
more information and usage instructions, please see
[dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See manifest-20160607-01.txt for sha256sums of the packages and
manifest-20160607-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.1.5](https://github.com/decred/decred-binaries/releases/tag/v0.1.5)

## 2016-06-07

This release contains updated binary files (dcrd, dcrctl, dcrwallet,
and dcrticketbuyer) for various platforms.

See manifest-20160607-01.txt for sha256sums of the packages and
manifest-201600607-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.1.4](https://github.com/decred/decred-binaries/releases/tag/v0.1.4)

## 2016-05-26

This release contains updated binary files (dcrd, dcrctl, dcrwallet,
and dcrticketbuyer) for various platforms.

See manifest-20160526-01.txt for sha256sums of the packages and
manifest-201600526-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.1.3](https://github.com/decred/decred-binaries/releases/tag/v0.1.3)

## 2016-05-10

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160510-01.txt for sha256sums of the packages and
manifest-201600510-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.1.2](https://github.com/decred/decred-binaries/releases/tag/v0.1.2)

## 2016-05-03

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160503-01.txt for sha256sums of the packages and
manifest-201600503-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.1.1](https://github.com/decred/decred-binaries/releases/tag/v0.1.1)

## 2016-04-25

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160425-01.txt for sha256sums of the packages and
manifest-201600425-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.1.0](https://github.com/decred/decred-binaries/releases/tag/v0.1.0)

## 2016-04-18

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160418-01.txt for sha256sums of the packages and
manifest-201600418-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.0.10](https://github.com/decred/decred-binaries/releases/tag/v0.0.10)

## 2016-04-06

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms and is primarily a bugfix for dcrwallet.

See manifest-20160406-01.txt for sha256sums of the packages and
manifest-201600406-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.0.9](https://github.com/decred/decred-binaries/releases/tag/v0.0.9)

## 2016-04-01

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160401-01.txt for sha256sums of the packages and
manifest-201600401-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.0.8](https://github.com/decred/decred-binaries/releases/tag/v0.0.8)

## 2016-03-18

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160318-01.txt for sha256sums of the packages and
manifest-20160318-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.0.6](https://github.com/decred/decred-binaries/releases/tag/v0.0.6)

## 2016-03-04

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160304-01.txt for sha256sums of the packages and
manifest-20160304-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.0.5](https://github.com/decred/decred-binaries/releases/tag/v0.0.5)

## 2016-02-26

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160226-01.txt for sha256sums of the packages and
manifest-20160226-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.0.4](https://github.com/decred/decred-binaries/releases/tag/v0.0.4)

## 2016-02-24

This release contains updated binary files (dcrd, dcrctl, dcrwallet)
for various platforms.

See manifest-20160224-01.txt for sha256sums of the packages and
manifest-20160224-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

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

# [v0.0.3](https://github.com/decred/decred-binaries/releases/tag/v0.0.3)

## 2016-02-09

This wallet only release resolves an upstream wallet bug (see
decred/dcrutil 8aae5a2dacf45b7f5ee9b59c393118bc48647861).

Platform specific files are attached.

See manifest-20160209-01.txt for sha256sums of the packages and
manifest-20160209-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

# [v0.0.2](https://github.com/decred/decred-binaries/releases/tag/v0.0.2)

## 2016-02-08

This release is an unencrypted version of the current mainnet enabled
code.

The packages below contain platform specific copies of drcd,
dcrwallet, and dcrctl.

See manifest-20160208-01.txt for sha256sums of the packages and
manifest-20160208-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

# [v0.0.1](https://github.com/decred/decred-binaries/releases/tag/v0.0.1)

## 2016-02-07

This is the initial mainnet binaries for Decred.

The packages below contain platform specific copies of drcd,
dcrwallet, and dcrctl.

See manifest-20160207-01.txt for sha256sums of the packages and
manifest-20160207-01.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.

The platform specific archives have been encrypted with 7zip. The key
will be made available when mainnet is launched.

To unencrypt on the command line you can do:

```bash
7za e FILENAME
```

then provide the password when asked.

Mainnet binary decryption key (password): yqJgFJUmQODUOWP2jJez5gt1

# [v0.0](https://github.com/decred/decred-binaries/releases/tag/v0.0)

## 2016-01-27

This is the testnet pre-release of Decred.

The packages below contain platform specific copies of drcd,
dcrwallet, and dcrctl.

See manifest-20160127-02.txt for sha256sums of the packages and
manifest-20160127-02.txt.asc to confirm those shas.

See https://wiki.decred.org/Verifying_Binaries for more info on
verifying the files.
