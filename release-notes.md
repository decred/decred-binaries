# 2024-11-13


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v2.0.5/decrediton-linux-amd64-v2.0.5.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v2.0.5/decrediton-linux-amd64-v2.0.5.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v2.0.5/decrediton-darwin-amd64-v2.0.5.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v2.0.5/decrediton-darwin-arm64-v2.0.5.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v2.0.5/decrediton-windows-amd64-v2.0.5.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v2.0.5-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [dcrd](#dcrd-v205)
* [dcrwallet](#dcrwallet-v205)
* [Decrediton](#decrediton-v205)


# dcrd v2.0.5

This is a patch release of dcrd which includes the following changes:

- Improved StakeShuffle mixing robustness against misbehaving peers
- Peers are no longer intermittently disconnected when serving factored polynomial data

## Upgrade Required To Participate in StakeShuffle Mixing

Although upgrading to this latest release is not required for continued operation of the core network, it is required for anyone who wishes to participate in StakeShuffle mixing with the highest anonymity set guarantees and fastest matching.

## Changelog

This patch release consists of 8 commits from 2 contributors which total to 8 files changed, 83 additional lines of code, and 56 deleted lines of code.

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v2.0.4...release-v2.0.5).

See [dcrd's own release notes](https://github.com/decred/dcrd/releases/tag/release-v2.0.5) for a categorized breakdown of all commits since the last release.

### Code Contributors (alphabetical order):

- Dave Collins
- Josh Rickmar


# dcrwallet v2.0.5

This release includes fixes to increase the mixing reliability and improves startup syncing when operating in in SPV mode.

All mixing users should upgrade to this release to maintain the maximum anonymity set.

## Bug fixes

* When secrets are revealed in a mix, blame assignment is delayed until all expected messages for the current stage of the run have been received ([decred/dcrd#3454](https://github.com/decred/dcrd/pull/3454)).

* A rare crash that could occur calculating mixing message jitter was fixed ([decred/dcrd#3448](https://github.com/decred/dcrd/pull/3448)).

* A started but killed `csppsolver` child process is now detected.  If this occurs, wallets will fall back to depending on other peers' published root solutions and will stop advertising root solving capabilities to other peers ([decred/dcrd#3451](https://github.com/decred/dcrd/pull/3451)).

* A missing check that published roots in the mixing protocol are in the proper order was added ([decred/dcrd#3453](https://github.com/decred/dcrd/pull/3453)).

* When mixed tickets are purchased using the `purchasetickets` JSON-RPC method, the mix change is returned to the configured change account ([`b22f59b3`](https://github.com/decred/dcrwallet/commit/b22f59b3)).

* When mixing is disabled and no other voting account has been specified, voting addresses are derived from the purchasing account rather than the unset voting account ([`bf73f3c2`](https://github.com/decred/dcrwallet/commit/bf73f3c2)).

* The `mixaccount` JSON-RPC method, which was unusable since the introduction of P2P mixing, was fixed ([`cb88e4f0`](https://github.com/decred/dcrwallet/commit/cb88e4f0)).

* The `--ticketsplitaccount` option, used when converting an unmixed ticketbuyer gradually over to a mixing buyer, was not being used since the introduction of P2P mixing ([`e45749aa`](https://github.com/decred/dcrwallet/commit/e45749aa)).

* The voting account, a required argument during mixed ticketbuying, is now always used when mixing is enabled, even when `UseVotingAccount` in a ticket purchasing request is not set true ([`c1b1ac0b`](https://github.com/decred/dcrwallet/commit/c1b1ac0b)).

* A hang occuring at the end of initial SPV sync has been fixed ([`7def7850`](https://github.com/decred/dcrwallet/commit/7def7850)).

## Other Improvements

* Peers who send too few headers, which could slow down initial sync time, are disconnected ([`59a40408`](https://github.com/decred/dcrwallet/commit/59a40408)).

* Peers who send headers before being requested are disconnected earlier in the sync process ([`58585aa5`](https://github.com/decred/dcrwallet/commit/58585aa5)).

* Peers who send headers that do not connect to the block locators are disconnected earlier in the sync process ([`fdd9e0b2`](https://github.com/decred/dcrwallet/commit/fdd9e0b2)).

* An error determining the block to rescan from is no longer a permanent ticket autobuyer failure ([`8c660622`](https://github.com/decred/dcrwallet/commit/8c660622)).

* Background mixing client operations are more reliably stopped when `dcrd` is disconnected in RPC sync mode ([`01f1e12e`](https://github.com/decred/dcrwallet/commit/01f1e12e)).

* Compatibility with older VSP software has been improved ([`3bbc7781`](https://github.com/decred/dcrwallet/commit/3bbc7781)).

## Changelog

The following lists all commits since dcrwallet v2.0.4:

* [`563b6779`](https://github.com/decred/dcrwallet/commit/563b6779): [release-v2.0] version: Update for v2.0.5
* [`5a0c93f7`](https://github.com/decred/dcrwallet/commit/5a0c93f7): [release-v2.0] Update to latest mixing module
* [`7def7850`](https://github.com/decred/dcrwallet/commit/7def7850): [release-v2.0] spv: Accept cfilters from more peers.
* [`3bbc7781`](https://github.com/decred/dcrwallet/commit/3bbc7781): [release-v2.0] multi: Send empty VSP policy fields
* [`01f1e12e`](https://github.com/decred/dcrwallet/commit/01f1e12e): [release-v2.0] Add context wrapping for syncer disconnections
* [`45d78411`](https://github.com/decred/dcrwallet/commit/45d78411): [release-v2.0] rescan: add missing db update error check
* [`c1b1ac0b`](https://github.com/decred/dcrwallet/commit/c1b1ac0b): [release-v2.0] Always use configured voting account when mixing
* [`e45749aa`](https://github.com/decred/dcrwallet/commit/e45749aa): [release-v2.0] Use correct account for mixed ticket split txns.
* [`8c660622`](https://github.com/decred/dcrwallet/commit/8c660622): [release-v2.0] ticketbuyer: Dont terminate if RescanPoint fails.
* [`cb88e4f0`](https://github.com/decred/dcrwallet/commit/cb88e4f0): [release-v2.0] jsonrpc: Allow mixaccount RPC to actually mix.
* [`bf73f3c2`](https://github.com/decred/dcrwallet/commit/bf73f3c2): [release-v2.0] wallet: Use purchase acct for voting if not mixing
* [`b22f59b3`](https://github.com/decred/dcrwallet/commit/b22f59b3): [release-v2.0] jsonrpc: Use correct change account when mixing.
* [`fdd9e0b2`](https://github.com/decred/dcrwallet/commit/fdd9e0b2): [release-v2.0] p2p: Move check for getheaders locators earlier in the call
* [`58585aa5`](https://github.com/decred/dcrwallet/commit/58585aa5): [release-v2.0] p2p: Move headers requested check earlier in the call
* [`59a40408`](https://github.com/decred/dcrwallet/commit/59a40408): [release-v2.0] p2p: Disconnect from peers that sent too few headers

## Code Contributors (alphabetical order):

* David Hill (@dajohi)
* Matheus Degiovani (@matheusd)
* Jamie Holdstock (@jholdstock)
* @JoeGruffins
* Josh Rickmar (@jrick)


## Decrediton v2.0.5

This release solely resolves an issue in the underlying dcrwallet software as well as updating to DCRDEX 1.0.2.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v2.0.5...release-v2.0.5).

## Code Contributors (alphabetical order):

* Alex Yocom-Piatt (@alexlyp)
* @buck54321
* @dev-warrior


# 2024-09-03


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v2.0.4/decrediton-linux-amd64-v2.0.4.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v2.0.4/decrediton-linux-amd64-v2.0.4.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v2.0.4/decrediton-darwin-amd64-v2.0.4.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v2.0.4/decrediton-darwin-arm64-v2.0.4.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v2.0.4/decrediton-windows-amd64-v2.0.4.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v2.0.4-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [dcrd](#dcrd-v204)
* [dcrwallet](#dcrwallet-v204)
* [Decrediton](#decrediton-v204)


# dcrd v2.0.4

This is a patch release of dcrd which includes the following changes:

- Improved session formation for StakeShuffle mix transactions
- Support for Internationalized Domain Names (IDNs) in hostnames
- StakeShuffle mixing performance enhancements

## Changelog

This patch release consists of 14 commits from 3 contributors which total to 17
files changed, 201 additional lines of code, and 97 deleted lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/release-v2.0.3...release-v2.0.4).

### Mixing message relay (mix pool):

- [release-v2.0] mixpool: Reject KEs submitted too early ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))
- [release-v2.0] mixclient: Use newest (fewest-PR) KEs to form alt sessions ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))

### RPC / gencerts utility changes:

- [release-v2.0] certgen,gencerts: Punycode non-ASCII hostnames ([decred/dcrd#3432](https://github.com/decred/dcrd/pull/3432))

### Developer-related package and module changes:

- [release-v2.0] mixclient: Remove completely unused var ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))
- [release-v2.0] mixpool: Remove error which is always returned nil ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))
- [release-v2.0] mixclient: Dont append to slice with non-zero length ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))
- [release-v2.0] mixing: Add missing copyright headers ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))
- [release-v2.0] mixclient: Add missing copyright headers ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))
- [release-v2.0] mixclient: Remove submit queue channel ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))
- [release-v2.0] mixclient: Do not submit PRs holding client mutex ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))

### Developer-related module management:

- [release-v2.0] main: Use backported mixing updates ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))
- [release-v2.0] main: Use backported certgen updates ([decred/dcrd#3432](https://github.com/decred/dcrd/pull/3432))

### Misc:

- [release-v2.0] mixing: Add missing periods to comments ([decred/dcrd#3431](https://github.com/decred/dcrd/pull/3431))
- [release-v2.0] release: Bump for 2.0.4 ([decred/dcrd#3433](https://github.com/decred/dcrd/pull/3433))

### Code Contributors (alphabetical order):

- Dave Collins
- Jamie Holdstock
- Josh Rickmar


## dcrwallet v2.0.4

This release includes improvements to the mixing session agreement, along with various bug fixes and minor performance improvements.

## Bug Fixes

* An issue where SPV wallets would stall block processing the latest block and only resume requesting additional new blocks after the next block is announced was fixed ([`39fd48b8`](https://github.com/decred/dcrwallet/commit/39fd48b8)).

* A potential crash in the VSP client was removed ([`2c7e4dcf`](https://github.com/decred/dcrwallet/commit/2c7e4dcf)).

* A deadlock in the mixing client that could trigger after reconnecting to a restarted dcrd was fixed ([dcrd/3401](https://github.com/decred/dcrd/pull/3401)).

* Automatic RPC TLS certificate generation no longer errors when the local hostname contains non-ASCII Unicode characters ([dcrd#3432](https://github.com/decred/dcrd/pull/3432)).

## Other Improvements

* Mix session agreement was improved by ignoring key exchange messages received too early before the calculated epoch time ([dcrd/3403](https://github.com/decred/dcrd/pull/3403)).

* Mix session agreement was improved by only considering a mixing identity's most recent key exchange messages ([dcrd/3404](https://github.com/decred/dcrd/pull/3404)).

## Changelog

The following lists all commits since dcrwallet v2.0.3:

* [`650a7c01`](https://github.com/decred/dcrwallet/commit/650a7c01): [release-v2.0] version: Update for v2.0.4
* [`9074d7fd`](https://github.com/decred/dcrwallet/commit/9074d7fd): [release-v2.0] Update to latest dcrd modules
* [`09ec255d`](https://github.com/decred/dcrwallet/commit/09ec255d): [release-v2.0] Update to latest vspd modules.
* [`ec74c62a`](https://github.com/decred/dcrwallet/commit/ec74c62a): [release-v2.0] wallet: Remove unused ctx from makeTicketSummary.
* [`2c7e4dcf`](https://github.com/decred/dcrwallet/commit/2c7e4dcf): [release-v2.0] vsp: Prevent nil pointer dereference.
* [`dcde8979`](https://github.com/decred/dcrwallet/commit/dcde8979): [release-v2.0] Update to latest mixing module
* [`39fd48b8`](https://github.com/decred/dcrwallet/commit/39fd48b8): [release-v2.0] spv: Fix request of new blocks after initial sync

## Code Contributors (alphabetical order):

* Matheus Degiovani (@matheusd)
* Jamie Holdstock (@jholdstock)
* Josh Rickmar (@jrick)


## Decrediton v2.0.4

This release of Decrediton includes numerous dependency updates that were flagged as possible vulnerabilities, as well 
as an update to the DCRDEX infrastructure for the recent v1.0.0 Bison Wallet release. 

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v2.0.3...release-v2.0.4).

## Code Contributors (alphabetical order):

* Alex Yocom-Piatt (@alexlyp)
* @buck54321



# 2024-06-21


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v2.0.3/decrediton-linux-amd64-v2.0.3.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v2.0.3/decrediton-linux-amd64-v2.0.3.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v2.0.3/decrediton-darwin-amd64-v2.0.3.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v2.0.3/decrediton-darwin-arm64-v2.0.3.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v2.0.3/decrediton-windows-amd64-v2.0.3.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v2.0.3-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [dcrd](#dcrd-v203)
* [dcrwallet](#dcrwallet-v203)


# dcrd v2.0.3

This is a patch release of dcrd which includes the following changes:

- Improved sender privacy for transactions and mix messages via randomized
  announcements
- Nodes now prefer to maintain at least three mixing-capable outbound connections
- Recent transactions and mix messages will now be available to serve for longer
- Reduced memory usage during periods of lower activity
- Mixing-related performance enhancements

## Changelog

This patch release consists of 26 commits from 2 contributors which total to 37
files changed, 4527 additional lines of code, and 499 deleted lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/release-v2.0.2...release-v2.0.3).

See [dcrd's own release notes](https://github.com/decred/dcrd/releases/tag/release-v2.0.3) for a categorized breakdown of all commits since the last release.

### Code Contributors (alphabetical order):

- Dave Collins
- Josh Rickmar



# dcrwallet v2.0.3

This release includes several important privacy and performance improvements for mixing users.  All 2.0.2 users are advised to upgrade.

## Bug Fixes

* Ending the initial wallet setup prompts before the birthday prompt has been completed will no longer panic the wallet ([`37e81f87`](https://github.com/decred/dcrwallet/commit/37e81f87)).

## Other Improvements

* The mixing client was modified to space out the publishing of pair request messages throughout the entire duration up until 30s before and after the epoch, and to add a small random delay before the broadcast of all messages.  Together these changes reduce the ability to deanonymize which messages belong to the same wallets depending on when they were seen or received ([dcrd/3388](https://github.com/decred/dcrd/pull/3388)).

* In SPV mode, a uniform random 100-500ms of per-peer delay is added to each inventory broadcast.  This also has the effect of batching recent inventory into fewer `inv` messages ([`fee60562`](https://github.com/decred/dcrwallet/commit/fee60562)).

* In SPV mode, a minimum of 3 (out of 8 total) full node peers which implement the mix message broadcasting protocol version will be targeted.  If too many connected peers do not support this protocol version, they will be disconnected for other peers which do ([`7830dd64`](https://github.com/decred/dcrwallet/commit/7830dd64)).

## Changelog

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrwallet/compare/release-v2.0.2...release-v2.0.3).

## Code Contributors (alphabetical order):

* @JoeGruffins
* Josh Rickmar (@jrick)


# 2024-06-05


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v2.0.2/decrediton-linux-amd64-v2.0.2.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v2.0.2/decrediton-linux-amd64-v2.0.2.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v2.0.2/decrediton-darwin-amd64-v2.0.2.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v2.0.2/decrediton-darwin-arm64-v2.0.2.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v2.0.2/decrediton-windows-amd64-v2.0.2.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v2.0.2-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [dcrd](#dcrd-v202)
* [dcrwallet](#dcrwallet-v202)


# dcrd v2.0.2

This is a patch release of dcrd which includes the following key changes:

- Nodes now prefer to maintain at least one mixing-capable outbound connection
- Peers will no longer potentially be improperly banned due to missing mix messages
- Mixing messages that are not available will now be obtained from elsewhere
- Improves mixing message availability during network propagation

## Changelog

This patch release consists of 26 commits from 3 contributors which total to 18 files changed, 468 additional lines of code, and 451 deleted lines of code.

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v2.0.1...release-v2.0.2).

See [dcrd's own release notes](https://github.com/decred/dcrd/releases/tag/release-v2.0.2) for a categorized breakdown of all commits since the last release.

### Code Contributors (alphabetical order):

- Dave Collins
- David Hill


# dcrwallet v2.0.2

This release includes several important bug fixes for mixing users.  All 2.0.1 users are advised to ugrade.

## Bug Fixes

* The mixing client will no longer attempt to create mixes that, when signed, exceed the standardness rules set by dcrd mempool ([dcrd/3338](https://github.com/decred/dcrd/pull/3338)).

* A change was made to how reruns are handled after blame is assigned.  Rather than incrementing the run, a new session is formed.  This reduces unexpected behavior by requiring the stricter message acceptance checks that were only performed during run-0 ([dcrd/3343](https://github.com/decred/dcrd/pull/3343)).

## Other improvements

* Peers who send mix messages when disablerelaytx is enabled (this includes dcrd version 2.0.0, but not 2.0.1 or 2.0.2) will be temporarily banned ([`48c59f55`](https://github.com/decred/dcrwallet/commit/48c59f55)).

* Debug logging of mixing activity has been improved through changes in both the mixpool and mixclient packages ([dcrd/3326](https://github.com/decred/dcrd/pull/3326), [dcrd/3331](https://github.com/decred/dcrd/pull/3331), [dcrd/3333](https://github.com/decred/dcrd/pull/3333), [dcrd/3339](https://github.com/decred/dcrd/pull/3339), [dcrd/3340](https://github.com/decred/dcrd/pull/3340)).

## Changelog

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrwallet/compare/release-v2.0.1...release-v2.0.2).

## Code Contributors (alphabetical order):

* Matheus Degiovani (@matheusd)
* Josh Rickmar (@jrick)


# 2024-05-29


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v2.0.1/decrediton-linux-amd64-v2.0.1.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v2.0.1/decrediton-linux-amd64-v2.0.1.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v2.0.1/decrediton-darwin-amd64-v2.0.1.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v2.0.1/decrediton-darwin-arm64-v2.0.1.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v2.0.1/decrediton-windows-amd64-v2.0.1.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v2.0.1-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [dcrd](#dcrd-v201)
* [dcrwallet](#dcrwallet-v201)


# dcrd v2.0.1 

This is a patch release of dcrd which includes the following key changes:

* Provides a new JSON-RPC API method named `getmixmessage` that can be used to query decentralized StakeShuffle mixing messages
* No longer relays mixing messages when transaction relay is disabled
* Transaction outputs with one confirmation may now be used as part of a mix
* Improves best network address candidate selection
* More consistent logging of banned peers along with the reason they were banned

## Changelog

This patch release consists of 19 commits from 3 contributors which total to 18 files changed, 388 additional lines of code, and 187 deleted lines of code.

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v2.0.0...release-v2.0.1).

See [dcrd's own release notes](https://github.com/decred/dcrd/releases/tag/release-v2.0.1) for a categorized breakdown of all commits since the last release.

### Code Contributors (alphabetical order):

- Dave Collins
- David Hill
- Josh Rickmar


# dcrwallet v2.0.1

This release includes several important bug fixes for mixing users.  All 2.0.0 users are advised to ugrade.

## Bug Fixes

* A panic that could be caused from a reconnecting RPC link to `dcrd` when mixing is enabled was fixed ([`9a954c35`](https://github.com/decred/dcrwallet/commit/9a954c35)).

* The initial mixing pair request sync in RPC syncing mode has been changed to operate more similarly to how it is done in SPV mode, by watching at least a full epoch for peers sending key exchange messages, and fetching their pair requests (only) when they are not known.  This is a better solution than using the `getmixpairrequests` JSON-RPC method, which would return all unremoved pair requests known to `dcrd`, including stale ones ([`d5d5ef76`](https://github.com/decred/dcrwallet/commit/d5d5ef76)).

* An issue where change addresses derived for inclusion in mixing pair requests were not properly persisted to the database was fixed ([`f977db4e`](https://github.com/decred/dcrwallet/commit/f977db4e)).

* This release includes a newer version of the mixpool and mixclient packages from dcrd's mixing module.  Among other improvements, this fixes an issue where pair requests were being improperly removed from the wallet's mixpool during some sessions that did not run to completion.

## Other improvements

* An error log was added to record the failed transaction send of any mixed coinjoin transaction ([`8b47dedb`](https://github.com/decred/dcrwallet/commit/8b47dedb)).

* The VSP client package has been made available as a non-internal package ([`9df1e498`](https://github.com/decred/dcrwallet/commit/9df1e498)).

## Changelog

The following lists all commits since dcrwallet v2.0.0:

* [`3b46b151`](https://github.com/decred/dcrwallet/commit/3b46b151): [release-v2.0] version: Update for v2.0.1
* [`e0829f0e`](https://github.com/decred/dcrwallet/commit/e0829f0e): [release-v2.0] Update to latest dcrd modules
* [`8b47dedb`](https://github.com/decred/dcrwallet/commit/8b47dedb): [release-v2.0] Log any errors publishing mix transactions
* [`f977db4e`](https://github.com/decred/dcrwallet/commit/f977db4e): [release-v2.0] Record derived mixing change addresses
* [`d5d5ef76`](https://github.com/decred/dcrwallet/commit/d5d5ef76): [release-v2.0] chain: Fetch unknown PRs of notified orphan KEs
* [`c18f2b0e`](https://github.com/decred/dcrwallet/commit/c18f2b0e): [release-v2.0] Update mixing module for client race fixes
* [`9a954c35`](https://github.com/decred/dcrwallet/commit/9a954c35): [release-v2.0] chain: Wait for errgroup before returning from sync
* [`9df1e498`](https://github.com/decred/dcrwallet/commit/9df1e498): externalize vsp client

## Code Contributors (alphabetical order):

* @buck54321
* Josh Rickmar (@jrick)


# 2024-05-21


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v2.0.0/decrediton-linux-amd64-v2.0.0.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v2.0.0/decrediton-linux-amd64-v2.0.0.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v2.0.0/decrediton-darwin-amd64-v2.0.0.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v2.0.0/decrediton-darwin-arm64-v2.0.0.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v2.0.0/decrediton-windows-amd64-v2.0.0.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v2.0.0-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [dcrd](#dcrd-v200)
* [dcrwallet](#dcrwallet-v200)
* [Decrediton](#decrediton-v200)

# dcrd v2.0.0

This is a new major release of dcrd.  Some of the key highlights are:

* Decentralized StakeShuffle mixing
* Higher network throughput
* Lightweight client sync time reduced by around 50%
* Improved initial peer discovery
* Reject protocol message removal
* Various updates to the RPC server:
  * Dynamic TLS certificate reload
  * Proof-of-Work hash in block information
  * New JSON-RPC API additions related to decentralized StakeShuffle mixing
* Quality assurance changes

## Upgrade Required To Continue Participating in StakeShuffle Mixing

Although upgrading to this latest release is not absolutely required for
continued operation of the core network, it is required for anyone who wishes to
continue participating in StakeShuffle mixing.

## Notable Changes

### Decentralized StakeShuffle Mixing

The StakeShuffle mixing process is now fully decentralized via the peer-to-peer
network as of this release.  All core software has been upgraded to make use of
the new decentralized coordination facilities.

This release introduces several new peer-to-peer protocol messages to provide
the decentralized coordination.  The following is a brief summary of the new
messages:

|Message      |Overall Purpose                                                |
|-------------|---------------------------------------------------------------|
|`mixpairreq` |Request to participate in a mix with relevant data and proofs. |
|`mixkeyxchg` |Publishes public keys and commitments for blame assignment.    |
|`mixcphrtxt` |Enables quantum resistant (PQ) blinded key exchange.           |
|`mixslotres` |Establishes slot reservations used in the blinding process.    |
|`mixfactpoly`|Encodes solution to the factored slot reservation polynomial.  |
|`mixdcnet`   |Untraceable multi-party broadcast (dining cryptographers).     |
|`mixconfirm` |Provides partial signatures to create the mix transaction.     |
|`mixsecrets` |Reveals secrets of an unsuccessful mix for blame assignment.   |

### Higher Network Throughput

This release now supports concurrent data requests (`getdata`) which allows for
higher network throughput, particularly when the communications channel is
experiencing high latency.

A couple of notable benefits are:

* Reduced vote times since it allows blocks and transactions to propagate more
  quickly throughout the network
* More responsive during traffic bursts and general network congestion

### Lightweight client sync time reduced by around 50%

Lightweight clients may now request version 2 compact filters in batches as
opposed to one at a time.  This has the effect of drastically reducing the
initial sync time for lightweight clients such as Simplified Payment
Verification (SPV) wallets.

This release introduces a new pair of peer-to-peer protocol messages named
`getcfsv2` and `cfiltersv2` which provide the aforementioned capability.

### Improved Initial Peer Discovery

Peers will now continue to query unreachable seeders in the background with an
increasing backoff timeout when they have not already discovered a sufficient
number of peers on the network to achieve the target connectivity.

This primarily improves the experience for peers joining the network for the
first time and those that have not been online for a long time since they do not
have a known list of good peers to use.
 
### Reject Protocol Message Removal (`reject`)

The previously deprecated `reject` peer-to-peer protocol message is no longer
available.

Consequently, the minimum required network protocol version to
participate on the network is now version 9.

Note that all nodes on older protocol versions are already not able to
participate in the network due to consensus changes that have passed.

Recall from previous release notes that this message is being removed because it
is a holdover from the original codebase where it was required, but it really is
not a useful message and has several downsides:

* Nodes on the network must be trustless, which means anything relying on such a
  message is setting itself up for failure because nodes are not obligated to
  send it at all nor be truthful as to the reason
* It can be harmful to privacy as it allows additional node fingerprinting
* It can lead to security issues for implementations that don't handle it with
  proper sanitization practices
* It can easily give software implementations the fully incorrect impression
  that it can be relied on for determining if transactions and blocks are valid
* The only way it is actually used currently is to show a debug log message,
  however, all of that information is already available via the peer and/or wire
  logging anyway
* It carries a non-trivial amount of development overhead to continue to support
  it when nothing actually uses it

### RPC Server Changes

The RPC server version as of this release is 8.2.0.

#### Dynamic TLS Certificate Reload

The RPC server now checks for updates to the TLS certificate key pair
(`rpc.cert` and `rpc.key` by default) on new connections and dynamically reloads
them if needed.  Similarly, the authorized client certificates (`clients.pem` by
default) when running with the client certificate authorization type mode
(`--authtype=clientcert`).

Some key highlights of this change:

* Certificates can now be updated without needing to shutdown and restart the
  process which enables things such as:
  * Updating the certificates to change the allowed domain name and/or IP addresses
  * Dynamically adding or removing authorized clients
  * Changing the cryptographic primitives used to newer supported variants
* All existing connections will continue to use the certificates that were
  loaded at the time the connection was made
* The existing working certs are retained if any errors are encountered when
  loading the new ones in order to avoid breaking a working config

#### New Proof-of-Work Hash Field in Block Info RPCs (`getblock` and `getblockheader`)

The verbose results of the `getblock` and `getblockheader` RPCs now include a
`powhash` field in the JSON object that contains the Proof-of-Work hash for the
block.  The new field will be exactly the same as the `hash` (block hash) field
for all blocks prior to the activation of the stakeholder vote to change the PoW
hashing algorithm
([DCP0011](https://github.com/decred/dcps/blob/master/dcp-0011/dcp-0011.mediawiki)).

See the following for API details:

* [getblock JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getblock)
* [getblockheader JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getblockheader)

#### New StakeShuffle Mixing Pool (mixpool) Message Send RPC (`sendrawmixmessage`)

A new RPC named `sendrawmixmessage` is now available.  This RPC can be used to
manually submit all mixing messages to the mixpool and broadcast them to the
network.

See the following for API details:

* [sendrawmixmessage JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#sendrawmixmessage)

#### New StakeShuffle Mixing Pool (mixpool) Message WebSocket Notification RPCs (`notifymixmessages`)

WebSocket notifications for mixing messages accepted to the mixpool are now
available.

Use `notifymixmessages` to request `mixmessage` notifications and
`stopnotifymixmessages` to stop receiving notifications.

See the following for API details:

* [notifymixmessages JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#notifymixmessages)
* [stopnotifymixmessages JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#stopnotifymixmessages)
* [mixmessage JSON-RPC API Notification Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#mixmessage)

## Changelog

This release consists of 168 commits from 11 contributors which total
to 265 files changed, 18292 additional lines of code, and 2978 deleted
lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/release-v1.8.1...release-v2.0.0).

### Protocol and network:

- main: Add read header timeout to profile server ([decred/dcrd#3186](https://github.com/decred/dcrd/pull/3186))
- server: Support concurrent getdata requests ([decred/dcrd#3203](https://github.com/decred/dcrd/pull/3203))
- server: Update required minimum protocol version ([decred/dcrd#3221](https://github.com/decred/dcrd/pull/3221))
- wire: add p2p mixing messages ([decred/dcrd#3066](https://github.com/decred/dcrd/pull/3066))
- server: Retry seeder connections ([decred/dcrd#3228](https://github.com/decred/dcrd/pull/3228))
- wire: Add epoch field to mix key exchange message ([decred/dcrd#3235](https://github.com/decred/dcrd/pull/3235))
- wire: Remove PR hashes from (get)initstate ([decred/dcrd#3244](https://github.com/decred/dcrd/pull/3244))
- wire: add previous revealed secrets hashes to RS message ([decred/dcrd#3239](https://github.com/decred/dcrd/pull/3239))
- wire: Add Opcode field to MixPairReqUTXO ([decred/dcrd#3243](https://github.com/decred/dcrd/pull/3243))
- wire: Zero out secrets signature for commitment hash ([decred/dcrd#3248](https://github.com/decred/dcrd/pull/3248))
- wire: add flag bits to PR message ([decred/dcrd#3246](https://github.com/decred/dcrd/pull/3246))
- wire: Add MsgMixFactoredPoly ([decred/dcrd#3247](https://github.com/decred/dcrd/pull/3247))
- server: Require protocol v9 (removed reject msg) ([decred/dcrd#3254](https://github.com/decred/dcrd/pull/3254))
- wire: Remove deprecated reject message support ([decred/dcrd#3254](https://github.com/decred/dcrd/pull/3254))
- wire: Include unmixed session position in KE ([decred/dcrd#3257](https://github.com/decred/dcrd/pull/3257))
- wire: Add msgs to get batch of cfilters ([decred/dcrd#3211](https://github.com/decred/dcrd/pull/3211))
- multi: Respond to getcfsv2 message ([decred/dcrd#3211](https://github.com/decred/dcrd/pull/3211))
- chaincfg: Update assume valid for release ([decred/dcrd#3263](https://github.com/decred/dcrd/pull/3263))
- chaincfg: Update min known chain work for release ([decred/dcrd#3264](https://github.com/decred/dcrd/pull/3264))
- multi: Integrate mixpool and propagate p2p mixing messages ([decred/dcrd#3208](https://github.com/decred/dcrd/pull/3208))

### Mining:

- mining: Update blk templ diff for too few voters ([decred/dcrd#3241](https://github.com/decred/dcrd/pull/3241))
- cpuminer: Rework discrete mining vote wait logic ([decred/dcrd#3242](https://github.com/decred/dcrd/pull/3242))
- cpuminer: Remove unused IsKnownInvalidBlock method ([decred/dcrd#3242](https://github.com/decred/dcrd/pull/3242))

### RPC:

- rpc: Add PoWHash to getblock/getblockheader (verbose) results ([decred/dcrd#3154](https://github.com/decred/dcrd/pull/3154))
- rpcserver: Support dynamic cert reload ([decred/dcrd#3153](https://github.com/decred/dcrd/pull/3153))
- rpcserver: Modify getnetworkhashps -1 blocks logic ([decred/dcrd#3181](https://github.com/decred/dcrd/pull/3181))
- rpcserver: Remove unneeded AddedNodeInfo method ([decred/dcrd#3236](https://github.com/decred/dcrd/pull/3236))

### dcrd command-line flags and configuration:

- config: Support DCRD_APPDATA env variable ([decred/dcrd#3152](https://github.com/decred/dcrd/pull/3152))
- config: Show usage message on invalid cli flags ([decred/dcrd#3282](https://github.com/decred/dcrd/pull/3282))

### Documentation:

- docs: Add release notes for v1.8.0 ([decred/dcrd#3144](https://github.com/decred/dcrd/pull/3144))
- docs: Add release notes templates ([decred/dcrd#3148](https://github.com/decred/dcrd/pull/3148))
- docs: Update for blockchain v5 module ([decred/dcrd#3149](https://github.com/decred/dcrd/pull/3149))
- docs: Update JSON-RPC API for powhash ([decred/dcrd#3154](https://github.com/decred/dcrd/pull/3154))
- docs: Update README.md to required Go 1.20/1.21 ([decred/dcrd#3172](https://github.com/decred/dcrd/pull/3172))
- docs: Add release notes for v1.8.1 ([decred/dcrd#3195](https://github.com/decred/dcrd/pull/3195))
- docs: Update README.md to required Go 1.21/1.22 ([decred/dcrd#3220](https://github.com/decred/dcrd/pull/3220))
- docs: Add mixing cmds and ntfn JSON-RPC API ([decred/dcrd#3275](https://github.com/decred/dcrd/pull/3275))

### Contrib changes:

- docker: Update image to golang:1.20.5-alpine3.18 ([decred/dcrd#3146](https://github.com/decred/dcrd/pull/3146))
- docker: Update image to golang:1.20.6-alpine3.18 ([decred/dcrd#3158](https://github.com/decred/dcrd/pull/3158))
- docker: Update image to golang:1.20.7-alpine3.18 ([decred/dcrd#3170](https://github.com/decred/dcrd/pull/3170))
- docker: Update image to golang:1.21.0-alpine3.18 ([decred/dcrd#3171](https://github.com/decred/dcrd/pull/3171))
- docker: Update image to golang:1.21.1-alpine3.18 ([decred/dcrd#3183](https://github.com/decred/dcrd/pull/3183))
- docker: Update image to golang:1.21.2-alpine3.18 ([decred/dcrd#3197](https://github.com/decred/dcrd/pull/3197))
- docker: Update image to golang:1.21.3-alpine3.18 ([decred/dcrd#3198](https://github.com/decred/dcrd/pull/3198))
- docker: Update image to golang:1.21.4-alpine3.18 ([decred/dcrd#3210](https://github.com/decred/dcrd/pull/3210))
- docker: Update image to golang:1.21.5-alpine3.18 ([decred/dcrd#3214](https://github.com/decred/dcrd/pull/3214))
- docker: Update image to golang:1.21.6-alpine3.19 ([decred/dcrd#3215](https://github.com/decred/dcrd/pull/3215))
- docker: Update image to golang:1.22.0-alpine3.19 ([decred/dcrd#3219](https://github.com/decred/dcrd/pull/3219))
- docker: Update image to golang:1.22.1-alpine3.19 ([decred/dcrd#3222](https://github.com/decred/dcrd/pull/3222))
- docker: Update image to golang:1.22.2-alpine3.19 ([decred/dcrd#3231](https://github.com/decred/dcrd/pull/3231))
- docker: Update image to golang:1.22.3-alpine3.19 ([decred/dcrd#3249](https://github.com/decred/dcrd/pull/3249))
- contrib: Add mixing to go workspace setup script ([decred/dcrd#3265](https://github.com/decred/dcrd/pull/3265))

### Developer-related package and module changes:

- jsonrpc/types: Add powhash to verbose block output ([decred/dcrd#3154](https://github.com/decred/dcrd/pull/3154))
- chaingen: More precise ASERT comments ([decred/dcrd#3156](https://github.com/decred/dcrd/pull/3156))
- rpcclient: Explicitly require TLS >= 1.2 for HTTP ([decred/dcrd#3169](https://github.com/decred/dcrd/pull/3169))
- multi: Avoid range capture for Go 1.22 changes ([decred/dcrd#3165](https://github.com/decred/dcrd/pull/3165))
- blockchain: Remove unused progress logger param ([decred/dcrd#3177](https://github.com/decred/dcrd/pull/3177))
- blockchain: Remove unused trsy enabled param ([decred/dcrd#3177](https://github.com/decred/dcrd/pull/3177))
- multi: Wrap errors for better errors.Is/As support ([decred/dcrd#3178](https://github.com/decred/dcrd/pull/3178))
- rpcserver: Improve internal error handling ([decred/dcrd#3182](https://github.com/decred/dcrd/pull/3182))
- sampleconfig: Use embed with external files ([decred/dcrd#3185](https://github.com/decred/dcrd/pull/3185))
- secp256k1/ecdsa: Expose r and s value of signature ([decred/dcrd#3188](https://github.com/decred/dcrd/pull/3188))
- secp256k1/ecdsa: Remove some unnecessary subslices ([decred/dcrd#3189](https://github.com/decred/dcrd/pull/3189))
- secp256k1/ecdsa: Add tests for new R and S methods ([decred/dcrd#3190](https://github.com/decred/dcrd/pull/3190))
- secp256k1/ecdsa: Add test for order wraparound ([decred/dcrd#3191](https://github.com/decred/dcrd/pull/3191))
- dcrutil: Use os.UserHomeDir in appDataDir ([decred/dcrd#3196](https://github.com/decred/dcrd/pull/3196))
- multi: Reduce done goroutines ([decred/dcrd#3199](https://github.com/decred/dcrd/pull/3199))
- multi: Consolidate waitgroup logic ([decred/dcrd#3200](https://github.com/decred/dcrd/pull/3200))
- netsync: Rename NewPeer to PeerConnected ([decred/dcrd#3202](https://github.com/decred/dcrd/pull/3202))
- netsync: Rename DonePeer to PeerDisconnected ([decred/dcrd#3202](https://github.com/decred/dcrd/pull/3202))
- netsync: Export opaque peer and require it in API ([decred/dcrd#3202](https://github.com/decred/dcrd/pull/3202))
- server: Use server peer in log statements ([decred/dcrd#3202](https://github.com/decred/dcrd/pull/3202))
- server: Don't wait or try to send notfound data ([decred/dcrd#3204](https://github.com/decred/dcrd/pull/3204))
- peer: select on p.quit during stall control chan writes ([decred/dcrd#3209](https://github.com/decred/dcrd/pull/3209))
- peer: provide better debug for queued nil messages ([decred/dcrd#3213](https://github.com/decred/dcrd/pull/3213))
- wire: Mark legacy message types as deprecated ([decred/dcrd#3205](https://github.com/decred/dcrd/pull/3205))
- secp256k1: Add TinyGo support ([decred/dcrd#3223](https://github.com/decred/dcrd/pull/3223))
- wire: Fix typo in comment ([decred/dcrd#3226](https://github.com/decred/dcrd/pull/3226))
- secp256k1: No allocs in slow scalar base mult path ([decred/dcrd#3225](https://github.com/decred/dcrd/pull/3225))
- dcrutil: Remove Getenv("HOME") fallback for appdata dir ([decred/dcrd#3230](https://github.com/decred/dcrd/pull/3230))
- server: Do not update addrmgr on simnet/regnet ([decred/dcrd#3240](https://github.com/decred/dcrd/pull/3240))
- connmgr: Only mark persistent peer reconn pending ([decred/dcrd#3238](https://github.com/decred/dcrd/pull/3238))
- server: Use atomic types for some svr peer fields ([decred/dcrd#3237](https://github.com/decred/dcrd/pull/3237))
- peer: Remove deprecated reject message support ([decred/dcrd#3254](https://github.com/decred/dcrd/pull/3254))
- peer: Close mock connections in tests ([decred/dcrd#3254](https://github.com/decred/dcrd/pull/3254))
- peer: Require protocol v9 (removed reject msg) ([decred/dcrd#3254](https://github.com/decred/dcrd/pull/3254))
- gcs: Add func to determine max cfilter size ([decred/dcrd#3211](https://github.com/decred/dcrd/pull/3211))
- blockchain: Add function to locate multiple cfilters ([decred/dcrd#3211](https://github.com/decred/dcrd/pull/3211))
- server: Use sync.Mutex since the read lock isn't used ([decred/dcrd#3270](https://github.com/decred/dcrd/pull/3270))
- mixing: Only validate compressed 33-byte pubkeys ([decred/dcrd#3271](https://github.com/decred/dcrd/pull/3271))
- mixing: Add mixpool package ([decred/dcrd#3082](https://github.com/decred/dcrd/pull/3082))
- mixing: Add mixclient package ([decred/dcrd#3256](https://github.com/decred/dcrd/pull/3256))
- server: Implement separate mutex for peer state ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make server peer conn req concurrent safe ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Use iterator for connected ip count ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make add peer logic synchronous ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make done peer logic synchronous ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make conn count query synchronous ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make outbound group query synchronous ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make manual connect code synchronous ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make pending conn cancel code synchronous ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make persistent peer removal synchronous ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make persistent node query synchronous ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Make manual peer disconnect synchronous ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))
- server: Remove unused query chan and handler ([decred/dcrd#3251](https://github.com/decred/dcrd/pull/3251))

### Developer-related module management:

- secp256k1: Prepare v4.3.0 ([decred/dcrd#3227](https://github.com/decred/dcrd/pull/3227))
- main: update dcrdtest module to master ([decred/dcrd#3232](https://github.com/decred/dcrd/pull/3232))
- main: update dcrdtest module to master ([decred/dcrd#3233](https://github.com/decred/dcrd/pull/3233))
- wire: go mod tidy ([decred/dcrd#3250](https://github.com/decred/dcrd/pull/3250))
- multi: Deduplicate external dependencies ([decred/dcrd#3255](https://github.com/decred/dcrd/pull/3255))
- wire: Prepare v1.7.0 ([decred/dcrd#3258](https://github.com/decred/dcrd/pull/3258))
- blockchain/standalone: Prepare v2.2.1 ([decred/dcrd#3259](https://github.com/decred/dcrd/pull/3259))
- addrmgr: Prepare v2.0.3 ([decred/dcrd#3260](https://github.com/decred/dcrd/pull/3260))
- mixing: Use latest crypto deps ([decred/dcrd#3261](https://github.com/decred/dcrd/pull/3261))
- connmgr: Prepare v3.1.2 ([decred/dcrd#3262](https://github.com/decred/dcrd/pull/3262))
- chaincfg: Prepare v3.2.1 ([decred/dcrd#3266](https://github.com/decred/dcrd/pull/3266))
- txscript: Prepare v4.1.1 ([decred/dcrd#3267](https://github.com/decred/dcrd/pull/3267))
- hdkeychain: Prepare v3.1.2 ([decred/dcrd#3268](https://github.com/decred/dcrd/pull/3268))
- rpc/jsonrpc/types: Prepare v4.2.0 ([decred/dcrd#3276](https://github.com/decred/dcrd/pull/3276))
- peer: Prepare v3.1.0 ([decred/dcrd#3277](https://github.com/decred/dcrd/pull/3277))
- dcrutil: Prepare v4.0.2 ([decred/dcrd#3278](https://github.com/decred/dcrd/pull/3278))
- database: Prepare v3.0.2 ([decred/dcrd#3279](https://github.com/decred/dcrd/pull/3279))
- mixing: Prepare v0.1.0 ([decred/dcrd#3280](https://github.com/decred/dcrd/pull/3280))
- blockchain/stake: Prepare v5.0.1 ([decred/dcrd#3281](https://github.com/decred/dcrd/pull/3281))
- gcs: Prepare v4.1.0 ([decred/dcrd#3283](https://github.com/decred/dcrd/pull/3283))
- blockchain: Prepare v5.0.1 ([decred/dcrd#3284](https://github.com/decred/dcrd/pull/3284))
- rpcclient: Prepare v8.0.1 ([decred/dcrd#3285](https://github.com/decred/dcrd/pull/3285))
- main: Update to use all new module versions ([decred/dcrd#3286](https://github.com/decred/dcrd/pull/3286))
- main: Remove module replacements ([decred/dcrd#3288](https://github.com/decred/dcrd/pull/3288))
- mixing: Introduce module ([decred/dcrd#3207](https://github.com/decred/dcrd/pull/3207))

### Testing and Quality Assurance:

- main: Use release version of dcrtest framework ([decred/dcrd#3142](https://github.com/decred/dcrd/pull/3142))
- database: Mark test helpers ([decred/dcrd#3147](https://github.com/decred/dcrd/pull/3147))
- database: Use TempDir to create temp test dirs ([decred/dcrd#3147](https://github.com/decred/dcrd/pull/3147))
- build: Add CI support for test and module cache ([decred/dcrd#3145](https://github.com/decred/dcrd/pull/3145))
- main: improve test flag handling ([decred/dcrd#3151](https://github.com/decred/dcrd/pull/3151))
- build: Add nilerr linter ([decred/dcrd#3157](https://github.com/decred/dcrd/pull/3157))
- build: Update to latest action versions ([decred/dcrd#3159](https://github.com/decred/dcrd/pull/3159))
- build: Move lint logic to its own script ([decred/dcrd#3161](https://github.com/decred/dcrd/pull/3161))
- build: Use go install for linter and add cache ([decred/dcrd#3162](https://github.com/decred/dcrd/pull/3162))
- build: Update golangci-lint to v1.53.3 ([decred/dcrd#3163](https://github.com/decred/dcrd/pull/3163))
- build: Correct missing shebang in lint script ([decred/dcrd#3164](https://github.com/decred/dcrd/pull/3164))
- build: Checkout source before Go setup ([decred/dcrd#3166](https://github.com/decred/dcrd/pull/3166))
- build: Use setup-go action cache ([decred/dcrd#3168](https://github.com/decred/dcrd/pull/3168))
- build: Update to latest action versions ([decred/dcrd#3172](https://github.com/decred/dcrd/pull/3172))
- build: Update golangci-lint to v1.53.1 ([decred/dcrd#3172](https://github.com/decred/dcrd/pull/3172))
- build: Test against Go 1.21 ([decred/dcrd#3172](https://github.com/decred/dcrd/pull/3172))
- build: Test against Go 1.21 ([decred/dcrd#3172](https://github.com/decred/dcrd/pull/3172))
- standalone: Add decreasing timestamps ASERT test ([decred/dcrd#3173](https://github.com/decred/dcrd/pull/3173))
- build: Add dupword linter ([decred/dcrd#3175](https://github.com/decred/dcrd/pull/3175))
- build: Add errorlint linter ([decred/dcrd#3179](https://github.com/decred/dcrd/pull/3179))
- build: Update to latest action versions ([decred/dcrd#3216](https://github.com/decred/dcrd/pull/3216))
- build: Update golangci-lint to v1.55.2 ([decred/dcrd#3216](https://github.com/decred/dcrd/pull/3216))
- build: Update golangci-lint to v1.56.0 ([decred/dcrd#3220](https://github.com/decred/dcrd/pull/3220))
- build: Test against Go 1.22 ([decred/dcrd#3220](https://github.com/decred/dcrd/pull/3220))
- secp256k1: Add scalar base mult variant benchmarks ([decred/dcrd#3224](https://github.com/decred/dcrd/pull/3224))
- run_tests.sh: allow passing of additional test arguments ([decred/dcrd#3229](https://github.com/decred/dcrd/pull/3229))
- dcrutil: Fix message in test error ([decred/dcrd#3230](https://github.com/decred/dcrd/pull/3230))
- dcrutil: Use os.UserHomedir for base home directory in tests ([decred/dcrd#3230](https://github.com/decred/dcrd/pull/3230))
- rpctests: Pass test loggers to dcrdtest package ([decred/dcrd#3232](https://github.com/decred/dcrd/pull/3232))
- multi: Fix function names in some comments ([decred/dcrd#3245](https://github.com/decred/dcrd/pull/3245))
- rpc/jsonrpc/types: Add tests for new mix types ([decred/dcrd#3274](https://github.com/decred/dcrd/pull/3274))

### Misc:

- release: Bump for 1.9 release cycle ([decred/dcrd#3141](https://github.com/decred/dcrd/pull/3141))
- main: Don't include requires in build ([decred/dcrd#3143](https://github.com/decred/dcrd/pull/3143))
- multi: Address some linter complaints ([decred/dcrd#3155](https://github.com/decred/dcrd/pull/3155))
- multi: Remove a bunch of dup words in comments ([decred/dcrd#3174](https://github.com/decred/dcrd/pull/3174))
- multi: Cleanup superfluous trailing newlines ([decred/dcrd#3176](https://github.com/decred/dcrd/pull/3176))
- main: Update license to 2024 ([decred/dcrd#3217](https://github.com/decred/dcrd/pull/3217))
- release: Bump for 2.0 release cycle ([decred/dcrd#3269](https://github.com/decred/dcrd/pull/3269))
- release: Bump for 2.0.0 ([decred/dcrd#3289](https://github.com/decred/dcrd/pull/3289))

### Code Contributors (alphabetical order):

- Billy Zelani Malik
- Dave Collins
- David Hill
- Matheus Degiovani
- Nicola Larosa
- peicuiping
- Peter Zen
- Jamie Holdstock
- Jonathan Chappelow
- Josh Rickmark
- SeedHammer


# dcrwallet v2.0.0

This release is a major release for `dcrwallet`, adding many new features, improvements, and bug fixes.  It is the first release to integrate peer-to-peer StakeShuffle mixing (sometimes also referred to as CoinShuffle++ or CSPP), replacing the previous mixing features that required communicating through a central server as a coordination point.

Configuration for the new mixing protocol requires no changes from previous `dcrwallet` versions, except that the enabling the feature is done with a boolean `--mixing` option instead of setting `--csppserver`.

When mixing, it is recommend, but not required, to build `csppsolver` and either install it to `PATH`, or provide the path to the executable with the `--csppsolver` option.  The solver is a necessary component to complete a mix, but only one participant in the mix is required to provide it.  The solver requires the C library libflint (including its development headers, if your distribution creates separate -dev packages), and once these dependencies are met, `csppsolver` can be built and installed with:

```
$ go install decred.org/cspp/v2/cmd/csppsolver@latest
```

Beyond the mixing changes, this release includes major performance and reliability improvements for both JSON-RPC and SPV syncing modes.  Rescan performance has likewise been greatly improved upon over previous releases.  Several issues affecting VSP users have been identified and corrected.

## Downgrade Warning

The database format in v2.0.0 is not compatible with previous versions of the software.  This only affects downgrades as users upgrading from previous versions will see a one time database migration.

## Bug fixes

* The configured mixed split account and branch is now properly used when purchasing mixed tickets using the `purchasetickets` JSON-RPC method ([`7a31751b`](https://github.com/decred/dcrwallet/commit/7a31751b)).

* Unsigned transactions created by the `purchasetickets` JSON-RPC method are no longer published or recorded by the wallet ([`7e5c5f2f`](https://github.com/decred/dcrwallet/commit/7e5c5f2f), [`a021248f`](https://github.com/decred/dcrwallet/commit/a021248f)).

* An invalid usage of a synchronization primitive by the SPV syncer was corrected ([`d5a07ae6`](https://github.com/decred/dcrwallet/commit/d5a07ae6)).

* Additional addresses are no longer fetched from peers in SPV mode when their services are deemed insufficient.  This reduces the number of TCP connections currently open, preventing resource exhaustion if the wallet is using a Tor proxy and hitting the maximum circuit limit ([`ab6da249`](https://github.com/decred/dcrwallet/commit/ab6da249)).

* An issue stalling the SPV syncing during the fetching of compact filters for sidechain blocks was fixed by adding a watchdog timer to the fetch ([`66a3e69d`](https://github.com/decred/dcrwallet/commit/66a3e69d)).

* A logic race that could result in missing relevant transactions in block connected at initial sync was corrected in the JSON-RPC syncing mode ([`9873543d`](https://github.com/decred/dcrwallet/commit/9873543d)).

* An off-by-one error during address discovery was corrected ([`3c1d19e1`](https://github.com/decred/dcrwallet/commit/3c1d19e1)).

* The `redeemmultisigout` JSON-RPC method now returns with the `complete` field of the result set to false when the caller-provided transaction already contained invalid signatures ([`0a63be64`](https://github.com/decred/dcrwallet/commit/0a63be64)).

* VSP fees are now calculated properly depending on the activation of DCP0012 ([`90232ed6`](https://github.com/decred/dcrwallet/commit/90232ed6)).

* Several error-handling issues that could cause some tickets to be skipped over by the VSP client were corrected ([`35c6ac0f`](https://github.com/decred/dcrwallet/commit/35c6ac0f), [`a38abe28`](https://github.com/decred/dcrwallet/commit/a38abe28), [`a87fa843`](https://github.com/decred/dcrwallet/commit/a87fa843)).

* The VSP client now confirms acceptance of fee payment for tickets before removing their internal tracking in the client, instead of simply assuming the fee payment was accepted after six confirmations ([`35c6ac0f`](https://github.com/decred/dcrwallet/commit/35c6ac0f)).

## New features

* The client-server StakeShuffle mixing has been replaced with a peer-to-peer variant of the same protocol ([`bb04b755`](https://github.com/decred/dcrwallet/commit/bb04b755)).

* Wallet creation now prompts if a birthday (as either a block height or date) is known for a restored wallet ([`5e8f1328`](https://github.com/decred/dcrwallet/commit/5e8f1328)).

* Wallet creation now prompts for any extended public keys are available to create additional new xpub accounts ([`25b8ae63`](https://github.com/decred/dcrwallet/commit/25b8ae63)).

* A `--spvdisablerelaytx` option has been added to inform full nodes not to announce transactions ([`eb5b1b72`](https://github.com/decred/dcrwallet/commit/eb5b1b72)).

* It is now possible to configure TLS certificate authentication to authenticate the JSON-RPC connection made to `dcrd` ([`0c735a70`](https://github.com/decred/dcrwallet/commit/0c735a70)).

* A new JSON-RPC method named `spendoutputs` has been introduced, which provides an easier-to-use alternative (over the existing create/sign/sendrawtransaction calls) to create and send transactions in a single RPC call with manual UTXO selection ([`ad140d26`](https://github.com/decred/dcrwallet/commit/ad140d26)).

* The currently-configured VSP URL has been added to the `walletinfo` JSON-RPC result object ([`bed109b0`](https://github.com/decred/dcrwallet/commit/bed109b0)).

* An `--offline` option has been added for air-gapped wallets to disable syncing through a JSON-RPC or SPV network backend ([`3b708125`](https://github.com/decred/dcrwallet/commit/3b708125)).

* The `gettickets` JSON-RPC method is now usable under SPV mode ([`1e6f8917`](https://github.com/decred/dcrwallet/commit/1e6f8917)).

* Any transaction changes that are performed during non-startup rescans (e.g. those manually started by the `rescanwallet` JSON-RPC method) are now logged ([`0be25dbc`](https://github.com/decred/dcrwallet/commit/0be25dbc)).

## Other improvements

* During initial sync in SPV mode, unsynced peers will now be disconnected from if they are overtaken by the wallet as it syncs from its other peers ([`6f510a51`](https://github.com/decred/dcrwallet/commit/6f510a51)).

* Compact filters in SPV mode are now fetched from multiple peers, and will continue to be fetched after the announcing peer has disconnected [`adba0d1c`](https://github.com/decred/dcrwallet/commit/adba0d1c).

* Compact filters in SPV mode are now fetched in batches from peers who support this protocol addition ([`1920377b`](https://github.com/decred/dcrwallet/commit/1920377b)).

* Headers are now requested from peers in SPV mode after initial sync has completed, improving resyncing performance after temporary network loss ([`b9fd1a79`](https://github.com/decred/dcrwallet/commit/b9fd1a79)).

* Headers sync in SPV mode has been modified to request headers and compact filters in batches, improving sync performance ([`ab15d980`](https://github.com/decred/dcrwallet/commit/ab15d980)).

* JSON-RPC sync logic has been improved by waiting for `dcrd` to finish syncing before wallet begins its own syncing logic ([`e4acd44b`](https://github.com/decred/dcrwallet/commit/e4acd44b)).

* Performance of and memory usage during initial sync in both SPV and JSON-RPC modes has been improved by iterating wallet's main chain blocks by height rather than following the previous headers through the hash ([`947fcaf7`](https://github.com/decred/dcrwallet/commit/947fcaf7)).

* Rescan performance is greatly improved due to improved batching of the database updates ([`14c704a1`](https://github.com/decred/dcrwallet/commit/14c704a1)).

* On OpenBSD, `dcrwallet` no longer links to the `syscall` symbol, which has been removed from `libc.so` in OpenBSD 7.5 ([`49941c3d`](https://github.com/decred/dcrwallet/commit/49941c3d)).

## Changelog

The following lists all commits included in dcrwallet v2.0.0 that were not backported to a prior 1.8.x release:

* [`ade2a17b`](https://github.com/decred/dcrwallet/commit/ade2a17b): version: Prepare v2.0.0 release
* [`4618df87`](https://github.com/decred/dcrwallet/commit/4618df87): Improve error message for initial csppsolver check
* [`645032b4`](https://github.com/decred/dcrwallet/commit/645032b4): Bump version to 2.0.0-pre
* [`1920377b`](https://github.com/decred/dcrwallet/commit/1920377b): spv: Add batched cfilter fetching
* [`bb04b755`](https://github.com/decred/dcrwallet/commit/bb04b755): Replace client-server with peer-to-peer mixing
* [`475b13a5`](https://github.com/decred/dcrwallet/commit/475b13a5): Update Decred dependencies to latest releases
* [`5e8f1328`](https://github.com/decred/dcrwallet/commit/5e8f1328): wallet: Add birthday.
* [`7a31751b`](https://github.com/decred/dcrwallet/commit/7a31751b): assign mixedSplitAccount for rpc tickets
* [`f314a44c`](https://github.com/decred/dcrwallet/commit/f314a44c): rpc: allow syncing older tips on simnet
* [`eb5b1b72`](https://github.com/decred/dcrwallet/commit/eb5b1b72): multi: Expose disablerelaytx
* [`44c0f78d`](https://github.com/decred/dcrwallet/commit/44c0f78d): Introduce VSPTicket struct.
* [`d2eddb1a`](https://github.com/decred/dcrwallet/commit/d2eddb1a): jsonrpc: Require hash for processUnmanagedTicket
* [`0c735a70`](https://github.com/decred/dcrwallet/commit/0c735a70): Allow client certificate authentication to dcrd RPC
* [`ad140d26`](https://github.com/decred/dcrwallet/commit/ad140d26): Implement spendoutputs JSON-RPC method
* [`7e5c5f2f`](https://github.com/decred/dcrwallet/commit/7e5c5f2f): Do not record unsigned split txs from purchasetickets
* [`d374979e`](https://github.com/decred/dcrwallet/commit/d374979e): bump jsonrpc semver minor
* [`bed109b0`](https://github.com/decred/dcrwallet/commit/bed109b0): Add VSP URL to walletinfo result
* [`14c704a1`](https://github.com/decred/dcrwallet/commit/14c704a1): Batch rescan database updates
* [`fe3c447d`](https://github.com/decred/dcrwallet/commit/fe3c447d): lru: Implement Map type
* [`3b708125`](https://github.com/decred/dcrwallet/commit/3b708125): multi: Introduce --offline sync mode
* [`e4acd44b`](https://github.com/decred/dcrwallet/commit/e4acd44b): chain: Wait for dcrd to sync before starting RPC sync
* [`25b8ae63`](https://github.com/decred/dcrwallet/commit/25b8ae63): Prompt for account xpub imports at wallet creation
* [`4fbd29aa`](https://github.com/decred/dcrwallet/commit/4fbd29aa): chain: Fetch missing blocks one by one after initial getheaders
* [`e2b5adac`](https://github.com/decred/dcrwallet/commit/e2b5adac): Move a variable declaration to the only scope it is used
* [`a021248f`](https://github.com/decred/dcrwallet/commit/a021248f): Do not attempt publish of unsigned ticket purchases
* [`d5a07ae6`](https://github.com/decred/dcrwallet/commit/d5a07ae6): spv: fix unsafe waitgroup usage
* [`0ea06987`](https://github.com/decred/dcrwallet/commit/0ea06987): p2p: avoid strange context timeout wrapping
* [`88e59357`](https://github.com/decred/dcrwallet/commit/88e59357): rpc: return wrapped error.
* [`595de3bb`](https://github.com/decred/dcrwallet/commit/595de3bb): rpcserver: add missing error return
* [`b6295695`](https://github.com/decred/dcrwallet/commit/b6295695): p2p: do not retry failed outbound connections
* [`92b6b88a`](https://github.com/decred/dcrwallet/commit/92b6b88a): p2p: update the required minimum protocol version
* [`2e2ce259`](https://github.com/decred/dcrwallet/commit/2e2ce259): Drop Go 1.20 support
* [`bbb072e1`](https://github.com/decred/dcrwallet/commit/bbb072e1): wallet: Allow coin type upgrades on simnet
* [`2264d0ff`](https://github.com/decred/dcrwallet/commit/2264d0ff): wallet: Remove mainchain tip check on NeedsAccountsSync
* [`6cde2cc7`](https://github.com/decred/dcrwallet/commit/6cde2cc7): multi: Refactor wallet.NetworkBackend.
* [`5a412fb4`](https://github.com/decred/dcrwallet/commit/5a412fb4): Do not send reject messages for bad services
* [`ab6da249`](https://github.com/decred/dcrwallet/commit/ab6da249): Request more p2p addrs after peer checks
* [`3f77f1b1`](https://github.com/decred/dcrwallet/commit/3f77f1b1): Remove unused fadded parameter from spv rescan method
* [`1e6f8917`](https://github.com/decred/dcrwallet/commit/1e6f8917): enabled gettickets for rpc+spv
* [`3c1d19e1`](https://github.com/decred/dcrwallet/commit/3c1d19e1): wallet: Fix off-by-one in addr discovery
* [`b9fd1a79`](https://github.com/decred/dcrwallet/commit/b9fd1a79): spv: Request headers from peer after initial sync
* [`705569f2`](https://github.com/decred/dcrwallet/commit/705569f2): chain: Avoid early getHeaders on sidechains
* [`ab15d980`](https://github.com/decred/dcrwallet/commit/ab15d980): spv: Process header batches in parallel
* [`6693162d`](https://github.com/decred/dcrwallet/commit/6693162d): Use Go 1.19 atomic types
* [`14a2d7b8`](https://github.com/decred/dcrwallet/commit/14a2d7b8): Fix grpc log prefix stripping
* [`9873543d`](https://github.com/decred/dcrwallet/commit/9873543d): chain: Request block ntfns only after initial sync
* [`5c83e551`](https://github.com/decred/dcrwallet/commit/5c83e551): wallet: Prune chain instead of rooted tree
* [`66a3e69d`](https://github.com/decred/dcrwallet/commit/66a3e69d): spv: Add watchdog timer to cfilter fetching
* [`adba0d1c`](https://github.com/decred/dcrwallet/commit/adba0d1c): spv: Fetch CFilters from multiple peers
* [`41fc9432`](https://github.com/decred/dcrwallet/commit/41fc9432): p2p: Reduce number of goroutines in CFiltersV2()
* [`c61d89be`](https://github.com/decred/dcrwallet/commit/c61d89be): spv: Split cfilter fetching in smaller batches
* [`51c6c577`](https://github.com/decred/dcrwallet/commit/51c6c577): spv: Refactor initialSyncHeaders
* [`cee37c24`](https://github.com/decred/dcrwallet/commit/cee37c24): spv: Track requested block locator height
* [`38621ffe`](https://github.com/decred/dcrwallet/commit/38621ffe): spv: Request cfilters only for best chain
* [`284762f8`](https://github.com/decred/dcrwallet/commit/284762f8): multi: Drop Headers func from Peer interface
* [`8afcdefd`](https://github.com/decred/dcrwallet/commit/8afcdefd): spv: Move initial rescan to global syncer loop
* [`a9f0d247`](https://github.com/decred/dcrwallet/commit/a9f0d247): spv: Switch Rescan to use waitForRemote
* [`16457c76`](https://github.com/decred/dcrwallet/commit/16457c76): spv: Switch Blocks func to wait for peers
* [`0203f769`](https://github.com/decred/dcrwallet/commit/0203f769): spv: Drop syncer-global block locators
* [`eaaca07e`](https://github.com/decred/dcrwallet/commit/eaaca07e): spv: Fetch headers in syncer instead of peer startup
* [`6f510a51`](https://github.com/decred/dcrwallet/commit/6f510a51): spv: Disconnect from straggler peers
* [`10c7b17c`](https://github.com/decred/dcrwallet/commit/10c7b17c): spv: Remove peer disconnection logic
* [`5216b452`](https://github.com/decred/dcrwallet/commit/5216b452): p2p: Track last height returned by every peer
* [`18120068`](https://github.com/decred/dcrwallet/commit/18120068): spv: Move FetchMissingCFilter to syncer startup
* [`bef0b66f`](https://github.com/decred/dcrwallet/commit/bef0b66f): spv: Switch CFilters backend func to waitForRemote
* [`090267fa`](https://github.com/decred/dcrwallet/commit/090267fa): spv: Unify connectToPeer and connectToCandidate
* [`d9d3f17a`](https://github.com/decred/dcrwallet/commit/d9d3f17a): spv: Validate header chain diff earlier
* [`389bbe20`](https://github.com/decred/dcrwallet/commit/389bbe20): main: Use PEER for p2p logging
* [`0a63be64`](https://github.com/decred/dcrwallet/commit/0a63be64): Set complete=false in redeemmultisigout on invalid sigs
* [`de27db47`](https://github.com/decred/dcrwallet/commit/de27db47): wallet: Make validateHeaderChainDifficulties fulfill contract
* [`2056a303`](https://github.com/decred/dcrwallet/commit/2056a303): Semver unit tests for chain package
* [`541381ac`](https://github.com/decred/dcrwallet/commit/541381ac): wallet: Avoid recalculating BlockHash
* [`9603d38d`](https://github.com/decred/dcrwallet/commit/9603d38d): spv: Avoid re-hashing header
* [`87d237a7`](https://github.com/decred/dcrwallet/commit/87d237a7): p2p: Drop knownheaders cache
* [`4fb078d1`](https://github.com/decred/dcrwallet/commit/4fb078d1): spv: Move BlockNode init
* [`dba768a7`](https://github.com/decred/dcrwallet/commit/dba768a7): p2p: Ensure received headers connect to block locators
* [`947fcaf7`](https://github.com/decred/dcrwallet/commit/947fcaf7): wallet: Traverse by height in calcNextBlake256Diff
* [`49941c3d`](https://github.com/decred/dcrwallet/commit/49941c3d): Update bbolt to 1.3.8
* [`46ac6036`](https://github.com/decred/dcrwallet/commit/46ac6036): rpc: Don't use deprecated ioutil.
* [`09bb3c2c`](https://github.com/decred/dcrwallet/commit/09bb3c2c): vsp: Update to latest types/client.
* [`90232ed6`](https://github.com/decred/dcrwallet/commit/90232ed6): txrules: Consider DCP0012 in VSP fee calculations.
* [`44cce5eb`](https://github.com/decred/dcrwallet/commit/44cce5eb): gRPC: Update docker image for protobuf-builder.
* [`5c31b4b9`](https://github.com/decred/dcrwallet/commit/5c31b4b9): Replace interface{} with 'any' alias
* [`0faf51fd`](https://github.com/decred/dcrwallet/commit/0faf51fd): Use latest go1.21.x with github workflow
* [`a87fa843`](https://github.com/decred/dcrwallet/commit/a87fa843): multi: Select managed tickets outside VSP client
* [`e491c9c1`](https://github.com/decred/dcrwallet/commit/e491c9c1): vsp: Fix managed ticket selection bug.
* [`4211e567`](https://github.com/decred/dcrwallet/commit/4211e567): main: Log unhandled VSP client error.
* [`7fbedb9b`](https://github.com/decred/dcrwallet/commit/7fbedb9b): Always check context cancellation before publishing tix
* [`0be25dbc`](https://github.com/decred/dcrwallet/commit/0be25dbc): Log transaction changes for non-initial rescans
* [`a38abe28`](https://github.com/decred/dcrwallet/commit/a38abe28): multi: Always iterate over all VSP tickets.
* [`35c6ac0f`](https://github.com/decred/dcrwallet/commit/35c6ac0f): wallet: Fix VSP ticket iteration bug.
* [`3e3db0fc`](https://github.com/decred/dcrwallet/commit/3e3db0fc): vsp: Improve unknown FeeTxStatus log message.
* [`3c8cd477`](https://github.com/decred/dcrwallet/commit/3c8cd477): vsp: Dont remove payments unless confirmed by VSP.
* [`46ef8b6c`](https://github.com/decred/dcrwallet/commit/46ef8b6c): vsp: Move confirmPayment comment.
* [`a315791a`](https://github.com/decred/dcrwallet/commit/a315791a): wallet: Remove duplication from testing code.
* [`2911d856`](https://github.com/decred/dcrwallet/commit/2911d856): Make the LRU cache a generic container
* [`45fef04c`](https://github.com/decred/dcrwallet/commit/45fef04c): vsp: Calculate blocksUntilLive properly
* [`a2362ed2`](https://github.com/decred/dcrwallet/commit/a2362ed2): Add errors.Join
* [`2f646886`](https://github.com/decred/dcrwallet/commit/2f646886): Require Go 1.20, test 1.21 builds
* [`91c9697b`](https://github.com/decred/dcrwallet/commit/91c9697b): Remove errors.Cause, rely on Is/As instead
* [`765f2fd8`](https://github.com/decred/dcrwallet/commit/765f2fd8): Remove unused bottom field from errors.Error struct
* [`bfed19fe`](https://github.com/decred/dcrwallet/commit/bfed19fe): multi: Select unmanaged tickets outside VSP client
* [`41042e54`](https://github.com/decred/dcrwallet/commit/41042e54): Remove AddressReuse from wallet config
* [`19f7ed1e`](https://github.com/decred/dcrwallet/commit/19f7ed1e): vsp: Hard-code background context for async code.
* [`74fdfd04`](https://github.com/decred/dcrwallet/commit/74fdfd04): multi: Remove unnecessary ProcessTicket func.
* [`f8752a15`](https://github.com/decred/dcrwallet/commit/f8752a15): multi: Rename references to VSP funcs.
* [`b1ef2251`](https://github.com/decred/dcrwallet/commit/b1ef2251): vsp: Access logger instance through Client.
* [`01c09cbf`](https://github.com/decred/dcrwallet/commit/01c09cbf): vsp: Don't use a global logger.
* [`25c7b343`](https://github.com/decred/dcrwallet/commit/25c7b343): udb: Add tests for serializing VSP data.
* [`d6c3b29d`](https://github.com/decred/dcrwallet/commit/d6c3b29d): udb: Remove v25 upgrade test
* [`efededa9`](https://github.com/decred/dcrwallet/commit/efededa9): udb: Remove redundant VSP pubkey check.
* [`30e24f64`](https://github.com/decred/dcrwallet/commit/30e24f64): udb: Remove incorrect comment.
* [`0218809a`](https://github.com/decred/dcrwallet/commit/0218809a): spv: Drop extraneous tspend logging for txs
* [`1a098f7c`](https://github.com/decred/dcrwallet/commit/1a098f7c): Fix tests to account for Go 1.21 changes
* [`2c0284a0`](https://github.com/decred/dcrwallet/commit/2c0284a0): vsp: Reduce dependencies on wallet packages.
* [`1afe2512`](https://github.com/decred/dcrwallet/commit/1afe2512): multi: Bump major module version to 4


## Code Contributors (alphabetical order):

* @buck54321
* Dave Collins (@davecgh)
* David Hill (@dajohi)
* Jamie Holdstock (@jholdstock)
* @JoeGruffins
* Josh Rickmar (@jrick)
* Matheus Degiovani (@matheusd)
* Philip Obiora (@Philip-21)


# Decrediton v2.0.0

This is a minor Decrediton release that updates to use the new dcrwallet p2p 
mixing service and other various dependecies due to security issues and bugs.  
There were also large updates to the French and Chinese transalations.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.8.1...release-v2.0.0).


# 2023-10-06


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v1.8.1/decrediton-v1.8.1.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v1.8.1/decrediton-v1.8.1.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v1.8.1/decrediton-amd64-v1.8.1.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v1.8.1/decrediton-arm64-v1.8.1.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.8.1/decrediton-v1.8.1.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.8.1-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [dcrd](#dcrd-v181)
* [dcrwallet](#dcrwallet-v181)
* [Decrediton](#decrediton-v181)

# dcrd v1.8.1

This is a patch release of dcrd that includes some updates to the RPC server and
JSON-RPC API in light of the changes made by
[DCP0011](https://github.com/decred/dcps/blob/master/dcp-0011/dcp-0011.mediawiki) as follows:

* The `getblock` and `getblockheader` RPCs now have an additional `powhash`
  field for the new Proof-of-Work hash
* The `getnetworkhashps` RPC now treats -1 for the blocks parameter as the
  default number of blocks versus the previous behavior that is no longer
  applicable to the new difficulty ajustement algorithm

The RPC server version as of this release is 8.1.0.

## Changelog

This patch release consists of 5 commits from 2 contributors which total to 7
files changed, 47 additional lines of code, and 29 deleted lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/release-v1.8.0...release-v1.8.1).

### RPC:

- rpc: Add PoWHash to getblock/getblockheader (verbose) results ([decred/dcrd#3192](https://github.com/decred/dcrd/pull/3192))
- rpcserver: Modify getnetworkhashps -1 blocks logic ([decred/dcrd#3193](https://github.com/decred/dcrd/pull/3193))

### Developer-related package and module changes:

- jsonrpc/types: Add powhash to verbose block output ([decred/dcrd#3192](https://github.com/decred/dcrd/pull/3192))
- main: Use backported rpc types updates ([decred/dcrd#3192](https://github.com/decred/dcrd/pull/3192))

### Misc:

- release: Bump for 1.8.1 ([decred/dcrd#3194](https://github.com/decred/dcrd/pull/3194))

### Code Contributors (alphabetical order):

- Dave Collins
- Jonathan Chappelow


# dcrwallet v1.8.1

This release contains important bug fixes for VSP users.

## Bug fixes

* A warning is logged if a VSP fee payment could not be created due to a locked wallet ([`1c1bcfbd`](https://github.com/decred/dcrwallet/commit/1c1bcfbd)).

* VSP fee payments started by RPC requests are no longer cancelled early after the RPC returns ([`07854e37`](https://github.com/decred/dcrwallet/commit/07854e37)).

* The random duration interval during which ticket fee payment operations occur was fixed using the correct calculation of when a ticket goes live ([`c4c6c421`](https://github.com/decred/dcrwallet/commit/c4c6c421)).

* Fee payment confirmations are no longer assumed to be valid after they receive 6 confirmations, and the VSP is contacted to ensure that it has also confirmed the payment ([`7c551ce6`](https://github.com/decred/dcrwallet/commit/7c551ce6)).

* Block heights for ticket liveness and expiry are recalculated properly whenever unmined tickets are processed by the VSP client  ([`1319da0b`](https://github.com/decred/dcrwallet/commit/1319da0b)).

## New features

* The verbose `getblock` and `getblockheader` JSON-RPC results now include a `powhash` field with the hash calculated for the Proof-of-Work algorithm.

## Changelog

The following lists all commits since dcrwallet v1.8.0:

* [`1c1bcfbd`](https://github.com/decred/dcrwallet/commit/1c1bcfbd): vsp: Dont ignore locked wallet errs
* [`07854e37`](https://github.com/decred/dcrwallet/commit/07854e37): vsp: Hardcode background ctx
* [`c4c6c421`](https://github.com/decred/dcrwallet/commit/c4c6c421): vsp: Fix blocksUntilLive calc
* [`7c551ce6`](https://github.com/decred/dcrwallet/commit/7c551ce6): vsp: Only remove confirmed payments
* [`1319da0b`](https://github.com/decred/dcrwallet/commit/1319da0b): vsp: Recalculate live/expiry height
* [`bc7f095c`](https://github.com/decred/dcrwallet/commit/bc7f095c): Bump patch version for upcoming 1.8.1 release
* [`a02926a8`](https://github.com/decred/dcrwallet/commit/a02926a8): Update dcrd JSON-RPC types module
* [`7cb12ad4`](https://github.com/decred/dcrwallet/commit/7cb12ad4): Update decred dependencies

## Code Contributors (alphabetical order):

* Jamie Holdstock (@jholdstock)
* Josh Rickmar (@jrick)


# Decrediton v1.8.1

This is a minor Decrediton release that updates DEX to the most recent
release and fixes a few critical bugs.

## Bug fixes

* Fix response buffer size for logging into DEX on v1.8.0

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.8.0...release-v1.8.1).



# 2023-06-12


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v1.8.0/decrediton-v1.8.0.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v1.8.0/decrediton-v1.8.0.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v1.8.0/decrediton-amd64-v1.8.0.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v1.8.0/decrediton-arm64-v1.8.0.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.8.0/decrediton-v1.8.0.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.8.0-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [dcrd](#dcrd-v180)
* [dcrwallet](#dcrwallet-v180)
* [Decrediton](#decrediton-v180)

# dcrd v1.8.0

This is a new major release of dcrd.  Some of the key highlights are:

* Two new consensus vote agendas which allow stakeholders to decide whether or
  not to activate support for the following:
  * Changing the Proof-of-Work hashing algorithm to BLAKE3 and the difficulty algorithm to ASERT
  * Changing the Proof-of-Work and Proof-of-Stake subsidy split from 10%/80% to 1%/89%
* Separation of block hash from Proof-of-Work hash
* BLAKE3 CPU mining support
* Initial sync time reduced by about 20%
* Runtime memory management optimizations
* Faster cryptographic signature validation
* Low fee transaction rejection
* Unspent transaction output set size reduction
* No more checkpoints
* Improved network protocol message responsiveness
* Header proof commitment hash storage
* Address index removal
* Several CLI options deprecated
* Various updates to the RPC server:
  * Total coin supply output correction
  * More stable global communication over WebSockets
  * Winning ticket notifications when unsynced mining on test networks
  * Several other notable updates, additions, and removals related to the JSON-RPC API
* Infrastructure improvements
* Miscellaneous network and protocol optimizations
* Quality assurance changes

For those unfamiliar with the [voting process](https://docs.decred.org/governance/consensus-rule-voting/overview/) in Decred, all code needed in order to support each of the aforementioned consensus changes is already included in this release, however it will remain
dormant until the stakeholders vote to activate it.

For reference, the consensus change work was originally proposed and approved for initial implementation via the following Politeia proposal:
- [Change PoW/PoS Subsidy Split to 1/89 and Change PoW Algorithm to BLAKE3](https://proposals.decred.org/record/a8501bc)

The following Decred Change Proposals (DCPs) describe the proposed changes in detail and provide full technical specifications:
- [DCP0011: Change PoW to BLAKE3 and ASERT](https://github.com/decred/dcps/blob/master/dcp-0011/dcp-0011.mediawiki)
- [DCP0012: Change PoW/PoS Subsidy Split To 1/89](https://github.com/decred/dcps/blob/master/dcp-0012/dcp-0012.mediawiki)

## Upgrade Required

**It is extremely important for everyone to upgrade their software to this latest release even if you don't intend to vote in favor of the agenda.  This particularly applies to PoW miners as failure to upgrade will result in lost rewards after block height 777240.  That is estimated to be around June 29th, 2023.**

## Downgrade Warning

The database format in v1.8.0 is not compatible with previous versions of the software.  This only affects downgrades as users upgrading from previous versions will see a one time database migration.

Once this migration has been completed, it will no longer be possible to downgrade to a previous version of the software without having to delete the database and redownload the chain.

The database migration typically takes around 4-6 minutes on HDDs and 2-3 minutes on SSDs.

## Notable Changes

### Two New Consensus Change Votes

Two new consensus change votes are now available as of this release.  After upgrading, stakeholders may set their preferences through their wallet.

#### Change PoW to BLAKE3 and ASERT

The first new vote available as of this release has the id `blake3pow`.

The primary goals of this change are to:

* Increase decentralization of proof of work mining by obsoleting the current   specialized hardware (ASICs) that is only realistically available to the   existing highly centralized mining monopoly
* Improve the proof of work mining difficulty adjustment algorithm responsiveness * Provide more equal profitability to steady state PoW miners versus hit and run   miners

See the following for more details:

* [Politeia proposal](https://proposals.decred.org/record/a8501bc)
* [DCP0011](https://github.com/decred/dcps/blob/master/dcp-0011/dcp-0011.mediawiki)

#### Change PoW/PoS Subsidy Split to 1/89 Vote

The second new vote available as of this release has the id `changesubsidysplitr2`.

The proposed modification to the subsidy split in tandem with the change to the PoW hashing function is intended to break up the mining cartel and further improve decentralization of the issuance process.

See the following for more details:

* [Politeia proposal](https://proposals.decred.org/record/a8501bc)
* [DCP0012](https://github.com/decred/dcps/blob/master/dcp-0012/dcp-0012.mediawiki)

### Separation of Block Hash from Proof-of-Work Hash

A new Proof-of-Work (PoW) hash that is distinct from the existing block hash is now used for all consensus rules related to PoW verification.

Block hashes have historically served multiple roles which include those related to proof of work (PoW).  As of this release, the roles related to PoW are now solely the domain of the new PoW hash.

Some key points related to this change are:

* The new PoW hash will be exactly the same as the existing block hash for all blocks prior to the activation of the stakeholder vote to change the PoW hashing algorithm
* The block hash continues to use the existing hashing algorithm
* The block hash will no longer have the typical pattern of leading zeros upon activation of the PoW hashing algorithm
* The PoW hash will have the typical pattern of leading zeros both before and after the activation of the new PoW hashing algorithm

### BLAKE3 CPU Mining Support

The internal CPU miner has been significantly optimized to provide much higher hash rates, especially when using multiple cores, and now automatically mines using the BLAKE3 algorithm when the `blake3pow` agenda is active.

### Initial Sync Time Reduced by About 20%

The amount of time it takes to complete the initial chain synchronization process with default settings has been reduced by about 20% versus the previous release.

### Runtime Memory Management Optimizations

The way memory is managed has been optimized to provide performance enhancements to both steady-state operation as well as the initial chain sync process.

The primary benefits are:

* Lower maximum memory usage during transient periods of high demand
* Approximately a 10% reduction to the duration of the initial sync process
* Significantly reduced overall total memory allocations (~42%)
* Less overall CPU usage for the same amount of work

### Faster Cryptographic Signature Validation

Similar to the previous release, this release further improves some aspects of the underlying crypto code to increase its execution speed and reduce the number of memory allocations.  The overall result is a 52% reduction in allocations and about a 1% reduction to the verification time for a single signature.

The primary benefits are:

* Improved vote times since blocks and transactions propagate more quickly throughout the network
* Approximately a 4% reduction to the duration of the initial sync process

### Low Fee Transaction Rejection

The default transaction acceptance and relay policy is no longer based on priority and instead now immediately rejects all transactions that do not pay the minimum required fee.

This provides a better user experience for transactions that do not pay enough fees.

For some insight into the motivation for this change prior to the introduction of support for child pays for parent (CPFP), it was possible for transactions to essentially become stuck forever if they didn't pay a high enough fee for miners to include them in a block.

In order to prevent this, a policy was introduced that allowed relaying transactions that do not pay enough fees based on a priority calculated from the fee as well as the age of coins being spent.  The result is that the priority slowly increased over time as the coins aged to ensure such transactions would eventually be relayed and mined.  In order to prevent abuse the behavior could otherwise allow, the policy also included additional rate-limiting of these types of transactions.

While the policy served its purpose, it had some downsides such as:

* A confusing user experience where transactions that do not pay enough fees and also are not old enough to meet the dynamically changing priority requirements are rejected due to having insufficient priority instead of not paying enough fees as the user might expect
* The priority requirements dynamically change over time which leads to non-deterministic behavior and thus ultimately results in what appear to be intermittent/transient failures to users

The policy is no longer necessary or desirable given such transactions can now use CPFP to increase the overall fee of the entire transaction chain thereby ensuring they are mined.

### Unspent Transaction Output Set Size Reduction

The set of all unspent transaction outputs (UTXO set) no longer contains unspendable `treasurybase` outputs.

A `treasurybase` output is a special output that increases the balance of the decentralized treasury account which requires stakeholder approval to spend funds.  As a result, they do not operate like normal transaction outputs and therefore are never directly spendable.

Removing these unspendable outputs from the UTXO set reduces its overall size.

### No More Checkpoints

This release introduces a new model for deciding when to reject old forks to make use of the hard-coded assumed valid block that is updated with each release to a recent block thereby removing the final remaining usage of checkpoints.

Consequently, the `--nocheckpoints` command-line option and separate `findcheckpoints` utility have been removed.

### Improved Network Protocol Message Responsiveness (`getheaders`/`getcfilterv2`)

All protocol message requests for headers (`getheaders`) and version 2 compact filters (`getcfilterv2`) will now receive empty responses when there is not any available data or the peer is otherwise unwilling to serve the data for a variety of reasons.

For example, a peer might be unwilling to serve data because they are still performing the initial sync or temporarily no longer consider themselves synced with the network due to recently coming back online after being unable to communicate with the network for a long time.

This change helps improve network robustness by preventing peers from appearing unresponsive or stalled in such cases.

### Header Proof Commitment Hash Storage

The individual commitment hashes covered by the commitment root field of the header of each block are now stored in the database for fast access.  This provides better scaling for generating and serving inclusion proofs as more commitments are added to the header proof in future upgrades.

### Address Index Removal (`--addrindex`, `--dropaddrindex`)

The previously deprecated optional address index that could be enabled via `--addrindex` and removed via `--dropaddrindex` is no longer available.  All of the information previously provided from the address index, and much more, is available via [dcrdata](https://github.com/decred/dcrdata/).

### Several CLI Options Deprecated

The following CLI options no longer have any effect and are now deprecated:

* `--norelaypriority`
* `--limitfreerelay`
* `--blockminsize`
* `--blockprioritysize`

They will be removed in a future release.

### RPC Server Changes

The RPC server version as of this release is 8.0.0.

#### Total Coin Supply Output Correction (`getcoinsupply`)

The total coin supply reported by `getcoinsupply` will now correctly include the coins generated as a part of the block reward for the decentralized treasury as intended.

As a result, the amount reported will now be higher than it was previously.  It is important to note that this issue was only an RPC display issue and did not affect consensus in any way.

#### More Stable Global Communication over WebSockets

WebSocket connections now have longer timeouts and remain connected through transient network timeouts.  This significantly improves the stability of high-latency connections such as those communicating across multiple continents.

#### Winning Ticket Notifications when Unsynced Mining on Test Networks (`winningtickets`)

Clients that subscribe to receive `winningtickets` notifications via WebSockets with `notifywinningtickets` will now also receive the notifications on test networks prior to being fully synced when the `--allowunsyncedmining` CLI option is provided.

See the following for API details:

* [notifywinningtickets JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#notifywinningtickets)
* [winningtickets JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#winningtickets)

#### Transaction Fee Priority Fields on Mempool RPC Deprecated (`getrawmempool`)

Due to the removal of the policy related to low fee transaction priority, the `startingpriority` and `currentpriority` fields of the results of the verbose output of the `getrawmempool` RPC are now deprecated.  They will always be set to 0 and are scheduled to be removed in a future version.

See the [getrawmempool JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getrawmempool) for API details.

#### Removal of Raw Transaction Search RPC (`searchrawtransactions`)

The deprecated `searchrawtransactions` RPC, which could previously be used to obtain all transactions that either credit or debit a given address via RPC is no longer available.

Callers that wish to access details related to addresses are encouraged to use [dcrdata](https://github.com/decred/dcrdata/) instead.

#### Removal of Address Index Status Field on Info RPC (`getinfo`)

The `addrindex` field of the `getinfo` RPC is no longer available.

See the [getinfo JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getinfo) for API details.

#### Removal of Missed and Expired Ticket RPCs

Now that missed and expired tickets are automatically revoked by the consensus rules, all RPCs related to querying and requesting notifications for missed and expired tickets are no longer available.

In particular, the following deprecated RPCs are no longer available:

* `missedtickets`
* `rebroadcastmissed`
* `existsmissedtickets`
* `existsexpiredtickets`
* `notifyspentandmissedtickets`

#### Updates to Work RPC (`getwork`)

The `getwork` RPC will now return an error message immediately if block template generation is temporarily unable to generate a template indicating the reason.  Previously, the RPC would block until a new template was eventually generated which could potentially be an exceedingly long time.

Additionally, cancelling a `getwork` invocation before the work has been fully generated will now cancel the underlying request which allows the RPC server to immediately service other queued work requests.

See the [getwork JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getwork) for API details.

## Changelog

This release consists of 439 git commits from 18 contributors which total to 408 files changed, 25840 additional lines of code, and 22871 deleted lines of code.

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v1.7.7...release-v1.8.0).

See [dcrd's own release notes](https://github.com/decred/dcrd/releases/tag/release-v1.8.0) for a categorized breakdown of all commits since the last release.

### Code Contributors (alphabetical order):

- Abirdcfly
- Dave Collins
- David Hill
- Donald Adu-Poku
- Eng Zer Jun
- Jamie Holdstock
- JoeGruff
- Jonathan Chappelow
- Josh Rickmar
- Julian Y
- Matheus Degiovani
- Ryan Staudt
- Sef Boukenken
- arjundashrath
- matthawkins90
- norwnd
- peterzen
- 刘昆

# dcrwallet v1.8.0

This release enables the votes for and implements the necessary features to follow the upcoming hard forks described by DCP0011 and DCP0012.  As always, other minor feature additions and bug fixes have been included.

## Bug fixes

* Manual ticket revocations are no longer performed by the VSP client ([`c9fc99b2`](https://github.com/decred/dcrwallet/commit/c9fc99b2)).

* A data race on the fee transaction pointer in the VSP client was corrected ([`a8f2b058`](https://github.com/decred/dcrwallet/commit/a8f2b058)).

* VSP options in the config file are validated at startup to prevent invalid configurations that do not specify all required settings ([`6cc8d053`](https://github.com/decred/dcrwallet/commit/6cc8d053)).

* Ticket purchasing performed through the JSON-RPC server now respects the configured maximum VSP fee ([`a19dcb43`](https://github.com/decred/dcrwallet/commit/a19dcb43)).

* A data race on rescanned block hashes in SPV mode was corrected ([`dfcac12f`](https://github.com/decred/dcrwallet/commit/dfcac12f)).

* New addresses can no longer be generated and returned externally for an imported voting account.  This does not affect address generation when paying to voting account addresses during ticket buying ([`d9945563`](https://github.com/decred/dcrwallet/commit/d9945563)).

## New features

* Blocks are now validated according to either the initial proof-of-work algorithm or the difficulty and proof-of-work hash algorithm specified by DCP0011 ([`3a52f00a`](https://github.com/decred/dcrwallet/commit/3a52f00a)).

* Votes created by the wallet will use the subsidy split described by DCP0012 if the agenda is active ([`8374bd52`](https://github.com/decred/dcrwallet/commit/8374bd52)).

* Mixed ticket purchasing now trickles the ticket purchases with random delays to harden against profiling specific buyers by their ticket timings ([`e71decbd`](https://github.com/decred/dcrwallet/commit/e71decbd)).

* Mixed ticket purchasing was implemented by the `WalletService.PurchaseTickets` gRPC method ([`5b6ab6da`](https://github.com/decred/dcrwallet/commit/5b6ab6da), [`4c697648`](https://github.com/decred/dcrwallet/commit/4c697648)).

* A `WalletService.Address` gRPC method was added to query the wallet for details about its addresses ([`80a0e716`](https://github.com/decred/dcrwallet/commit/80a0e716), [`a333c1f5`](https://github.com/decred/dcrwallet/commit/a333c1f5)).

* A `WalletService.DumpPrivateKey` gRPC method was added to dump private keys of wallet addresses ([`c609d558`](https://github.com/decred/dcrwallet/commit/c609d558), [`12b9c552`](https://github.com/decred/dcrwallet/commit/12b9c552)).

* A `VotingService.SetTSpendPolicy` gRPC method was added to set a voting policy for a specific TSpend transaction.  A `VotingService.TSpendPolicies` gRPC method was added to query the voting policies of these specific TSpends ([`7352c1cb`](https://github.com/decred/dcrwallet/commit/7352c1cb)).

* In SPV mode, TSpends now fetched at wallet startup ([`eab54c36`](https://github.com/decred/dcrwallet/commit/eab54c36)).

* A `--cpuprofile` config flag was added to write a pprof CPU profile for the entire process execution.  The `--memprofile` flag was changed to also profile the entire process execution rather than stopping after 5 minutes ([`39a379eb`](https://github.com/decred/dcrwallet/commit/39a379eb)).

* An additional newline character is no longer required when providing the seed during seed restore when entering seeds in hexadecimal form ([`f31e848f`](https://github.com/decred/dcrwallet/commit/f31e848f)).

* The passphrase confirmation can now be piped during the `--create` prompts ([`dd93c2f6`](https://github.com/decred/dcrwallet/commit/dd93c2f6)).

## Changelog

The following lists all commits included in dcrwallet v1.8.0 that were not backported to a prior 1.7.x release:

* [`e71decbd`](https://github.com/decred/dcrwallet/commit/e71decbd): Trickle tickets during mixed buying
* [`82f59828`](https://github.com/decred/dcrwallet/commit/82f59828): Update version prerelease and metadata for release-v1.8 branch
* [`92529a4b`](https://github.com/decred/dcrwallet/commit/92529a4b): Prepare v1.8.0 release
* [`3a52f00a`](https://github.com/decred/dcrwallet/commit/3a52f00a): Validate that blocks satisfy either V1 or V2 PoW
* [`85b48444`](https://github.com/decred/dcrwallet/commit/85b48444): Bump deps.
* [`96817277`](https://github.com/decred/dcrwallet/commit/96817277): Remove features marked deprecated
* [`8374bd52`](https://github.com/decred/dcrwallet/commit/8374bd52): Follow DCP0012 once activated.
* [`99be2039`](https://github.com/decred/dcrwallet/commit/99be2039): Remove jsonrpc/types module replacement
* [`1683d3ae`](https://github.com/decred/dcrwallet/commit/1683d3ae): multi: Fix "the the" comment typos.
* [`c9fc99b2`](https://github.com/decred/dcrwallet/commit/c9fc99b2): vsp: Don't revoke tickets.
* [`a8f2b058`](https://github.com/decred/dcrwallet/commit/a8f2b058): vsp: Add missing mutex locks.
* [`b6467521`](https://github.com/decred/dcrwallet/commit/b6467521): multi: Introduce AgendaChoices type.
* [`816f16d6`](https://github.com/decred/dcrwallet/commit/816f16d6): vsp: Don't export Policy.
* [`d95475b1`](https://github.com/decred/dcrwallet/commit/d95475b1): vsp: Unparam Policy.
* [`bf8e7a09`](https://github.com/decred/dcrwallet/commit/bf8e7a09): vsp: Don't export Wallet.
* [`6cc8d053`](https://github.com/decred/dcrwallet/commit/6cc8d053): Validate VSP configs on startup.
* [`a19dcb43`](https://github.com/decred/dcrwallet/commit/a19dcb43): jsonrpc: Respect configured VSPMaxFee.
* [`c6933a35`](https://github.com/decred/dcrwallet/commit/c6933a35): Move logger subsystem variables to internal package
* [`7cd8248f`](https://github.com/decred/dcrwallet/commit/7cd8248f): linter: fixes
* [`72eefbed`](https://github.com/decred/dcrwallet/commit/72eefbed): Revert unintentional context change from previous commit
* [`dc38eb65`](https://github.com/decred/dcrwallet/commit/dc38eb65): Unexport wallet SaveRescanned method
* [`0aeb02cd`](https://github.com/decred/dcrwallet/commit/0aeb02cd): vsp: Use client provided by vspd package.
* [`89623dc9`](https://github.com/decred/dcrwallet/commit/89623dc9): build: Test against Go 1.20
* [`69d8b47b`](https://github.com/decred/dcrwallet/commit/69d8b47b): multi: linter cleanup
* [`dfcac12f`](https://github.com/decred/dcrwallet/commit/dfcac12f): Avoid spv data race on rescanned block hashes
* [`86898358`](https://github.com/decred/dcrwallet/commit/86898358): Bump remaining golang.org/x/* modules
* [`e89da321`](https://github.com/decred/dcrwallet/commit/e89da321): Bump golang.org/x/sys module
* [`904a6db4`](https://github.com/decred/dcrwallet/commit/904a6db4): cmd: update to latest deps
* [`5b6ab6da`](https://github.com/decred/dcrwallet/commit/5b6ab6da): multi: Modify PurchaseTickets method.
* [`4c697648`](https://github.com/decred/dcrwallet/commit/4c697648): rpc: Add parameters to PurchaseTickets.
* [`c609d558`](https://github.com/decred/dcrwallet/commit/c609d558): server: Add DumpPrivateKey.
* [`12b9c552`](https://github.com/decred/dcrwallet/commit/12b9c552): rpc: Add DumpPrivateKey method type.
* [`80a0e716`](https://github.com/decred/dcrwallet/commit/80a0e716): server: Add Address method.
* [`a333c1f5`](https://github.com/decred/dcrwallet/commit/a333c1f5): rpc: Add address method type.
* [`eab54c36`](https://github.com/decred/dcrwallet/commit/eab54c36): Fetch tspends in SPV mode
* [`39a379eb`](https://github.com/decred/dcrwallet/commit/39a379eb): dcrwallet: Add --cpuprofile option
* [`7352c1cb`](https://github.com/decred/dcrwallet/commit/7352c1cb): rpc: Add TSpendPolicies and SetTSpendPolicy requests
* [`f31e848f`](https://github.com/decred/dcrwallet/commit/f31e848f): Do not require additional newline prompting a hex seed
* [`dd93c2f6`](https://github.com/decred/dcrwallet/commit/dd93c2f6): Allow passphrase confirmation to be read from non-tty
* [`566eff83`](https://github.com/decred/dcrwallet/commit/566eff83): multi: Remove some unused code
* [`183083d6`](https://github.com/decred/dcrwallet/commit/183083d6): multi: Update dcrd pkgs to wip major versions
* [`5e7d5e73`](https://github.com/decred/dcrwallet/commit/5e7d5e73): multi: Bump major module version to 3
* [`b16f7ca0`](https://github.com/decred/dcrwallet/commit/b16f7ca0): vsp: Pass the context to feepayment instead of creating a new one.
* [`fe1bb25f`](https://github.com/decred/dcrwallet/commit/fe1bb25f): tests:  Use a single context in tests.
* [`3b3e9e04`](https://github.com/decred/dcrwallet/commit/3b3e9e04): build: Test against Go 1.19
* [`3d518eab`](https://github.com/decred/dcrwallet/commit/3d518eab): whack a comment
* [`ed842ec8`](https://github.com/decred/dcrwallet/commit/ed842ec8): Run go fmt from Go 1.19 over the tree
* [`7cdfb44a`](https://github.com/decred/dcrwallet/commit/7cdfb44a): Bump development version
* [`4ed5a4c6`](https://github.com/decred/dcrwallet/commit/4ed5a4c6): Prevent panic in RPC-mode getstakeinfo
* [`4c162c4f`](https://github.com/decred/dcrwallet/commit/4c162c4f): Fix compatibility with latest development dcrd
* [`04d8d0f6`](https://github.com/decred/dcrwallet/commit/04d8d0f6): Fix regen.sh return code if $UID is unset
* [`736efd2a`](https://github.com/decred/dcrwallet/commit/736efd2a): Make default fee amount constant more readable
* [`185f9cd7`](https://github.com/decred/dcrwallet/commit/185f9cd7): Update to latest gRPC
* [`4941af16`](https://github.com/decred/dcrwallet/commit/4941af16): Updates for Go 1.18
* [`80bcd2f3`](https://github.com/decred/dcrwallet/commit/80bcd2f3): Switch away from deprecated terminal package
* [`d9945563`](https://github.com/decred/dcrwallet/commit/d9945563): wallet: No taking voting addresses.

## Code Contributors (alphabetical order):

* Alex Yocom-Piatt (@alexlyp)
* @bgptr
* Dave Collins (@davecgh)
* David Hill (@dajohi)
* Jamie Holdstock (@jholdstock)
* @JoeGruffins
* Josh Rickmar (@jrick)
* Matheus Degiovani (@matheusd)
* @norwnd

# Decrediton v1.8.0

This release of Decrediton includes numerous bug fixes and refinement across
all pages/tabs.

* All pages have had layouts and styling updated to match redesign specs. There
  are a few more pages that will receive design updates.  Trezor pages
  were recently updated and Ledger integration is currently on schedule and
  should be included in an upcoming release in the near future.

* DCRDEX is now at 0.6.1 and has included numerous improvements, as well as new 
  assets to be able to trade.  There are more exciting updates in the future 
  for DCRDEX as laid out in the recently approved 
  [proposal](https://proposals.decred.org/record/4d2324b).  

* Test coverage has also increased to cover most of the front-end areas. 
  Hopefully, in a few more releases we'll have the entirity of Decrediton 
  covered with unit tests that should protect us from most regression errors.

* The ability to vote on all treasury spending is now active.  This can be 
  done by approving/dis-approving all treasury spending or spending can be voted
  on per transaction.  

* Legacy tickets and references to stakepool have been completely removed from
  the codebase.  

## Code Contributors (alphabetical order)

* Alex Yocom-Piatt
* Amir Massarwa
* artikozel
* bgptr
* Joe Gruffins
* Jonathan Chappelow
* Jonathan Zeppettini
* Matheus Degiovani
* tiagoalvesdulce

# 2022-04-10


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v1.7.7/decrediton-v1.7.7.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v1.7.7/decrediton-v1.7.7.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v1.7.7/decrediton-amd64-v1.7.7.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v1.7.7/decrediton-arm64-v1.7.7.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.7.7/decrediton-v1.7.7.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.7.7-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [dcrd](#dcrd-v177)
* [dcrwallet](#dcrwallet-v177)
* [Decrediton](#decrediton-v177)


# dcrd v1.7.7

This is a patch release of dcrd that includes the following changes:

- Use the latest network protocol version
- Reduce bandwidth usage in certain scenarios by avoiding requests for inventory that is already known
- Mitigate excessive CPU usage in some rare scenarios specific to the test network
- Improve best address candidate selection efficiency

## Changelog

This patch release consists of 19 commits from 3 contributors which total to 92
files changed, 1357 additional lines of code, and 1191 deleted lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/release-v1.7.5...release-v1.7.7).

### Protocol and network:

- peer: Use latest pver by default ([decred/dcrd#3083](https://github.com/decred/dcrd/pull/3083))
- peer: Correct known inventory check ([decred/dcrd#3083](https://github.com/decred/dcrd/pull/3083))

### Documentation:

- peer: Go 1.19 doc comment formatting ([decred/dcrd#3083](https://github.com/decred/dcrd/pull/3083))
- addrmgr: Go 1.19 doc comment formatting ([decred/dcrd#3084](https://github.com/decred/dcrd/pull/3084))
- multi: Go 1.19 doc comment formatting ([decred/dcrd#3087](https://github.com/decred/dcrd/pull/3087))
- docs: Update README.md to required Go 1.19/1.20 ([decred/dcrd#3087](https://github.com/decred/dcrd/pull/3087))

### Developer-related package and module changes:

- peer: Support module graph prune and lazy load ([decred/dcrd#3083](https://github.com/decred/dcrd/pull/3083))
- main: Use backported peer updates ([decred/dcrd#3083](https://github.com/decred/dcrd/pull/3083))
- addmrgr: Use TempDir to create temp test dirs ([decred/dcrd#3084](https://github.com/decred/dcrd/pull/3084))
- addrmgr: Support module graph prune and lazy load ([decred/dcrd#3084](https://github.com/decred/dcrd/pull/3084))
- addrmgr: Break after selecting random address ([decred/dcrd#3084](https://github.com/decred/dcrd/pull/3084))
- addrmgr: Set min value and optimize address chance ([decred/dcrd#3084](https://github.com/decred/dcrd/pull/3084))
- main: Use backported addrmgr updates ([decred/dcrd#3084](https://github.com/decred/dcrd/pull/3084))
- main: Update to use latest sys module ([decred/dcrd#3087](https://github.com/decred/dcrd/pull/3087))

### Testing and Quality Assurance:

- build: Enable run_tests.sh to work with go.work ([decred/dcrd#3087](https://github.com/decred/dcrd/pull/3087))
- build: Update to latest action versions ([decred/dcrd#3087](https://github.com/decred/dcrd/pull/3087))
- build: Update golangci-lint to v1.51.1 ([decred/dcrd#3087](https://github.com/decred/dcrd/pull/3087))
- build: Test against Go 1.20 ([decred/dcrd#3087](https://github.com/decred/dcrd/pull/3087))

### Misc:

- release: Bump for 1.7.7 ([decred/dcrd#3085](https://github.com/decred/dcrd/pull/3085))

### Code Contributors (alphabetical order):

- Dave Collins
- Eng Zer Jun
- Jonathan Chappelow


# dcrwallet v1.7.7

This release includes many bug fixes and performance improvements that, in
particular, benefits ticketbuying and other heavily-used wallets that contain
many transactions.

## Bug fixes

* A deadlock during address discovery was corrected.

* SPV peer selection no longer requires excessive CPU usage when few quality
  peers are known.

* A data race during rescanning in SPV mode was corrected.

* A logic race that could result in failing to watch addresses after purchasing
  tickets, and subsequently missing transactions paying to these addresses, was
  corrected.

* A duplicate log message when failing to watch addresses after purchasing
  tickets was removed.

* Account balances are no longer calculated by the automatic ticket buyer if the
  `ticketbuyer.balancetomaintainabsolute` flag is unset or zero.  Calculating
  balances is a expensive operation on wallets with many transactions, and
  avoiding this unnecessary task can provide a significant performance boost.

* The hardcoded maximum number of UTXOs that can be concurrently mixed during
  account mixing was removed and replaced with a maximum value that scales with
  the `mixsplitlimit` config option.

* Mixed ticket buying and account mixing no longer creates change that is
  smaller than the minimum amount needed to mix a UTXO at the smallest common
  demonination during change account mixing.  Previously, change that was too
  small to mix was only discarded (i.e. included in the transaction fee) during
  mixing at the smallest common denomination.

## New features

* A `watchlast` config setting was included to configure the maximum number of
  recent addresses on an account branch are watched at startup.

* A new UTXO selection algorithm was implemented to pick UTXOs at random.
  Previously, randomization was implemented by reading all UTXOs into memory and
  shuffling.  The new algorithm reads UTXOs from the database directly without
  needing to read all UTXOs into memory, which provides both performance and
  memory improvements over the previous algorithm.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.7.5...release-v1.7.7).


# Decrediton v1.7.7

This release includes a various new features and bug fixes. Users are now able
to choose individually on each TSpend instead of by pubkey.  Launcher views have
been totally revamped and improved.  Trezor views have also had an improved
UX introduced.  And last but not least, DEX has been upgraded to 0.6.0 which
now allows for trading with ETH.  

## New Features

* DEX has been updated to 0.6.0 which now allows access to the dcr-eth trading
  pair.   You can find the full rundown of improvements to DEX for 0.6.0 [here](https://github.com/decred/dcrdex/blob/master/docs/release-notes/release-notes-0.6.0.md).

* TSpends can now be voted on individually instead of by the overall signing
  pubkey.  This gives stakeholders more control over their voting rights when
  it comes to treasury expenditures.

* Launching views have been redesigned and should allow for more interactity and
  learning while waiting for the wallet to fully load in.  Ideally this should
  reduce the number of support questions we receive overall.

* Trezor wallet creation views have been fully revamped and should allow
  for a much better user experience.  The new views can be seen [here](https://github.com/decred/decrediton/pull/3570).

  
## Bug fixes

* Resend vote choices to recently updated VSPs.  If a user updates their local
  vote preference before the VSP that controls their ticket, this was required
  to ensure that the User's vote choices were maintained after they update to 
  the new version.

* Fix Dex Window not launching after wallet reload.

* Speed up and refine wallet start up process.  There were a few extraneous
  processes that were occurring durign startup that could cause delays in the
  wallet fully opening.

* Fix an issue with the send form that would cause incorrect amounts to be used
  as the final value.  Eg.  User enters 50 to send, but only would register 5.

* Fix time remaining estimation during block syncing.

* Fix various minor CSS issues throughout.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.7.6...release-v1.7.7).





# 2022-11-16


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v1.7.6/decrediton-v1.7.6.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v1.7.6/decrediton-v1.7.6.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v1.7.6/decrediton-amd64-v1.7.6.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v1.7.6/decrediton-arm64-v1.7.6.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.7.6/decrediton-v1.7.6.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.7.6-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [Decrediton](#decrediton-v176)

# Decrediton v1.7.6

This is a small release that contains no changes to the Decrediton base, but 
fixes an issue with the underlying DEX.  This also fixes an issue with 
Decrediton v1.7.5 on Windows resolving alternative DNS servers (8.8.8.8 etc).

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.7.5...release-v1.7.6).

## Code Contributors (alphabetical order)

- Jonathan Chappelow (@chappjc)


# 2022-10-12


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v1.7.5/decrediton-v1.7.5.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v1.7.5/decrediton-v1.7.5.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v1.7.5/decrediton-amd64-v1.7.5.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v1.7.5/decrediton-arm64-v1.7.5.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.7.5/decrediton-v1.7.5.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.7.5-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.


## Contents
* [dcrd](#dcrd-v175)
* [dcrwallet](#dcrwallet-v175)
* [Decrediton](#decrediton-v175)

# dcrd v1.7.5

This is a patch release of dcrd that updates the utxo cache to improve its
robustness, optimize it, and correct some hard to hit corner cases that involve
a mix of manual block invalidation, conditional flushing, and successive unclean
shutdowns.

## Changelog

This patch release consists of 19 commits from 1 contributor which total to 13
files changed, 1118 additional lines of code, and 484 deleted lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/a2c3c656...release-v1.7.5).

### Developer-related package and module changes:

- blockchain: Misc consistency cleanup pass ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Pre-allocate in-flight utxoview tx map ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Remove unused utxo cache add entry err ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Fix rare unclean utxo cache recovery ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Don't fetch trsy{base,spend} inputs ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Don't add treasurybase utxos ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Separate utxo cache vs view state ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Improve utxo cache spend robustness ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Split regular/stake view tx connect ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Bypass utxo cache for zero conf spends ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- main: Use backported blockchain updates ([decred/dcrd#3007](https://github.com/decred/dcrd/pull/3007))

### Testing and Quality Assurance:

- blockchain: Address some linter complaints ([decred/dcrd#3005](https://github.com/decred/dcrd/pull/3005))
- blockchain: Allow tests to override cache flushing ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Improve utxo cache initialize tests ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Consolidate utxo cache test entries ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Rework utxo cache spend entry tests ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Rework utxo cache commit tests ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))
- blockchain: Rework utxo cache add entry tests ([decred/dcrd#3006](https://github.com/decred/dcrd/pull/3006))

### Misc:

- release: Bump for 1.7.5 ([decred/dcrd#3008](https://github.com/decred/dcrd/pull/3008))

### Code Contributors (alphabetical order):

- Dave Collins

# dcrwallet v1.7.5

This release includes minor fixes and improvements for the wallet.

In addition to the fixes and new features listed below, the wallet has also been
updated to follow the TestNet3 hard fork which throttles the difficulty changes
allowed as hashpower is quickly increased on the network.  This was an unvoted
hard fork that only affects the test network, and all users of the test network
must upgrade.

## Bug fixes

* The SFNodeCF service flag was removed from the required services of nodes
  connected to in SPV mode.  Version 2 compact filters are now required by
  consensus rules and there is no service flag to identify their support.

* An issue preventing the `signrawtransaction` JSON-RPC method from using
  private keys in the request parameters was corrected.

* The automated ticket buyer no longer attempts to mix change if the
  StakeShuffle server is not specified in the application config
  (`--csppserver`) or the gRPC requests that started the buyer.

## New features

* The gRPC methods `VotingService.TreasuryPolicies` and
  `VotingService.SetTreasuryPolicies` were added for gRPC clients to be able to
  view and set the treasury voting policies of a ticket with VSPs.

* An `importpubkey` JSON-RPC method was introduced to import raw secp256k1
  public keys and their derived P2PKH address to the `imported` account.  This
  method is only usable on watching-only wallets.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.7.2...release-v1.7.5).

## Code Contributors (alphabetical order)

* bgptr
* Dave Collins
* David Hill
* Josh Rickmar
* Matheus Degiovani


# Decrediton v1.7.5

This release is mainly due to a critical fix that was included in DEX 0.5.4.  

There are other small bug fixes and improvements included as well.
## Bug fixes

* Fix never ending loading button on Treasury Spending tab.

* Add Ticket Spent entry to the Revocation tx details page.

* Fix placeholder size in TextInput

* Rename cspp to StakeShuffle throughout.

* Refresh DEX window with F5 key now working as expected.

* Add testnet PiKeys on testnet for treasury spending tab.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.7.3...release-v1.7.5).

## Code Contributors (alphabetical order)

* Alex Yocom-Piatt
- bgptr
- Jonathan Chappelow (@chappjc)


# 2022-05-18


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v1.7.3/decrediton-v1.7.3.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v1.7.3/decrediton-v1.7.3.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v1.7.3/decrediton-amd64-v1.7.3.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v1.7.3/decrediton-arm64-v1.7.3.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.7.3/decrediton-v1.7.3.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.7.2-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.

## Contents
* [Decrediton](#decrediton-v173)


# Decrediton v1.7.3

This is a small patch release that fixes an issue with macOS 10.15 (Catalina)
not being able to launch dcrd and dcrwallet properly.  

We also fixed an issue with updating Treasury Spending failing due to 
dcrwallet not having an rpc implemented.

A couple other minor styling issues that were found in v1.7.2 were fixed as well.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.7.2...release-v1.7.3).

## Code Contributors (alphabetical order)

- Alex Yocom-Piatt
- bgptr


# 2022-05-11


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v1.7.2/decrediton-v1.7.2.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v1.7.2/decrediton-v1.7.2.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v1.7.2/decrediton-amd64-v1.7.2.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v1.7.2/decrediton-arm64-v1.7.2.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.7.2/decrediton-v1.7.2.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.7.2-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.


## Contents
* [dcrd](#dcrd-v172)
* [dcrwallet](#dcrwallet-v172)
* [Decrediton](#decrediton-v172)

# dcrd v1.7.2

This is a patch release of dcrd to resolve a rare and hard to hit case when optional indexing is enabled.

## Changelog

This patch release consists of 4 commits from 2 contributors which total to 11 files changed, 158 additional lines of code, and 15 deleted lines of code.

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v1.7.1...release-v1.7.2) and [here](https://github.com/decred/dcrd/compare/blockchain/v4.0.0...blockchain/v4.0.1).

### Protocol and network:

- server: Fix syncNotified race ([decred/dcrd#2931](https://github.com/decred/dcrd/pull/2931))

### Developer-related package and module changes:

- indexers: fix subscribers race ([decred/dcrd#2921](https://github.com/decred/dcrd/pull/2921))
- main: Use backported blockchain updates ([decred/dcrd#2935](https://github.com/decred/dcrd/pull/2935))

### Misc:

- release: Bump for 1.7.2 ([decred/dcrd#2936](https://github.com/decred/dcrd/pull/2936))

### Code Contributors (alphabetical order):

- Dave Collins
- Donald Adu-Poku

# dcrwallet v1.7.2

This release updates the wallet in light of the activation of DCP0009 on all
Decred networks, as well as providing various other fixes.

## Bug fixes

* All ticket revoking functionality has been removed or disabled due to the
  activation of DCP0009 which modified consensus rules to require miners to
  include revocations for new expired or missed tickets.  The wallet will no
  longer log warnings and errors due to revocations being created in response to
  missed tickets, and all RPCs which manually revoked tickets have been
  deprecated and no longer perform any action.  Old unspent tickets will be
  revoked by project members, eliminating the need for the wallet to ever create
  a revocation of its own.

* The `verifymessage` JSON-RPC method and
  `MessageVerificationService.VerifyMessage` gRPC method were corrected to
  return success when the message is validly signed by the keys associated with
  a P2PKH address.  P2PK addresses are no longer valid inputs and an appropriate
  error will be returned if one is used.

* The `walletpubpassphrasechange` JSON-RPC method was enabled.  This method was
  already implemented but the method was not exposed in the RPC API.

* Some options in the sample configuration were rewritten to move comments that
  described various options to their own lines.  This prevents parsing and/or
  runtime errors if an option was uncommented due to the configuration not
  ignoring comments that do not begin at the start of a line.

## New features

* The `WalletService.GetTicket` gRPC method now provides the VSP host associated
  with a ticket.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.7.1...release-v1.7.2).

## Code Contributors (alphabetical order)

* bgptr
* Dave Collins
* Josh Rickmar

# Decrediton v1.7.2

This Decrediton release includes various bug fixes for issues found during
v1.7.1 usage.  DCRDEX has been updated to 0.4.3.  We have also
added a few new features that should improve usage before the next big release.
## Bug fixes

* Fix 'account not found' error when registering for DCRDEX.  There was a corner
  case that could be triggered due to using an incorrect password when
  creating a DEX account.

* Launcher now allows for completion of wallets that had not completed their
  creation steps.

* Improved performance of Transaction/Ticket history pages.  Better scroll
  and saving previous place where they were viewing.

* Automatically set the 'per-account encryption' during wallet creation since
  the passphrase is available.

## New features

* Ticket transaction details now show their associated VSP Host and a button
  that allows for the user to check the tickets' status at that VSP.  

* Due to the recent network upgrade, we've removed all of the Revoke buttons.

* We've removed DEX login step once the user has successfully launched the
  DEX window for the first time.  

* Add Treasury Spending tab on the Governance Page.  This allows for stakeholders
  to approve or deny the public keys that sign the tspends.  

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.7.1...release-v1.7.2).

## Code Contributors (alphabetical order)

* Alex Yocom-Piatt
- Amir Massarwa (@amassarwi)
- bgptr
- Jonathan Chappelow (@chappjc)

# 2022-02-17


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v1.7.1/decrediton-v1.7.1.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v1.7.1/decrediton-v1.7.1.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v1.7.1/decrediton-amd64-v1.7.1.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v1.7.1/decrediton-arm64-v1.7.1.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.7.1/decrediton-v1.7.1.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.7.1-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.


## Contents
* [dcrd](#dcrd-v171)
* [dcrwallet](#dcrwallet-v171)
* [Decrediton](#decrediton-v171)

# dcrd v1.7.1

This is a patch release of dcrd which includes the following changes:

- Resolve an issue related to RPC authentication of limited users

## Changelog

This patch release consists of 2 commits from 2 contributors which total to 3
files changed, 170 additional lines of code, and 35 deleted lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/release-v1.7.0...release-v1.7.1).

### RPC:

- rpcserver: Fix websocket auth failure ([decred/dcrd#2879](https://github.com/decred/dcrd/pull/2879))

### Misc:

- release: Bump for 1.7.1 ([decred/dcrd#2880](https://github.com/decred/dcrd/pull/2880))

### Code Contributors (alphabetical order):

- Dave Collins
- 刘昆


# dcrwallet v1.7.1
 
This release includes vote policy bug fixes for VSP users.
 
## Bug fixes
 
* The `setvotechoice` JSON-RPC method, when setting a vote choice for a
  particular ticket, will use the VSP recorded with the ticket from the database
  rather than using the VSP in the current application configuration.
 
* An issue where vote choices were sometimes not communicated with the VSP for
  all unexpired tickets was corrected.
 
* The `settreasurypolicy` and `settspendpolicy` JSON-RPC methods now validate
  that the length of a ticket hash is exactly 32 bytes.
 
## Changelog
 
All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.7.0...release-v1.7.1).
 
## Code Contributors (alphabetical order)
 
* Alex Yocom-Piatt
* Jamie Holdstock

# Decrediton v1.7.1

This patch release fixes a few outstanding issues found after the initial 
release of v1.7.0.  We have also included the new design for the Settings page 
and LN wallet creation.

## Bug Fixes

* Live tickets were not showing fee status.

* Autobuyer wasn't working due to minimum ticketbuyer limit being 0.

* Update treasury balance to combine legacy and new treasury balances.

* Fix issue when creating DEX account that allowed for users to proceed on
  bad passphrase entry.

* Update menu items when changing from SPV mode for DEX access.

* Various styling issue.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.7.0...release-v1.7.1).

## Code Contributors (alphabetical order)

* Alex Yocom-Piatt
* bgptr
* Jamie Holdstock
* Jonathan Chappelow
* Matheus Degiovani

# 2021-01-24


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux AppImage](https://github.com/decred/decred-binaries/releases/download/v1.7.0/decrediton-v1.7.0.AppImage)
or 
[Decrediton Linux tar](https://github.com/decred/decred-binaries/releases/download/v1.7.0/decrediton-v1.7.0.tar.gz)
or
[Decrediton macOS amd64](https://github.com/decred/decred-binaries/releases/download/v1.7.0/decrediton-amd64-v1.7.0.dmg)
or
[Decrediton macOS arm64](https://github.com/decred/decred-binaries/releases/download/v1.7.0/decrediton-arm64-v1.7.0.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.7.0/decrediton-v1.7.0.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.7.0-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.


## Contents
* [dcrd](#dcrd-v170)
* [dcrwallet](#dcrwallet-v170)
* [Decrediton](#decrediton-v170)


# dcrd v1.7.0

This is a new major release of dcrd.  Some of the key highlights are:

* Four new consensus vote agendas which allow stakeholders to decide whether or not to activate support for the following:
  * Reverting the Treasury maximum expenditure policy
  * Enforcing explicit version upgrades
  * Support for automatic ticket revocations for missed votes
  * Changing the Proof-of-Work and Proof-of-Stake subsidy split from 60%/30% to 10%/80%
* Substantially reduced initial sync time
* Major performance enhancements to unspent transaction output handling
* Faster cryptographic signature validation
* Significant improvements to network synchronization
* Support for a configurable assumed valid block
* Block index memory usage reduction
* Asynchronous indexing
* Version 1 block filters removal
* Various updates to the RPC server:
  * Additional per-connection read limits
  * A more strict cross origin request policy
  * A new alternative client authentication mechanism based on TLS certificates
  * Availability of the scripting language version for transaction outputs
  * Several other notable updates, additions, and removals related to the JSON-RPC API
* New developer modules:
  * Age-Partitioned Bloom Filters
  * Fixed-Precision Unsigned 256-bit Integers
  * Standard Scripts
  * Standard Addresses
* Infrastructure improvements
* Quality assurance changes

For those unfamiliar with the [voting process](https://docs.decred.org/governance/consensus-rule-voting/overview/) in Decred, all code needed in order to support each of the aforementioned consensus changes is already included in this release, however it will remain dormant until the stakeholders vote to activate it.

For reference, the consensus change work for each of the four changes was originally proposed and approved for initial implementation via the following Politeia proposals:
- [Decentralized Treasury Spending](https://proposals-archive.decred.org/proposals/c96290a)
- [Explicit Version Upgrades Consensus Change](https://proposals.decred.org/record/3a98861)
- [Automatic Ticket Revocations Consensus Change](https://proposals.decred.org/record/e2d7b7d)
- [Change PoW/PoS Subsidy Split From 60/30 to 10/80](https://proposals.decred.org/record/427e1d4)

The following Decred Change Proposals (DCPs) describe the proposed changes in detail and provide full technical specifications:
- [DCP0007](https://github.com/decred/dcps/blob/master/dcp-0007/dcp-0007.mediawiki)
- [DCP0008](https://github.com/decred/dcps/blob/master/dcp-0008/dcp-0008.mediawiki)
- [DCP0009](https://github.com/decred/dcps/blob/master/dcp-0009/dcp-0009.mediawiki)
- [DCP0010](https://github.com/decred/dcps/blob/master/dcp-0010/dcp-0010.mediawiki)

## Upgrade Required

**It is extremely important for everyone to upgrade their software to this
latest release even if you don't intend to vote in favor of the agenda.  This
particularly applies to PoW miners as failure to upgrade will result in lost
rewards after block height 635775.  That is estimated to be around Feb 21st,
2022.**

## Downgrade Warning

The database format in v1.7.0 is not compatible with previous versions of the software.  This only affects downgrades as users upgrading from previous versions will see a one time database migration.

Once this migration has been completed, it will no longer be possible to downgrade to a previous version of the software without having to delete the database and redownload the chain.

The database migration typically takes around 40-50 minutes on HDDs and 20-30 minutes on SSDs.

## Notable Changes

### Four New Consensus Change Votes

Four new consensus change votes are now available as of this release.  After upgrading, stakeholders may set their preferences through their wallet.

#### Revert Treasury Maximum Expenditure Policy Vote

The first new vote available as of this release has the id `reverttreasurypolicy`.

The primary goal of this change is to revert the currently active maximum expenditure policy of the decentralized Treasury to the one specified in the [original Politeia proposal](https://proposals-archive.decred.org/proposals/c96290a).

See [DCP0007](https://github.com/decred/dcps/blob/master/dcp-0007/dcp-0007.mediawiki) for the full technical specification.

#### Explicit Version Upgrades Vote

The second new vote available as of this release has the id `explicitverupgrades`.

The primary goals of this change are to:

* Provide an easy, reliable, and efficient method for software and hardware to determine exactly which rules should be applied to transaction and script versions
* Further embrace the increased security and other desirable properties that hard forks provide over soft forks

See the following for more details:

* [Politeia proposal](https://proposals.decred.org/record/3a98861)
* [DCP0008](https://github.com/decred/dcps/blob/master/dcp-0008/dcp-0008.mediawiki)

#### Automatic Ticket Revocations Vote

The third new vote available as of this release has the id `autorevocations`.

The primary goals of this change are to:

* Improve the Decred stakeholder user experience by removing the requirement for stakeholders to manually revoke missed and expired tickets
* Enable the recovery of funds for users who lost their redeem script for the legacy VSP system (before the release of vspd, which removed the need for the redeem script)

See the following for more details:

* [Politeia proposal](https://proposals.decred.org/record/e2d7b7d)
* [DCP0009](https://github.com/decred/dcps/blob/master/dcp-0009/dcp-0009.mediawiki)

#### Change PoW/PoS Subsidy Split to 10/80 Vote

The fourth new vote available as of this release has the id `changesubsidysplit`.

The proposed modification to the subsidy split is intended to substantially diminish the ability to attack Decred's markets with mined coins and improve decentralization of the issuance process.

See the following for more details:

* [Politeia proposal](https://proposals.decred.org/record/427e1d4)
* [DCP0010](https://github.com/decred/dcps/blob/master/dcp-0010/dcp-0010.mediawiki)

### Substantially Reduced Initial Sync Time

The amount of time it takes to complete the initial chain synchronization process has been substantially reduced.  With default settings, it is around 48% faster versus the previous release.

### Unspent Transaction Output Overhaul

The way unspent transaction outputs (UTXOs) are handled has been significantly reworked to provide major performance enhancements to both steady-state operation as well as the initial chain sync process as follows:

* Each UTXO is now tracked independently on a per-output basis
* The UTXOs now reside in a dedicated database
* All UTXO reads and writes now make use of a cache

#### Unspent Transaction Output Cache

All reads and writes of unspent transaction outputs (utxos) now go through a cache that sits on top of the utxo set database which drastically reduces the amount of reading and writing to disk, especially during the initial sync process when a very large number of blocks are being processed in quick succession.

This utxo cache provides significant runtime performance benefits at the cost of some additional memory usage.  The maximum size of the cache can be configured with the new `--utxocachemaxsize` command-line configuration option.  The default value is 150 MiB, the minimum value is 25 MiB, and the maximum value is 32768 MiB (32 GiB).

Some key properties of the cache are as follows:

* For reads, the UTXO cache acts as a read-through cache
  * All UTXO reads go through the cache
  * Cache misses load the missing data from the disk and cache it for future lookups
* For writes, the UTXO cache acts as a write-back cache
  * Writes to the cache are acknowledged by the cache immediately, but are only periodically flushed to disk
* Allows intermediate steps to effectively be skipped thereby avoiding the need to write millions of entries to disk
* On average, recent UTXOs are much more likely to be spent in upcoming blocks than older UTXOs, so only the oldest UTXOs are evicted as needed in order to maximize the hit ratio of the cache
* The cache is periodically flushed with conditional eviction:
  * When the cache is NOT full, nothing is evicted, but the changes are still written to the disk set to allow for a quicker reconciliation in the case of an unclean shutdown
  * When the cache is full, 15% of the oldest UTXOs are evicted

### Faster Cryptographic Signature Validation

Some aspects of the underlying crypto code has been updated to further improve its execution speed and reduce the number of memory allocations resulting in about a 1% reduction to signature verification time.

The primary benefits are:

* Improved vote times since blocks and transactions propagate more quickly throughout the network
* Approximately a 2% reduction to the duration of the initial sync process

### Significant Improvements to Network Synchronization

The method used to obtain blocks from other peers on the network is now guided entirely by block headers.  This provides a wide variety of benefits, but the most notable ones for most users are:

* Faster initial synchronization
* Reduced bandwidth usage
* Enhanced protection against attempted DoS attacks
* Percentage-based progress reporting
* Improved steady state logging

### Support for Configurable Assumed Valid Block

This release introduces a new model for deciding when several historical validation checks may be skipped for blocks that are an ancestor of a known good block.

Specifically, a new `AssumeValid` parameter is now used to specify the aforementioned known good block.  The default value of the parameter is updated with each release to a recent block that is part of the main chain.

The default value of the parameter can be overridden with the `--assumevalid` command-line option by setting it as follows:

* `--assumevalid=0`: Disable the feature resulting in no skipped validation checks
* `--assumevalid=[blockhash]`:  Set `AssumeValid` to the specified block hash

Specifying a block hash closer to the current best chain tip allows for faster syncing.  This is useful since the validation requirements increase the longer a particular release build is out as the default known good block becomes deeper in the chain.

### Block Index Memory Usage Reduction

The block index that keeps track of block status and connectivity now occupies around 30MiB less memory and scales better as more blocks are added to the chain.

### Asynchronous Indexing

The various optional indexes are now created asynchronously versus when blocks are processed as was previously the case.

This permits blocks to be validated more quickly when the indexes are enabled since the validation no longer needs to wait for the indexing operations to complete.

In order to help keep consistent behavior for RPC clients, RPCs that involve interacting with the indexes will not return results until the associated indexing operation completes when the indexing tip is close to the current best chain tip.

One side effect of this change that RPC clients should be aware of is that it is now possible to receive sync timeout errors on RPCs that involve interacting with the indexes if the associated indexing tip gets so far behind it would end up delaying results for too long.  In practice, errors of this type are rare and should only ever be observed during the initial sync process before the associated indexes are current.  However, callers should be aware of the possibility and handle the error accordingly.

The following RPCs are affected:

* `existsaddress`
* `existsaddresses`
* `getrawtransaction`
* `searchrawtransactions`

### Version 1 Block Filters Removal

The previously deprecated version 1 block filters are no longer available on the peer-to-peer network.  Use [version 2 block filters](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#version-2-block-filters) with their associated [block header commitment](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#block-header-commitments) and [inclusion proof](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#verifying-commitment-root-inclusion-proofs) instead.

### RPC Server Changes

The RPC server version as of this release is 7.0.0.

#### Max Request Limits

The RPC server now imposes the following additional per-connection read limits to help further harden it against potential abuse in non-standard configurations on poorly-configured networks:

* 0 B / 8 MiB for pre and post auth HTTP connections
* 4 KiB / 16 MiB for pre and post auth WebSocket connections

In practice, these changes will not have any noticeable effect for the vast majority of nodes since the RPC server is not publicly accessible by default and also requires authentication.

Nevertheless, it can still be useful for scenarios such as authenticated fuzz testing and improperly-configured networks that have disabled all other security measures.

#### More Strict Cross Origin Request (CORS) Policy

The CORS policy for WebSocket clients is now more strict and rejects requests from other domains.

In practice, CORS requests will be rejected before ever reaching that point due to the use of a self-signed TLS certificate and the requirement for
authentication to issue any commands.  However, additional protection mechanisms make it that much more difficult to attack by providing defense in depth.

#### Alternative Client Authentication Method Based on TLS Certificates

A new alternative method for TLS clients to authenticate to the RPC server by presenting a client certificate in the TLS handshake is now available.

Under this authentication method, the certificate authority for a client certificate must be added to the RPC server as a trusted root in order for it to trust the client.  Once activated, clients will no longer be required to provide HTTP Basic authentication nor use the `authenticate` RPC in the case of WebSocket clients.

Note that while TLS client authentication has the potential to ultimately allow more fine grained access controls on a per-client basis, it currently only supports clients with full administrative privileges.  In other words, it is not currently compatible with the `--rpclimituser` and `--rpclimitpass` mechanism, so users depending on the limited user settings should avoid the new authentication method for now.

The new authentication type can be activated with the `--authtype=clientcert` configuration option.

By default, the trusted roots are loaded from the `clients.pem` file in dcrd's application data directory, however, that location can be modified via the `--clientcafile` option if desired.

#### Updates to Transaction Output Query RPC (`gettxout`)

The `gettxout` RPC has the following modifications:

* An additional `tree` parameter is now required in order to explicitly identify the exact transaction output being requested
* The transaction `version` field is no longer available in the primary JSON object of the results
* The child `scriptPubKey` JSON object in the results now includes a new `version` field that identifies the scripting language version

See the [gettxout JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#gettxout) for API details.

#### Removal of Stake Difficulty Notification RPCs (`notifystakedifficulty` and `stakedifficulty`)

The deprecated `notifystakedifficulty` and `stakedifficulty` WebSocket-only RPCs are no longer available.  This notification is unnecessary since the difficulty change interval is well defined.  Callers may obtain the difficulty via `getstakedifficulty` at the appropriate difficulty change intervals instead.

See the [getstakedifficulty JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getstakedifficulty) for API details.

#### Removal of Version 1 Filter RPCs (`getcfilter` and `getcfilterheader`)

The deprecated `getcfilter` and `getcfilterheader` RPCs, which were previously used to obtain version 1 block filters via RPC are no longer available. Use `getcfilterv2` instead.

See the [getcfilterv2 JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getcfilterv2) for API details.

#### New Median Time Field on Block Query RPCs (`getblock` and `getblockheader`)

The verbose results of the `getblock` and `getblockheader` RPCs now include a `mediantime` field that specifies the median block time associated with the block.

See the following for API details:

* [getblock JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getblock)
* [getblockheader JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getblockheader)

#### New Scripting Language Version Field on Raw Transaction RPCs (`getrawtransaction`, `decoderawtransaction`, `searchrawtransactions`, and `getblock`)

The verbose results of the `getrawtransaction`, `decoderawtransaction`, `searchrawtransactions`, and `getblock` RPCs now include a `version` field in the child `scriptPubKey` JSON object that identifies the scripting language version.

See the following for API details:

* [getrawtransaction JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getrawtransaction)
* [decoderawtransaction JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#decoderawtransaction)
* [searchrawtransactions JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#searchrawtransactions)
* [getblock JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getblock)

#### New Treasury Add Transaction Filter on Mempool Query RPC (`getrawmempool`)

The transaction type parameter of the `getrawmempool` RPC now accepts `tadd` to only include treasury add transactions in the results.

See the [getrawmempool JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getrawmempool) for API details.

#### New Manual Block Invalidation and Reconsideration RPCs (`invalidateblock` and `reconsiderblock`)

A new pair of RPCs named `invalidateblock` and `reconsiderblock` are now available.  These RPCs can be used to manually invalidate a block as if it had violated consensus rules and reconsider a block for validation and best chain selection by removing any invalid status from it and its ancestors, respectively.

This capability is provided for development, testing, and debugging.  It can be particularly useful when developing services that build on top of Decred to more easily ensure edge conditions associated with invalid blocks and chain reorganization are being handled properly.

These RPCs do not apply to regular users and can safely be ignored outside of development.

See the following for API details:

* [invalidateblock JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#invalidateblock)
* [reconsiderblock JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#reconsiderblock)

### Reject Protocol Message Deprecated (`reject`)

The `reject` peer-to-peer protocol message is now deprecated and is scheduled to be removed in a future release.

This message is a holdover from the original codebase where it was required, but it really is not a useful message and has several downsides:

* Nodes on the network must be trustless, which means anything relying on such a message is setting itself up for failure because nodes are not obligated to send it at all nor be truthful as to the reason
* It can be harmful to privacy as it allows additional node fingerprinting
* It can lead to security issues for implementations that don't handle it with proper sanitization practices
* It can easily give software implementations the fully incorrect impression that it can be relied on for determining if transactions and blocks are valid
* The only way it is actually used currently is to show a debug log message, however, all of that information is already available via the peer and/or wire logging anyway
* It carries a non-trivial amount of development overhead to continue to support it when nothing actually uses it

### No DNS Seeds Command-Line Option Deprecated (`--nodnsseed`)

The `--nodnsseed` command-line configuration option is now deprecated and will be removed in a future release.  Use `--noseeders` instead.

DNS seeding has not been used since the previous release.

## Notable New Developer Modules

### Age-Partitioned Bloom Filters 

A new `github.com/decred/dcrd/container/apbf` module is now available that provides Age-Partitioned Bloom Filters (APBFs).

An APBF is a probabilistic lookup device that can quickly determine if it contains an element.  It permits tracking large amounts of data while using very little memory at the cost of a controlled rate of false positives.  Unlike classic Bloom filters, it is able to handle an unbounded amount of data by aging and discarding old items.

For a concrete example of actual savings achieved in Decred by making use of an APBF, the memory to track addresses known by 125 peers was reduced from ~200 MiB to ~5 MiB.

See the [apbf module documentation](https://pkg.go.dev/github.com/decred/dcrd/container/apbf) for full details on usage, accuracy under workloads, expected memory usage, and performance benchmarks.

### Fixed-Precision Unsigned 256-bit Integers

A new `github.com/decred/dcrd/math/uint256` module is now available that provides highly optimized allocation free fixed precision unsigned 256-bit integer arithmetic.

The package has a strong focus on performance and correctness and features arithmetic, boolean comparison, bitwise logic, bitwise shifts, conversion to/from relevant types, and full formatting support - all served with an ergonomic API, full test coverage, and benchmarks.

Every operation is faster than the standard library `big.Int` equivalent and the primary math operations provide reductions of over 90% in the calculation time. Most other operations are also significantly faster.

See the [uint256 module documentation](https://pkg.go.dev/github.com/decred/dcrd/math/uint256) for full details on usage, including a categorized summary, and performance benchmarks.

### Standard Scripts

A new `github.com/decred/dcrd/txscript/v4/stdscript` package is now available that provides facilities for identifying and extracting data from transaction scripts that are considered standard by the default policy of most nodes.

The package is part of the `github.com/decred/dcrd/txscript/v4` module.

See the [stdscript package documentation](https://pkg.go.dev/github.com/decred/dcrd/txscript/v4/stdscript) for full details on usage and a list of the recognized standard scripts.

### Standard Addresses

A new `github.com/decred/dcrd/txscript/v4/stdaddr` package is now available that provides facilities for working with human-readable Decred payment addresses.

The package is part of the `github.com/decred/dcrd/txscript/v4` module.

See the [stdaddr package documentation](https://pkg.go.dev/github.com/decred/dcrd/txscript/v4/stdaddr) for full details on usage and a list of the supported addresses.

## Changelog

This release consists of 877 commits from 16 contributors which total to 492 files changed, 77937 additional lines of code, and 30961 deleted lines of code.


All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v1.6.0...release-v1.7.0).

See the [dcrd's own release notes](https://github.com/decred/dcrd/releases/tag/release-v1.7.0) for a categorized breakdown of all commits since the last release.

### Code Contributors (alphabetical order):

- briancolecoinmetrics
- Dave Collins
- David Hill
- degeri
- Donald Adu-Poku
- J Fixby
- Jamie Holdstock
- Joe Gruffins
- Jonathan Chappelow
- Josh Rickmar
- lolandhold
- Matheus Degiovani
- Naveen
- Ryan Staudt
- Youssef Boukenken
- Wisdom Arerosuoghene

# dcrwallet v1.7.0

This release focuses on implementing a mixing protocol change to add additional
post-quantum security in the key exchanges, improvements to VSP ticketbuying,
and adding support for current dcrd consensus agendas.

This prerelease software contains a database upgrade.  Testers are advised to
backup their wallet databases before upgrading.

## New features

* Mixing support now uses a different, incompatible protocol for extra security.
  Users of the cspp.decred.org mix server are advised to updated their
  configurations to use mix.decred.org.  A new server certificate will need to
  be downloaded as well.

* New JSON-RPC methods (`settreasurypolicy`, `settspendpolicy`,
  `treasurypolicy`, `tspendpolicy`) were added to control the approval policy of
  treasury expenditure transactions.  Policies are set on a per-key basis with
  overriding policies for particular transaction hashes.

* The `purchaseticket` JSON-RPC method now respects mixing configurations and
  will buy mixed tickets when these settings are used.

* A `mixsplitlimit` config option was added to control how many concurrent
  connections may be made to the mixer server for a given output value for
  account and change mixing.

* The `walletinfo` JSON-RPC method now returns whether the wallet is in SPV mode
  or not.

* The `validateaddress` JSON-RPC and `WalletService.ValidateAddress` gRPC
  methods now include additional wallet information for decoded wallet address,
  including the account and branch paths.

* It is now possible to import extended xpriv accounts that are derived from
  arbitrary seeds.  This is intended for importing accounts for voting and is
  performed with the `WalletService.ImportVotingAccountFromSeed` gRPC method.

* The `getblock`, `getblockheader`, `getcfilterv2`, `getcurrentnet` `gettxout`,
  and JSON-RPC methods are now supported under SPV mode.

* The median time is now included reported by the `getblock` JSON-RPC response.

* The `WalletService.DiscoverUsage` gRPC method was added to force address and
  account discovery.

* The `WalletService.ImportExtendedPublicKey` gRPC method was added to import
  xpubs as accounts (providing the same functionality as the `importxpub`
  JSON-RPC method).

* Ticket tracking in the database now records which VSP (if any) a ticket was
  purchased for.  This allows the VSP client to check the status of
  previously-bought tickets without the polling every VSP for the ticket info.
  VSP tickets will also processed even if no current VSP is configured in the
  current application settings.

* The `ticketbuyer.limit` option now defaults to 1.

* A `logsize` config option was added to control how large log files may become
  before they are rotated and compressed.

## Bug fixes

* The wallet no longer attempts to perform votes or revocations if the wallet
  only has an imported address or pubkey but no private key to sign the
  transaction inputs.

* The `ticketbuyer.limit` config option now controls how many separate
  connections are made to the mix server with distinct groups of transaction
  inputs to mix.  This reduces mix correlation of larger sets of inputs with
  their change output.

* The `WalletService.Accounts` gRPC method response now contains the last
  returned account indexes rather than the total number of keys in an account,
  which more accurately reflects account usage due to how the gap limit is
  internally handled by the wallet.

* A bug negatively affecting performance and memory usage related to address
  watching was corrected.

* Several issues preventing blockchain reorganization from being handled
  correctly in SPV mode were fixed.

* Several deadlocks in the SPV implementation mode were corrected.

* Transaction size and fee estimation for multisig transactions was improved.

* Data races were corrected.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.6.3...release-v1.7.0).

## Code Contributors (alphabetical order)

* Alex Yocom-Piatt
* David Hill
* Matheus Degiovani
* Jamie Holdstock
* JoeGruffins
* Jonathan Chappelow
* Josh Rickmar
* Victor Oliveira
* Wisdom Arerosuoghene

# Decrediton v1.7.0

This release of Decrediton includes numerous bug fixes and refinement across
all pages/tabs.  

We have overhauled the security of Decrediton so that we can
keep using electron in the future, with a decent amount of assurance that it's
safe and not prone to intrusion.  The overal gist of the work done could be
described simply as: layer/context isolation.  We reduced the total number of
dependencies as well as the access those dependencies may have to private 
information.  Users will be shown some new modals while confirming wallet 
seeds and confirming destination addresses.

DCRDEX is now at 0.4.0 and considered to be fully integrated with Decrediton.  
Some extra work has been done to improve bitcoin config handling and overall
stability of new DEX account creation.  Users are now able to restore their DEX
accounts with a seed from their DCRDEX windows.  This should help users avoid 
paying fees to trading servers unnecessarily. There are a few remaining features
that will be added in the future (dcrwallet SPV and ETH support), but overall is 
feature complete in terms of decrediton pieces.

We have begun to implement redesigns to some areas of decrediton.  The 
Governance and LN pages got full redesigns.  Changes were also made to the
confirm seed view screen.  There will be more of these redesigns implemented
in the near future: Settings and Launcher (wallet selection) coming up next!

We have also added test coverage to all of the tabs on the Transactions page.
Ideally, as we increase test coverage we will avoid bugs caused by regressions or
oversight.

Lastly, we have begun the process of using our react component library: pi-ui.
Things like text inputs, paginators, toggles, radio buttons are now from pi-ui.
Centralizing these components should streamline the look and feel across many
Decred products (politeia, cms, decrediton).

## New features

* We have added a few new tools that will hopefully reduce the amount of support
  requests that are commonly issued.  First, when restoring a wallet from seed
  users are now given the option to 'disable coin type upgrades' which will
  allow older wallet (pre-2017) to be restored on the previous coin type.  We have
  also added a 'gap limit' setting when restoring, this should help avoid 
  address indexes being not correctly synced which could result in incorrect
  balances being shown.  Note: If the gap limit is changed on restore, then that
  gap limit will be used for that wallet from then on.  

  For wallets that have already been restored that may have incorrect address
  indices, we have replaced the Gap Limit in settings with a 'discover usage'
  tool.  This will allow users to properly determine their address indices and
  balances.

* We have added the ability to revoke tickets while in SPV mode.  This seems
  to be a common request in support.  The new 'revoke ticket' button is found
  in the transaction details for any non-spent ticket.  Users will be presented
  with a confirmation modal that informs them of the risk of attempting to
  revoke before that confirm that the ticket is missed on dcrdata.  (They would
  have to Abandon the 'bad' revocation transaction and rescan.)

* We have decided to hide the legacy ticket purchase area.  We will wait until
  a later date to remove the components and code itself, but after 1.7.0 users
  will only be able to purchase private/acccount-less tickets.

## Bug Fixes

* Fix issues with the Sync VSP Tickets dropdown

* Various fixes for Trezor wallets.

* VSPD ticket processing has been fixed and revamped.  A new status of 
  'confirmed' has been added.  This should reduce the number of misses that some
  users have encountered during the changeover from legacy ticket purchasing.

* Fix issue that caused large input transactions (eg PoW mining payouts) to crash
  decrediton.  These transactions caused large numbers of addresses to be
  validated within dcrwallet which lead to resource exhaustion.  

* Make sure that the unmixed account was unlocked when using the ticket
  autobuyer.  This could cause funds not to be spent during auto-buying.  We
  never had any reports of this, so unsure of the overall usage of autobuyer
  in general.

* Fix duplicate ticket transactions being shown in the Ticket History.  Each
  are now labeled appropriately (eg Vote, Voted, Revoke, Revoked)

* Add insufficient balance check for the account mixer.  Previously the mixer
  could be started even if there was no balance to mix.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.6.3...release-v1.7.0).

## Code Contributors (alphabetical order)

* Alex Yocom-Piatt
* Amir Massarwa
* bgptr
* Degeri
* Guilherme Marques
* Jamie Holdstock
* Joe Gruffins
* Jonathan Chappelow
* Jonathan Zeppettini
* Matheus Degiovani
* Victor Oliveira


# 2021-05-12


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.6.3/decrediton-v1.6.3.AppImage)
or
[Decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.6.3/decrediton-v1.6.3.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.6.3/decrediton-v1.6.3.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.6.3-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.


## Contents

* [dcrwallet](#dcrwallet-v163)
* [Decrediton](#decrediton-v163)
* [DCRDEX](#dcrdex-v020)


# dcrwallet v1.6.3

This release focuses on bug fixes and feature improvements for VSP ticket 
buying.

## New features

* An `AccountUnlocked` gRPC method was added to query if an account is
  individually encrypted and its current locked state.

* A `GetTrackedVSPTickets` gRPC method was added for clients to gain insight
  into what tickets and fees are currently being processed by the VSP client.

* A `syncstatus` JSON-RPC method was added to query whether the wallet is known
  to be synchronized with the network or not, or whether it is still performing
  initial synchronization.

## Bug Fixes

* Additional situations which caused unexpected "low balance" bugs when
  purchasing tickets with a VSP have been fixed by attempting to create the
  additional split transaction.

* Reliability improvements were made to ensuring that fees are correctly paid to
  the VSP.  This will result in lower missed ticket rates.

* A bug preventing correct key derivation for keys in a locked
  individually-encrypted account when all other wallet accounts were unlocked
  was fixed by deriving the pubkey, rather than erroring when attempting to
  derive the private key.

* A data race dealing with the synchronization of managing locked outputs was
  fixed.

* The automated ticketbuyer no longer errors for unlocking the wallet with an
  empty passphrase if the account is individually-encrypted and is unlocked by
  another method.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.6.2...release-v1.6.3).

## Code Contributors (alphabetical order)

* Alex Yocom-Piatt
* David Hill
* Jamie Holdstock
* Josh Rickmar
* Matheus Degiovani
* Victor Oliveira
* Wisdom Arerosuoghene


# Decrediton v1.6.3

This release of Decrediton includes the initial DEX integration, as well as 
many other graphical improvements, security upgrades, and bug fixes.

## New features

* This release includes our first iteration of DCRDEX being available directly 
  within Decrediton.  There is a new page available, 'DEX' on the sidebar.  
  Initially, users will be presented with the option to "enable" DEX on their
  wallet.  Currently, we suggest using a separate wallet to use for DEX trading,
  instead of a users' main wallet.  While we believe the wallet is still secure,
  the DEX integration has increased the attack surface of the wallet, so it is 
  worth taking extra precaution while using this feature.

  Once enabled, users need to set a DEX passphrase.  This passphrase is what 
  they will use to Login and to submit orders etc.  Next they need to select
  or create a new account for DEX.  Theses funds are what will be accessible
  inside of the DCRDEX trading platform.

  Users must then connect their DCR and BTC wallets to DEX.  Once connected,
  they will be guided to register their DEX account and pay the required fee.

  Once these steps are complete they will be able to launch the trading 
  platform.  Upon attempting to close Decrediton, there will be an attempt to 
  logout of the DEX.  If there are any open orders, Decrediton will not be
  allowed to close.  This is to ensure that the swaps are able to complete
  successfully.

* With the introduction of DEX and privacy into Decrediton, we've decided to
  upgrade some of the security features in the wallet.  While most of this
  is invisible to the user (Electron/Webpack upgrades), we have added 
  per-account locking.  Previously, when any action occured the whole wallet
  was unlocked and then relocked upon completion.  Now only the pertinent 
  account for the transcation will be unlocked.  This will protect other 
  accounts for situations like DEX and mixing where accounts will be unlocked 
  for long periods of time.

* We have improved the new vspd ticket tracking so fees are now paid more 
  frequently and process managed tickets is only shown when the user hasn't yet
  fully confirmed their tickets with the vspd.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.6.2...release-v1.6.3).

## Code Contributors (alphabetical order)

* Alex Yocom-Piatt
* Amir Massarwa
* bgptr
* Guilherme Marques
* Jamie Holdstock
* Joe Gruffins
* Matheus Degiovani
* Scott Christian
* Victor Oliveira


# DCRDEX v0.2.0

This release includes a large number of improvements to the UI, the
communications protocol, and software design.

The most notable new features are:

- Numerous UI and usability enhancements including responsive design and depth
  chart interactivity
- Support client control by the Decrediton GUI wallet and use of its accounts
- Experimental Bitcoin Cash (BCH) support
- Initial changes to support SPV (light) wallets in the next release
- Account import/export

The latest 1.6 release of dcrd and dcrwallet is required for this release of
DCRDEX. At the time of release, this corresponds to the v1.6.2 releases.
Bitcoin Core 0.20 and 0.21 are both supported.

## Important Notices

Although DCRDEX looks and feels like a regular exchange, the "decentralized"
aspect brings an expanded role to the client. Please take the time to read and
understand the following:

- Ensure your nodes (and wallets) are fully **synchronized with the blockchain
  network before placing orders**.
- **Never shutdown your wallets with dexc running**. When shutting down, always
  stop dexc before stopping your wallets.
- If you have to restart dexc with active orders or swaps, you must
  **immediately login again with your app password when dexc starts up**.
- There is an "inaction timeout" when it becomes your client's turn to broadcast
  a transaction, so be sure not to stop dexc or lose connectivity for longer
  than that or you risk having your active orders and swaps/matches revoked. If
  you do have to restart dexc, remember to login as soon as you start it up
  again.
- Only one dexc (client) process should be running for a given user account at
  any time. For example, if you have identical dexc configurations on two
  computers and you run dexc and login on both, neither dexc instance will be
  adequately connected to successfully negotiate swaps. Also note that order
  history is not synchronized between different installations.
- Your DEX server accounts exist inside the dexc.db file, the location of which
  depends on operating system, but is typically in ~/.dexc/mainnet/dexc.db or
  %HOMEPATH%\Local\Dexc\mainnet\dexc.db. Do not delete this file.
- If you use a non-default bitcoin wallet name, don't forget to set it in
  bitcoin.conf with a `wallet=wallet_name_here` line so that bitcoind
  will load it each time it starts. Otherwise, dexc will give you a "wallet not
  found" error on startup and login.
- bitcoind's "smart" fee estimation needs plenty of time to warm up or it is not
  so smart. When possible, keep your bitcoind running for at least 6 blocks,
  especially if had not been running for more than an hour, or ensure that the
  value returned from a bitcoin-cli call to `estimatesmartfee 1` returns a
  `"feerate"` close to what <https://mempool.space/> reports as "High priority".

## Client (dexc)

### Features and Improvements

- Experimental support for Bitcoin Cash (BCH).
  ([542ed9b](https://github.com/decred/dcrdex/commit/542ed9ba9ef8db3d8f5d3e36b3078c9fa3d5888f))
- Show confirmations for swaps transactions on the Order page when a swap has
  not yet reached the required number of confirmations.
  ([ecbfebd](https://github.com/decred/dcrdex/commit/ecbfebdd6f3184b51d6f72011b488edd73e3c5cb))
- Open dialogs can be closed by hitting the "Escape" key.
  ([7c978cd](https://github.com/decred/dcrdex/commit/7c978cd8436c3fab9e90a80d1a17502e945e76f8))
- Allow changing the dex client "application password".
  ([8d7163c](https://github.com/decred/dcrdex/commit/8d7163cb9022f9f19ef706f33251a32d228d1c02))
- Responsive browser UI design.
  ([c91bde4](https://github.com/decred/dcrdex/commit/c91bde4446a5d3e6c3db20a805da380d4c6bf835))
- Differentiate between buy/sell orders in confirmation modal dialog.
  ([2bdf81f](https://github.com/decred/dcrdex/commit/2bdf81f94262c34a345c84daf4def921e41c7107))
- Clearer revocation notifications.
  ([c8c9729](https://github.com/decred/dcrdex/commit/c8c9729ba6adb5a1803a8a7e9de30e8aaa81c942))
- Raw transaction data is now transmitted to counterparties in the `'audit'` and
  `'match_status'` requests. This is a prerequisite for SPV clients.
  ([3704513](https://github.com/decred/dcrdex/commit/3704513bc63facc234edabf742ec1f87ef80b35d))
- More chart interactivity. (a) Indicators on the depth chart for the user's
  orders. When the mouse hovers near the indicator, the order is highlighted in
  the "Your Orders" table. Conversely, when the mouse hovers over a row in the
  "Your Orders" table, the indicator is highlighted on the chart. (b) Move the
  legend and hover info to the top. (c) When a rate is entered in the order form
  for a limit order, display a line indicator at that rate on the depth chart.
  (d) When the user hovers over an order in the buy/sell tables, display an
  indicator at that rate on the depth chart. (e) Last zoom level is saved across
  markets and reloads. (f) Display the total buy/sell volume.
  ([fb6f3ea](https://github.com/decred/dcrdex/commit/fb6f3eaa7dae7d043aae8ceb5771638554dd5d1c),
  [08ec4ac](https://github.com/decred/dcrdex/commit/08ec4ac99f06aa23d654cd3855c62c13945b2a2e))
- Multiple authorized browser sessions are now permitted. This refers to logging
  in to dexc from two different browsers that do not share a cookie store. This
  is now permitted, however, signing *out* of one session signs out of all
  sessions.
  ([030173b](https://github.com/decred/dcrdex/commit/030173b828fabb0cb4b2c9884bbeaa91b1ce7f11))
- A wallet's connection settings and private passphrase can be changed at the
  same time. Developers should see the `ReconfigureWallet` change.
  ([761e3e1](https://github.com/decred/dcrdex/commit/761e3e13981a9595623718036913fe54a2c2d764))
- Add account import/export functions.
  ([1a38c4d](https://github.com/decred/dcrdex/commit/1a38c4decea6c0c02370edf4ed4eee833afbe8c8))
- Add account disable function.
  ([f414a87](https://github.com/decred/dcrdex/commit/f414a87a3991d8abbdd8347dc46fe350c96d9981))
- Starting dexc when a configured DEX server is unreachable starts a reconnect
  attempt loop. Previously it was necessary to restart dexc later and hope the
  server was back.
  ([c782ffb](https://github.com/decred/dcrdex/commit/c782ffb0a8e4b8dd11360c8a6394a6b64c91cd3e))
- Account-based DCR wallet locking support. With dcrwallet 1.6, accounts may be
  individually encrypted, with a unique password, in contrast to whole-wallet
  locking. This allows working with such accounts by using the `accountunlocked`
  dcrwallet RPC to determine the locking scheme for an account, and the
  `unlockaccount`/`lockaccount` RPCs instead of `walletpassphrase`/`walletlock`.
  The "beta" simnet DCR harness now uses an individually-encrypted "default"
  account.
  ([ff4e76c](https://github.com/decred/dcrdex/commit/ff4e76cc509e0019f1239316db9e8c7639faf38f),
  [37cdc9e](https://github.com/decred/dcrdex/commit/37cdc9e640e032ec9b0f0f2da12be637e0f696ea))
- Handling of new server-provided fee rates. This will support SPV clients, and
  helps ensure that both redeem and order funding transactions are not created
  with low fee rates when the client's wallet/node is not providing good
  estimates.
  ([79a1cb0](https://github.com/decred/dcrdex/commit/79a1cb016f8d08354610767e890c78a9bd3470b4))
- Network-specific loopback IPs for the webserver and RPC server listen
  addresses. Now by default, dexc listens on 127.0.0.1 for mainnet, 127.0.0.2
  for testnet, and 127.0.0.3 for simnet. Users are still be able to specify
  custom addresses with `webaddr` and `rpcaddr`.
  ([08ec4ac](https://github.com/decred/dcrdex/commit/08ec4ac99f06aa23d654cd3855c62c13945b2a2e))
- Maximum order size estimates on order dialog. Get maximum order estimates
  based on wallet balances and, in the case of buy orders, the rate in the rate
  input field. The data is shown in the UI as a small message above the rate
  field. When you click on the label, the quantity fields are pre-populated with
  the max order.
  ([920d1ac](https://github.com/decred/dcrdex/commit/920d1ac50b748ea17c177fe5cad2259300361fef))
- dexcctl / RPC server: Add a matches list to the `myorders` response.
  ([3bef6ba](https://github.com/decred/dcrdex/commit/3bef6ba8ff8df2af7a8c37fd1c43e6119a1af32f))
- When orders are placed, the client remembers the expected maximum fee rate,
  and verifies that the rate provided by the server at match time does not
  exceed this amount.
  ([2123f10](https://github.com/decred/dcrdex/commit/2123f10a509bbf26ba3e74d3a7583b6524ba9191))
- Add a "fee rate limit" setting to each wallet that is checked against the max
  fee rate set by the server's config. Orders are blocked by the client if the
  server specifies a max fee rate that exceeds the client's limit.
  ([414ffcc](https://github.com/decred/dcrdex/commit/414ffccd83972718d9c3058526101ab745eb36d2))
- On shutdown, the active orders are logged, and inactive trades have their
  coins released to the wallet if they were not already.
  ([41749a8](https://github.com/decred/dcrdex/commit/41749a83afb9f234c3f5c5755367df3beb77d8f1))
- Add sample config files. (also server)
  ([792602b](https://github.com/decred/dcrdex/commit/792602bdab53f2b933f51142df79432fada378e8))
- The `'init'` and `'redeem'` requests are now run asynchronously so most other
  actions are not blocked while waiting for a response. This is generally an
  internal change, but it may improve the overall responsiveness of the dexc
  application.
  ([a0538bb](https://github.com/decred/dcrdex/commit/a0538bbef5460dd08342b8c99851bc6076faea73))
- Preimage request handling is reworked to prevent blocking for a long period
  given an incoming preimage request for an unknown order.
  ([1b66492](https://github.com/decred/dcrdex/commit/1b66492b1ef53670f32c19b484e7366fab977993))
- Add a custom webserver "site" directory argument.
  ([4506406](https://github.com/decred/dcrdex/commit/4506406d974aaa8463a2e924ccdf1147d8078c45))
- Favor confirmed UTXOs in BTC order funding. This is primarily an internal
  change, but it can defend against swaps that take too long to confirm.
  ([3f6e429](https://github.com/decred/dcrdex/commit/3f6e4299c81751558891bcc209cd50825e10183c))
- "Long" execution times (more than 250ms) for incoming message handling and
  track ticks are now logged.
  ([529cb0d](https://github.com/decred/dcrdex/commit/529cb0d17154f3a8a391848fa8eb2ff65453ed9c))

### Developer

- When `Core` is shut down, wallets are locked when the `Run` method returns.
  Previously, wallets were only locked if the consumer used `PromptShutdown`.
  ([8976d8d](https://github.com/decred/dcrdex/commit/8976d8d166706ba626cee437d8765fa3ca3794e4))
  This change was in 0.1.5, but it is reiterated here as it is an significant
  change in behavior that Go consumers should note.
- Updates to the `User` struct returned by the `User` and `Exchanges` methods of
  `client/core.Core`.  The `client/core.Market` has replaced the
  `{Base,Quote}{Order,Contract}Locked` fields with methods.
  ([167efd4](https://github.com/decred/dcrdex/commit/167efd491eb5eed4c1980995be6b48ea5a780f2a))
- When specifying TLS certificates, allow either a filename or the contents of
  the certificate file. This applies to the `Register`, `GetFee`, and
  `GetDEXConfig` methods of `client/core.Core`.
  ([44a3363](https://github.com/decred/dcrdex/commit/44a33633e40bee15e70b700b982c69833317692f))
- Notification subjects are now package-level constants.
  ([3aef72d](https://github.com/decred/dcrdex/commit/3aef72d00790b2d8b0354efaf844a8fd08f3bdc6))
- `ReconfigureWallet` has a new pass input (`nil` indicates no password change).
  ([761e3e1](https://github.com/decred/dcrdex/commit/761e3e13981a9595623718036913fe54a2c2d764))
- New order fee estimate API. See the new `(*Core).PreOrder` method and the new
  returned `OrderEstimate` type. Also see the `PreSwap` and `PreRedeem` methods
  of `client/asset.Wallet`, and the new types of the same name.
  ([5394cea](https://github.com/decred/dcrdex/commit/5394ceaa2a0e69518cabb2a3ae4fdb2164a6a08e))
- New `isinitialized` http API endpoint and `Core` method.
  ([b767a23](https://github.com/decred/dcrdex/commit/b767a23f0c89ec54a1f60e61c9bd21d05daba906))
- Add the `(*Core).GetDEXConfig` method and a corresponding http API endpoint
  `getdexinfo` the functions similar to `getfee` by making a temporary
  connection to a DEX with *no existing account*, except that it returns the
  server's entire config.
  ([d85f6bc](https://github.com/decred/dcrdex/commit/d85f6bc34d74773a56500089ff4d12e0e3d3380e))
- Check the server's API version and each asset's version that are now returned
  in the server's `'config'` response.
  ([e59b47f](https://github.com/decred/dcrdex/commit/e59b47fe777ba94741a38da62b06edd317101873),
  [205e802](https://github.com/decred/dcrdex/commit/205e8022adcaf8e7a5bda026e80d43edc3c07497),
  [1bc0cc9](https://github.com/decred/dcrdex/commit/1bc0cc9e9c1ffab8b6ed37dcad96cc136bbcf33f))
- Only active orders are listed by the `User` and `Exchanges` methods of `Core`.
  Completed orders that are pending retirement are excluded.
  ([6358d97](https://github.com/decred/dcrdex/commit/6358d97fe1a1977c363519a98c15273c0612a6b2))
- Add profiling switches to dcrdex. A CPU profile file may be specified with
  `--cpuprofile`. The http profiler may be started with `--httpprof`.
  ([c17baf9](https://github.com/decred/dcrdex/commit/c17baf93a76f6803af1d354bf0d9d7a51332e475))
- (internal) DCR asset backends now use `rpcclient/v6`, which provide cancelable requests.
  ([312397a](https://github.com/decred/dcrdex/commit/312397a56d307f71c12696bcaae126f4629c7aea),
  [9d65d55](https://github.com/decred/dcrdex/commit/9d65d55c8f3b0ca613fb3a7d401346706d65d7e7))
- (internal) BTC's asset backend now uses Decred's `rpcclient` package for
  cancellation capability. All request now use `RawRequest`.
  ([cefe6a5](https://github.com/decred/dcrdex/commit/cefe6a5ced3cce460311d3b50dffdfd4ce9aa22f))
- (internal) All incoming response and notification message handlers are wrapped
  for panic recovery.
  ([829a661](https://github.com/decred/dcrdex/commit/829a661a4c134ad575f9fdbac67b812c73a53589))
- (internal) Message unmarshalling is now more robust with respect to null
  payloads.
  ([9bf1a3e](https://github.com/decred/dcrdex/commit/9bf1a3eeacb86247e8b33067aabcf7fc0cf59f8a))
- Many third party Go dependency updates.
  ([go.mod diff](https://github.com/decred/dcrdex/compare/4517832...release-v0.2#diff-33ef32bf6c23acb95f5902d7097b7a1d5128ca061167ec0716715b0b9eeaa5f6))
- Update site build system to Webpack 5, and update most other deps.
  ([a8e76ea](https://github.com/decred/dcrdex/commit/a8e76eacdecf4e30d96248a885c13a27f81a867e))
- Add an ETH simnet harness for support of upcoming ETH support.
  ([ea10f5a](https://github.com/decred/dcrdex/commit/ea10f5a032ddc365f6982de2f0956e560a26dc2e))
- The simnet harnesses now listen on all interfaces.
  ([4e246cf](https://github.com/decred/dcrdex/commit/4e246cfbef547f41fee5bad2ab397ab80d89dc2a))
- The Decred wallet harnesses now start dcrwallet with http profiling enabled.
  ([b96f546](https://github.com/decred/dcrdex/commit/b96f546f3ff67c3fed3f013023c395daab115fc0))
- Rework the `db.MetaMatch` struct.
  ([db3df62](https://github.com/decred/dcrdex/commit/db3df625eb736442a464dcc3aea424e8a8491a78))

### Fixes

In addition to numerous fixes that were also in the 0.1.x releases, the
most notable fixes are:

- No longer show the Register dialog if the server for the only registered DEX
  happens to be down at the time.
  ([b6ea0ea](https://github.com/decred/dcrdex/commit/b6ea0eaccd92f0c1fe8058a943013217cbf38b0e))
- Correct handling of IPv6 listen addresses. (also on server)
  ([f0ef965](https://github.com/decred/dcrdex/commit/f0ef965103e035052c5034d0486b44881a0c1067))
- Update the browser UI when orders are placed via dexcctl.
  ([8cc1502](https://github.com/decred/dcrdex/commit/8cc1502b0bb511513c0cf70117cbc29b0952f8db))
- Better error reporting on the DEX registration dialog.
  ([2617d75](https://github.com/decred/dcrdex/commit/2617d750f5207d52dfb7afab82634253a99b514c))
- More robust recovery for orders that become unfunded (e.g. user spends coins
  that were reserved for an order).
  ([122277e](https://github.com/decred/dcrdex/commit/122277ec0eca5e5cb8151536aa2e2532d15d9af2))
- No longer prematurely broadcast Decred refund transactions.
  ([03cdf2d](https://github.com/decred/dcrdex/commit/03cdf2d473fc7546892112d78cfa3cfeb6a89605))
- Commitment checksum handling in the presence of missed preimage is now handled
  the same way as on the server by including the all epoch order commitments in
  the csum computation, not just the ones with revealed preimages.
  ([25e3679](https://github.com/decred/dcrdex/commit/25e3679e4e909adf5f0c34821ef14b34357fab42),
  [7d71ffd](https://github.com/decred/dcrdex/commit/7d71ffd5221e0965aefd532e05d6520b17302a54))
- Never show negative confirmations for swap transactions even before they have
  been checked.
  ([fb39b97](https://github.com/decred/dcrdex/commit/fb39b97f1d73e942f6dd79ef0cf0ae4e1a061fcc))
- The mouse wheel only zooms when hovering over the depth chart, no longer
  scrolling the page at the same time.
  ([736b005](https://github.com/decred/dcrdex/commit/736b005151cf3501f0724e36f070e4b74ac365e5))

## Server (dcrdex)

- `Swapper` resumes on startup from DB rather than a state file.
  ([a676e07](https://github.com/decred/dcrdex/commit/a676e074a6845a2b05b3597856d226a22f3c9234))
- Market data API endpoints. `/spots` is the spot price and booked volume of all
  markets. `/candles` is candlestick data, available in bin sizes of 24h, 1h,
  15m, and per-epoch sticks. e.g. `/candles/dcr/btc/15m`. `/orderbook` is
  already a WebSocket route, but is now also accessible by HTTP. An example URL
  is `/orderbook/dcr/btc`. `/config` is another WebSocket route that is also now
  available over HTTP too.
  ([08afde3](https://github.com/decred/dcrdex/commit/08afde3f7bb5d9df5579621ed0e7ae9850424744))
- Configurable trade limits with the new `--inittakerlotlimit` and
  `--abstakerlotlimit` dcrdex switches, and `userBookedLotLimit` set in
  markets.json.
  ([5771186](https://github.com/decred/dcrdex/commit/5771186321eb7b969685fc722ffdb65d42a64539))
- Provide API and asset versions in the `'config'` response.
  ([e59b47f](https://github.com/decred/dcrdex/commit/e59b47fe777ba94741a38da62b06edd317101873),
  [205e802](https://github.com/decred/dcrdex/commit/205e8022adcaf8e7a5bda026e80d43edc3c07497),
  [1bc0cc9](https://github.com/decred/dcrdex/commit/1bc0cc9e9c1ffab8b6ed37dcad96cc136bbcf33f))
- Begin sending `TxData` (raw tx) in audit and match_status requests to
  counterparty. This will support SPV clients.
  ([370451](https://github.com/decred/dcrdex/commit/3704513bc63facc234edabf742ec1f87ef80b35d))
- Experimental Bitcoin Cash (BCH) support.
  ([542ed9b](https://github.com/decred/dcrdex/commit/542ed9ba9ef8db3d8f5d3e36b3078c9fa3d5888f))
- Version the DB scheme and implement initial updates to populate historical
  market data in the `epoch_reports` table.
  ([d000f19](https://github.com/decred/dcrdex/commit/d000f196923497122a71790e8c8f0c89503cfaaf))
- The outgoing preimage request now includes the commitment for the preimage
  being requested.
  ([850e8a6](https://github.com/decred/dcrdex/commit/850e8a6779dd537ecb820974606a9f7294ca155a))
- Provide fee rate estimates to the clients in certain messages: `orderbook`,
  `epoch_report`, and the new `fee_rate` route. With this data provided to the
  clients, minimum fee rates of zero-conf funding coins are enforced.
  ([79a1cb0](https://github.com/decred/dcrdex/commit/79a1cb016f8d08354610767e890c78a9bd3470b4),
  [9885bf1](https://github.com/decred/dcrdex/commit/9885bf1ed697bd82ba300ed33c98647c2413df8f))
- Fix market suspension not purging the outgoing book router's orders list. The
  actual book was purged, but clients would still pull a book snapshot listing
  orders if they restarted after a purge.
  ([a25d14e](https://github.com/decred/dcrdex/commit/a25d14e3a397268bae8a8e899b836d53e0219d79))
- Order priority queue automatic reallocation and smaller initial capacity.
  ([3750cce](https://github.com/decred/dcrdex/commit/3750cce2abeed01879d26b54483b85a2f78f9187))
- New administrative endpoints: `orderbook`, `epochorders`, and `matches`.
  ([0ce3ec7](https://github.com/decred/dcrdex/commit/0ce3ec70024f48fc21b9e9e8aee925e31e2ceb02))
- Add order ID to cancel route error message.
  ([0a7157b](https://github.com/decred/dcrdex/commit/0a7157bb2c2511ac85842e88bb7ead0e127a85ae))
- Various test harness improvements.
  ([ca9882d](https://github.com/decred/dcrdex/commit/ca9882d36463c94375c200ca09cf1a44740f6d1a))
- Active order counts are logged when a user authenticates.
  ([945cb4a](https://github.com/decred/dcrdex/commit/945cb4aa618990c9ab66ee09954d0357e479bc6c))
- Drop the dependency on the deprecated golang.org/x/crypto/ssh/terminal
  repository.
  ([cae9f5a](https://github.com/decred/dcrdex/commit/cae9f5a12ef24c8f4f0d44a021768323b91aaa1f))
- The /api/market/{marketID}/matches endpoint now returns decoded swap/redeem
  coin IDs and an idiomatic JSON response.
  ([a1fbdc0](https://github.com/decred/dcrdex/commit/a1fbdc023c2dfd95d89ab66d91594be5d98ce011))

## Build requirements

- Go 1.15 or 1.16
- Node 14 is the minimum supported version for building the site assets.
- dcrd and dcrwallet must *still* be built from their `release-v1.6` branches.
- The minimum required dcrwallet RPC server version is 8.5.0, which corresponds
  to the v1.6.2 patch release of dcrwallet, but the latest `release-v1.6.x` tag
  should be used.

## Code Summary

166 commits, 287 files changed, 40,296 insertions(+), 18,072 deletions(-)

https://github.com/decred/dcrdex/compare/4517832...release-v0.2

9 contributors

- Amir Massarwa (@amassarwi)
- Brian Stafford (@buck54321)
- David Hill (@dajohi)
- Joe Gruffins (@JoeGruffins)
- Jonathan Chappelow (@chappjc)
- Kevin Wilde (@kevinstl)
- @peterzen
- Victor Oliveira (@vctt94)
- Wisdom Arerosuoghene (@itswisdomagain)



# 2021-04-08


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.6.2/decrediton-v1.6.2.AppImage)
or
[Decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.6.2/decrediton-v1.6.2.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.6.2/decrediton-v1.6.2.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.6.2-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.


## Contents

* [dcrd](#dcrd-v162)
* [dcrwallet](#dcrwallet-v162)
* [Decrediton](#decrediton-v162)


# dcrd v1.6.2

This is a patch release of dcrd to introduce a quality of life change for
lightweight clients, such as SPV wallets, by not sending them a certain class
of announcements that only full nodes are equiped to handle.

## Changelog

This patch release consists of 2 commits from 1 contributor which total to 3
files changed, 55 additional lines of code, and 31 deleted lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/release-v1.6.1...release-v1.6.2).

### Protocol and Network

- server: Only send fast block anns to full nodes ([decred/dcrd#2609](https://github.com/decred/dcrd/pull/2609))

### Misc

- release: Bump for 1.6.2 ([decred/dcrd#2629](https://github.com/decred/dcrd/pull/2629))

### Code Contributors (alphabetical order)

- Dave Collins


# dcrwallet v1.6.2

This release focuses on bug fixes and feature improvements for VSP ticketbuying
and change mixing.

## New Features

* A `accountunlocked` JSON-RPC method was added, allowing clients to determine
  whether an account has been encrypted with a unique passphrase, and if it is
  currently unlocked if so.

* The `setvotechoices` JSON-RPC method will now use the vspd client to set vote
  choices at the VSP, if any is configured in the application settings and the
  ticket was bought for the VSP.

## Bug Fixes

* A UTXO selection issue which caused "low balance" errors during the additional
  split transaction sometimes necessary when purchasing tickets with a VSP was
  fixed.  Some UTXOs of the account were not always being considered during the
  creation of this transaction, which led to the balance errors.

* A check for a too-low fee when mixing at the smallest common amount was added.
  This previously was causing "invalid submission" errors, as the server would
  reject the submission for not paying enough fee.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.6.1...release-v1.6.2).

### Code Contributors (alphabetical order)

* Jonathan Chappelow
* Josh Rickmar


# Decrediton v1.6.2

This patch release for Decrediton includes just a few small changes for copy
and buttons missing text.

## Bug Fixes

* Missing Legacy Ticket purchase button text.

* Incorrect copy on Governance for thresholds for upgrading the network.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.6.1...release-v1.6.2).

### Code Contributors (alphabetical order)

- Alex Yocom-Piatt
- Amir Massarwa
- bgptr
- Matheus Degiovani


# 2021-02-23


## Install

To install Decrediton desktop wallet, download, uncompress, and run
[Decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.6.1/decrediton-v1.6.1.AppImage)
or
[Decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.6.1/decrediton-v1.6.1.dmg)
or
[Decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.6.1/decrediton-v1.6.1.exe).

To install the command-line tools, please see
[dcrinstall](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

See decred-v1.6.1-manifest.txt and the other manifest files for SHA-256 hashes
and the associated .asc signature files to confirm those hashes.

See [README.md](./README.md#verifying-binaries) for more info on verifying the
files.


## Contents

* [dcrd](#dcrd-v161)
* [dcrwallet](#dcrwallet-v161)
* [Decrediton](#decrediton-v161)
* [dcrdex](#dcrdex-v015)


# dcrd v1.6.1

This is a patch release of dcrd which includes the following changes:

- Correct a hard to hit issue where connections might not be reestablished after
  a network outage under some rare circumstances
- Allow stakeholders to make use of the staking system to force proof-of-work
  miners to upgrade to the latest version so voting on the new consensus changes
  can commence

## Changelog

This patch release consists of 3 commits from 1 contributor which total to 3
files changed, 30 additional lines of code, and 9 deleted lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/release-v1.6.0...release-v1.6.1).

### Protocol and Network

- server: Notify block mgr later and track ntfn
  ([decred/dcrd#2588](https://github.com/decred/dcrd/pull/2588))
- server: Force PoW upgrade to v8
  ([decred/dcrd#2597](https://github.com/decred/dcrd/pull/2597))

### Misc

- release: Bump for 1.6.1
  ([decred/dcrd#2600](https://github.com/decred/dcrd/pull/2600))

### Code Contributors (alphabetical order)

- Dave Collins


# dcrwallet v1.6.1

This release focuses on fixing issues with the new VSP fee payments and
account mixing.

## New Features

* A `WalletServer.SetVspdVoteChoice` gRPC method was added, allowing clients to
  update the agenda preferences for the new VSP software.

## Bug Fixes

* An additional transaction may be created now when an account does not have
  enough UTXOs to pay for both a ticket and a VSP fee.  This avoids insufficient
  balance errors where possible and prevents the user from needing to split a
  UTXO themselves.

* Several issues causing double spends when dealing with unpublished
  transactions were corrected.  This improves the reliability of paying the VSP
  fee.

* Account balances no longer report the outputs of unpublished transactions as
  spendable with minconf=0.  Instead, these balances are added to the
  unconfirmed balance.

* Account and output mixing now considers the required fee necessary when
  selecting which common output amount and output count to mix with.  This fixes
  mixing for some outputs which are currently being rejected by the
  CoinShuffle++ server due to not paying enough of the required transaction fee.

* The `signrawtransaction` JSON-RPC method was changed to return an error
  if the transaction being signed has no inputs.

* The salsa20 and blake2b dependencies were updated to prevent possible memory
  corruption caused by smashing the SP register in optimized assembly
  implementations.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.6.0...release-v1.6.1).


### Code Contributors (alphabetical order)

- Josh Rickmar


# Decrediton v1.6.1

This patch release fixes several issues discovered in the v1.6.0 release.

Most changes are focused on improving the staking experience with the new VSP
system: unexpected insufficient balance error is fixed, successes and failures
of various staking operations are better reported now, setting consensus vote
choices on the new VSP was implemented.

## Updates

* Consensus change voting is now working as expected.  When a user sets their
  vote choice, it is updated in their local wallet and also sent to any legacy
  VSP.  Every live ticket they have assigned with a new VSP is updated as well.

* Due to the way the coins (UTXOs) are handled when purchasing tickets, there is
  a possibility of the underlying dcrwallet purchasing fewer tickets than what
  the user requested.  This condition is now explained with a better message,
  to help the user understand why, for example, they only got 1 ticket when
  trying to buy 2.

* Labels on the Staking tab have been updated to make things more clear with the
  new tickets and the old tickets.

* An initial Traditional Chinese translation was completed by @smartwojak and
  verified by long-standing community member Hugo Chang (@changhugo).

* Running or attempting multiple things at the same time is no longer allowed
  to avoid possible issues or unexpected errors.  For instance, when the mixer
  is running, users may not purchase tickets or run the autobuyer, and vice
  versa.  To perform an action, the user needs to turn off a running activity
  before proceeding. Several tooltips have been added to make the user aware of
  the situation.

* Loading indicators have been added to various buttons related to ticket
  purchasing, to indicate that the user should wait for a long-running operation
  (like mixed ticket purchasing) to complete.

* Success and failure messages have been added to various new ticket purchasing
  actions. Now users will be shown a message when they successfully complete (or
  receive errors for) the following actions: verify that visible tickets are
  assigned to VSPs and have their fees paid (Process Managed), discover tickets
  not yet assigned to a VSP and pay their fees (Process Unmanaged), and sync
  failed VSP tickets.

## Bug Fixes

* Added a timeout when not receiving VSP status response within 5 seconds.

* Transaction history filtering has been fixed and now allows to select multiple
  types of transactions at once.

* Tickets will now show as "Processing", "Error" or "Paid" shortly after
  purchase.  Previously they would be shown as "Solo" until a restart or another
  block was mined.

* Added explicit wallet lock calls to ensure that wallet is locked after mixing
  or ticket autobuyer requests.

* There were a few reports of incorrectly created legacy ticket purchases
  due to a still unknown cause.  To work-around this we've added sanity checks
  prior to purchase request to dcrwallet to avoid any potential malformed
  requests from being sent.  This won't solve the core issue, but should at
  least notify users of something wrong occuring and give us data to investigate
  further.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.6.0...release-v1.6.1).

### Code Contributors (alphabetical order)

- Alex Yocom-Piatt
- Amir Massarwa
- bgptr
- Guilherme Marques
- JoeGruffins
- Matheus Degiovani
- Scott Christian
- smartwojak
- Victor Oliveira


# dcrdex v0.1.5

This patch release provides several important bug fixes.

Please read the
[initial release (v0.1.0) notes](https://github.com/decred/dcrdex/releases/tag/release-v0.1.0)
for important information and instructions.

## Client (dexc)

### Features and Improvements

* The user's account ID is now logged on connection and authentication with a
  DEX server.
  ([8ce328](https://github.com/decred/dcrdex/commit/8ce328cacc4d7b0d35973a39917eef48ac1d1d64))

### Fixes

* Fix a possible panic when reconfiguring a wallet that is not connected.
  ([dfe4cd](https://github.com/decred/dcrdex/commit/dfe4cd12234d1d17d6114f3de8f062ff912c594b))

* When resuming trades on startup and login, counterparty contract audits now
  retry repeatedly, as is the case when an audit request is initially received.
  This prevents a match from being incorrectly revoked on startup if the
  wallet/node fails to locate the counterparty contract immediately.
  ([dfe4cd](https://github.com/decred/dcrdex/commit/dfe4cd12234d1d17d6114f3de8f062ff912c594b))

* The client's database subsystem is always started first and stopped last.
  This is a prerequisite for the following wallet lock-on-shutdown change.
  ([b4ef3f](https://github.com/decred/dcrdex/commit/b4ef3ff01f3a1567aecf762c5db75f83a9687d64))

* On shutdown of client `Core`, the wallets are now locked even if the
  `PromptShutdown` function is not used.  This does not affect dexc users,
  only direct Go consumers of the `client/core.Core` type.
  ([70044e](https://github.com/decred/dcrdex/commit/70044e68740faffc4888c6f4b4303806531a0255))

* Fix a possible interruption of the DEX reconnect loop if the config response
  timed out.
  ([4df683](https://github.com/decred/dcrdex/commit/4df683a10d755d71f37c979655b6ceea6343db8d))

* Update the crypto/x/blake2 dependency to prevent silent memory corruption
  from the hash function's assembly code.
  ([c67af3](https://github.com/decred/dcrdex/commit/c67af3f3b88750e69957e019d9eacc80d6aa7555))

* Handle orders that somehow lose their funding coins.  Previously, such
  orders would forever be logged at startup but never retired, and any matches
  from such orders that required swap negotiation of other recovery would have
  been improperly abandoned.
  ([a7b5aa](https://github.com/decred/dcrdex/commit/a7b5aa0a67dd2962c33d229cf101c59e85cb7b85))

## Server (dcrdex)

There are no substantive server changes, just a few logging improvements.

## Code Summary

11 commits, 13 files changed, 564 insertions(+), and 254 deletions(-)

https://github.com/decred/dcrdex/compare/v0.1.4...v0.1.5

3 contributors

- Brian Stafford (@buck54321) (review)
- David Hill (@dajohi) (blake2 fix)
- Jonathan Chappelow (@chappjc)


# 2021-01-25


## Install

To install the command line tools, please see [dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).
To install decrediton download, uncompress, and run [decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.6.0/decrediton-v1.6.0.AppImage) or [decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.6.0/decrediton-v1.6.0.dmg) or [decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.6.0/decrediton-v1.6.0.exe).

See manifest-v1.6.0.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v160)
* [dcrwallet](#dcrwallet-v160)
* [decrediton](#decrediton-v160)
* [dcrlnd](#dcrlnd-v030)
* [dcrdex](#dcrdex-v014)


# dcrd v1.6.0

This release of dcrd introduces a large number of updates.  Some of the key
highlights are:

* A new consensus vote agenda which allows the stakeholders to decide whether or
  not to activate support for a decentralized treasury
* Aggregate fee transaction selection in block templates (Child Pays For Parent)
* Improved peer discovery via HTTPS seeding with filtering capabilities
* Major performance enhancements for signature validation and other
  cryptographic operations
* Approximately 15% less overall resident memory usage
* Proactive signature cache eviction
* Improved support for single-party Schnorr signatures
* Ticket exhaustion prevention
* Various updates to the RPC server such as:
  * A new method to retrieve the current treasury balance
  * A new method to query treasury spend transaction vote details
* Infrastructure improvements
* Quality assurance changes

For those unfamiliar with the
[voting process](https://docs.decred.org/governance/consensus-rule-voting/overview/)
in Decred, all code needed in order to support a decentralized treasury is
already included in this release, however it will remain dormant until the
stakeholders vote to activate it.

For reference, the decentralized treasury work was originally proposed and
approved for initial implementation via the following Politeia proposal:
- [Decentralized Treasury Consensus Change](https://proposals.decred.org/proposals/c96290a2478d0a1916284438ea2c59a1215fe768a87648d04d45f6b7ecb82c3f)

The following Decred Change Proposal (DCP) describes the proposed changes in
detail and provides a full technical specification:
- [DCP0006](https://github.com/decred/dcps/blob/master/dcp-0006/dcp-0006.mediawiki)

**It is important for everyone to upgrade their software to this latest release
even if you don't intend to vote in favor of the agenda.**

## Downgrade Warning

The database format in v1.6.0 is not compatible with previous versions of the
software.  This only affects downgrades as users upgrading from previous
versions will see a one time database migration.

Once this migration has been completed, it will no longer be possible to
downgrade to a previous version of the software without having to delete the
database and redownload the chain.

The database migration typically takes about 5 to 10 minutes on HDDs and 2 to 4
minutes on SSDs.

## Notable Changes

### Decentralized Treasury Vote

A new vote with the id `treasury` is now available as of this release.  After
upgrading, stakeholders may set their preferences through their wallet or Voting
Service Provider's (VSP) website.

The primary goal of this change is to fully decentralize treasury spending so
that it is controlled by the stakeholders via ticket voting.

See the initial
[Politeia proposal](https://proposals.decred.org/proposals/c96290a2478d0a1916284438ea2c59a1215fe768a87648d04d45f6b7ecb82c3f)
for more details.

### Aggregate Fee Block Template Transaction Selection (Child Pays For Parent)

The transactions that are selected for inclusion in block templates that
Proof-of-Work miners solve now prioritize the overall fees of the entire
transaction ancestor graph.

This is beneficial for both miners and end users as it:

- Helps maximize miner profit by ensuring that unconfirmed transaction chains
  with higher aggregate fees are given priority over others with lower aggregate
  fees
- Provides a mechanism for users to increase the priority of an unconfirmed
  transaction by spending its outputs with another transaction that pays higher
  fees

This is commonly referred to as Child Pays For Parent (CPFP) as the spending
("child") transaction is able to increase the priority of the spent ("parent")
transaction.

### HTTPS Seeding

The initial bootstrap process that contacts seeders to discover other nodes to
connect to now uses a REST-based API over HTTPS.

This change will be imperceptible for most users, with the exception that it
accelerates the process of finding suitable candidate nodes that support desired
services, particularly in the case of recently-introduced services that have not
yet achieved widespread adoption on the network.

The following are some key benefits of HTTPS seeders over the previous DNS-based
seeders:

- Support for non-standard ports
- Advertisement of supported service
- Better scalability both in terms of network load and new features
- Native support for TLS-secured communication channels
- Native support for proxies which allows the use of anonymous overlay networks
  such as Tor and I2P
- No need for a large DNSSEC dependency surface
- Uses better audited infrastructure
- More secure
- Increases flexibility

### Signature Validation And Other Crypto Operation Optimizations

The underlying crypto code has been reworked to significantly improve its
execution speed and reduce the number of memory allocations.  While this has
more benefits than enumerated here, probably the most important ones for most
stakeholders are:

- Improved vote times since blocks and transactions propagate more quickly
  throughout the network
- The initial sync process is around 15% faster

### Proactive Signature Cache Eviction

Signature cache entries that are nearly guaranteed to no longer be useful are
now immediately and proactively evicted resulting in overall faster validation
during steady state operation due to fewer cache misses.

The primary purpose of the cache is to avoid double checking signatures that are
already known to be valid.

### Orphan Transaction Relay Policy Refinement

Transactions that spend outputs which are not known to nodes relaying them,
known as orphan transactions, now have the same size restrictions applied to
them as standard non-orphan transactions.

This ensures that transactions chains are not artificially hindered from
relaying regardless of the order they are received.

In order to keep memory usage of the now potentially larger orphan transactions
under control, more intelligent orphan eviction has been implemented and the
maximum number of allowed orphans before random eviction occurs has been
lowered.

These changes, in conjunction with other related changes, mean that nodes are
better about orphan transaction management and thus missing ancestors will
typically either be broadcast or mined fairly quickly resulting in fewer overall
orphans and smaller actual run-time orphan pools.

### Ticket Exhaustion Prevention

Mining templates that would lead to the chain becoming unrecoverable due to
inevitable ticket exhaustion will no longer be generated.

This is primarily aimed at the testing networks, but it could also theoretically
affect the main network in some far future if the demand for tickets were to
ever dry up for some unforeseen reason.

### New Initial State Protocol Messages (`getinitstate`/`initstate`)

This release introduces a pair of peer-to-peer protocol messages named
`getinitstate` and `initstate` which support querying one or more pieces of
information that are useful to acquire when a node first connects in a
consolidated fashion.

Some examples of the aforementioned information are the mining state as of the
current tip block and, with the introduction of the decentralized treasury, any
outstanding treasury spend transactions that are being voted on.

### Mining State Protocol Messages Deprecated (`getminings`/`minings`)

Due to the addition of the previously-described initial state peer-to-peer
protocol messages, the `getminings` and `minings` protocol messages are now
deprecated.  Use the new `getinitstate` and `initstate` messages with the
`headblocks` and `headblockvotes` state types instead.

### RPC Server Changes

The RPC server version as of this release is 6.2.0.

#### New Treasury Balance Query RPC (`gettreasurybalance`)

A new RPC named `gettreasurybalance` is now available to query the current
balance of the decentralized treasury.  Please note that this requires the
decentralized treasury vote to pass and become active, so it will return an
appropriate error indicating the decentralized treasury is inactive until that
time.

See the
[gettreasurybalance JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#gettreasurybalance)
for API details.

#### New Treasury Spend Vote Query RPC (`gettreasuryspendvotes`)

A new RPC named `gettreasuryspendvotes` is now available to query vote
information about one or more treasury spend transactions.  Please note that
this requires the decentralized treasury vote to pass and become active to
produce a meaningful result since treasury spend transactions are invalid until
that time.

See the
[gettreasuryspendvotes JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#gettreasuryspendvotes)
for API details.

#### New Force Mining Template Regeneration RPC (`regentemplate`)

A new RPC named `regentemplate` is now available which can be used to force the
current background block template to be regenerated.

See the
[regentemplate JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#regentemplate)
for API details.

#### New Unspent Transaction Output Set Query RPC (`gettxoutsetinfo`)

A new RPC named `gettxoutsetinfo` is now available which can be used to retrieve
statistics about the current global set of unspent transaction outputs (UTXOs).

See the
[gettxoutsetinfo JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#gettxoutsetinfo)
for API details.

#### Updates to Peer Information Query RPC (`getpeerinfo`)

The results of the `getpeerinfo` RPC are now sorted by the `id` field.

See the
[getpeerinfo JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getpeerinfo)
for API details.

#### Enforced Results Limit on Transaction Search RPC (`searchrawtransactions`)

The maximum number of transactions returned by a single request to the
`searchrawtransactions` RPC is now limited to 10,000 transactions.  This far
exceeds the number of results for all typical cases; however, for the rare cases
where it does not, the caller can make use of the `skip` parameter in subsequent
requests to access additional data if they require access to more results.

See the
[searchrawtransactions JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#searchrawtransactions)
for API details.

#### New Index Status Fields on Info Query RPC (`getinfo`)

The results of the `getinfo` RPC now include `txindex` and `addrindex` fields
that specify whether or not the respective indexes are active.

See the
[getinfo JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getinfo)
for API details.

### Version 1 Block Filters Deprecated

Support for version 1 block filters is deprecated and is scheduled to be removed
in the next release.   Use
[version 2 block filters](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#version-2-block-filters)
with their associated [block header commitment](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#block-header-commitments)
and [inclusion proof](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#verifying-commitment-root-inclusion-proofs)
instead.

## Changelog

This release consists of 616 commits from 17 contributors which total to 526
files changed, 63090 additional lines of code, and 26279 deleted lines of code.

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrd/compare/release-v1.5.2...release-v1.6.0).

See the [dcrd's own release notes](https://github.com/decred/dcrd/releases/tag/release-v1.6.0) for a categorized breakdown of all commits since the last release.

### Code Contributors (Alphabetical Order)

- Brian Stafford
- Dave Collins
- David Hill
- degeri
- Donald Adu-Poku
- Jamie Holdstock
- Joe Gruffins
- Josh Rickmar
- Julian Yap
- Marco Peereboom
- Matheus Degiovani
- Matt Hawkins
- Ryan Riley
- Ryan Staudt
- Wisdom Arerosuoghene
- Youssef Boukenken
- zhizhongzhiwai


# dcrwallet v1.6.0

This release focuses on adding support for the decentralized Decred treasury, 
improved SPV syncing with version 2 committed filters, and client support for 
the new privacy-conscious VSP implementation to make mixed VSP ticketbuying 
viable.

A comprehensive list of improvements and bug fixes follows.

## Notable Changes

### Decentralized Treasury

* Support for the decentralized treasury consensus change is added.  Two new 
JSON-RPC methods `sendtotreasury` and `spendfromtreasury` are added, to send to 
and spend from value in the treasury, respectively.  The vote version and 
current agendas have been updated to allow stakeholders to vote on the 
activation of the decentralized treasury.

### SPV Mode

* Version 2 committed filters are now used, rather than the previous version 1 
filters.  These filters are consensus validated by proof-of-work miners as part 
of the commitments in the block header.  Version 2 filters are smaller and also 
do not require knowledge of the exact outputs spent, but rather only the 
previous output script (or address).

* The `fundrawtransaction` JSON-RPC method is now directly implemented by 
dcrwallet, rather than delegating this method to dcrd through RPC passthrough. 
 This allows the method to be usable under SPV mode.

* A `WalletService.GetRawCFilters` gRPC method was added to query the 
wallet-stored version 2 committed filter for specified blocks.

* Both a `getpeerinfo` JSON-RPC method and `WalletService.GetPeerInfo` gRPC 
method were implemented to provide peer info in SPV mode.  The JSON-RPC method 
continues to return results from a connected dcrd when syncing in RPC mode.

* A `sendrawtransaction` implementation has been added to the JSON-RPC server. 
This allows arbitrary transactions to be published under SPV mode.

### Staking

* A client for the new vspd server was added, and dcrwallet supports this 
client functionality from both the ticket autobuyer and through various gRPC 
methods.

* A `ticketinfo` JSON-RPC method was added to provide detailed status 
information regarding all tickets from the wallet.

* Vote preferences may now be specified on a per-ticket basis with added 
optional parameters to the `setvotechoice` JSON-RPC method.  This feature is 
used by the new vspd server.

* The `stakepooluserinfo` JSON-RPC method has been reintroduced, after being 
removed from prior releases.  This is used by the new vspd server.

* Unpublished transactions are now supported.  When an unpublished transaction 
is saved to the database, the outputs it spends are tallied in balance results 
and are not spendable by other transactions.  Unpublishd transactions will not 
be automatically rebroadast to the network when the wallet starts up and begins 
syncing.  Unpublished transactions are used to record transactions paying vspd 
fees prior to the vspd instance accepting the client's ticket request.

* A `--manualtickets` flag was added to the application config.  This setting 
disables discovering any tickets from the network syncing, instead requiring any
 tickets to be manually added to the wallet using `addtransaction`.  This 
feature is used by the new vspd server to avoid voting on unprocessed tickets 
which used a vspd voting address.  The current state of this setting is 
reported in the `walletinfo` JSON-RPC result.

* The `WalletService.PurchaseTickets` gRPC method gained a `dont_sign_tx` 
parameter to support unsigned ticket purchasing and eventual hardware wallet 
signing.

* Ticket purchasing will now attempt to buy fewer tickets than requested when 
there is a low balance, either due to a bad estimate of how many tickets could 
be purchased, or due to outputs being reserved to pay the fees for the new 
vspd server.

### Mixing

* An `AccountMixerService` was added to the gRPC server to perform CoinShuffle++
 mixing on all funds received by an account.

* The `WalletService.PurchaseTickets` method gained support for specifying 
CoinShuffle++ options for mixed ticket buying.

* The `getcoinjoinsbyacct` JSON-RPC method and 
`WalletService.GetCoinjoinOutputspByAcct` gRPC methods were added to discover 
probable CoinJoin transactions and report them by account.

* Outputs which are being mixed are now locked to prevent accidental spending 
before the mix completes.

* Mix denominations above the ticket price are now avoided when mixing large 
value outputs.  This improves pairing with the large volume of mixes occurring 
from ticket buying, as there are many pairings occurring at the standard 
denominations below the ticket price to mix CoinJoin change outputs.

* Mixed ticketbuying using the autobuyer will now default to buy one ticket per 
client connection if the limit is unset.  Setting a larger limit will continue 
to buy at most limit number of tickets per client connection.

### Wallet Encryption and Authentication

* A `walletpassphrasechange` JSON-RPC method was added to modify the wallet's 
public data encryption passphrase.  Changing to the default insecure value 
"public" effectively removes any prompts for the public passphrase at startup.

* Accounts are now able to be encrypted using separate, per-account passphrases.
 Unlocking an account only provides access to that account's private keys, 
and no others.  Account passphrases may be set using the `setaccountpassphrase` 
JSON-RPC method, and locked and unlocked by the `unlockaccount` and 
`lockaccount` methods.

* JSON-RPC clients may now be authenticated using TLS client certificates, and 
this authentication is now required for the gRPC server.  The feature may be 
enabled for JSON-RPC by using the `--jsonrpcauthtype=clientcert` config flag. 
 Client certificates read from a `clients.pem` file in the application directory
 are trusted by default, and this file may be modified by the `--clientcafile` 
config flag.  Additionally, an `--issueclientcert` flag is provided which 
causes the wallet to issue and send an ephemeral client certificate and key 
over the TX pipe to the parent process which forked dcrwallet.  Client 
certificates may be generated by the `gencerts` tool, which is now part of the 
Decred CLI distribution.

* gRPC methods to lock and unlock the wallet's global keys and 
individually-encrypted accounts are now added, and the passphrase in all 
requests which required an unlocked wallet are now optional.  As the gRPC 
server now requires client authentication, there is no a risk of an 
unauthenticated client from quickly hitting an already-unlocked wallet or 
account and using private keys it should not otherwise have access to.

* The scrypt KDF used for wallet encryption keys now defaults to weaker 
parameters on simnet.  This is primarily done for quicker unit tests, but will 
also affect real dcrwallet simnet instances by requiring less time and memory 
to derive keys.

### Other Improvements

* A `createsignature` JSON-RPC method was introduced, analogous to the gRPC 
`WalletService.CreateSignature` method.

* A `discoverusage` JSON-RPC method was introduced, which triggers the same 
address and account discovery as performed on startup when there are new blocks 
available.  However, this method is more general purpose and is useful when 
correcting issues with prior discoveries, at it allows specifying the exact 
starting blocks and a BIP0044 gap limit to use.

* A `WalletService.SignHashes` gRPC method was added to sign an arbitrary number
 of 32-byte hashes.  This method was used by the now-defunct TumbleBit 
implementation.

* A `WalletService.Spender` gRPC method was added to query the transaction and 
input index which spends a wallet output.

* The `WalletService.TransactionNotifications` gRPC method now provides more 
details about the block headers which were detached during a reorganize, rather 
than only their hashes.

* An `addtransaction` JSON-RPC method was added, allowing transactions to be 
manually added to the wallet, mined in a specified block, without discovering 
the transaction through the network.

* A `NetworkService.GetRawBlock` gRPC method was added to fetch raw blocks 
using the wallet's peer-to-peer implementation.

* An optional account parameter was added to the `listunspent` and 
`listlockunspent` JSON-RPC methods to filter results for a particular account.

* The `listunspent` JSON-RPC method now includes the hex encoding of a redeem 
script when the output is P2SH and the redeem script is known.

* Peer-to-peer seeding is now performed over an HTTPS API rather than DNS. 
 This improves reliability (HTTPS is authenticated), as well as greater control 
of filtering results by various URL parameters.

* The LOGFLAGS environment variable may now include a UTC flag to cause the 
wallet to always log with UTC timestamps, regardless of the current system 
timezone.

* Many log messages were added, removed, or rewritten to better reflect the 
operational state of the application.

* Imported scripts are now recorded in plain text and the wallet does not need 
to be unlocked to retrieve the full script for the P2SH address.  This change is
 made under the assumption that imported redeem scripts should not be secrets 
themselves, but still require a signature check at the very least.

* Importing an already-existing redeem script from the `importscript` JSON-RPC 
method no longer starts a rescan.

* Output locking no longer considers differences between the regular and stake 
transaction trees.

* Wallet setup may now be performed by providing answers to the prompts from 
piped output or a redirected file, as long as the passphrase is provided using 
the `--pass` flag.

* Newly created simnet wallets now always use the SLIP0044 coin type.  This 
ensures that the printed mining address during the creation process will not 
become invalid after a coin type upgrade from the legacy to the SLIP0044 coin 
type following address discovery.

* The latest peer-to-peer protocol version is now supported.  The `miningstate` 
and `initstate` messages which are expected in this version are replied to with 
empty responses.

## Bug Fixes

* A memory leak of requests and responses made to a dcrd websocket server was 
plugged.

* Imported xpub accounts no longer produce errors while trying to read the 
account's xpriv.

* Created transactions are now checked against the current network's maximum 
transaction size limit, to avoid creating transactions which are too long for 
consensus-validating nodes to accept.

* An out-of-bounds panic seen during address discovery of imported xpub accounts
 was corrected.

* A data race during the subscribing of transaction notifications involving 
wallet addresses was fixed.

* The `getaddressesbyaccount` JSON-RPC method now returns results for the 
imported account.

* The database implementation used by dcrwallet (bbolt) was fixed and updated 
to remove invalid usage of Go's unsafe programming features.

* The peer-to-peer implementation now allows the same block to be requested 
concurrently by the same peer.  This fixes some occasional errors which stopped 
the SPV syncer under normal wallet usage.

* The autobuyer will no longer mix the change account when the wallet is not 
up to date with other peers on the network.  This avoids submitting mix requests
 involving outputs which may have already been spent.

* A memory leak of wallet address private keys when operating a wallet that 
remained always unlocked was plugged.

* The stakebase script found in vote transactions is now included when creating 
the unsigned vote, rather than during signing.  This fix ensures that the 
correct stakebase script for the active network is always used, instead of 
filling in the script for a different network.

* UTXO selection is now aware of output maturity and will not include immature 
outputs.

## Changelog

All commits since the last release may be viewed on GitHub 
[here](https://github.com/decred/dcrwallet/compare/v1.5.1...v1.6.0).

### Code Contributors

In alphabetical order:

- Alex Yocom-Piatt
- Brian Stafford
- Dave Collins
- David Hill
- Donald Adu-Poku
- Jamie Holdstock
- Jonathan Chappelow
- Josh Rickmar
- Julian Yap
- Kifen
- Marco Peereboom
- Matheus Degiovani
- Matt Hawkins
- Mike Belopuhov
- peterzen
- Victor Oliveira
- Wisdom Arerosuoghene


# decrediton v1.6.0

This release includes two major functionality improvements for staking 
and privacy.  The past privacy improvements that were available for dcrwallet 
are now implemented in decrediton for ticket purchasing and account mixing. 
Accountless VSP ticket purchasing has been added as well that should greatly 
simplify the staking process and increase privacy.

There have been numerous graphical improvements and bug fixes that will 
hopefully lead to a smoother UX and reduce support questions and intervention.

## New Features

### Privacy

We have added a new menu item that covers Privacy and Security tools. 
Users should go there to 'enable' privacy on their wallets.  This enabling 
process is not done automatically yet, mostly due to required user 
intervention with private passphrase entry to create needed mixed and unmixed 
accounts.  Hopefully in the future we will add this step to the wallet 
launcher.

Once enabled, the privacy page will transform into an account mixer form that 
allows users to mix funds from the unmixed account into the mixed account.  To 
follow what dcrwallet is doing, there is a log window below.  In the future, 
we may add better messaging that will allow updates to the mixing process 
instead of just showing raw logs.

Once privacy is enabled, spending to external addresses is only allowed from the 
mixed account.  This is to ensure privacy is not broken by spending from any 
unmixed account.  Additionally, it is not allowed to manually generate 
addresses in the mixed account, since only funds that have been properly mixed 
should be allowed to end up there.

There is a checkbox that allows users to forgo the external spending 
restriction.  There is a dominant warning and users must confirm the risks 
they are imposing by spending from unmixed accounts.

### Accountless VSP Staking with Optional Mixing

The new accountless VSP ticket purchasing process has been added. 
Now there is no need to create an account at VSP's website, add its API key in 
Decrediton and backup redeem scripts.  Users may now simply go 
to the tickets page, select the VSP they'd like to use and the number of 
tickets to purchase.

This new way of staking is more private even without mixing enabled since it 
eliminates address reuse and the use of email. It is recommended that users 
migrate their tickets to this new system sooner. Read more 
[here](https://blog.decred.org/2020/06/02/A-More-Private-Way-to-Stake/).

If privacy is enabled, the process of purchasing a 
ticket requires there to be a successful mix to occur.  Mix sessions happen 
every 20 minutes and participating in a single session is usually (though not 
always) sufficient.  If successful, the mixed split ticket funding 
transaction, the ticket, and the ticket's fee, should all be seen on the 
overview.  But as you may notice, the ticket's fee is not yet broadcast onto 
the network by the VSP until the ticket has been confirmed by 6 blocks.  If 
any tickets have missing or errored fees, the user will be notified if they 
try to close Decrediton.

## Other Updates

* Menu was reorganized and optimized to accomodate added tabs and tools.  Since 
we are quickly adding functionality we need to make sure the left-hand sidebar 
menu is as efficient as possible without becoming bloated with items. 
 Hopefully the current layout allows for more growth for tools and 
functionality.

* Peer count is now shown on the side bar.  This should alleviate issues where 
people don't know why their transactions aren't getting mined.

* An SPV indicator has been added to the sidebar.  Previously there 
was no way of understanding what mode the wallet was running in without 
looking at Settings page.

* Unmined transactions are now able to be abandoned under transaction details. 
 This should fix issues that people previously had unminable transactions 
"stuck" in their wallet.  If the network doesn't know about the transaction, 
then they should be able to be abandoned and the funds unreserved.

* A full refactor of components into functional components is now mostly 
complete.  This should now allow for more agile development moving forward.

## Code Contributors

In alphabetical order:

- Alex Yocom-Piatt
- Amir Massarwa
- artikozel
- bgptr
- David Hill
- degeri
- Fernando Guisso
- Guilherme Marques
- Jamie Holdstock
- JoeGruffins
- Jonathan Zeppettini
- karamble
- Matheus Degiovani
- Nicola Larosa
- Piotr Delikat
- Thiago F. Figueiredo
- unimere
- Victor Oliveira
- Victor Guedes
- Zubair Zia

Welcome our new additions to the decrediton team: Amir Massarwa, bgptr, 
Fernando Guisso, JoeGruffins, Guilherme Marques, Victor Guedes.


# dcrlnd v0.3.0

_Please note that while Bitcoin's Lightning Network has been in production for 
a few years, Decred's version still hasn't seen extensive use in mainnet. Users 
should be mindful of the total amount of funds committed to dcrlnd wallets and 
channels._

This is a major dcrlnd release including significant amount of changes.

This release brings dcrlnd in line with the upstream lnd 
[release v0.11.1](https://github.com/lightningnetwork/lnd/releases/tag/v0.11.1-beta)
 and also includes ports for versions 
[v0.11.0](https://github.com/lightningnetwork/lnd/releases/tag/v0.11.0-beta), 
[v0.10.0](https://github.com/lightningnetwork/lnd/releases/tag/v0.10.0-beta) and
 [v0.9.0](https://github.com/lightningnetwork/lnd/releases/tag/v0.9.0-beta).

## Vulnerability Fixes

This release includes fixes for 
[CVE-2020-26896](https://lists.linuxfoundation.org/pipermail/lightning-dev/2020-October/002857.html)
 and [CVE-2020-895](https://lists.linuxfoundation.org/pipermail/lightning-dev/2020-October/002858.html)
 made in the upstream lnd project. Fixes for these were released in upstream 
versions v0.11.0 and v0.10.0 respectively and the underlying issues were fully 
disclosed in Oct 20, 2020.

Additional context for the vulnerabilities and its impact in LN implementations,
 written by the original discoverer can be found 
[here](https://lists.linuxfoundation.org/pipermail/lightning-dev/2020-October/002859.html)
 and [here](https://lists.linuxfoundation.org/pipermail/lightning-dev/2020-October/002855.html)

## Database Migrations

This release contains database migrations for the new TLV encoding of invoices, 
payment address indexing and close summary information. Old versions of dcrlnd 
cannot use the new database version once these migrations are applied.

## Changelog

The major Decred-specific feature introduced in this release is the ability to 
run a dcrlnd instance connected to a dcrwallet running in SPV mode. This is 
useful mostly for Decrediton users that will now have the option to run dcrlnd 
even when their wallet is using the SPV configuration.

### Node Syncing Config

CLI users now have two options for the `--node` argument:

- `--node=dcrd` instructs dcrlnd to connect to a dcrd instance for on-chain 
  operations.
- `--node=dcrw` instructs dcrlnd to use the underlying dcrwallet instance for 
  on-chain operations.

When using `--node=dcrd`, the `--dcrd.`-namespaced options should be used to 
configure the connection to the underlying dcrd node.

When using `--node=dcrw`, either the `--dcrd.`-namespaced options should be 
used, in order to use an _embedded_ dcrwallet instance (that is, dcrwallet 
runs automatically inside dcrlnd) **or** the `--dcrw.`-namespaced options 
should be used to configure a __remote__ dcrwallet instance.

Note that SPV mode is only supported on remote dcrwallet instances.

For hub nodes (that is, nodes that are online most of the time and offer 
the ability to receive open channel requests) the recommended config setting 
is to use embedded wallets with a dcrd instance.

### Wumbo Channel Support

This release adapts the [Wumbo](https://github.com/lightningnetwork/lnd/pull/4429)
feature for the realities of Decred. Wumbo channel support can be enabled by 
running dcrlnd with `--protocol.wumbo-channels` and has a global maximum channel
 size of 500 DCR.

### Relevant Upstream Changes

The following is a non-exhaustive list of the relevant upstream changes that 
were ported to dcrlnd. These include changes from the upstream 
[v0.9](https://github.com/decred/dcrlnd/pull/74), 
[v0.10](https://github.com/decred/dcrlnd/pull/99) and 
[v0.11](https://github.com/decred/dcrlnd/pull/103) lines. Please refer to the 
respective upstream releases for additional information.

- Multi Path Payment (MPP) support so that a single payment can be split 
  among multiple channels.
- Track payments with a new Payment Address field.
- Additional TLV data sent in payments, which allows creating new use cases 
  to deliver payload data via LN payments.
- Keysend payment experiment which allows spontaneous payments without the 
  need for a precreated invoice.
- Upfront shutdown script support to enforce channel closure to pay to 
  pre-configured addresses.
- HTLC Interception API to allow creation of custom payment forwarding engines.
- Additional data in Channel Close Summaries.
- Add ability to limit max remote pending HTLC amount during channel opening.
- Anchor outputs experimental feature.
- External channel funding experimental feature.
- Healthchecks to ensure adequate operating conditions of the node
- Several bug fixes throughout the app.

## Porting Effort

A total of 450 upstream PRs were considered for inclusion. The list of of PRs 
can be found in the acompanying [upstream-prs.csv](/docs/upstream-prs.csv) doc.

## Decred Contributors (Alphabetical Order)

- Fernando Guisso
- Matheus Degiovani
- Ole Andre Birkedal

## Acknowledgement

The majority of the work included in this release is from features and bugfixes 
performed by the contributors to the upstream 
[lnd](https://github.com/lightningnetwork/lnd) project that were ported to 
Decred.

We wish to sincerely thank them for providing such a high quality project 
and hope we can continue to contribute in building a large scale and cross-coin 
LN ecosystem.

# dcrdex v0.1.4

This patch release makes a number of small UI improvments, including showing the
user's account ID on the settings page, focusing password field, and colorizing
various buy/sell elements, and fixes several bugs.  The main bug fixes deal 
with wallet settings changes, deposit address revalidation, Decred withdraws 
working for the full balance, and historical order and match display.

Please read the [initial release (v0.1.0) notes](https://github.com/decred/dcrdex/releases/tag/release-v0.1.0) for important information and instructions.

## Client (dexc)

### Features and Improvements

- The account ID for each configured DEX server is now displayed on the settings 
page.  When not logged in, there is a placeholder that says to login to display 
the account ID. ([1a5c070](https://github.com/decred/dcrdex/commit/1a5c070196ab7899214b524a9c681168fbdcfd75))
- Focus password field in order dialogs. ([5eb9fb2](https://github.com/decred/dcrdex/commit/5eb9fb2de51722158eaf1d2122c11f30154bd9b3))
- Colorize the "Side" column in the orders table. ([83b07cd](https://github.com/decred/dcrdex/commit/83b07cd08a8a7ecced012335092c0f196d7fcfb0))
- The registration fee address is no longer logged if there is a funding error 
since there is nothing a user can do with the address other than shoot 
themselves in the foot and send to it manually.  Registration fee payment should
 only be done via the app. ([dc67cdb](https://github.com/decred/dcrdex/commit/dc67cdbb09fe6e296164da0b916ab8a1744912f6))
- Wallet balances are updated on all wallet settings changes. ([8ff4d94](https://github.com/decred/dcrdex/commit/8ff4d943d69182b9866faf6637e9e3c17e97db69))
- Wallet sync status is more consistently checked on wallet (re)connect events, 
and continually check sync status on RPC errors as it is common for node/wallet
 startup to initially error and then start reporting status (e.g. bitcoind's 
 "verifying blocks..." error while starting up). ([1c9ca02](https://github.com/decred/dcrdex/commit/1c9ca02db974cbd76dceac5b29a825b5cc805c84), [53194c6](https://github.com/decred/dcrdex/commit/53194c615ee3179c2c6ec08278a41bbd9b234634))

### Fixes

- Fix changing wallet settings possibly interrupting active swaps. ([f0a304f](https://github.com/decred/dcrdex/commit/f0a304f7ea74af3ce75f3edc1cbb3f4f524f1c84))
- Fix a case where a wallet can become unlockable without restarting dexc if 
dexc were started with both active orders and an unlocked wallet. ([f8c47a1](https://github.com/decred/dcrdex/commit/f8c47a163387b8c63201f2f9ad1053a205e6203f))
- Fix duplicate notify_fee requests that resulted from multiple fee coin 
waiters being created for the same coin. ([ee1bd84](https://github.com/decred/dcrdex/commit/ee1bd84c8ef6136fcbbcf764782b610d20c3540c))
- Fix retrieving the full list of historical orders ([2846814](https://github.com/decred/dcrdex/commit/284681488b5812157dd8624151efc576764eb824))
- Fix incorrect year displayed for a match's date. ([a347b0f](https://github.com/decred/dcrdex/commit/a347b0f34d0fd143b566b59588cda4f86f1b218b))
- Wallet deposit addresses are validated and more often refreshed whenever the 
wallet is connected ([c3990c7](https://github.com/decred/dcrdex/commit/c3990c765f7a7de2017da08c29fb9fae8853a522), [6a66a1c](https://github.com/decred/dcrdex/commit/6a66a1cb7701ed6d6e7187231a46ad1f2a74a782))
- Correctly handle chain sync status when in initial block download state, but 
blocks are up-to-date with headers. This is only possible in practice with 
simnet. ([3523de1](https://github.com/decred/dcrdex/commit/3523de11b270fed9162c0b2bd8aee2333fe2e8f6))
- Fix DCR withdraws in various cases. ([d0ba1e5](https://github.com/decred/dcrdex/commit/d0ba1e5dbcdc063c8fb4abf95725c67174868291))
- Allow dexc to shutdown without hanging if a wallet was unexpectedly shutdown 
first. ([7321c36](https://github.com/decred/dcrdex/commit/7321c364297b8f5c0dd85cf798902b169bd3eebf))
- When loading active matches on login, correctly skip adding cancel order 
matches to the trades map. ([61697bb](https://github.com/decred/dcrdex/commit/61697bbc4364466d9eb55763aed8e7fb849e01e0))
- Prevent login while already logged in from re-creating the entries in the 
trades map. ([b6f81ad](https://github.com/decred/dcrdex/commit/b6f81adcc9a05f4c604420b3b138f1286b25c9c7))
- Resolve a data race on wallet reconfigure for DCR. ([bca1325](https://github.com/decred/dcrdex/commit/bca1325ab1ccdd21b3447571693a8212e5874e97))
- Avoid a possible deadlock on wallet reconfigure. ([4bed3e2](https://github.com/decred/dcrdex/commit/4bed3e2f55f97cac45ca30cf7ad4faac94d20604))

## Developer

- Simnet harnesses are quicker to start, being based on archives, and more well 
funded. ([0de8945](https://github.com/decred/dcrdex/commit/0de89456c129bc39a200e816fb660f216a7d41e2))
- Update simnet trade tests for current wallet unlocking system and more well 
funded harnesses. ([e198b1f](https://github.com/decred/dcrdex/commit/e198b1f095be8cad51c8e49604c873ed2ac4f02d))

## Server (dcrdex)

Create a fee rate scaling administrative endpoint. ([7a3f183](https://github.com/decred/dcrdex/commit/7a3f18313a34a5945c064a06a1b85bfdc07b0dd4))
The endpoint is `api/asset/{sym}/setfeescale/{scale}`, using a GET request 
instead of POST for convenience.

## Code Summary

27 commits, 52 files changed, 1582 insertions(+), and 890 deletions(-)

https://github.com/decred/dcrdex/compare/v0.1.3...v0.1.4

6 contributors

- Amir Massarwa (@amassarwi)
- Brian Stafford (@buck54321)
- David Hill (@dajohi)
- Jonathan Chappelow (@chappjc)
- Kevin Wilde (@kevinstl)
- @peterzen


# dcrdex v0.1.3

This patch release includes a workaround for a bug in the Safari browser, an 
important fix to a possible deadlock (client hang), and a minor fix to the 
client's validation of the server's order matching.

NOTE: If you use the dexcctl program (an optional command line tool), you will 
need to move any dexcctl.conf file from the ".dexc" folder to a new ".dexcctl" 
folder.

Please read the [initial release (v0.1.0) notes](https://github.com/decred/dcrdex/releases/tag/release-v0.1.0) for important information and instructions.

## Client (dexc)

### Fixes

- Eliminate a possible deadlock (hang) introduced in v0.1.2. ([65c9830](https://github.com/decred/dcrdex/commit/65c98309370779e747d676b2c29020610645284d))
- Fix the client's validation of the server's deterministic epoch matching 
result.  This avoids an error message in the logs, but the bug was otherwise 
not a problem. ([10b4689](https://github.com/decred/dcrdex/commit/10b4689ae9a1118f94747951fd3ac444e490faab))

### Other

The location of the dexcctl.conf file is now in ~/.dexcctl instead of ~/.dexc 
(or the corresponding "appdata" folders on Windows and macOS)  ([16a0fb0](https://github.com/decred/dcrdex/commit/16a0fb003e2eca51fd2c29b938b0ec9bf681f7e5))

## Server (dcrdex)

There are no server changes.

## Code Summary

5 commits, 17 files changed, 188 insertions(+), and 174 deletions(-)

https://github.com/decred/dcrdex/compare/v0.1.2...v0.1.3

2 contributors

- Brian Stafford (@buck54321)
- Jonathan Chappelow (@chappjc)


# dcrdex v0.1.2

This patch release improves handling of slow contract audits, fixes a bug on 
32-bit systems, automatically unlocks wallets to avoid swap failures if the 
wallet unexpectedly became locked, and improves the display of canceled orders. 
 There are also a few usability improvements for developers.

Please read the [initial release (v0.1.0) notes](https://github.com/decred/dcrdex/releases/tag/release-v0.1.0) for important information and instructions.

## Client (dexc)

### Features and Improvements

#### User-facing

- When already logged in, automatically attempt to unlock wallets as needed for
trades.  This helps prevent users from breaking their swaps by accidentally 
locking their wallets. ([de40913](https://github.com/decred/dcrdex/commit/de409134c37270145dc7094e89d6ef9d8e2d1f74))
- Display cancel order matches differently from trade matches. ([b013581](https://github.com/decred/dcrdex/commit/b01358159eeb7cbe5024f58f035306e98bb0a2f8))

#### Developer

- Create a `Ready` method so consumer packages know when the client core is 
done starting up.  ([c3d9e80](https://github.com/decred/dcrdex/commit/c3d9e80602e9cad8cc7ebc80e2d7e96a2257d3ab))
- Increase notification channel capacity to prevent dropped notifications when 
there are many simultaneous events. ([2de62a3](https://github.com/decred/dcrdex/commit/2de62a378d8b964c6ff2a485ca907b0b1c2b7ac4))
- Remove the obsolete (and incomplete) terminal UI.  ([75ff8d0](https://github.com/decred/dcrdex/commit/75ff8d09f6f5f898dfd23ebbacbb7a3f1d2e473f))

### Fixes

- Workaround for 64-bit atomic variable access on 32-bit platforms. ([3abaf43](https://github.com/decred/dcrdex/commit/3abaf434a3da3603916969f7af4b0c487b76b149))
- Prevent contract auditing from blocking incoming messages.  Continue to 
search for counterparty contracts until it succeeds or the match is revoked, 
and log a warning of the audit is taking a long time. ([23f2f36](https://github.com/decred/dcrdex/commit/23f2f362486141419d4a321674229f3716fd4faf))

## Server (dcrdex)

There are no server changes.

## Code Summary

9 commits, 44 files changed, 621 insertions(+), and 2,652 deletions(-)

https://github.com/decred/dcrdex/compare/v0.1.1...v0.1.2

3 contributors

- Brian Stafford (@buck54321)
- David Hill (@dajohi)
- Jonathan Chappelow (@chappjc)


# dcrdex v0.1.1

This patch release addresses two important match recovery bugs, and a number of
minor bugs. This release also includes several improvements to the client's user
 interface. New client features include Tor proxy support and new deposit 
 address generation.

Please read the [initial release (v0.1.0) notes](https://github.com/decred/dcrdex/releases/tag/release-v0.1.0) for important information and instructions.

## Client (dexc)

### Features and Improvements 

- Add the mainnet ["client quick start" guide](https://github.com/decred/dcrdex#client-quick-start-installation). ([a383d5e](https://github.com/decred/dcrdex/commit/a383d5e76d2de90969f4eaf372084d290a051032))
- Tor support for connections with DEX servers. ([824f1c0](https://github.com/decred/dcrdex/commit/824f1c0da0b17afcab271c60665be6f8da3d6025)) **WARNING**: This should be used with caution since Tor is slow and unreliable.
- On dexc start-up, display a link (URL) to the browser page, and if there are 
active orders, warn the user. ([a01e403](https://github.com/decred/dcrdex/commit/a01e403d09c491765d71ac34fc2d60b7898c3596))
- Add the ability to generate new deposit addresses. ([860af3e](https://github.com/decred/dcrdex/commit/860af3e19b49db9fb6b68016e894edd71361db3d))
- Various browser UI improvements, including order dialog wording and button 
formatting. ([dbf9d2c](https://github.com/decred/dcrdex/commit/dbf9d2c1f7c4644530b8a91f407818d4f435aa7b))
- Dialogs now have a close/cancel button. ([6716b58](https://github.com/decred/dcrdex/commit/6716b58c87933e71661f922d8cd2f479e6851a0d))
- Taker redemption transactions are more readily batched, potentially requiring 
fewer transactions for a taker order that matches with multiple maker orders. ([3ea75a9](https://github.com/decred/dcrdex/commit/3ea75a91d8e6935ad2cde128190042bde24f1e1d))
- When any node (e.g. bitcoind and dcrd) is still synchronizing with the 
network, new orders cannot be placed. ([2cac73a](https://github.com/decred/dcrdex/commit/2cac73a6655550d3cdd02ca2591844988e8126e7))

### Fixes

- Match recover is more robust, with fixes to revoked match handling on 
reconnect or restart. ([9790fb1](https://github.com/decred/dcrdex/commit/9790fb1cfb6e7ed7ffadc4624979ca57341d2ca0))
- Resolve a potential deadlock during match status resolution, ([c09017d](https://github.com/decred/dcrdex/commit/c09017d8170602bfae4fc2e34edd5ccfee34127e))
- Explicitly set js Content-Type in webserver to workaround misconfigured 
operating systems, such as Windows with misconfigured CLASSES_ROOT registry entries. ([f632893](https://github.com/decred/dcrdex/commit/f6328937f815f210daf4d910cb4722205ddf6e79))
- Delete obsolete notifications on frontend. ([8a69e99](https://github.com/decred/dcrdex/commit/8a69e991b518170eacc23d99eb8e1629ce7517d4))
- Avoid harmless but confusing warnings about returning zero coins when 
resumed trades are later completed. ([a01e403](https://github.com/decred/dcrdex/commit/a01e403d09c491765d71ac34fc2d60b7898c3596))
- Avoid redundant swap negotiation invocations on restart with unknown matches 
reported from a server. ([c0adb26](https://github.com/decred/dcrdex/commit/c0adb2659fe4ab341fc75b995c261b2cee029675))
- Orphaned cancel orders that could be created in certain circumstances are now 
retired during status resolution of the linked trade. ([867ba89](https://github.com/decred/dcrdex/commit/867ba894b6da4f6cda16ba4c371eb2436cc4d977))

## Server (dcrdex)

- Fix book purge heap orientation. ([eb6ccd4](https://github.com/decred/dcrdex/commit/eb6ccd464af474c4d7b506ee465a66e1f69f534f))
- Avoid orphaned epoch status orders when shutting down via SIGINT *without* a 
preceding suspend command. ([d463439](https://github.com/decred/dcrdex/commit/d4634395495f25b92cdc935fb7a72f311d23d118))
- When any node (e.g. bitcoind and dcrd) is still synchronizing with the 
network, relevant markets will not accept new orders. ([2cac73a](https://github.com/decred/dcrdex/commit/2cac73a6655550d3cdd02ca2591844988e8126e7))

## Code Summary

17 commits, 66 files changed, 2216 insertions(+), 566 deletions(-)

https://github.com/decred/dcrdex/compare/release-v0.1.0...release-v0.1.1

3 contributors

- Brian Stafford (@buck54321)
- David Hill (@dajohi)
- Jonathan Chappelow (@chappjc)


# dcrdex v0.1.0 (beta)

## Important Notices

- Ensure your nodes (and wallets) are fully **synchronized with the blockchain 
network before placing orders**. The software will verify this for you in the 
next patch release.
- **Never shutdown your wallets with dexc running**. When shutting down, always 
stop dexc before stopping your wallets.
- If you have to restart dexc with active orders or swaps, you must 
**immediately login again with your app password when dexc starts up**. The 
next patch release wil inform you on startup if this is required.
- There is a ~10 minute "inaction timeout" when it becomes your client's turn 
to broadcast a transaction, so be sure not to stop dexc or lose connectivity 
for longer than that or you risk having your active orders and swaps/matches 
revoked. If you do have to restart dexc, remember to login as soon as you start 
it up again.
- Only one dexc process should be running for a given user account at any time. 
For example, if you have identical dexc configurations on two computers and you 
run and login on both, neither dexc instance will be adequately connected to 
successfully negotiate swaps. Also note that order history is not synchronized 
between different installations at this time.
- Your DEX server accounts exist inside the dexc.db file, the location of which 
depends on operating system, but is typically in ~/.dexc/mainnet/dexc.db or 
%HOMEPATH%\Local\Dexc\mainnet\dexc.db.  Do not delete this account or you will 
need to register again at whatever server was configured in it.

## Overview

This release of DCRDEX includes a client program called dexc and a server 
called dcrdex. Users run their own wallets (e.g. dcrwallet or bitcoind), which
dexc works with to perform trades via atomic swaps. dcrdex facilitates price 
discovery by maintaining an order book for one or more markets, and coordinates 
atomic swaps directly between pairs of traders that are matched according to 
their orders. The server is generally run on a remote system, but anyone may 
operate a dcrdex server.

This release supports Decred, Bitcoin, and Litecoin.

### Client (dexc)

- Provides a browser-based interface, which is self-hosted by the dexc 
program, for configuring wallets, displaying market data such as order books, 
and placing and monitoring orders.
- Communicates with any user-specified dcrdex server.
- Funds orders and executes atomic swaps by controlling the external wallets 
(dcrwallet, etc.).

### Server (dcrdex)

- Accepts orders from clients who prove ownership of on-chain coins to fund 
the order.
- Books and matches orders with an epoch-based matching algorithm.
- Relays swap data between matched parties, allowing the clients to perform 
the transactions themselves directly on the assets' blockchains.
- Has a one-time nominal (e.g. 1 DCR) registration fee, which acts as an 
anti-spam measure and to incentivize completing swaps.
- Enforces the code of community conduct by suspending accounts that 
repeatedly violate the rules.

## Features

### Markets and Orders

The server maintains a familiar market of buy and sell orders, each with a 
quantity and a rate. A market is defined by a pair of assets, where one asset 
is referred to as the **base asset**. For example, in the "DCR-BTC" market, 
DCR is the base asset and BTC is known as the **quote asset**. A market is 
also specified by a **lot size**, which is a quantity of the base asset. Order 
quantity must be a multiple of lot size, with the exception of market buy 
orders that are necessarily specified in units of the quote asset that is 
offered in the trade. The intent of a client to execute an atomic swap of one 
asset for another is communicated by submitting orders to a specific market 
on a dcrdex server.

The two types of trade orders are market orders, which have a quantity but no 
rate, and limit orders, which also specify a rate. Limit orders also have a 
**time-in-force** that specifies if the order should be allowed to become 
booked or if it should only be allowed to match with other orders when it is 
initially processed. The time-in-force options are referred to as "standing" 
or "immediate", where standing indicates the order is allowed to become booked 
while immediate restricts that order to being a taker order by only allowing a 
match when it is initially processed.

The following image is an example order submission dialog from a testnet 
DCR-BTC market with a 40 DCR lot size that demonstrates limit order buying 2 
lots (80 DCR) at a rate of 0.001207 BTC/DCR using a standing time-in-force to 
allow the order to become booked if it is not filled:

![submit order dialog](https://user-images.githubusercontent.com/9373513/97030709-c8fd9500-1524-11eb-8bd0-3eb4cf95e8c8.png)

Checking the "Match for one epoch only" box above specifies that the limit 
order's time-in-force should be immediate, while unchecking it allows the order 
to be booked if it does not match with another order at first. The concept of 
epochs is described in the [Epoch](#epochs) section.

### Order Funding

Since orders must be funded by coins from the user's wallets, placing an order 
"locks" an amount in the relevant wallet. For example, a buy order on the 
DCR-BTC market marks a certain quantity of BTC as locked with the user's wallet.
 (This involves no transactions or movement of funds.) This amount will be 
 shown in the "locked" row of the Balances table.

It is important to note that the amount that is locked by the order may be 
**larger than the order quantity** since the "locked" amount is dependent on 
the size of the UTXO (for UTXO-based assets like Bitcoin and Decred) that is 
reserved for use as an input to the swap transaction, where the amount that 
does not enter the contract goes in a change address. This is no different 
from when you make a regular transaction, however because the input UTXOs are 
locked in advance of broadcasting the actual transaction that spends them, you 
will see the amount locked in the wallet until the swap actually takes place.

Depending on the asset, there may be a wallet setting on the Wallets page to 
pre-size funding UTXOs to avoid this over-locking, but (1) it involves an extra 
transaction that pays to yourself before placing the order, which has on-chain 
transaction fees that may be undesirable on chains like BTC, and (2) it is only 
applied for limit orders with standing time-in-force since the UTXOs are only
locked until the swap transaction is broadcasted, which is relatively brief for
taker-only orders that are never booked.

### Epochs

An important concept with DCRDEX is that newly submitted orders are processed 
in short windows of time called **epochs**, the length of which is part of the 
server's market configuration, but is typically on the order of 10 seconds. 
When a valid order is received by the server, it enters into the pool of epoch 
orders before it is matched and/or booked. The motivation for this approach is 
described in detail in the DCRDEX specification. The Your Orders table will 
show the status of such orders as "epoch" until they are matched at the end of 
the epoch, as described in the next section.

Order cancellation requests are also processed in the epoch with trade 
(market/limit) orders since a cancellation is actually a type of order. 
However, from the user's perspective, cancelling an order is simply a matter 
clicking the cancel icon for one of their booked orders.

### Matching

When the end of an epoch is reached, the orders it includes are then matched 
with the orders that are already on the book. A key concept of DCRDEX order 
matching is a deterministic algorithm for shuffling the epoch orders so that 
it is difficult for a user to game the system. To perform the shuffling of the 
closed epoch prior to matching, clients with orders in the epoch must provide 
to the server a special value for each of their orders called a **preimage**, 
which must correspond to another value that was provided when the order was 
initially submitted called the **commitment**. This is done automatically by 
dexc, requiring no action from the user.

If an order fails to match with another order, it will become either 
**booked** or **executed** with no part of the order filled. The Your Orders 
table displays the current status and remaining quantity of each of a user's 
orders. If an order does match with another trade order, the order status will 
become **settling**, and atomic swap negotiation begins.

### Settlement

When maker orders (on the book) are matched with taker orders from an epoch, 
the atomic swap sequence begins. No action is required from either user during 
the process.

In the current atomic swap protocol, the **maker initiates** by broadcasting a 
transaction with a swap contract on the relevant asset network, and informing 
the server of the transaction and the full contract. The server audits the 
contract, and if it is successfully validated, the information is relayed to 
the taker, who independently audits the contract to ensure it meets their 
expectations. The transaction containing the maker's swap contract must then 
be mined and reach the **swap confirmation requirement**, which is also a 
market setting. For example, Bitcoin might require 3 confirmations while other 
chains like Litecoin might be considerably more. When the required number of 
confirmations is reached, the **taker participates** by broadcasting a 
transaction with their swap contract and informing the server. Again, the 
server and the counterparty audit the contract and wait for that asset's swap 
confirmation requirement. When the required confirmations are reached, the 
**maker redeems** the taker's contract and informs the server of the redemption 
transaction. This is the end of the process for the maker, as the redemption 
spends the taker's contract, paying to an address controlled by the maker. 
The server relays the maker's redeem data to the taker, and the 
**taker redeems** immediately, ending the swap.

The Order Details page shows each match associated with an order. For example, 
a match where the user was the taker is shown below with links to block 
explorers for each of the transactions described above. The maker will have 
their redemption listed, but not the taker's.

![match details](https://user-images.githubusercontent.com/9373513/97028559-eda43d80-1521-11eb-9ab6-2e0b21df584d.png)

Orders may be partially filled in increments of the lot size. Hence a single 
order may have more than one match (and thus swap) associated with it, each of 
which will be shown on the Order Details page.

Wallet balances will change during swap negotiation. When the client broadcasts 
their swap contract, the amount locked in that contract will go into the 
"locked" row for the asset that funded the order. When the counterparty 
redeems their contract, that amount will be reduced by the contract amount, 
and the user will redeem the counterparty contract, thus adding to the balance 
of the other asset. This is the essence of the atomic swap. Note that until 
the redemption transactions are confirmed, the redeemed amount may remain in 
the wallet's "immature" balance category, but this depends on the asset.

### Revoked Matches

While the atomic swap process requires no party to trust the other, a swap may 
be forced into an alternate path ending in one or both users refunding 
themselves by spending their own contract after the lock time expires. This 
happens when one of the parties fails to act in the expected time frame, an 
**inaction timeout**. When an inaction timeout occurs the following happens:

- The match is revoked, and both parties are notified.
- The at-fault user has their order revoked (if it was partially filled and 
still booked) and is notified.
- The at-fault user has their score adjusted according to type of match 
failure. See below for descriptions of each type and the associated user score 
adjustments.

The general categories of match failures are:

- `NoMakerSwap`: A match is made, but the maker does not initiate the swap. 
No transactions are created in this case.
- `NoTakerSwap`: The maker (initiator) broadcasts their swap contract 
transaction and informs the server, but the taker (participant) fails to 
broadcast their swap contract and inform the server. The maker will 
automatically refund their contract when it expires after 20 hrs.
- `NoMakerRedeem`: The taker broadcasts their swap and informs the server, but 
the maker does not redeem it. The taker will refund when their contract expires 
after 8 hrs. Note that the taker's client begins watching for an unannounced 
redeem of their contract by the maker, which reveals the secret and permits 
the taker to redeem as well, completing the swap although in a potentially 
extended time frame.
- `NoTakerRedeem`: The maker redeems the taker's contract and informs the 
server, but the taker fails to redeem the maker's contract even though they 
can do so at any time. This case is not disruptive to the counterparty, and is 
only detrimental to the takers, so it is of minimal concern.

NOTE: The *order* remaining amounts are still reduced at match time although 
they did not settle that portion of the order.

### User Scoring

Users have an incentive to respond with their preimage for their submitted 
orders and to complete swaps as the match negotiation protocol specifies, and 
if they repeatedly fail to act as required, their account may be suspended. 
This may require either communicating an excusable reason for the issue to the 
server operator, or registering a new account. However, a reasonable scoring 
system is established to balance the need to deter intentional disruptions 
with the reality of unreliable consumer networks and other such technical 
issues.

In this release, there are two primary inaction violations that adjust a 
users score: (1) failure to respond with a preimage for an order when the 
epoch for that order is closed (preimage miss), and (2) swap negotiation 
resulting in match revocation as described in the [previous section](#revoked_matches).

The score threshold at which an account becomes suspended (ban score) is an 
operator set variable, but the default is 20.

The adjustment to the at-fault user's score depends on the match failure:

| Match Outcome   | Points | Notes                                              |
|-----------------|-------:|----------------------------------------------------|
| `NoMakerSwap`   |      4 | book spoof, taker needs new order, no locked funds |
| `NoTakerSwap`   |     11 | maker has contract stuck for 20 hrs                |
| `NoMakerRedeem` |      7 | taker has contract stuck for 8 hrs                 |
| `NoTakerRedeem` |      1 | counterparty not inconvenienced, only self         |
| `Success`       |     -1 | offsets violations                                 |

A preimage miss adds 2 points to the users score.

The above scoring system should be considered tentative while it is evaluated 
in the wild.

### Order Size Limits

This release uses an experimental system to set the maximum order quantity 
based on their swap history. It is likely to change, but it is described in [PR #750](https://github.com/decred/dcrdex/pull/750).


## Code Summary

This release consists of 473 pull requests comprising 506 commits from 12 contributors.

Contributors (alphabetical order):

- Brian Stafford (@buck54321)
- David Hill (@dajohi)
- @degeri
- Donald Adu-Poku (@dnldd)
- Fernando Abolafio (@fernandoabolafio)
- Joe Gruffins (@JoeGruffins)
- Jonathan Chappelow (@chappjc)
- Kevin Wilde (@kevinstl)
- @song50119
- Victor Oliveira (@vctt94)
- Wisdom Arerosuoghene (@itswisdomagain)
- @zeoio

(there is no previous release to which a diff can be made)



## 2020-08-27

## Install

To install the command line tools, please see [dcrinstaller](https://github.com/decred/decred-release/releases/tag/v1.5.2).
To install decrediton download, uncompress, and run [decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.5.2/decrediton-v1.5.2.tar.gz) or [decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.5.2/decrediton-v1.5.2.dmg) or [decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.5.2/decrediton-v1.5.2.exe).

See decred-v1.5.2-manifest.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v152)
* [decrediton](#decrediton-v152)

# dcrd v1.5.2

This is a patch release of dcrd to address a potential denial of service vector.

## Changelog

This patch release consists of 5 commits from 2 contributors which total to 4 files changed, 114 additional lines of code, and 20 deleted lines of code.

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v1.5.1...release-v1.5.2).

### Protocol and network:

- blockmanager: handle notfound messages from peers ([decred/dcrd#2344](https://github.com/decred/dcrd/pull/2344))
- blockmanager: limit the requested maps ([decred/dcrd#2344](https://github.com/decred/dcrd/pull/2344))
- server: increase ban score for notfound messages ([decred/dcrd#2344](https://github.com/decred/dcrd/pull/2344))
- server: return whether addBanScore disconnected the peer ([decred/dcrd#2344](https://github.com/decred/dcrd/pull/2344))

### Misc:

- release: Bump for 1.5.2([decred/dcrd#2345](https://github.com/decred/dcrd/pull/2345))

### Code Contributors (alphabetical order):

- Dave Collins
- David Hill

# decrediton v1.5.2

Decrediton has no code changes for 1.5.2, but includes a dcrd which has the
required fix.


## 2019-01-28


## Install

To install the command line tools, please see [dcrinstaller](https://github.com/decred/decred-release/releases/tag/v1.5.1).
To install decrediton download, uncompress, and run [decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.5.1/decrediton-v1.5.1.tar.gz) or [decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.5.1/decrediton-v1.5.1.dmg) or [decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.5.1/decrediton-v1.5.1.exe).

See manifest-v1.5.1.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v151)
* [dcrwallet](#dcrwallet-v151)
* [decrediton](#decrediton-v151)

# dcrd v1.5.1

This is a patch release of dcrd to address a minor memory leak with authenticated RPC websocket clients on intermitent connections.   It also updates the `dcrctl` utility to include the new `auditreuse` dcrwallet command.

## Changelog

This patch release consists of 4 commits from 3 contributors which total to 4 files changed, 27 additional lines of code, and 6 deleted lines of code.

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v1.5.0...release-v1.5.1).

### RPC:

- rpcwebsocket: Remove client from missed maps ([decred/dcrd#2049](https://github.com/decred/dcrd/pull/2049))
- rpcwebsocket: Use nonblocking messages and ntfns ([decred/dcrd#2050](https://github.com/decred/dcrd/pull/2050))

### dcrctl utility changes:

- dcrctl: Update dcrwallet RPC types package ([decred/dcrd#2051](https://github.com/decred/dcrd/pull/2051))

### Misc:

- release: Bump for 1.5.1([decred/dcrd#2052](https://github.com/decred/dcrd/pull/2052))

### Code Contributors (alphabetical order):

- Dave Collins
- Josh Rickmar
- Matheus Degiovani


# dcrwallet v1.5.1

This release contains bug fixes and minor feature additions.  A
comprehensive list of improvements and bug fixes follows.

## New features

* An `auditreuse` JSON-RPC method was added.  This method reports all
  transactions that reuse an output address, excluding votes and
  revocations which must use the committed address from a ticket.  An
  optional block height parameter may be provided to only search for
  reuse following a block.

* The `createrawtransaction` JSON-RPC method was implemented directly.
  This allows users of the SPV syncing mode to perform the call, rather
  than the call erroring due to no RPC passthrough to a `dcrd` JSON-RPC
  server.

## Other improvements

* The `--csppserver.ca` option is now expanded with `~` and environment
  variables.

* The sample config has been updated with options related to
  CoinShuffle++.

## Bug fixes

* Duplicate logs for insufficient balance errors during automated
  ticketbuying have been silenced.

* The gRPC method `TicketBuyerV2Service.RunTicketBuyer` contained a
  regression causing all change to be created for only the default
  (first) account.  A fix was made to restore the previous behavior,
  where change is created for the source account.

* An address reuse bug caused by resetting child indexes backwards
  after address and account discovery was corrected.  It was possible
  for this bug to be hit any time network synchronization had to be
  restarted (e.g. the `dcrd` JSON-RPC link was lost), because address
  discovery would always occur on resync.

* A shutdown hang of the `dcrwallet` process following a panic in a
  JSON-RPC handler was fixed with improved synchronization code.

* A data race in the `signrawtransaction` JSON-RPC method was
  corrected.

* A memory leak in the JSON-RPC websocket client to `dcrd` was fixed.
  This bug caused excessive memory usage by retaining every unmarshaled
  response in memory for the lifetime of the websocket connection.

* Extended pubkeys imported via the `importxpub` JSON-RPC method may
  now be used immediately rather than requiring a restart of the process.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/v1.5.0...v1.5.1).

# decrediton v1.5.1

This patch release for decrediton mainly focuses on patching various issues that
were found during public usage.  We have also included an update to the QR
code that shows a basic DCR logo within.

## New Features

- The QR Code generated for addresses to receive funds in Decrediton now
  include a blue/green DCR logo in the center.  Functionally, this will be no
  different than before.  ([#2385](https://github.com/decred/decrediton/pull/2385)) 

## Bug Fixes

- Double notifications were being shown when sending transactions ([#2375](https://github.com/decred/decrediton/pull/2375))

- Allow for the second instance warning to be closed and quit the application.
  ([#2394](https://github.com/decred/decrediton/pull/2394))

- Various typos and spelling fixes. ([#2383](https://github.com/decred/decrediton/pull/2383), [#2400](https://github.com/decred/decrediton/pull/2400), [#2395](https://github.com/decred/decrediton/pull/2395))

- The number of active tickets on the overview was not showing correctly 
  while in SPV wallets.  ([#2389](https://github.com/decred/decrediton/pull/2389))

- Prevent gap exhaustion during change generation. ([#2358](https://github.com/decred/decrediton/pull/2358))

- Disable various elements from being selectable. ([#2388](https://github.com/decred/decrediton/pull/2388))

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.5.0...release-v1.5.1).


## 2019-12-16


## Install

To install the command line tools, please see [dcrinstaller](https://github.com/decred/decred-release/releases/tag/v1.5.0).
To install decrediton download, uncompress, and run [decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.5.0/decrediton-1.5.0.tar.gz) or [decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.5.0/decrediton-v1.5.0.dmg) or [decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.5.0/decrediton-v1.5.0.exe).

See manifest-v1.5.0.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v150)
* [dcrwallet](#dcrwallet-v150)
* [decrediton](#decrediton-v150)
* [dcrlnd](#dcrlnd-v020)

# dcrd v1.5.0

This release of dcrd introduces a large number of updates.  Some of the key
highlights are:

* A new consensus vote agenda which allows the stakeholders to decide whether or
  not to activate support for block header commitments
* More efficient block filters
* Significant improvements to the mining infrastructure including asynchronous
  work notifications
* Major performance enhancements for transaction script validation
* Automatic external IP address discovery
* Support for IPv6 over Tor
* Various updates to the RPC server such as:
  * A new method to query information about the network
  * A method to retrieve the new version 2 block filters
  * More calls available to limited access users
* Infrastructure improvements
* Quality assurance changes

For those unfamiliar with the voting process in Decred, all code in order to
support block header commitments is already included in this release, however
its enforcement will remain dormant until the stakeholders vote to activate it.

For reference, block header commitments were originally proposed and approved
for initial implementation via the following Politeia proposal:
- [Block Header Commitments Consensus Change](https://proposals.decred.org/proposals/0a1ff846ec271184ea4e3a921a3ccd8d478f69948b984445ee1852f272d54c58)


The following Decred Change Proposal (DCP) describes the proposed changes in
detail and provides a full technical specification:
- [DCP0005](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki)

**It is important for everyone to upgrade their software to this latest release
even if you don't intend to vote in favor of the agenda.**

## Downgrade Warning

The database format in v1.5.0 is not compatible with previous versions of the
software.  This only affects downgrades as users upgrading from previous
versions will see a one time database migration.

Once this migration has been completed, it will no longer be possible to
downgrade to a previous version of the software without having to delete the
database and redownload the chain.

## Notable Changes

### Block Header Commitments Vote

A new vote with the id `headercommitments` is now available as of this release.
After upgrading, stakeholders may set their preferences through their wallet or
Voting Service Provider's (VSP) website.

The primary goal of this change is to increase the security and efficiency of
lightweight clients, such as Decrediton in its lightweight mode and the
dcrandroid/dcrios mobile wallets, as well as add infrastructure that paves the
way for several future scalability enhancements.

A high level overview aimed at a general audience including a cost benefit
analysis can be found in the
[Politeia proposal](https://proposals.decred.org/proposals/0a1ff846ec271184ea4e3a921a3ccd8d478f69948b984445ee1852f272d54c58).

In addition, a much more in-depth treatment can be found in the
[motivation section of DCP0005](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#motivation).

### Version 2 Block Filters

The block filters used by lightweight clients, such as SPV (Simplified Payment
Verification) wallets, have been updated to improve their efficiency,
ergonomics, and include additional information such as the full ticket
commitment script.  The new block filters are version 2.  The older version 1
filters are now deprecated and scheduled to be removed in the next release, so
consumers should update to the new filters as soon as possible.

An overview of block filters can be found in the
[block filters section of DCP0005](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#block-filters).

Also, the specific contents and technical specification of the new version 2
block filters is available in the
[version 2 block filters section of DCP0005](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#version-2-block-filters).

Finally, there is a one time database update to build and store the new filters
for all existing historical blocks which will likely take a while to complete
(typically around 8 to 10 minutes on HDDs and 4 to 5 minutes on SSDs).

### Mining Infrastructure Overhaul

The mining infrastructure for building block templates and delivering the work
to miners has been significantly overhauled to improve several aspects as follows:

* Support asynchronous background template generation with intelligent vote propagation handling
* Improved handling of chain reorganizations necessary when the current tip is unable to
obtain enough votes
* Current state synchronization
* Near elimination of stale templates when new blocks and votes are received
* Subscriptions for streaming template updates

The standard [getwork RPC](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getwork)
that PoW miners currently use to perform the mining process has been updated to
make use of this new infrastructure, so existing PoW miners will seamlessly get
the vast majority of benefits without requiring any updates.

However, in addition, a new [notifywork RPC](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#notifywork)
is now available that allows miners to register for work to be delivered
asynchronously as it becomes available via a WebSockets
[work notification](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#work).
These notifications include the same information that `getwork` provides along
with an additional `reason` parameter which allows the miners to make better
decisions about when they should instruct workers to discard the current
template immediately or should be allowed to finish their current round before
being provided with the new template.

Miners are highly encouraged to update their software to make use of the new
asynchronous notification infrastructure since it is more robust, efficient, and
faster than polling `getwork` to manually determine the aforementioned
conditions.

The following is a non-exhaustive overview that highlights the major benefits of
the changes for both cases:

- Requests for updated templates during the normal mining process in between tip
  changes will now be nearly instant instead of potentially taking several
  seconds to build the new template on the spot
- When the chain tip changes, requesting a template will now attempt to wait
  until either all votes have been received or a timeout occurs prior to handing
  out a template which is beneficial for PoW miners, PoS miners, and the network
  as a whole
- PoW miners are much less likely to end up with template with less than the max
  number of votes which means they are less likely to receive a reduced subsidy
- PoW miners will be much less likely to receive stale templates during chain
  tip changes due to vote propagation
- PoS voters whose votes end up arriving to the miner slightly slower than the
  minimum number required are much less likely to have their votes excluded
  despite having voted simply due to propagation delay

PoW miners who choose to update their software, pool or otherwise, to make use
of the asynchronous work notifications will receive additional benefits such as:

- Ability to start mining a new block sooner due to receiving updated work as
  soon as it becomes available
- Immediate notification with new work that includes any votes that arrive late
- Periodic notifications with new work that include new transactions only when
  there have actually been new transaction
- Simplified interface code due to removal of the need for polling and manually
  checking the work bytes for special cases such as the number of votes

**NOTE: Miners that are not rolling the timestamp field as they mine should
ensure their software is upgraded to roll the timestamp to the latest timestamp
each time they hand work out to a miner.  This helps ensure the block timestamps
are as accurate as possible.**

### Transaction Script Validation Optimizations

Transaction script validation has been almost completely rewritten to
significantly improve its speed and reduce the number of memory allocations.
While this has many more benefits than enumerated here, probably the most
important ones for most stakeholders are:

- Votes can be cast more quickly which helps reduce the number of missed votes
- Blocks are able to propagate more quickly throughout the network, which in
  turn further improves votes times
- The initial sync process is around 20-25% faster

### Automatic External IP Address Discovery

In order for nodes to fully participate in the peer-to-peer network, they must
be publicly accessible and made discoverable by advertising their external IP
address.  This is typically made slightly more complicated since most users run
their nodes on networks behind Network Address Translation (NAT).

Previously, in addition to configuring the network firewall and/or router to
allow inbound connections to port 9108 and forwarding the port to the internal
IP address running dcrd, it was also required to manually set the public
external IP address via the `--externalip` CLI option.

This release will now make use of other nodes on the network in a decentralized
fashion to automatically discover the external IP address, so it is no longer
necessary to manually set CLI option for the vast majority of users.

### Tor IPv6 Support

It is now possible to resolve and connect to IPv6 peers over Tor in addition to
the existing IPv4 support.

### RPC Server Changes

#### New Version 2 Block Filter Query RPC (`getcfilterv2`)

A new RPC named `getcfilterv2` is now available which can be used to retrieve
the version 2 [block filter](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki#Block_Filters)
for a given block along with its associated inclusion proof.  See the
[getcfilterv2 JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getcfilterv2)
for API details.

#### New Network Information Query RPC (`getnetworkinfo`)

A new RPC named `getnetworkinfo` is now available which can be used to query
information related to the peer-to-peer network such as the protocol version,
the local time offset, the number of current connections, the supported network
protocols, the current transaction relay fee, and the external IP addresses for
the local interfaces.  See the
[getnetworkinfo JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getnetworkinfo)
for API details.

#### Updates to Chain State Query RPC (`getblockchaininfo`)

The `difficulty` field of the `getblockchaininfo` RPC is now deprecated in favor
of a new field named `difficultyratio` which matches the result returned by the
`getdifficulty` RPC.

See the
[getblockchaininfo JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getblockchaininfo)
for API details.

#### New Optional Version Parameter on Script Decode RPC (`decodescript`)

The `decodescript` RPC now accepts an additional optional parameter to specify
the script version.  The only currently supported script version in Decred is
version 0 which means decoding scripts with versions other than 0 will be seen
as non standard.

#### Removal of Deprecated Block Template RPC (`getblocktemplate`)

The previously deprecated `getblocktemplate` RPC is no longer available.  All
known miners are already using the preferred `getwork` RPC since Decred's block
header supports more than enough nonce space to keep mining hardware busy
without needing to resort to building custom templates with less efficient extra
nonce coinbase workarounds.

#### Additional RPCs Available To Limited Access Users

The following RPCs that were previously unavailable to the limited access RPC
user are now available to it:

- `estimatefee`
- `estimatesmartfee`
- `estimatestakediff`
- `existsaddress`
- `existsaddresses`
- `existsexpiredtickets`
- `existsliveticket`
- `existslivetickets`
- `existsmempoltxs`
- `existsmissedtickets`
- `getblocksubsidy`
- `getcfilter`
- `getcoinsupply`
- `getheaders`
- `getstakedifficulty`
- `getstakeversioninfo`
- `getstakeversions`
- `getvoteinfo`
- `livetickets`
- `missedtickets`
- `rebroadcastmissed`
- `rebroadcastwinners`
- `ticketfeeinfo`
- `ticketsforaddress`
- `ticketvwap`
- `txfeeinfo`

### Single Mining State Request

The peer-to-peer protocol message to request the current mining state
(`getminings`) is used when peers first connect to retrieve all known votes for
the current tip block.  This is only useful when the peer first connects because
all future votes will be relayed once the connection has been established.
Consequently, nodes will now only respond to a single mining state request.
Subsequent requests are ignored.

### Developer Go Modules

A full suite of versioned Go modules (essentially code libraries) are now
available for use by applications written in Go that wish to create robust
software with reproducible, verifiable, and verified builds.

These modules are used to build dcrd itself and are therefore well maintained,
tested, documented, and relatively efficient.

## Changelog

This release consists of 600 commits from 17 contributors which total to 537
files changed, 41494 additional lines of code, and 29215 deleted lines of code.

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v1.4.0...release-v1.5.0).

### Protocol and network:

- chaincfg: Add checkpoints for 1.5.0 release ([decred/dcrd#1924](https://github.com/decred/dcrd/pull/1924))
- chaincfg: Introduce agenda for header cmtmts vote ([decred/dcrd#1904](https://github.com/decred/dcrd/pull/1904))
- multi: Implement combined merkle root and vote ([decred/dcrd#1906](https://github.com/decred/dcrd/pull/1906))
- blockchain: Implement v2 block filter storage ([decred/dcrd#1906](https://github.com/decred/dcrd/pull/1906))
- gcs/blockcf2: Implement v2 block filter creation ([decred/dcrd#1906](https://github.com/decred/dcrd/pull/1906))
- wire: Implement getcfilterv2/cfilterv2 messages ([decred/dcrd#1906](https://github.com/decred/dcrd/pull/1906))
- peer: Implement getcfilterv2/cfilterv2 listeners ([decred/dcrd#1906](https://github.com/decred/dcrd/pull/1906))
- server: Implement getcfilterv2 ([decred/dcrd#1906](https://github.com/decred/dcrd/pull/1906))
- multi: Implement header commitments and vote ([decred/dcrd#1906](https://github.com/decred/dcrd/pull/1906))
- server: Remove instead of disconnect node ([decred/dcrd#1644](https://github.com/decred/dcrd/pull/1644))
- server: limit getminingstate requests ([decred/dcrd#1678](https://github.com/decred/dcrd/pull/1678))
- peer: Prevent last block height going backwards ([decred/dcrd#1747](https://github.com/decred/dcrd/pull/1747))
- connmgr: Add ability to remove pending connections ([decred/dcrd#1724](https://github.com/decred/dcrd/pull/1724))
- connmgr: Add cancellation of pending requests ([decred/dcrd#1724](https://github.com/decred/dcrd/pull/1724))
- connmgr: Check for canceled connection before connect ([decred/dcrd#1724](https://github.com/decred/dcrd/pull/1724))
- multi: add automatic network address discovery ([decred/dcrd#1522](https://github.com/decred/dcrd/pull/1522))
- connmgr: add TorLookupIPContext, deprecate TorLookupIP ([decred/dcrd#1849](https://github.com/decred/dcrd/pull/1849))
- connmgr: support resolving ipv6 hosts over Tor ([decred/dcrd#1908](https://github.com/decred/dcrd/pull/1908))

### Transaction relay (memory pool):

- mempool: Reject same block vote double spends ([decred/dcrd#1597](https://github.com/decred/dcrd/pull/1597))
- mempool: Limit max vote double spends exactly ([decred/dcrd#1596](https://github.com/decred/dcrd/pull/1596))
- mempool: Optimize pool double spend check ([decred/dcrd#1561](https://github.com/decred/dcrd/pull/1561))
- txscript: Tighten standardness pubkey checks ([decred/dcrd#1649](https://github.com/decred/dcrd/pull/1649))
- mempool: drop container/list for simple FIFO ([decred/dcrd#1681](https://github.com/decred/dcrd/pull/1681))
- mempool: remove unused error return value ([decred/dcrd#1785](https://github.com/decred/dcrd/pull/1785))
- mempool: Add ErrorCode to returned TxRuleErrors ([decred/dcrd#1901](https://github.com/decred/dcrd/pull/1901))

### Mining:

- mining: Optimize get the block's votes tx ([decred/dcrd#1563](https://github.com/decred/dcrd/pull/1563))
- multi: add BgBlkTmplGenerator ([decred/dcrd#1424](https://github.com/decred/dcrd/pull/1424))
- mining: Remove unnecessary notify goroutine ([decred/dcrd#1708](https://github.com/decred/dcrd/pull/1708))
- mining: Improve template key handling ([decred/dcrd#1709](https://github.com/decred/dcrd/pull/1709))
- mining:  fix scheduled template regen ([decred/dcrd#1717](https://github.com/decred/dcrd/pull/1717))
- miner: Improve background generator lifecycle ([decred/dcrd#1715](https://github.com/decred/dcrd/pull/1715))
- cpuminer: No speed monitor on discrete mining ([decred/dcrd#1716](https://github.com/decred/dcrd/pull/1716))
- mining: Run vote ntfn in a separate goroutine ([decred/dcrd#1718](https://github.com/decred/dcrd/pull/1718))
- mining: Overhaul background template generator ([decred/dcrd#1748](https://github.com/decred/dcrd/pull/1748))
- mining: Remove unused error return value ([decred/dcrd#1859](https://github.com/decred/dcrd/pull/1859))
- cpuminer: Fix off-by-one issues in nonce handling ([decred/dcrd#1865](https://github.com/decred/dcrd/pull/1865))
- mining: Remove dead code ([decred/dcrd#1882](https://github.com/decred/dcrd/pull/1882))
- mining: Remove unused extra nonce update code ([decred/dcrd#1883](https://github.com/decred/dcrd/pull/1883))
- mining: Minor cleanup of aggressive mining path ([decred/dcrd#1888](https://github.com/decred/dcrd/pull/1888))
- mining: Remove unused error codes ([decred/dcrd#1889](https://github.com/decred/dcrd/pull/1889))
- mining: fix data race ([decred/dcrd#1894](https://github.com/decred/dcrd/pull/1894))
- mining: fix data race ([decred/dcrd#1896](https://github.com/decred/dcrd/pull/1896))
- cpuminer: fix race ([decred/dcrd#1899](https://github.com/decred/dcrd/pull/1899))
- cpuminer: Improve speed stat tracking ([decred/dcrd#1921](https://github.com/decred/dcrd/pull/1921))
- rpcserver/mining: Use bg tpl generator for getwork ([decred/dcrd#1922](https://github.com/decred/dcrd/pull/1922))
- mining: Export TemplateUpdateReason ([decred/dcrd#1923](https://github.com/decred/dcrd/pull/1923))
- multi: Add tpl update reason to work ntfns ([decred/dcrd#1923](https://github.com/decred/dcrd/pull/1923))
- mining: Store block templates given by notifywork ([decred/dcrd#1949](https://github.com/decred/dcrd/pull/1949))

### RPC:

- dcrjson: add cointype to WalletInfoResult ([decred/dcrd#1606](https://github.com/decred/dcrd/pull/1606))
- rpcclient: Introduce v2 module using wallet types ([decred/dcrd#1608](https://github.com/decred/dcrd/pull/1608))
- rpcserver: Update for dcrjson/v2 ([decred/dcrd#1612](https://github.com/decred/dcrd/pull/1612))
- rpcclient: Add EstimateSmartFee ([decred/dcrd#1641](https://github.com/decred/dcrd/pull/1641))
- rpcserver: remove unused quit chan ([decred/dcrd#1629](https://github.com/decred/dcrd/pull/1629))
- rpcserver: Undeprecate getwork ([decred/dcrd#1635](https://github.com/decred/dcrd/pull/1635))
- rpcserver: Add difficultyratio to getblockchaininfo ([decred/dcrd#1630](https://github.com/decred/dcrd/pull/1630))
- multi:  add version arg to decodescript rpc ([decred/dcrd#1731](https://github.com/decred/dcrd/pull/1731))
- dcrjson: Remove API breaking change ([decred/dcrd#1778](https://github.com/decred/dcrd/pull/1778))
- rpcclient: Add GetMasterPubkey ([decred/dcrd#1777](https://github.com/decred/dcrd/pull/1777))
- multi: add getnetworkinfo rpc ([decred/dcrd#1536](https://github.com/decred/dcrd/pull/1536))
- rpcserver: Better error message ([decred/dcrd#1861](https://github.com/decred/dcrd/pull/1861))
- multi: update limited user rpcs ([decred/dcrd#1870](https://github.com/decred/dcrd/pull/1870))
- multi: make rebroadcast winners & missed ws only ([decred/dcrd#1872](https://github.com/decred/dcrd/pull/1872))
- multi: remove getblocktemplate ([decred/dcrd#1736](https://github.com/decred/dcrd/pull/1736))
- rpcserver: Match tx filter on ticket commitments ([decred/dcrd#1881](https://github.com/decred/dcrd/pull/1881))
- rpcserver: don't use activeNetParams ([decred/dcrd#1733](https://github.com/decred/dcrd/pull/1733))
- rpcserver: update rpcAskWallet rpc set ([decred/dcrd#1892](https://github.com/decred/dcrd/pull/1892))
- rpcclient: close the unused response body ([decred/dcrd#1905](https://github.com/decred/dcrd/pull/1905))
- rpcclient: Support getcfilterv2 JSON-RPC ([decred/dcrd#1906](https://github.com/decred/dcrd/pull/1906))
- multi: add notifywork rpc ([decred/dcrd#1410](https://github.com/decred/dcrd/pull/1410))

### dcrd command-line flags and configuration:

- config: Remove deprecated getworkkey option ([decred/dcrd#1594](https://github.com/decred/dcrd/pull/1594))

### certgen utility changes:

- certgen: Support Ed25519 cert generation on Go 1.13 ([decred/dcrd#1757](https://github.com/decred/dcrd/pull/1757))

### dcrctl utility changes:

- dcrctl: Make version string consistent ([decred/dcrd#1598](https://github.com/decred/dcrd/pull/1598))
- dcrctl: Update for dcrjson/v2 and wallet types ([decred/dcrd#1609](https://github.com/decred/dcrd/pull/1609))

### promptsecret utility changes:

- promptsecret: Add -n flag to prompt multiple times ([decred/dcrd#1705](https://github.com/decred/dcrd/pull/1705))

### Documentation:

- docs: Update for secp256k1 v2 module ([decred/dcrd#1919](https://github.com/decred/dcrd/pull/1919))
- docs: document module breaking changes process ([decred/dcrd#1891](https://github.com/decred/dcrd/pull/1891))
- docs: Link to btc whitepaper on decred.org ([decred/dcrd#1885](https://github.com/decred/dcrd/pull/1885))
- docs: Update for mempool v3 module ([decred/dcrd#1835](https://github.com/decred/dcrd/pull/1835))
- docs: Update for peer v2 module ([decred/dcrd#1834](https://github.com/decred/dcrd/pull/1834))
- docs: Update for connmgr v2 module ([decred/dcrd#1833](https://github.com/decred/dcrd/pull/1833))
- docs: Update for mining v2 module ([decred/dcrd#1831](https://github.com/decred/dcrd/pull/1831))
- docs: Update for blockchain v2 module ([decred/dcrd#1823](https://github.com/decred/dcrd/pull/1823))
- docs: Update for rpcclient v4 module ([decred/dcrd#1807](https://github.com/decred/dcrd/pull/1807))
- docs: Update for blockchain/stake v2 module ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- docs: Update for database v2 module ([decred/dcrd#1799](https://github.com/decred/dcrd/pull/1799))
- docs: Update for rpcclient v3 module ([decred/dcrd#1793](https://github.com/decred/dcrd/pull/1793))
- docs: Update for dcrjson/v3 module ([decred/dcrd#1792](https://github.com/decred/dcrd/pull/1792))
- docs: Update for txscript v2 module ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- docs: Update for dcrutil v2 module ([decred/dcrd#1770](https://github.com/decred/dcrd/pull/1770))
- docs: Update for dcrec/edwards v2 module ([decred/dcrd#1765](https://github.com/decred/dcrd/pull/1765))
- docs: Update for chaincfg v2 module ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- docs: Update for hdkeychain v2 module ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- hdkeychain: Correct docs key examples ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- docs: allowHighFees arg has been implemented ([decred/dcrd#1695](https://github.com/decred/dcrd/pull/1695))
- docs: move json rpc docs to mediawiki ([decred/dcrd#1687](https://github.com/decred/dcrd/pull/1687))
- docs: Update for lru module ([decred/dcrd#1683](https://github.com/decred/dcrd/pull/1683))
- docs: fix formatting in json rpc doc ([decred/dcrd#1633](https://github.com/decred/dcrd/pull/1633))
- docs: Update for mempool v2 module ([decred/dcrd#1613](https://github.com/decred/dcrd/pull/1613))
- docs: Update for rpcclient v2 module ([decred/dcrd#1608](https://github.com/decred/dcrd/pull/1608))
- docs: Update for dcrjson v2 module ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- jsonrpc/types: Add README.md and doc.go ([decred/dcrd#1794](https://github.com/decred/dcrd/pull/1794))
- dcrjson: Update README.md ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- dcrec/secp256k1: Update README.md broken link ([decred/dcrd#1631](https://github.com/decred/dcrd/pull/1631))
- bech32: Correct README build badge reference ([decred/dcrd#1689](https://github.com/decred/dcrd/pull/1689))
- hdkeychain: Update README.md ([decred/dcrd#1686](https://github.com/decred/dcrd/pull/1686))
- bech32: Correct README links ([decred/dcrd#1691](https://github.com/decred/dcrd/pull/1691))
- stake: Remove unnecessary language in comment ([decred/dcrd#1752](https://github.com/decred/dcrd/pull/1752))
- multi: Use https links where available ([decred/dcrd#1771](https://github.com/decred/dcrd/pull/1771))
- stake: Make doc.go formatting consistent ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- blockchain: Update doc.go to reflect reality ([decred/dcrd#1823](https://github.com/decred/dcrd/pull/1823))
- multi: update rpc documentation ([decred/dcrd#1867](https://github.com/decred/dcrd/pull/1867))
- dcrec: fix examples links ([decred/dcrd#1914](https://github.com/decred/dcrd/pull/1914))
- gcs: Improve package documentation ([decred/dcrd#1915](https://github.com/decred/dcrd/pull/1915))

### Developer-related package and module changes:

- dcrutil: Return deep copied tx in NewTxDeepTxIns ([decred/dcrd#1545](https://github.com/decred/dcrd/pull/1545))
- mining: Remove superfluous error check ([decred/dcrd#1552](https://github.com/decred/dcrd/pull/1552))
- dcrutil: Block does not cache the header bytes ([decred/dcrd#1571](https://github.com/decred/dcrd/pull/1571))
- blockchain: Remove superfluous GetVoteInfo check ([decred/dcrd#1574](https://github.com/decred/dcrd/pull/1574))
- blockchain: Make consensus votes network agnostic ([decred/dcrd#1590](https://github.com/decred/dcrd/pull/1590))
- blockchain: Optimize skip stakebase input ([decred/dcrd#1565](https://github.com/decred/dcrd/pull/1565))
- txscript: code cleanup ([decred/dcrd#1591](https://github.com/decred/dcrd/pull/1591))
- dcrjson: Move estimate fee test to matching file ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- dcrjson: Move raw stake tx cmds to correct file ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- dcrjson: Move best block result to correct file ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- dcrjson: Move winning tickets ntfn to correct file ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- dcrjson: Move spent tickets ntfn to correct file ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- dcrjson: Move stake diff ntfn to correct file ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- dcrjson: Move new tickets ntfn to correct file ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- txscript: Rename p2sh indicator to isP2SH ([decred/dcrd#1605](https://github.com/decred/dcrd/pull/1605))
- mempool: Remove deprecated min high prio constant ([decred/dcrd#1613](https://github.com/decred/dcrd/pull/1613))
- mempool: Remove tight coupling with dcrjson ([decred/dcrd#1613](https://github.com/decred/dcrd/pull/1613))
- blockmanager: only check if current once handling inv's ([decred/dcrd#1621](https://github.com/decred/dcrd/pull/1621))
- connmngr: Add DialAddr config option ([decred/dcrd#1642](https://github.com/decred/dcrd/pull/1642))
- txscript: Consistent checksigaltverify handling ([decred/dcrd#1647](https://github.com/decred/dcrd/pull/1647))
- multi: preallocate memory ([decred/dcrd#1646](https://github.com/decred/dcrd/pull/1646))
- wire: Fix maximum payload length of MsgAddr ([decred/dcrd#1638](https://github.com/decred/dcrd/pull/1638))
- blockmanager: remove unused requestedEverTxns ([decred/dcrd#1624](https://github.com/decred/dcrd/pull/1624))
- blockmanager: remove useless requestedEverBlocks ([decred/dcrd#1624](https://github.com/decred/dcrd/pull/1624))
- txscript: Introduce constant for max CLTV bytes ([decred/dcrd#1650](https://github.com/decred/dcrd/pull/1650))
- txscript: Introduce constant for max CSV bytes ([decred/dcrd#1651](https://github.com/decred/dcrd/pull/1651))
- chaincfg: Remove unused definition ([decred/dcrd#1661](https://github.com/decred/dcrd/pull/1661))
- chaincfg: Use expected regnet merkle root var ([decred/dcrd#1662](https://github.com/decred/dcrd/pull/1662))
- blockchain: Deprecate BlockOneCoinbasePaysTokens ([decred/dcrd#1657](https://github.com/decred/dcrd/pull/1657))
- blockchain: Explicit script ver in coinbase checks ([decred/dcrd#1658](https://github.com/decred/dcrd/pull/1658))
- chaincfg: Explicit unique net addr prefix ([decred/dcrd#1663](https://github.com/decred/dcrd/pull/1663))
- chaincfg: Introduce params lookup by addr prefix ([decred/dcrd#1664](https://github.com/decred/dcrd/pull/1664))
- dcrutil: Lookup params by addr prefix in chaincfg ([decred/dcrd#1665](https://github.com/decred/dcrd/pull/1665))
- peer: Deprecate dependency on chaincfg ([decred/dcrd#1671](https://github.com/decred/dcrd/pull/1671))
- server: Update for deprecated peer chaincfg ([decred/dcrd#1671](https://github.com/decred/dcrd/pull/1671))
- fees: drop unused chaincfg ([decred/dcrd#1675](https://github.com/decred/dcrd/pull/1675))
- lru: Implement a new module with generic LRU cache ([decred/dcrd#1683](https://github.com/decred/dcrd/pull/1683))
- peer: Use lru cache module for inventory ([decred/dcrd#1683](https://github.com/decred/dcrd/pull/1683))
- peer: Use lru cache module for nonces ([decred/dcrd#1683](https://github.com/decred/dcrd/pull/1683))
- server: Use lru cache module for addresses ([decred/dcrd#1683](https://github.com/decred/dcrd/pull/1683))
- multi: drop init and just set default log ([decred/dcrd#1676](https://github.com/decred/dcrd/pull/1676))
- multi: deprecate DisableLog ([decred/dcrd#1676](https://github.com/decred/dcrd/pull/1676))
- blockchain: Remove unused params from block index ([decred/dcrd#1674](https://github.com/decred/dcrd/pull/1674))
- bech32: Initial Version ([decred/dcrd#1646](https://github.com/decred/dcrd/pull/1646))
- chaincfg: Add extended key accessor funcs ([decred/dcrd#1694](https://github.com/decred/dcrd/pull/1694))
- chaincfg: Rename extended key accessor funcs ([decred/dcrd#1699](https://github.com/decred/dcrd/pull/1699))
- wire: Accurate calculations of maximum length ([decred/dcrd#1672](https://github.com/decred/dcrd/pull/1672))
- wire: Fix MsgCFTypes maximum payload length ([decred/dcrd#1673](https://github.com/decred/dcrd/pull/1673))
- txscript: Deprecate HasP2SHScriptSigStakeOpCodes ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Deprecate IsStakeOutput ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Deprecate GetMultisigMandN ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Introduce zero-alloc script tokenizer ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize script disasm ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Introduce raw script sighash calc func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize CalcSignatureHash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make isSmallInt accept raw opcode ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make asSmallInt accept raw opcode ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make isStakeOpcode accept raw opcode ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize IsPayToScriptHash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize IsMultisigScript ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize IsMultisigSigScript ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize GetSigOpCount ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize isAnyKindOfScriptHash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize IsPushOnlyScript ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize new engine push only script ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Check p2sh push before parsing scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize GetPreciseSigOpCount ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make typeOfScript accept raw script ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript pay-to-script-hash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isScriptHash function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript multisig ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isMultiSig function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript pay-to-pubkey ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isPubkey function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript pay-to-alt-pubkey ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript pay-to-pubkey-hash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isPubkeyHash function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript pay-to-alt-pk-hash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript nulldata detection ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isNullData function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript stakesub detection ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isStakeSubmission function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript stakegen detection ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isStakeGen function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript stakerev detection ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isStakeRevocation function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize typeOfScript stakechange detect ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isSStxChange function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ContainsStakeOpCodes ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractCoinbaseNullData ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Convert CalcScriptInfo ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isPushOnly function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused getSigOpCount function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize CalcMultiSigStats ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize multi sig redeem script func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Convert GetScriptHashFromP2SHScript ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize PushedData ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize IsUnspendable ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make canonicalPush accept raw opcode ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractAtomicSwapDataPushes ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs scripthash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs pubkeyhash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs altpubkeyhash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs pubkey ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs altpubkey ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs multisig ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs stakesub ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs stakegen ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs stakerev ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs stakechange ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAddrs nulldata ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Optimize ExtractPkScriptAltSigType ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused extractOneBytePush func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isPubkeyAlt function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isPubkeyHashAlt function ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused isOneByteMaxDataPush func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: mergeMultiSig function def order cleanup ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Use raw scripts in RawTxInSignature ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Use raw scripts in RawTxInSignatureAlt ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Correct p2pkSignatureScriptAlt comment ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Use raw scripts in SignTxOutput ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Implement efficient opcode data removal ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make isDisabled accept raw opcode ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make alwaysIllegal accept raw opcode ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make isConditional accept raw opcode ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make min push accept raw opcode and data ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Convert to use non-parsed opcode disasm ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Refactor engine to use raw scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused removeOpcodeByData func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Rename removeOpcodeByDataRaw func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused calcSignatureHash func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Rename calcSignatureHashRaw func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused parseScript func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused unparseScript func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused parsedOpcode.bytes func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Remove unused parseScriptTemplate func ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make executeOpcode take opcode and data ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Make op callbacks take opcode and data ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- dcrutil: Fix NewTxDeepTxIns implementation ([decred/dcrd#1685](https://github.com/decred/dcrd/pull/1685))
- stake: drop txscript.DefaultScriptVersion usage ([decred/dcrd#1704](https://github.com/decred/dcrd/pull/1704))
- peer: invSendQueue is a FIFO ([decred/dcrd#1680](https://github.com/decred/dcrd/pull/1680))
- peer: pendingMsgs is a FIFO ([decred/dcrd#1680](https://github.com/decred/dcrd/pull/1680))
- blockchain: drop container/list ([decred/dcrd#1682](https://github.com/decred/dcrd/pull/1682))
- blockmanager: use local var for the request queue ([decred/dcrd#1622](https://github.com/decred/dcrd/pull/1622))
- server: return on outbound peer creation error ([decred/dcrd#1637](https://github.com/decred/dcrd/pull/1637))
- hdkeychain: Remove Address method ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- hdkeychain: Remove SetNet method ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- hdkeychain: Require network on decode extended key ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- hdkeychain: Don't rely on global state ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- hdkeychain: Introduce NetworkParams interface ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- server: Remove unused ScheduleShutdown func ([decred/dcrd#1711](https://github.com/decred/dcrd/pull/1711))
- server: Remove unused dynamicTickDuration func ([decred/dcrd#1711](https://github.com/decred/dcrd/pull/1711))
- main: Convert signal handling to use context ([decred/dcrd#1712](https://github.com/decred/dcrd/pull/1712))
- txscript: Remove checks for impossible conditions ([decred/dcrd#1713](https://github.com/decred/dcrd/pull/1713))
- indexers: Remove unused func ([decred/dcrd#1714](https://github.com/decred/dcrd/pull/1714))
- multi: fix onVoteReceivedHandler shutdown ([decred/dcrd#1721](https://github.com/decred/dcrd/pull/1721))
- wire: Rename extended errors to malformed errors ([decred/dcrd#1742](https://github.com/decred/dcrd/pull/1742))
- rpcwebsocket: convert from list to simple FIFO ([decred/dcrd#1726](https://github.com/decred/dcrd/pull/1726))
- dcrec: implement GenerateKey ([decred/dcrd#1652](https://github.com/decred/dcrd/pull/1652))
- txscript: Remove SigHashOptimization constant ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- txscript: Remove CheckForDuplicateHashes constant ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- txscript: Remove CPUMinerThreads constant ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Move DNSSeed stringer next to type def ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Remove all registration capabilities ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Move mainnet code to mainnet files ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Move testnet3 code to testnet files ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Move simnet code to testnet files ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Move regnet code to regnet files ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Concrete genesis hash in Params struct ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Use scripts in block one token payouts ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Convert global param defs to funcs ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- edwards: remove curve param ([decred/dcrd#1762](https://github.com/decred/dcrd/pull/1762))
- edwards: unexport EncodedBytesToBigIntPoint ([decred/dcrd#1762](https://github.com/decred/dcrd/pull/1762))
- edwards: unexport a slew of funcs ([decred/dcrd#1762](https://github.com/decred/dcrd/pull/1762))
- edwards: add signature IsEqual and Verify methods ([decred/dcrd#1762](https://github.com/decred/dcrd/pull/1762))
- edwards: add Sign method to PrivateKey ([decred/dcrd#1762](https://github.com/decred/dcrd/pull/1762))
- chaincfg: Add addr params accessor funcs ([decred/dcrd#1766](https://github.com/decred/dcrd/pull/1766))
- schnorr: remove curve param ([decred/dcrd#1764](https://github.com/decred/dcrd/pull/1764))
- schnorr: unexport functions ([decred/dcrd#1764](https://github.com/decred/dcrd/pull/1764))
- schnorr: add signature IsEqual and Verify methods ([decred/dcrd#1764](https://github.com/decred/dcrd/pull/1764))
- secp256k1: unexport NAF ([decred/dcrd#1764](https://github.com/decred/dcrd/pull/1764))
- addrmgr: drop container/list ([decred/dcrd#1679](https://github.com/decred/dcrd/pull/1679))
- dcrutil: Remove unused ErrAddressCollision ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcurtil: Remove unused ErrMissingDefaultNet ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Require network on address decode ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Remove IsForNet from Address interface ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Remove DSA from Address interface ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Remove Net from Address interface ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Rename EncodeAddress to Address ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Don't store net ref in addr impls ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Require network on WIF decode ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Accept magic bytes directly in NewWIF ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Introduce AddressParams interface ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- blockchain: Do coinbase nulldata check locally ([decred/dcrd#1770](https://github.com/decred/dcrd/pull/1770))
- blockchain: update CalcBlockSubsidy ([decred/dcrd#1750](https://github.com/decred/dcrd/pull/1750))
- txscript: Use const for sighashall optimization ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Remove DisableLog ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Unexport HasP2SHScriptSigStakeOpCodes ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Remove third GetPreciseSigOpCount param ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Remove IsMultisigScript err return ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Unexport IsStakeOutput ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Remove CalcScriptInfo ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Remove multisig redeem script err return ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Remove GetScriptHashFromP2SHScript ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Remove GetMultisigMandN ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Remove DefaultScriptVersion ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Use secp256k1 types in sig cache ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- multi: decouple BlockManager from server ([decred/dcrd#1728](https://github.com/decred/dcrd/pull/1728))
- database: Introduce BlockSerializer interface ([decred/dcrd#1799](https://github.com/decred/dcrd/pull/1799))
- hdkeychain: Add ChildNum and Depth methods ([decred/dcrd#1800](https://github.com/decred/dcrd/pull/1800))
- chaincfg: Avoid block 1 subsidy codegen explosion ([decred/dcrd#1801](https://github.com/decred/dcrd/pull/1801))
- chaincfg: Add stake params accessor funcs ([decred/dcrd#1802](https://github.com/decred/dcrd/pull/1802))
- stake: Remove DisableLog ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- stake: Remove unused TxSSGenStakeOutputInfo ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- stake: Remove unused TxSSRtxStakeOutputInfo ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- stake: Remove unused SetTxTree ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- stake: Introduce StakeParams interface ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- stake: Accept AddressParams for ticket commit addr ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- gcs: Optimize AddSigScript ([decred/dcrd#1804](https://github.com/decred/dcrd/pull/1804))
- chaincfg: Add subsidy params accessor funcs ([decred/dcrd#1813](https://github.com/decred/dcrd/pull/1813))
- blockchain/standalone: Implement a new module ([decred/dcrd#1808](https://github.com/decred/dcrd/pull/1808))
- blockchain/standalone: Add merkle root calc funcs ([decred/dcrd#1809](https://github.com/decred/dcrd/pull/1809))
- blockchain/standalone: Add subsidy calc funcs ([decred/dcrd#1812](https://github.com/decred/dcrd/pull/1812))
- blockchain/standalone: Add IsCoinBaseTx ([decred/dcrd#1815](https://github.com/decred/dcrd/pull/1815))
- crypto/blake256: Add module with zero alloc funcs ([decred/dcrd#1811](https://github.com/decred/dcrd/pull/1811))
- stake: Check minimum req outputs for votes earlier ([decred/dcrd#1819](https://github.com/decred/dcrd/pull/1819))
- blockchain: Use standalone module for merkle calcs ([decred/dcrd#1816](https://github.com/decred/dcrd/pull/1816))
- blockchain: Use standalone for coinbase checks ([decred/dcrd#1816](https://github.com/decred/dcrd/pull/1816))
- blockchain: Use standalone module subsidy calcs ([decred/dcrd#1816](https://github.com/decred/dcrd/pull/1816))
- blockchain: Use standalone module for work funcs ([decred/dcrd#1816](https://github.com/decred/dcrd/pull/1816))
- blockchain: Remove deprecated code ([decred/dcrd#1823](https://github.com/decred/dcrd/pull/1823))
- blockchain: Accept subsidy cache in config ([decred/dcrd#1823](https://github.com/decred/dcrd/pull/1823))
- mining: Use lastest major version deps ([decred/dcrd#1831](https://github.com/decred/dcrd/pull/1831))
- connmgr: Accept DNS seeds as string slice ([decred/dcrd#1833](https://github.com/decred/dcrd/pull/1833))
- peer: Remove deprecated Config.ChainParams field ([decred/dcrd#1834](https://github.com/decred/dcrd/pull/1834))
- peer: Accept hash slice for block locators ([decred/dcrd#1834](https://github.com/decred/dcrd/pull/1834))
- peer: Use latest major version deps ([decred/dcrd#1834](https://github.com/decred/dcrd/pull/1834))
- mempool: Use latest major version deps ([decred/dcrd#1835](https://github.com/decred/dcrd/pull/1835))
- main: Update to use all new major module versions ([decred/dcrd#1837](https://github.com/decred/dcrd/pull/1837))
- blockchain: Implement stricter bounds checking ([decred/dcrd#1825](https://github.com/decred/dcrd/pull/1825))
- gcs: Start v2 module dev cycle ([decred/dcrd#1843](https://github.com/decred/dcrd/pull/1843))
- gcs: Support empty filters ([decred/dcrd#1844](https://github.com/decred/dcrd/pull/1844))
- gcs: Make error consistent with rest of codebase ([decred/dcrd#1846](https://github.com/decred/dcrd/pull/1846))
- gcs: Add filter version support ([decred/dcrd#1848](https://github.com/decred/dcrd/pull/1848))
- gcs: Correct zero hash filter matches ([decred/dcrd#1857](https://github.com/decred/dcrd/pull/1857))
- gcs: Standardize serialization on a single format ([decred/dcrd#1851](https://github.com/decred/dcrd/pull/1851))
- gcs: Optimize Hash ([decred/dcrd#1853](https://github.com/decred/dcrd/pull/1853))
- gcs: Group V1 filter funcs after filter defs ([decred/dcrd#1854](https://github.com/decred/dcrd/pull/1854))
- gcs: Support independent fp rate and bin size ([decred/dcrd#1854](https://github.com/decred/dcrd/pull/1854))
- blockchain: Refactor best chain state init ([decred/dcrd#1871](https://github.com/decred/dcrd/pull/1871))
- gcs: Implement version 2 filters ([decred/dcrd#1856](https://github.com/decred/dcrd/pull/1856))
- blockchain: Cleanup subsidy cache init order ([decred/dcrd#1873](https://github.com/decred/dcrd/pull/1873))
- multi: use chain ref. from blockmanager config ([decred/dcrd#1879](https://github.com/decred/dcrd/pull/1879))
- multi: remove unused funcs and vars ([decred/dcrd#1880](https://github.com/decred/dcrd/pull/1880))
- gcs: Prevent empty data elements in v2 filters ([decred/dcrd#1911](https://github.com/decred/dcrd/pull/1911))
- crypto: import ripemd160 ([decred/dcrd#1907](https://github.com/decred/dcrd/pull/1907))
- multi: Use secp256k1/v2 module ([decred/dcrd#1919](https://github.com/decred/dcrd/pull/1919))
- multi: Use crypto/ripemd160 module ([decred/dcrd#1918](https://github.com/decred/dcrd/pull/1918))
- multi: Use dcrec/edwards/v2 module ([decred/dcrd#1920](https://github.com/decred/dcrd/pull/1920))
- gcs: Prevent empty data elements fp matches ([decred/dcrd#1940](https://github.com/decred/dcrd/pull/1940))
- main: Update to use all new module versions ([decred/dcrd#1946](https://github.com/decred/dcrd/pull/1946))
- blockchain/standalone: Add inclusion proof funcs ([decred/dcrd#1906](https://github.com/decred/dcrd/pull/1906))

### Developer-related module management:

- build: Require dcrjson v1.2.0 ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- multi: Remove non-root module replacements ([decred/dcrd#1599](https://github.com/decred/dcrd/pull/1599))
- dcrjson: Introduce v2 module without wallet types ([decred/dcrd#1607](https://github.com/decred/dcrd/pull/1607))
- release: Freeze version 1 mempool module ([decred/dcrd#1613](https://github.com/decred/dcrd/pull/1613))
- release: Introduce mempool v2 module ([decred/dcrd#1613](https://github.com/decred/dcrd/pull/1613))
- main: Tidy module to latest ([decred/dcrd#1613](https://github.com/decred/dcrd/pull/1613))
- main: Update for mempool/v2 ([decred/dcrd#1616](https://github.com/decred/dcrd/pull/1616))
- multi: Add go 1.11 directive to all modules ([decred/dcrd#1677](https://github.com/decred/dcrd/pull/1677))
- build: Tidy module sums (go mod tidy) ([decred/dcrd#1692](https://github.com/decred/dcrd/pull/1692))
- release: Freeze version 1 hdkeychain module ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- release: Introduce hdkeychain v2 module ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- release: Freeze version 1 chaincfg module ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Introduce chaincfg v2 module ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- chaincfg: Use dcrec/edwards/v1.0.0 ([decred/dcrd#1758](https://github.com/decred/dcrd/pull/1758))
- dcrutil: Prepare v1.3.0 ([decred/dcrd#1761](https://github.com/decred/dcrd/pull/1761))
- release: freeze version 1 dcrec/edwards module ([decred/dcrd#1762](https://github.com/decred/dcrd/pull/1762))
- edwards: Introduce v2 module ([decred/dcrd#1762](https://github.com/decred/dcrd/pull/1762))
- release: freeze version 1 dcrec/secp256k1 module ([decred/dcrd#1764](https://github.com/decred/dcrd/pull/1764))
- secp256k1: Introduce v2 module ([decred/dcrd#1764](https://github.com/decred/dcrd/pull/1764))
- multi: Update all modules for chaincfg v1.5.1 ([decred/dcrd#1768](https://github.com/decred/dcrd/pull/1768))
- release: Freeze version 1 dcrutil module ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Update to use chaincfg/v2 module ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- release: Introduce dcrutil v2 module ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- database: Use chaincfg/v2 ([decred/dcrd#1772](https://github.com/decred/dcrd/pull/1772))
- txscript: Prepare v1.1.0 ([decred/dcrd#1773](https://github.com/decred/dcrd/pull/1773))
- stake: Prepare v1.2.0 ([decred/dcrd#1775](https://github.com/decred/dcrd/pull/1775))
- release: Freeze version 1 txscript module ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- txscript: Use dcrutil/v2 ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- release: Introduce txscript v2 module ([decred/dcrd#1774](https://github.com/decred/dcrd/pull/1774))
- main: Add requires for new version modules ([decred/dcrd#1776](https://github.com/decred/dcrd/pull/1776))
- dcrjson: Introduce v3 and move types to module ([decred/dcrd#1779](https://github.com/decred/dcrd/pull/1779))
- jsonrpc/types: Prepare 1.0.0 ([decred/dcrd#1787](https://github.com/decred/dcrd/pull/1787))
- main: Use latest JSON-RPC types ([decred/dcrd#1789](https://github.com/decred/dcrd/pull/1789))
- multi: Use decred fork of go-socks ([decred/dcrd#1790](https://github.com/decred/dcrd/pull/1790))
- rpcclient: Prepare v2.1.0 ([decred/dcrd#1791](https://github.com/decred/dcrd/pull/1791))
- release: Freeze version 2 rpcclient module ([decred/dcrd#1793](https://github.com/decred/dcrd/pull/1793))
- rpcclient: Use dcrjson/v3 ([decred/dcrd#1793](https://github.com/decred/dcrd/pull/1793))
- release: Introduce rpcclient v3 module ([decred/dcrd#1793](https://github.com/decred/dcrd/pull/1793))
- main: Use rpcclient/v3 ([decred/dcrd#1795](https://github.com/decred/dcrd/pull/1795))
- hdkeychain: Prepare v2.0.1 ([decred/dcrd#1798](https://github.com/decred/dcrd/pull/1798))
- release: Freeze version 1 database module ([decred/dcrd#1799](https://github.com/decred/dcrd/pull/1799))
- database: Use dcrutil/v2 ([decred/dcrd#1799](https://github.com/decred/dcrd/pull/1799))
- release: Introduce database v2 module ([decred/dcrd#1799](https://github.com/decred/dcrd/pull/1799))
- release: Freeze version 1 blockchain/stake module ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- stake: Use dcrutil/v2 and chaincfg/v2 ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- Use txscript/v2 ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- stake: Use database/v2 ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- release: Introduce blockchain/stake v2 module ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- gcs: Use txscript/v2 ([decred/dcrd#1804](https://github.com/decred/dcrd/pull/1804))
- gcs: Prepare v1.1.0 ([decred/dcrd#1804](https://github.com/decred/dcrd/pull/1804))
- release: Freeze version 3 rpcclient module ([decred/dcrd#1807](https://github.com/decred/dcrd/pull/1807))
- rpcclient: Use dcrutil/v2 and chaincfg/v2 ([decred/dcrd#1807](https://github.com/decred/dcrd/pull/1807))
- release: Introduce rpcclient v4 module ([decred/dcrd#1807](https://github.com/decred/dcrd/pull/1807))
- blockchain/standalone: Prepare v1.0.0 ([decred/dcrd#1817](https://github.com/decred/dcrd/pull/1817))
- multi: Use crypto/blake256 ([decred/dcrd#1818](https://github.com/decred/dcrd/pull/1818))
- main: Consume latest module minors and patches ([decred/dcrd#1822](https://github.com/decred/dcrd/pull/1822))
- blockchain: Prepare v1.2.0 ([decred/dcrd#1820](https://github.com/decred/dcrd/pull/1820))
- mining: Prepare v1.1.1 ([decred/dcrd#1826](https://github.com/decred/dcrd/pull/1826))
- release: Freeze version 1 blockchain module use ([decred/dcrd#1823](https://github.com/decred/dcrd/pull/1823))
- blockchain: Use lastest major version deps ([decred/dcrd#1823](https://github.com/decred/dcrd/pull/1823))
- release: Introduce blockchain v2 module ([decred/dcrd#1823](https://github.com/decred/dcrd/pull/1823))
- connmgr: Prepare v1.1.0 ([decred/dcrd#1828](https://github.com/decred/dcrd/pull/1828))
- peer: Prepare v1.2.0 ([decred/dcrd#1830](https://github.com/decred/dcrd/pull/1830))
- release: Freeze version 1 mining module use ([decred/dcrd#1831](https://github.com/decred/dcrd/pull/1831))
- release: Introduce mining v2 module ([decred/dcrd#1831](https://github.com/decred/dcrd/pull/1831))
- mempool: Prepare v2.1.0 ([decred/dcrd#1832](https://github.com/decred/dcrd/pull/1832))
- release: Freeze version 1 connmgr module use ([decred/dcrd#1833](https://github.com/decred/dcrd/pull/1833))
- release: Introduce connmgr v2 module ([decred/dcrd#1833](https://github.com/decred/dcrd/pull/1833))
- release: Freeze version 1 peer module use ([decred/dcrd#1834](https://github.com/decred/dcrd/pull/1834))
- release: Introduce peer v2 module ([decred/dcrd#1834](https://github.com/decred/dcrd/pull/1834))
- blockchain: Prepare v2.0.1 ([decred/dcrd#1836](https://github.com/decred/dcrd/pull/1836))
- release: Freeze version 2 mempool module use ([decred/dcrd#1835](https://github.com/decred/dcrd/pull/1835))
- release: Introduce mempool v3 module ([decred/dcrd#1835](https://github.com/decred/dcrd/pull/1835))
- go.mod: sync ([decred/dcrd#1913](https://github.com/decred/dcrd/pull/1913))
- secp256k1: Prepare v2.0.0 ([decred/dcrd#1916](https://github.com/decred/dcrd/pull/1916))
- wire: Prepare v1.3.0 ([decred/dcrd#1925](https://github.com/decred/dcrd/pull/1925))
- chaincfg: Prepare v2.3.0 ([decred/dcrd#1926](https://github.com/decred/dcrd/pull/1926))
- dcrjson: Prepare v3.0.1 ([decred/dcrd#1927](https://github.com/decred/dcrd/pull/1927))
- rpc/jsonrpc/types: Prepare v2.0.0 ([decred/dcrd#1928](https://github.com/decred/dcrd/pull/1928))
- dcrutil: Prepare v2.0.1 ([decred/dcrd#1929](https://github.com/decred/dcrd/pull/1929))
- blockchain/standalone: Prepare v1.1.0 ([decred/dcrd#1930](https://github.com/decred/dcrd/pull/1930))
- txscript: Prepare v2.1.0 ([decred/dcrd#1931](https://github.com/decred/dcrd/pull/1931))
- database: Prepare v2.0.1 ([decred/dcrd#1932](https://github.com/decred/dcrd/pull/1932))
- blockchain/stake: Prepare v2.0.2 ([decred/dcrd#1933](https://github.com/decred/dcrd/pull/1933))
- gcs: Prepare v2.0.0 ([decred/dcrd#1934](https://github.com/decred/dcrd/pull/1934))
- blockchain: Prepare v2.1.0 ([decred/dcrd#1935](https://github.com/decred/dcrd/pull/1935))
- addrmgr: Prepare v1.1.0 ([decred/dcrd#1936](https://github.com/decred/dcrd/pull/1936))
- connmgr: Prepare v2.1.0 ([decred/dcrd#1937](https://github.com/decred/dcrd/pull/1937))
- hdkeychain: Prepare v2.1.0 ([decred/dcrd#1938](https://github.com/decred/dcrd/pull/1938))
- peer: Prepare v2.1.0 ([decred/dcrd#1939](https://github.com/decred/dcrd/pull/1939))
- fees: Prepare v2.0.0 ([decred/dcrd#1941](https://github.com/decred/dcrd/pull/1941))
- rpcclient: Prepare v4.1.0 ([decred/dcrd#1943](https://github.com/decred/dcrd/pull/1943))
- mining: Prepare v2.0.1 ([decred/dcrd#1944](https://github.com/decred/dcrd/pull/1944))
- mempool: Prepare v3.1.0 ([decred/dcrd#1945](https://github.com/decred/dcrd/pull/1945))

### Testing and Quality Assurance:

- mempool: Accept test mungers for vote tx ([decred/dcrd#1595](https://github.com/decred/dcrd/pull/1595))
- build: Replace TravisCI with CI via Github actions ([decred/dcrd#1903](https://github.com/decred/dcrd/pull/1903))
- build: Setup github actions for CI ([decred/dcrd#1902](https://github.com/decred/dcrd/pull/1902))
- TravisCI: Recommended install for golangci-lint ([decred/dcrd#1808](https://github.com/decred/dcrd/pull/1808))
- TravisCI: Use more portable module ver stripping ([decred/dcrd#1784](https://github.com/decred/dcrd/pull/1784))
- TravisCI: Test and lint latest version modules ([decred/dcrd#1776](https://github.com/decred/dcrd/pull/1776))
- TravisCI: Disable race detector ([decred/dcrd#1749](https://github.com/decred/dcrd/pull/1749))
- TravisCI: Set ./run_tests.sh executable perms ([decred/dcrd#1648](https://github.com/decred/dcrd/pull/1648))
- travis: bump golangci-lint to v1.18.0 ([decred/dcrd#1890](https://github.com/decred/dcrd/pull/1890))
- travis: Test go1.13 and drop go1.11 ([decred/dcrd#1875](https://github.com/decred/dcrd/pull/1875))
- travis: Allow staged builds with build cache ([decred/dcrd#1797](https://github.com/decred/dcrd/pull/1797))
- travis: drop docker and test directly ([decred/dcrd#1783](https://github.com/decred/dcrd/pull/1783))
- travis: test go1.12 ([decred/dcrd#1627](https://github.com/decred/dcrd/pull/1627))
- travis: Add misspell linter ([decred/dcrd#1618](https://github.com/decred/dcrd/pull/1618))
- travis: run linters in each module ([decred/dcrd#1601](https://github.com/decred/dcrd/pull/1601))
- multi: switch to golangci-lint ([decred/dcrd#1575](https://github.com/decred/dcrd/pull/1575))
- blockchain: Consistent legacy seq lock tests ([decred/dcrd#1580](https://github.com/decred/dcrd/pull/1580))
- blockchain: Add test logic to find deployments ([decred/dcrd#1581](https://github.com/decred/dcrd/pull/1581))
- blockchain: Introduce chaingen test harness ([decred/dcrd#1583](https://github.com/decred/dcrd/pull/1583))
- blockchain: Use harness in force head reorg tests ([decred/dcrd#1584](https://github.com/decred/dcrd/pull/1584))
- blockchain: Use harness in stake version tests ([decred/dcrd#1585](https://github.com/decred/dcrd/pull/1585))
- blockchain: Use harness in checkblktemplate tests ([decred/dcrd#1586](https://github.com/decred/dcrd/pull/1586))
- blockchain: Use harness in threshold state tests ([decred/dcrd#1587](https://github.com/decred/dcrd/pull/1587))
- blockchain: Use harness in legacy seqlock tests ([decred/dcrd#1588](https://github.com/decred/dcrd/pull/1588))
- blockchain: Use harness in fixed seqlock tests ([decred/dcrd#1589](https://github.com/decred/dcrd/pull/1589))
- multi: cleanup linter warnings ([decred/dcrd#1601](https://github.com/decred/dcrd/pull/1601))
- txscript: Add remove signature reference test ([decred/dcrd#1604](https://github.com/decred/dcrd/pull/1604))
- rpctest: Update for rpccclient/v2 and dcrjson/v2 ([decred/dcrd#1610](https://github.com/decred/dcrd/pull/1610))
- wire: Add tests for MsgCFTypes ([decred/dcrd#1619](https://github.com/decred/dcrd/pull/1619))
- chaincfg: Move a test to chainhash package ([decred/dcrd#1632](https://github.com/decred/dcrd/pull/1632))
- rpctest: Add RemoveNode ([decred/dcrd#1643](https://github.com/decred/dcrd/pull/1643))
- rpctest: Add NodesConnected ([decred/dcrd#1643](https://github.com/decred/dcrd/pull/1643))
- dcrutil: Reduce global refs in addr unit tests ([decred/dcrd#1666](https://github.com/decred/dcrd/pull/1666))
- dcrutil: Consolidate tests into package ([decred/dcrd#1669](https://github.com/decred/dcrd/pull/1669))
- peer: Consolidate tests into package ([decred/dcrd#1670](https://github.com/decred/dcrd/pull/1670))
- wire: Add tests for BlockHeader (From)Bytes ([decred/dcrd#1600](https://github.com/decred/dcrd/pull/1600))
- wire: Add tests for MsgGetCFilter ([decred/dcrd#1628](https://github.com/decred/dcrd/pull/1628))
- dcrutil: Add tests for NewTxDeep ([decred/dcrd#1684](https://github.com/decred/dcrd/pull/1684))
- rpctest: Introduce VotingWallet ([decred/dcrd#1668](https://github.com/decred/dcrd/pull/1668))
- txscript: Add stake tx remove opcode tests ([decred/dcrd#1210](https://github.com/decred/dcrd/pull/1210))
- txscript: Move init func in benchmarks to top ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for script parsing ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for DisasmString ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Convert sighash calc tests ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for IsPayToScriptHash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmarks for IsMutlsigScript ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmarks for IsMutlsigSigScript ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for GetSigOpCount ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add tests for stake-tagged script hash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for isAnyKindOfScriptHash ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for IsPushOnlyScript ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for GetPreciseSigOpCount ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for GetScriptClass ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for pay-to-pubkey scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add bench for pay-to-alt-pubkey scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add bench for pay-to-pubkey-hash scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add bench for pay-to-alt-pubkey-hash scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add bench for null scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add bench for stake submission scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add bench for stake generation scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add bench for stake revocation scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add bench for stake change scripts ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for ContainsStakeOpCodes ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for ExtractCoinbaseNullData ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add CalcMultiSigStats benchmark ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add multisig redeem script extract bench ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for PushedData ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add benchmark for IsUnspendable ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add tests for atomic swap extraction ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add ExtractAtomicSwapDataPushes benches ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add ExtractPkScriptAddrs benchmarks ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- txscript: Add ExtractPkScriptAltSigType benchmark ([decred/dcrd#1656](https://github.com/decred/dcrd/pull/1656))
- wire: Add tests for MsgGetCFTypes ([decred/dcrd#1703](https://github.com/decred/dcrd/pull/1703))
- blockchain: Allow named blocks in chaingen harness ([decred/dcrd#1701](https://github.com/decred/dcrd/pull/1701))
- txscript: Cleanup opcode removal by data tests ([decred/dcrd#1702](https://github.com/decred/dcrd/pull/1702))
- hdkeychain: Correct benchmark extended key ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- hdkeychain: Consolidate tests into package ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- hdkeychain: Use locally-scoped netparams in tests ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- hdkeychain: Use mock net params in tests ([decred/dcrd#1696](https://github.com/decred/dcrd/pull/1696))
- wire: Add tests for MsgGetCFHeaders ([decred/dcrd#1720](https://github.com/decred/dcrd/pull/1720))
- wire: Add tests for MsgCFHeaders ([decred/dcrd#1732](https://github.com/decred/dcrd/pull/1732))
- main/rpctest: Update for hdkeychain/v2 ([decred/dcrd#1707](https://github.com/decred/dcrd/pull/1707))
- rpctest: Allow custom miner on voting wallet ([decred/dcrd#1751](https://github.com/decred/dcrd/pull/1751))
- wire: Add tests for MsgCFilter ([decred/dcrd#1741](https://github.com/decred/dcrd/pull/1741))
- chaincfg; Add tests for required unique fields ([decred/dcrd#1698](https://github.com/decred/dcrd/pull/1698))
- fullblocktests: Add coinbase nulldata tests ([decred/dcrd#1769](https://github.com/decred/dcrd/pull/1769))
- dcrutil: Make docs example testable and correct it ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- dcrutil: Use mock addr params in tests ([decred/dcrd#1767](https://github.com/decred/dcrd/pull/1767))
- wire: assert MaxMessagePayload limit in tests ([decred/dcrd#1755](https://github.com/decred/dcrd/pull/1755))
- docker: use go 1.12 ([decred/dcrd#1782](https://github.com/decred/dcrd/pull/1782))
- docker: update alpine and include notes ([decred/dcrd#1786](https://github.com/decred/dcrd/pull/1786))
- hdkeychain: Correct a few comment typos ([decred/dcrd#1796](https://github.com/decred/dcrd/pull/1796))
- database: Use unique test db names for v2 module ([decred/dcrd#1806](https://github.com/decred/dcrd/pull/1806))
- main: Add database/v2 override for tests ([decred/dcrd#1806](https://github.com/decred/dcrd/pull/1806))
- gcs: Add benchmark for AddSigScript ([decred/dcrd#1804](https://github.com/decred/dcrd/pull/1804))
- txscript: Fix typo in script test data ([decred/dcrd#1821](https://github.com/decred/dcrd/pull/1821))
- database: Separate dbs for concurrent db tests ([decred/dcrd#1824](https://github.com/decred/dcrd/pull/1824))
- gcs: Overhaul tests and benchmarks ([decred/dcrd#1845](https://github.com/decred/dcrd/pull/1845))
- rpctest: Remove leftover debug print ([decred/dcrd#1862](https://github.com/decred/dcrd/pull/1862))
- txscript: Fix duplicate test name ([decred/dcrd#1863](https://github.com/decred/dcrd/pull/1863))
- gcs: Add benchmark for filter hashing ([decred/dcrd#1853](https://github.com/decred/dcrd/pull/1853))
- gcs: Add tests for bit reader/writer ([decred/dcrd#1855](https://github.com/decred/dcrd/pull/1855))
- peer: Ensure listener tests sync with messages ([decred/dcrd#1874](https://github.com/decred/dcrd/pull/1874))
- rpctest: remove always-nil error ([decred/dcrd#1913](https://github.com/decred/dcrd/pull/1913))
- rpctest: use errgroup to catch errors from go routines ([decred/dcrd#1913](https://github.com/decred/dcrd/pull/1913))

### Misc:

- release: Bump for 1.5 release cycle ([decred/dcrd#1546](https://github.com/decred/dcrd/pull/1546))
- mempool: Fix typo in fetchInputUtxos comment ([decred/dcrd#1562](https://github.com/decred/dcrd/pull/1562))
- blockchain: Fix typos found by misspell ([decred/dcrd#1617](https://github.com/decred/dcrd/pull/1617))
- dcrutil: Fix typos found by misspell ([decred/dcrd#1617](https://github.com/decred/dcrd/pull/1617))
- main: Write memprofile on shutdown ([decred/dcrd#1655](https://github.com/decred/dcrd/pull/1655))
- config: Parse network interfaces ([decred/dcrd#1514](https://github.com/decred/dcrd/pull/1514))
- config: Cleanup and simplify network info parsing ([decred/dcrd#1706](https://github.com/decred/dcrd/pull/1706))
- main: Rework windows service sod notification ([decred/dcrd#1710](https://github.com/decred/dcrd/pull/1710))
- multi: fix recent govet findings ([decred/dcrd#1727](https://github.com/decred/dcrd/pull/1727))
- rpcserver: Fix misspelling ([decred/dcrd#1763](https://github.com/decred/dcrd/pull/1763))
- chaincfg: Run gofmt -s ([decred/dcrd#1776](https://github.com/decred/dcrd/pull/1776))
- jsonrpc/types: Update copyright years ([decred/dcrd#1794](https://github.com/decred/dcrd/pull/1794))
- stake: Correct comment typo on Hash256PRNG ([decred/dcrd#1803](https://github.com/decred/dcrd/pull/1803))
- multi: Correct typos ([decred/dcrd#1839](https://github.com/decred/dcrd/pull/1839))
- wire: Fix a few messageError string typos ([decred/dcrd#1840](https://github.com/decred/dcrd/pull/1840))
- miningerror: Remove duplicate copyright ([decred/dcrd#1860](https://github.com/decred/dcrd/pull/1860))
- multi: Correct typos ([decred/dcrd#1864](https://github.com/decred/dcrd/pull/1864))

### Code Contributors (alphabetical order):

- Aaron Campbell
- Conner Fromknecht
- Dave Collins
- David Hill
- Donald Adu-Poku
- Hamid
- J Fixby
- Jamie Holdstock
- JoeGruffins
- Jonathan Chappelow
- Josh Rickmar
- Matheus Degiovani
- Nicola Larosa
- Olaoluwa Osuntokun
- Roei Erez
- Sarlor
- Victor Oliveira


# dcrwallet v1.5.0

This release introduces the privacy features based on CoinShuffle++.  A new
voting agenda is also added to vote on the activation of the changes described
in
[DCP0005](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki).
A comprehensive list of improvements and bug fixes follows.

## New features

* CoinShuffle++ cooperative mixing features are added.  Through this process,
  tickets may be bought from outputs of a CoinJoin transaction.  CoinJoin change
  is not anonymized, and must be isolated to a different account and mixed down
  at standard amount values.
  
  This implementation of CoinShuffle++ currently requires a central server as a
  coordination point between all peers in a mix.  The Decred project operates a
  server at https://cspp.decred.org/, and more details about correct usage can
  be found there.  Anyone is able to host their own server and configure their
  wallets to use it, but for the largest anonymity set it is best that most
  people remain using the same server.

* Arbitrary extended pubkeys can now be imported as a watching-only account,
  even on wallets which do store private keys for other accounts.  Extended
  pubkeys are imported using the new `importxpub` JSON-RPC method.

* A --disablecointypeupgrades flag and config setting is added to prevent the
  wallet from ever upgrading the coin type on a seed restored wallet, even when
  there is no observed transactions for the seed.
  
* A `cointype` field has been added to the `walletinfo` JSON-RPC response, and a
  CoinType method has been added to the gRPC WalletService.

* A `getblockhash` method has been added to the JSON-RPC server.  This allows
  users to query for the best block hash even in SPV mode, where no `dcrd` RPC
  passthrough is available.

* The `abandontransaction` method has been implemented by the JSON-RPC server.
  This method allows the wallet to forget about any unmined transaction, and
  allows any previous outputs spent by the abandoned transaction to become
  spendable again.
  
* A `GetAccountExtendedPrivKey` method has been added to the gRPC WalletService
  to export the extended private key of an account.
  
## Other improvements

* Double spending vote/revocation transaction errors now include the hashes of
  the conflicting transactions.

* Concurrency was improved throughout with better in-memory data structures and
  reducing how long operations are performed while inside of database views and
  updates.  This should result in overall better performance.

* Self-signed TLS certificates are now created with ed25519 keys, instead of the
  increasingly unsupported P-521 elliptic curve.
  
* The `--ticketfee` config flag is now deprecated.  Tickets are created with the
  same fee rate as all other transactions.

* Deprecated config flags from the v1.4.0 release have been removed.

* Several deprecated methods and fields in the JSON-RPC API have been
  undeprecated.  These were deprecated in upstream code, but are
  still used and necessary for dcrwallet due to differences in account handling.

## Bug fixes

* A "missing credit value" error seen during reorgs of 2+ transaction spend
  chains was corrected.
  
* The Wallet.TransactionSummary method was fixed so that it correctly returns
  the block hash of mined transactions, instead of filling the block hash field
  with the transaction hash.

* Outbounded SPV peers are removed from an internal "connecting" state after any
  error is hit.  This allows the SPV syncer to try other peers instead of losing
  the ability to outbound any new peers.

* Duplicate ticket hashes are filtered out of the `livetickets` JSON-RPC if they
  are recorded internally in both the transaction and stake stores.
  
* Data races in the wallet's notification emitter were identified and corrected.

* Duplicate transaction errors when the wallet publishes a transaction to `dcrd`
  with the `sendrawtransaction` JSON-RPC are now handled as successful
  transaction publishes, instead of returning the errors back to the caller.

* An unlikely bug in Salsa20 (used by the wallet for storing encrypted messages
  in the database), which broke the security guarantees if more than 256GiB of
  the keystream was used, was corrected by upgrading the x/crypto module to a
  newer version with a fix.

* A data race accessing whether a transaction output is locked or not was fixed.

* A potential address reuse bug was corrected with improvements to the in-memory
  address index tracking.
  
* The `stakepooluserinfo` JSON-RPC method now correctly sets the status of
  immature tickets to "immature" instead of "live".

* Ticket commitments, which do not follow the UTXO model as they can not be
  spent, are now handled specially by the wallet.  This corrects balance
  reporting issues whenever tickets have been bought or observed with relevant
  commitment addresses.
  
* A panic caused by out-of-bounds array access in the SPV syncer was identified
  and corrected.
dfdfdes zero confirmation
  transactions and corrects the `last_block` behavior to match bitcoind.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.4.0...v1.5.0).


# decrediton v1.5.0

This release was primarily focused on overall look and feel refinement and bug
fixes.  It also includes a preliminary Lightning Network implementation by 
matheusd.  Most of the other work was completed by vctt and a new member of the team, bgptr.  Many thanks to them for their hard work on this release.

## New Features

- Initial LN support has been added.  This includes the following functionality:
  dcrlnd startup/teardown, open/close channels, create invoices, send payments,
  enabled autopilot and show dcrlnd logs.  This initial support should give users
  a chance to experience the capabilities of LN while we can also collect user
  feedback about how to best improve their experience with documentation or help.
  To enable LN support, please set the new option "ln_enabled" to "true" in your
  config.json.

- Window size responsiveness has been added to most of the pages to allow for
  graceful change from small, medium and large screen sizes.  When in "small"
  mode, the sidebar is moved to the bottom of the screen much like a mobile app.
  When in "medium" mode, the sidebar is collapsed shows only icons.  When in
  "large" mode, the sidebar is fully expanded and all the fields are fully shown.

## Other updates

- Dark mode (tonality) has been updated to have a more thoughtfully compiled
  pallette of color combinations.  We can now start to develop other color modes
  if users show an interest in such a feature.

- The launcher now has a daemon connection timeout detection.  Previously,
  the wallet would endlessly attempt to connect to the daemon, even if the
  daemon had some fatal error that it would never recover from.  This allows 
  the user to recover from such a situation more gracefully.

- Update Politeia proposal fetching to reduce amount of data that is constantly
  requested.  Previously, every load of decrediton would cause an unnecessary 
  amount of data to be requested.

## Bug fixes

- Fix pasting the hex version of the seed while restoring a wallet.

- Fix incorrect balance reporting for data exports.

- Fix advanced mode staring with an empty app data directory.

- Fix revoked ticket and recent transactions icon.

- Update lockedByTickets balance to accomodate dcrwallet balance updates staking.
  
## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.4.0...release-v1.5.0).

# dcrlnd v0.2.0

This update has brought dcrlnd in sync with the [v0.8.0-beta](https://github.com/lightningnetwork/lnd/releases/tag/v0.8.0-beta) of upstream lnd.

Most upstream work that was done since our original branching point in January 2019 was merged and Decred-specific work has been done to enable more seamless integration of dcrlnd to Decrediton.

Decred's LN network is still only in its beginning stages, therefore please use caution when comitting funds to it.

## Network Reset & Backwards Incompatible Change

Those running v0.1.0 or other versions built from code, please note that v0.2.0 has a **network-wide breaking change**. [PR46](https://github.com/decred/dcrlnd/pull/46) changed the algorithm used to encode payment requests from the Decred-default of Blake256 to the Bicoin-compatible SHA-256.

This means v0.1.0 nodes cannot use channels with v0.2.0 nodes. and will fail and force-close on the first attempt of payment.

Given the v0.1.0 network was still very small we decided to not implement signalling and backwards compatible changes to simplify implementation. Anyone still running the old version **MUST UPGRADE** their node. 

## Notable Changes 

- Support for remote dcrwallets which is used in Decrediton integration [decred/dcrlnd#40](https://github.com/decred/dcrlnd/pull/40)

- Switch payment hash algorithm to SHA-256 [decred/dcrlnd#46](https://github.com/decred/dcrlnd/pull/46)

- Remove the need to run the associated dcrd with transaction index enabled [decred/dcrlnd#41](https://github.com/decred/dcrlnd/pull/41)

## Notable Upstream Changes

[PR36](https://github.com/decred/dcrlnd/pull/36) and [PR42](https://github.com/decred/dcrlnd/pull/42) are the ones that port the upstream work. Some notable changes brought from the upstream include the following:

- Safu Commitments, which was an LN-wide protocol change enabling wallets to retrieve their local channel balance stored in unilaterally-closed channels without requiring coordination with the counterparty.

- Watchtower support, which allows a wallet to remain closed for a longer period of time by offloading the reposability to watch for channel breaches to a third party called a _watchtower_.

- Static Channel Backups, which are a race-condition-free way of backing up the channel data required to safely execute the Data Loss Protection protocol if the main database of lnd is lost.

- Hodl invoices, which is a way of creating and settling invoices by providing the payment hash/preimage via gRPC and allows bridging the lnd service to more advanced LN-based services such as atomic swaps.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrlnd/compare/v0.1.0...v0.2.0).


## 2019-02-06


## Install

To install the command line tools, please see [dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).
To install decrediton download, uncompress, and run [decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.4.0/decrediton-1.4.0.tar.gz) or [decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.4.0/decrediton-v1.4.0.dmg) or [decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.4.0/decrediton-v1.4.0.exe).

See manifest-v1.4.0.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [dcrd](#dcrd-v140)
* [dcrwallet](#dcrwallet-v140)
* [decrediton](#decrediton-v140)

# dcrd v1.4.0

This release of dcrd introduces a new consensus vote agenda which allows the
stakeholders to decide whether or not to activate changes needed to modify the
sequence lock handling which is required for providing full support for the
Lightning Network.  For those unfamiliar with the voting process in Decred, this
means that all code in order to make the necessary changes is already included
in this release, however its enforcement will remain dormant until the
stakeholders vote to activate it.

It also contains smart fee estimation, performance enhancements for block relay
and processing, a major internal restructuring of how unspent transaction
outputs are handled, support for whitelisting inbound peers to ensure service
for your own SPV (Simplified Payment Verification) wallets, various updates to
the RPC server such as a new method to query the state of the chain and more
easily supporting external RPC connections over TLS, infrastructure
improvements, and other quality assurance changes.

The following Decred Change Proposals (DCP) describes the proposed changes in detail:
- [DCP0004](https://github.com/decred/dcps/blob/master/dcp-0004/dcp-0004.mediawiki)

**It is important for everyone to upgrade their software to this latest release
even if you don't intend to vote in favor of the agenda.**

## Downgrade Warning

The database format in v1.4.0 is not compatible with previous versions of the
software.  This only affects downgrades as users upgrading from previous
versions will see a lengthy one time database migration.

Once this migration has been completed, it will no longer be possible to
downgrade to a previous version of the software without having to delete the
database and redownload the chain.

## Notable Changes

### Fix Lightning Network Sequence Locks Vote

In order to fully support the Lightning Network, the current sequence lock
consensus rules need to be modified.  A new vote with the id `fixlnseqlocks` is
now available as of this release.  After upgrading, stakeholders may set their
preferences through their wallet or Voting Service Provider's (VSP) website.

### Smart Fee Estimation (`estimatesmartfee`)

A new RPC named `estimatesmartfee` is now available which returns a suitable
fee rate for transactions to use in order to have a high probability of them
being mined within a specified number of confirmations.  The estimation is based
on actual network usage and thus varies according to supply and demand.

This is important in the context of the Lightning Network (LN) and, more
generally, it provides services and users with a mechanism to choose how to
handle network congestion.  For example, payments that are high priority might
be willing to pay a higher fee to help ensure the transaction is mined more
quickly, while lower priority payments might be willing to wait longer in
exchange for paying a lower fee.  This estimation capability provides a way to
obtain a fee that will achieve the desired result with a high probability.

### Support for Whitelisting Inbound Peers

When peers are whitelisted via the `--whitelist` option, they will now be
allowed to connect even when they would otherwise exceed the maximum number of
peers.  This is highly useful in cases where users have configured their wallet
to use SPV mode and only connect to dcrd instances that they control for
increased privacy and guaranteed service.

### Several Speed Optimizations

Similar to previous releases, this release also contains several enhancements to
improve speed for the initial sync process, validation, and network operations.

In order to achieve these speedups, there is a lengthy one time database
migration, as previously mentioned, that typically takes anywhere from 30
minutes to an hour to complete depending on hardware.

#### Faster Tip Block Relay

Blocks that extend the current best chain are now relayed to the network
immediately after they pass the initial sanity and contextual checks, most
notably valid proof of work.  This allows blocks to propagate more quickly
throughout the network, which in turn improves vote times.

#### UTXO Set Restructuring

The way the unspent transaction outputs are handled internally has been
overhauled to significantly decrease the time it takes to validate blocks and
transactions.  While this has many benefits, probably the most important one
for most stakeholders is that votes can be cast more quickly which helps reduce
the number of missed votes.

### RPC Server Changes

#### New Chain State Query RPC (`getblockchaininfo`)

A new RPC named `getblockchaininfo` is now available which can be used to query
the state of the chain including details such as its overall verification
progress during initial sync, the maximum supported block size, and that status
of consensus changes (deployments) which require stakeholder votes.  See the
[JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki#getblockchaininfo)
for API details.

#### Removal of Vote Creation RPC (`createrawssgen`)

The deprecated `createrawssgen`, which was previously used to allow creating a
vote via RPC is no longer available.  Votes are time sensitive and thus it does
not make sense to create them offline.

#### Updates to Block and Transaction RPCs

The `getblock`, `getblockheader`, `getrawtransaction`, and
`searchrawtransactions` RPCs now contain additional information such as the
`extradata` field in the header, the `expiry` field in transactions, and the
`blockheight` and `blockindex` of  the block that contains a transaction if it
has been mined.  See the [JSON-RPC API Documentation](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki)
for API details.

#### Built-in Support for Enabling External TLS RPC Connections

A new command line parameter (`--altdnsnames`) and environment variable
(`DCRD_ALT_DNSNAMES`) can now be used before the first launch of drcd to specify
additional external IP addresses and DNS names to add during the certificate
creation that are permitted to connect to the RPC server via TLS.  Previously,
a separate tool was required to accomplish this configuration.

## Changelog

All commits since the last release may be viewed on GitHub [here](https://github.com/decred/dcrd/compare/release-v1.3.0...release-v1.4.0).

### Protocol and network:

- chaincfg: Add checkpoints for 1.4.0 release ([decred/dcrd#1547](https://github.com/decred/dcrd/pull/1547))
- chaincfg: Introduce agenda for fixlnseqlocks vote ([decred/dcrd#1578](https://github.com/decred/dcrd/pull/1578))
- multi: Enable vote for DCP0004 ([decred/dcrd#1579](https://github.com/decred/dcrd/pull/1579))
- peer: Add support for specifying ua comments ([decred/dcrd#1413](https://github.com/decred/dcrd/pull/1413))
- blockmanager: Fast relay checked tip blocks ([decred/dcrd#1443](https://github.com/decred/dcrd/pull/1443))
- multi: Latest consensus active from simnet genesis ([decred/dcrd#1482](https://github.com/decred/dcrd/pull/1482))
- server: Always allow whitelisted inbound peers ([decred/dcrd#1516](https://github.com/decred/dcrd/pull/1516))

### Transaction relay (memory pool):

- blockmanager: handle txs in invalid blocks ([decred/dcrd#1430](https://github.com/decred/dcrd/pull/1430))
- mempool: Remove potential negative locktime check ([decred/dcrd#1455](https://github.com/decred/dcrd/pull/1455))
- mempool: Stake-related readability improvements ([decred/dcrd#1456](https://github.com/decred/dcrd/pull/1456))

### RPC:

- multi: Include additional fields on RPC tx results ([decred/dcrd#1441](https://github.com/decred/dcrd/pull/1441))
- rpcserver: Allow scripthash addrs in createrawsstx ([decred/dcrd#1444](https://github.com/decred/dcrd/pull/1444))
- rpcserver: Remove createrawssgen RPC ([decred/dcrd#1448](https://github.com/decred/dcrd/pull/1448))
- rpcclient: support getchaintips RPC ([decred/dcrd#1469](https://github.com/decred/dcrd/pull/1469))
- multi: Add getblockchaininfo rpc ([decred/dcrd#1479](https://github.com/decred/dcrd/pull/1479))
- rpcserver: Adds ability to allow alternative dns names for TLS ([decred/dcrd#1476](https://github.com/decred/dcrd/pull/1476))
- multi: Cleanup recent alt DNS names additions ([decred/dcrd#1493](https://github.com/decred/dcrd/pull/1493))
- multi: Cleanup getblock and getblockheader RPCs ([decred/dcrd#1497](https://github.com/decred/dcrd/pull/1497))
- multi: Return total chain work in RPC results ([decred/dcrd#1498](https://github.com/decred/dcrd/pull/1498))
- rpcserver: Improve GenerateNBlocks error message ([decred/dcrd#1507](https://github.com/decred/dcrd/pull/1507))
- rpcserver: Fix verify progress calculation ([decred/dcrd#1508](https://github.com/decred/dcrd/pull/1508))
- rpcserver: Fix sendrawtransaction error code ([decred/dcrd#1512](https://github.com/decred/dcrd/pull/1512))
- blockchain: Notify stake states after connected block ([decred/dcrd#1515](https://github.com/decred/dcrd/pull/1515))
- rpcserver: bump version to 5.0. ([decred/dcrd#1531](https://github.com/decred/dcrd/pull/1531))
- rpcclient: support getblockchaininfo RPC ([decred/dcrd#1539](https://github.com/decred/dcrd/pull/1539))
- rpcserver: update block template reconstruction ([decred/dcrd#1567](https://github.com/decred/dcrd/pull/1567))

### dcrd command-line flags and configuration:

- config: add --maxsameip to limit # of conns to same IP ([decred/dcrd#1517](https://github.com/decred/dcrd/pull/1517))

### Documentation:

- docs: Update docs for versioned modules ([decred/dcrd#1391](https://github.com/decred/dcrd/pull/1391))
- docs: Update for fees package ([decred/dcrd#1540](https://github.com/decred/dcrd/pull/1540))
- docs: Revamp main README.md and update docs ([decred/dcrd#1447](https://github.com/decred/dcrd/pull/1447))
- docs: Use relative versions in contrib checklist ([decred/dcrd#1451](https://github.com/decred/dcrd/pull/1451))
- docs: Use the correct binary name ([decred/dcrd#1461](https://github.com/decred/dcrd/pull/1461))
- docs: Add github pull request template ([decred/dcrd#1474](https://github.com/decred/dcrd/pull/1474))
- docs: Use unix line ending in mod hierarchy gv ([decred/dcrd#1487](https://github.com/decred/dcrd/pull/1487))
- docs: Add README badge and link for goreportcard ([decred/dcrd#1492](https://github.com/decred/dcrd/pull/1492))
- sampleconfig: Fix proxy typo ([decred/dcrd#1513](https://github.com/decred/dcrd/pull/1513))

### Developer-related package and module changes:

- release: Bump module versions and deps ([decred/dcrd#1541](https://github.com/decred/dcrd/pull/1541))
- build: Tidy module sums with go mod tidy ([decred/dcrd#1408](https://github.com/decred/dcrd/pull/1408))
- blockchain: update BestState ([decred/dcrd#1416](https://github.com/decred/dcrd/pull/1416))
- mempool: tweak trace logs ([decred/dcrd#1429](https://github.com/decred/dcrd/pull/1429))
- blockchain: Correct best pool size on disconnect ([decred/dcrd#1431](https://github.com/decred/dcrd/pull/1431))
- multi: Make use of new internal version package ([decred/dcrd#1435](https://github.com/decred/dcrd/pull/1435))
- peer: Protect handlePongMsg with p.statsMtx ([decred/dcrd#1438](https://github.com/decred/dcrd/pull/1438))
- limits: Make limits package internal ([decred/dcrd#1436](https://github.com/decred/dcrd/pull/1436))
- indexers: Remove unneeded existsaddrindex iface ([decred/dcrd#1439](https://github.com/decred/dcrd/pull/1439))
- blockchain: Reduce block availability assumptions ([decred/dcrd#1442](https://github.com/decred/dcrd/pull/1442))
- peer: Provide immediate queue inventory func ([decred/dcrd#1443](https://github.com/decred/dcrd/pull/1443))
- server: Add infrastruct for immediate inv relay ([decred/dcrd#1443](https://github.com/decred/dcrd/pull/1443))
- blockchain: Add new tip block checked notification ([decred/dcrd#1443](https://github.com/decred/dcrd/pull/1443))
- multi: remove chainState dependency in rpcserver ([decred/dcrd#1417](https://github.com/decred/dcrd/pull/1417))
- mining: remove chainState dependency ([decred/dcrd#1418](https://github.com/decred/dcrd/pull/1418))
- multi: remove chainState deps in server & cpuminer ([decred/dcrd#1419](https://github.com/decred/dcrd/pull/1419))
- blockmanager: remove block manager chain state ([decred/dcrd#1420](https://github.com/decred/dcrd/pull/1420))
- multi: move MinHighPriority into mining package ([decred/dcrd#1421](https://github.com/decred/dcrd/pull/1421))
- multi: add BlkTmplGenerator ([decred/dcrd#1422](https://github.com/decred/dcrd/pull/1422))
- multi: add cpuminerConfig ([decred/dcrd#1423](https://github.com/decred/dcrd/pull/1423))
- multi: Move update blk time to blk templ generator ([decred/dcrd#1454](https://github.com/decred/dcrd/pull/1454))
- multi: No stake height checks in check tx inputs ([decred/dcrd#1457](https://github.com/decred/dcrd/pull/1457))
- blockchain: Separate tx input stake checks ([decred/dcrd#1452](https://github.com/decred/dcrd/pull/1452))
- blockchain: Ensure no stake opcodes in tx sanity ([decred/dcrd#1453](https://github.com/decred/dcrd/pull/1453))
- blockchain: Move finalized tx func to validation ([decred/dcrd#1465](https://github.com/decred/dcrd/pull/1465))
- blockchain: Move unique coinbase func to validate ([decred/dcrd#1466](https://github.com/decred/dcrd/pull/1466))
- blockchain: Store interrupt channel with state ([decred/dcrd#1467](https://github.com/decred/dcrd/pull/1467))
- multi: Cleanup and optimize tx input check code ([decred/dcrd#1468](https://github.com/decred/dcrd/pull/1468))
- blockmanager: Avoid duplicate header announcements ([decred/dcrd#1473](https://github.com/decred/dcrd/pull/1473))
- dcrjson: additions for pay to contract hash ([decred/dcrd#1260](https://github.com/decred/dcrd/pull/1260))
- multi: Break blockchain dependency on dcrjson ([decred/dcrd#1488](https://github.com/decred/dcrd/pull/1488))
- chaincfg: Unexport internal errors ([decred/dcrd#1489](https://github.com/decred/dcrd/pull/1489))
- multi: Cleanup the unsupported dcrwallet commands ([decred/dcrd#1478](https://github.com/decred/dcrd/pull/1478))
- multi: Rename ThresholdState to NextThresholdState ([decred/dcrd#1494](https://github.com/decred/dcrd/pull/1494))
- dcrjson: Add listtickets command ([decred/dcrd#1267](https://github.com/decred/dcrd/pull/1267))
- multi: Add started and done reorg notifications ([decred/dcrd#1495](https://github.com/decred/dcrd/pull/1495))
- blockchain: Remove unused CheckWorklessBlockSanity ([decred/dcrd#1496](https://github.com/decred/dcrd/pull/1496))
- blockchain: Simplify block template checking ([decred/dcrd#1499](https://github.com/decred/dcrd/pull/1499))
- blockchain: Only mark nodes modified when modified ([decred/dcrd#1503](https://github.com/decred/dcrd/pull/1503))
- blockchain: Cleanup and optimize stake node logic ([decred/dcrd#1504](https://github.com/decred/dcrd/pull/1504))
- blockchain: Separate full data context checks ([decred/dcrd#1509](https://github.com/decred/dcrd/pull/1509))
- blockchain: Reverse utxo set semantics ([decred/dcrd#1471](https://github.com/decred/dcrd/pull/1471))
- blockchain: Convert to direct single-step reorgs ([decred/dcrd#1500](https://github.com/decred/dcrd/pull/1500))
- multi: Migration for utxo set semantics reversal ([decred/dcrd#1520](https://github.com/decred/dcrd/pull/1520))
- blockchain: Make version 5 update atomic ([decred/dcrd#1529](https://github.com/decred/dcrd/pull/1529))
- blockchain: Simplify force head reorgs ([decred/dcrd#1526](https://github.com/decred/dcrd/pull/1526))
- secp256k1: Correct edge case in deterministic sign ([decred/dcrd#1533](https://github.com/decred/dcrd/pull/1533))
- dcrjson: Add gettransaction txtype/ticketstatus ([decred/dcrd#1276](https://github.com/decred/dcrd/pull/1276))
- txscript: Use ScriptBuilder more ([decred/dcrd#1519](https://github.com/decred/dcrd/pull/1519))
- fees: Add estimator package ([decred/dcrd#1434](https://github.com/decred/dcrd/pull/1434))
- multi: Integrate fee estimation ([decred/dcrd#1434](https://github.com/decred/dcrd/pull/1434))

### Testing and Quality Assurance:

- multi: Use temp directories for database tests ([decred/dcrd#1404](https://github.com/decred/dcrd/pull/1404))
- multi: Only use module-scoped data in tests ([decred/dcrd#1405](https://github.com/decred/dcrd/pull/1405))
- blockchain: Use temp dirs for fullblocks test ([decred/dcrd#1406](https://github.com/decred/dcrd/pull/1406))
- database: Use module-scoped data in iface tests ([decred/dcrd#1407](https://github.com/decred/dcrd/pull/1407))
- travis: Update for Go1.11 and module builds ([decred/dcrd#1415](https://github.com/decred/dcrd/pull/1415))
- indexers: Use testable bucket for existsaddrindex ([decred/dcrd#1440](https://github.com/decred/dcrd/pull/1440))
- txscript: group numeric encoding tests with their opcodes ([decred/dcrd#1382](https://github.com/decred/dcrd/pull/1382))
- txscript: add p2sh opcode tests ([decred/dcrd#1381](https://github.com/decred/dcrd/pull/1381))
- txscript: add stake opcode tests ([decred/dcrd#1383](https://github.com/decred/dcrd/pull/1383))
- main: add address encoding magic constants test ([decred/dcrd#1458](https://github.com/decred/dcrd/pull/1458))
- chaingen: Only revoke missed tickets once ([decred/dcrd#1484](https://github.com/decred/dcrd/pull/1484))
- chaingen/fullblocktests: Add disapproval tests ([decred/dcrd#1485](https://github.com/decred/dcrd/pull/1485))
- multi: Resurrect regression network ([decred/dcrd#1480](https://github.com/decred/dcrd/pull/1480))
- multi: Use regression test network in unit tests ([decred/dcrd#1481](https://github.com/decred/dcrd/pull/1481))
- main: move cert tests to a separated file ([decred/dcrd#1502](https://github.com/decred/dcrd/pull/1502))
- mempool: Accept test mungers for create signed tx ([decred/dcrd#1576](https://github.com/decred/dcrd/pull/1576))
- mempool: Implement test harness seq lock calc ([decred/dcrd#1577](https://github.com/decred/dcrd/pull/1577))

### Misc:

- release: Bump for 1.4 release cycle ([decred/dcrd#1414](https://github.com/decred/dcrd/pull/1414))
- multi: Make changes suggested by Go 1.11 gofmt -s ([decred/dcrd#1415](https://github.com/decred/dcrd/pull/1415))
- build: Remove dep toml and lock file ([decred/dcrd#1460](https://github.com/decred/dcrd/pull/1460))
- docker: Update to go 1.11 ([decred/dcrd#1463](https://github.com/decred/dcrd/pull/1463))
- build: Support MacOS sed for obtaining module list ([decred/dcrd#1483](https://github.com/decred/dcrd/pull/1483))
- multi: Correct a few typos found by misspell ([decred/dcrd#1490](https://github.com/decred/dcrd/pull/1490))
- multi: Address some golint complaints ([decred/dcrd#1491](https://github.com/decred/dcrd/pull/1491))
- multi: Remove unused code ([decred/dcrd#1505](https://github.com/decred/dcrd/pull/1505))
- release: Bump siphash version to v1.2.1 ([decred/dcrd#1538](https://github.com/decred/dcrd/pull/1538))
- release: Bump module versions and deps ([decred/dcrd#1541](https://github.com/decred/dcrd/pull/1541))
- Fix required version of stake module ([decred/dcrd#1549](https://github.com/decred/dcrd/pull/1549))
- release: Tidy module files with published versions ([decred/dcrd#1543](https://github.com/decred/dcrd/pull/1543))
- mempool: Fix required version of mining module ([decred/dcrd#1551](https://github.com/decred/dcrd/pull/1551))

### Code Contributors (alphabetical order):

- Corey Osman
- Dave Collins
- David Hill
- Dmitry Fedorov
- Donald Adu-Poku
- ggoranov
- githubsands
- J Fixby
- Jonathan Chappelow
- Josh Rickmar
- Matheus Degiovani
- Sarlor
- zhizhongzhiwai

# dcrwallet v1.4.0

This release focuses on bug fixes and general improvements for both direct
dcrwallet command line users and other projects building on top of dcrwallet
(such as Decrediton and upcoming mobile wallets).  A new voting agenda is also
part of this release to enable votes on
[DCP0004](https://github.com/decred/dcps/blob/master/dcp-0004/dcp-0004.mediawiki).
A comprehensive list of improvements and bug fixes follows.

## Bug fixes

* Fixes were made to which and how many addresses and wallet UTXOs are watched
  by the SPV and RPC syncers.  This prevents several bugs resulting from missed
  transactions, such as avoiding double spending errors and spends of unknown
  inputs.

* Committed filter creation and validation is fixed on all ARM processors.
  Previously, an ARM assembly optimization could produce incorrect output for
  the siphash function.

* During initial wallet creation, the database is now always cleanly closed
  before the process exits.  Previously, this was a race and the new wallet
  database may have been missing writes during the initialization step.

* RPC connection errors to dcrd are now properly logged

* A possible deadlock situation was removed by adding a missing mutex unlock to
  the SPV peering implementation.

* Error handling has been improved when querying unmined and unspent ticket
  transactions.

* The total number of logged transactions processed by the RPC syncer has been
  fixed.

* The process can be interrupted at startup if while being blocked on acquiring
  the wallet's database lock.  Previously, the process would have needed to be
  killed, or wait for an existing running wallet to shutdown.

* Fixed reorganizations failing with "missing credit value" errors.  This
  was not a database corruption issue and a wallet restore is not necessary.

* Fixed the block hash returned by gRPC `WalletService.GetTransaction`
  responses.  This method was prevously using the transaction hash instead
  of the hash of the block the transaction was mined in.

* Fixed error handling in the RPC sync mode to ensure some synchronization
  errors are not ignored.

## New features

* The gRPC method `WalletService.ValidateAddress` now returns pubkey of P2PKH
  addresses and BIP0044 branch and child index if the address is controlled by
  the wallet.

* The gRPC method `WalletService.ImportScript` is now usable by watching-only
  wallets.

* The gRPC method `WalletService.StakeInfo` now includes counts of unspent
  tickets.

* A new gRPC method `TicketBuyerV2Service.RunTicketBuyer` has been added to run
  the SPV-compatible ticket buyer.

* A new gRPC method `WalletService.GetTicket` has been added to query the
  details of an individual ticket by its transaction hash.

* A new gRPC method `WalletService.SweepAccount` has been added to sweep all
  UTXOs of an account to a single new output.

* A new gRPC method `WalletService.RpcSync` has been added, providing a similar
  as `SpvSync` to perform wallet synchronization with a dcrd RPC connection.

* The SPV and RPC syncers now support callbacks for syncing notifications.
  These notifications are also availble to gRPC clients who invoke the syncers.

* Creating a new simnet wallet now shows an address that can be used for mining
  rewards.

* RPC syncing connections to dcrd can now be proxied using the `--proxy`,
  `--proxyuser`, and `--proxypass` options.

## Other improvements

* Builds have been converted to use Go Modules.  The repository has been split
  into various submodules, making it far easier to write applications that
  import dcrwallet packages as libraries.

* Wallet database API is exported for projects that need support for alternative
  database drivers (such as dcrandroid).

* Default transaction relay fee has been dropped to 0.0001 DCR/kB.

* Transaction size and fee estimation is improved for ticket purchases and any
  transaction that redeems a P2SH output.

* DCP0001-0003 now apply to simnet from the start of the chain (note that this
  is a hard fork for existing simnets).

* Log files are never automatically deleted.  Previously, log files would be
  rotated and old log files would be automatically removed.  This has been
  changed to avoid the loss of potentially important logs.

* Logs for unexpected database consistency issues have been improved by logging
  the keys and values

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/dcrwallet/compare/release-v1.3.0...release-v1.4.0).


# decrediton v1.4.0

This decrediton release has been mostly dedicated to fixing nagging issues
with users and cleaning up styling and design overall.  We are also happy to
include new features such as: alpha Trezor support, initial alternative color themes,
enhanced Governance/Politeia integration and a prominent page to choose SPV or normal mode.

We are proud to introduce initial Trezor hardware wallet support.  This includes
the ability to create transactions in decrediton and then sign them with the
connected device.  We will be working hard to add staking on Trezor in the near
future.

Alternative color themes have been a constantly suggested feature since the
launch of decrediton. We have added an initial proof of concept for a dark theme
toggle.  The colors are not yet final and design will hopefully provide a series
of possible themes instead of simply light and dark.  

This release is the first to directly ask users on startup whether or not they 
would like to use SPV mode or not.  This will hopefully increase SPV usage and 
provide better/faster wallet support for most users.

## New features

* Trezor integration has been added.  This allows users to essentially use 
  decrediton as watch-only wallet that is able to have its transactions signed
  directly by their Trezor device.  Staking isn't yet currently available, but
  we'll be looking in to adding that soon.  While we have tested and verified
  this initial Trezor integration, we will hold off on prominently advertising 
  this until we can fully confirm it is bug free and secure.  

* Decrediton has switched to using the ticketbuyer v2 service from the wallet 
  (instead of the old v1). Given that after [DCP-0001](https://github.com/decred/dcps/blob/master/dcp-0001/dcp-0001.mediawiki) the 
  ticket price has been stable, there's no need for that many configuration 
  parameters anymore. Version 2 of the ticket buyer needs to be configured only 
  with the source account, target stakepool and how much balance should be left 
  spendable. The buyer will then purchase as many tickets as possible, while 
  maintaining that balance.

* Launcher Sync Stream.  Now both modes (SPV/RPC) both use the same notification
  types to update during launching.  This helps with being able to allow dcrwallet
  to handle all of the syncing and simply just update on similiar notifications.
  Previously, there were situations that were causing issues since syncing steps
  would be done out of order.

* All users will see a new page on first load that lets them select whether or
  not they would like to enable SPV mode.  We have also added a link to a newly
  created document explaining everything about [SPV](https://docs.decred.org/wallets/spv).

* We have added an early proof of concept for color theme toggling.  The colors
  for the added dark theme are still being finalized by design, but the button
  can be found on the Settings page.

* Whenever a panic is detected by decrediton in dcrd or dcrwallet, users are now
  sent to a seperate fatal error screen where they will be able to copy the logs
  to be able to provide them to the developers and support.  This will hopefully
  help users receive better direction to alleviate issues that are hitting.

* Notifications have been completed restyled and fixed to allow for multiple
  simultaneous notifications.  There is now a prominent closer button and timer
  for automatic notification closing. 

## Other improvements

* Eeter and kylefirethought have delivered a whole new set of animated menu icons.
  These can be seen when hovering over a given menu page tab.  

* The Governance Page has received a large styling overhaul as provided by Eeter
  LLC.  Most importantly, notification bubbles have been added to let users
  know when there are new proposals and votes to see.

* Various clean up and refinement to the launcher.  There were issues in SPV mode
  that were causing confusion about whether it was waiting to connect to a
  daemon to proceed or not.  Now it should always be clear to the user when they
  need to resolve something to proceed or if they should expect to wait for
  something to happen.

* We have updated some error messages to better explain to users what the
  problem is and how it can be resolved.

* Watch-only wallets are now able to create unsigned transactions that can be
  transferred to an unlocked wallet for signing and subsequent broadcasting.

* Add an import script button to the Add Stakepool form.  There are some users
  that wish to simply import their script without having to communicate with any
  outside sources.

* The min default relay fee was updated in dcrd a few releases ago and now the
  network has sufficiently upgraded to allow for wallet software to use 0.0001
  DCR/kB as the default.  Any transaction or ticket created in decrediton or 
  dcrwallet should now use that minimum fee from now on.

* Change to use the documentation subsystem to add the release notes.  This will
  allow us to be more flexible when adding new release notes and letting users
  review older ones.

* Add decrediton logs to the Logs tab underneath the Help page.

* With the addition of `getblockchaininfo` json-rpc command in dcrd, we are
  now able to properly determine the progress of dcrd syncing.  This removes the
  need to use outside sources to figure out know the syncing progress.

* Transactions are now decoded within decrediton instead of being sent back to 
  dcrwallet for decoding.  This should help with performance to avoid an
  unnecessary request.

* Chinese language has been extensively reviewed by long time Asian community 
  contributor @Guang168

## Bug fixes

* There were various issues with the display of recent staking transactions on
  the Overview and the My Tickets pages. 

* Startup stats have been fixed to properly update and work better for large wallets 

* The application About button in macOS now also opens the About modal.

* CSV exporting now correctly generates timestamps in UTC or local time based 
  on app config (thanks to @rocknet for the first contribution).

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.3.0...release-v1.4.0).


## 2018-10-15


## Install

To install the command line tools, please see [dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run [decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.3.1/decrediton-1.3.1.tar.gz) or [decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.3.1/decrediton-v1.3.1.dmg) or [decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.3.1/decrediton-v1.3.1.exe).

See manifest-v1.3.1.txt, and the package specific manifest files for sha256 sums and the associated .asc files to confirm those shas.

See [README.md](./README.md#verifying-binaries) for more info on verifying the files.


## Contents

* [decrediton](#decrediton-v131)


# decrediton v1.3.1

This is primarily a patch release for Decrediton, but also reveals some exciting
new functionality to the entire user base.  Previously, SPV wallet functionality
and Politeia access were hidden behind configuration settings (which were only
accessible by knowledgeable users).  Now Politeia is seen by default underneath
the new "Governance" page that can be found on the left sidebar.  SPV can be
enabled by going to the Settings page and updating the option (this will
cause decrediton to reset to begin using the systems correctly).

We are also proud to add our first round of translations.  We have added French,
Spanish, German, Japanese, Chinese (simplified).  If you are a long standing 
community member and notice any incorrect translations you can open an issue on
[github](https://www.github.com/decred/decrediton/issues) or contact the team on
the slack/matrix chat platforms.  While we appreciate input from all users,
the translation process demands some existing trust, so we'd prefer only users
with existing relationships with the project submit translation issues.  We're
attempting to formalize our translations procedures to allow input from more
users.  Our goal is to provide the same high quality content for all users, no
matter their preferred language. Our tentative next list of languages are:
Russian, Arabic, Malay/Tagalog.

## Bug Fixes

* The underlying dcrwallet was updated to include a required fix that caused
  panics in some wallets with certain transactions (typically stakepool fee txs).

* Non-US languages were causing some odd strings to be shown.

* Use streaming GetTickets with dcrwallet to ease decrediton loading.  Now tickets
  are requested on a smaller basis to avoid issues with very large voting wallets.

## Other improvements

* Add proper wallet and daemon closing procedures to allow settings changes for
  SPV and Advanced Daemon.  Now the user does not have to completely close the
  wallet to enable these changes.  There is also an added button to close the
  current wallet and select a new one to load.  

* The transaction details page has received a design update from Eeter.  We have
  added the "Rebroadcast Transaction" button if the transaction is "Pending." 
  This should be close to the final form of the page with some minor tweaks.

* Updated Help page with more links and updated design from Eeter.

* Update major some major dependencies and others: Webpack 4, Electron 2.0.8

* Retain number of tickets to purchase upon unsuccessful attempt.

## Changelog

All commits since the last release may be viewed on GitHub
[here](https://github.com/decred/decrediton/compare/release-v1.3.0...release-v1.3.1).


## 2018-09-21


## Install

To install the command line tools, please see [dcrinstaller](https://github.com/decred/decred-release/tree/master/cmd/dcrinstall).

To install decrediton download, uncompress, and run [decrediton Linux](https://github.com/decred/decred-binaries/releases/download/v1.3.0/decrediton-1.3.0.tar.gz) or [decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.3.0/decrediton-v1.3.0.dmg) or [decrediton Windows](https://github.com/decred/decred-binaries/releases/download/v1.3.0/decrediton-v1.3.0.exe).

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.2.1/decrediton-1.2.1.dmg) or
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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.2.0/decrediton-v1.2.0.dmg) or
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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.1.3/decrediton-1.1.3.dmg) or
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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.1.2/decrediton-v1.1.2.dmg) or
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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.1.1/decrediton-1.1.1.dmg) or
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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.1.0/decrediton-1.1.0.dmg) or
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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.0.8/decrediton-1.0.8.dmg).

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.0.7/decrediton-1.0.7.dmg).

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
  we will be adding even more feedback from ticket buyer so the user
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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.0.6/decrediton-1.0.6.dmg).

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.0.5/decrediton-1.0.5.dmg).

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.0.3/decrediton-1.0.3.dmg).

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.0.2_decrediton/decrediton-1.0.2.dmg).

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.0.1/decrediton-1.0.1.dmg).

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v1.0.0/decrediton-1.0.0.dmg).

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v0.8.2/decrediton-0.8.2.dmg).

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v0.8.0/decrediton-0.8.0.dmg).

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
| Close when all windows are closed on macOS. | [decred/decrediton#129](https://github.com/decred/decrediton/pull/129) |
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
| Fix minor typo for running on macOS | [decred/decrediton#231](https://github.com/decred/decrediton/pull/231) |
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
binaries are only provided for 64 bit Linux and macOS.

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
[decrediton macOS](https://github.com/decred/decred-binaries/releases/download/v0.7.0/decrediton-0.7.0.dmg)

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
[Copay macOS](https://github.com/decred/decred-binaries/releases/download/v0.6.0/decred-copay-darwin-v0.6.0.dmg)
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
[Copay macOS](https://github.com/decred/decred-binaries/releases/download/v0.5.0/decred-copay-darwin-v0.5.0.dmg)
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
binaries for Copay for macOS and Linux.  Paymetheus is now able to
launch dcrd in the background when it runs.  This is also the first
release built with the version 1.7 of the go compiler.  This produces
smaller and faster binaries than previous versions of go.

To install Paymetheus download and run either
[Paymetheus 64bit](https://github.com/decred/decred-binaries/releases/download/v0.4.0/decred_0.4.0-beta_x64.msi) or
[Paymetheus 32bit](https://github.com/decred/decred-binaries/releases/download/v0.4.0/decred_0.4.0-beta_x86.msi)
depending on your version of Windows.

To install a the local Copay GUI download and run
[Copay macOS](https://github.com/decred/decred-binaries/releases/download/v0.4.0/decred-copay-darwin-v0.4.0.dmg)
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
