#!/bin/zsh
# This script is used to verify the release binary of Decrediton.
# This can be extended to verify other binaries and Operating Systems.
# Only MacOS is supported at this time.

# It is intended to be run from the directory containing the files to be verified.
# It will use the latest version of Decrediton in the current directory and the corresponding version manifest files.
# It will check that the gpg key is installed, and that the signature of the 'manifest.txt.asc' file is valid.
# It will check that the hash of the binary matches the hash in the manifest.
# It will check that the binary is signed by the gpg key.

# Get the latest version of the decrediton file in the current directory
dmg_file=$(ls -v decrediton-*.dmg 2>/dev/null | tail -1)
if [ -z "$dmg_file" ]; then
  echo "Error: DMG file not found."
  exit 1
fi

# Get the version from dmg_file (expected format: 'decrediton-*-v*.*.*.dmg', expected result 'v*.*.*')
version=$(echo "${dmg_file}" | sed -E 's/decrediton-.*-(v[0-9]+\.[0-9]+\.[0-9]+)\.dmg/\1/')

# Check that the version is valid
if [[ -z "${version}" ]]; then
    echo "Error: Could not get version from file name."
    exit 1
fi

# Get the latest version of the manifest file using the version
manifest_file=$(ls -v decrediton-${version}-manifest.txt 2>/dev/null | tail -1)
if [ -z "$manifest_file" ]; then
  echo "Error: Manifest file not found."
  exit 1
fi

# Get the latest version of the asc file using the version
asc_file=$(ls -v decrediton-${version}-manifest.txt.asc 2>/dev/null | tail -1)
if [ -z "$asc_file" ]; then
  echo "Error: ASC file not found."
  exit 1
fi

# Ensure user wants to continue with the files found
echo "Using files: \t ${dmg_file} ${manifest_file} ${asc_file}"
read -q "answer?Do you want to continue with these files? (y/n) "
echo
if ! [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Exiting..."
    exit 0
fi

# Check gpg is installed
if ! command -v gpg &> /dev/null; then
    echo "gpg must be installed to verify the binary"
    exit 1
fi

# Check gpg has the decred key
if ! gpg --list-keys release@decred.org | grep -q 'release@decred.org'; then
    echo "Missing 'release@decred.org' key, see https://docs.decred.org/advanced/verifying-binaries/ to add"
    exit 1
fi
echo "GPG Key: \t release@decred.org key found"

# Get gpg to verify the asc file
verify_result=$(gpg --verify "${asc_file}" 2>&1)
if echo "${verify_result}" | grep -iq 'good signature'; then
    echo "GPG Verify: \t GOOD signature"
else echo "${verify_result}" | grep -iq 'bad signature'
    echo "GPG Verify: \t BAD signature"
    exit 1
fi

# Get the hash from the manifest
manifest_line=$(grep "${dmg_file}" "${manifest_file}" | head -n 1)
if [[ -z "${manifest_line}" ]]; then
    echo "Missing manifest line"
    exit 1
else
    manifest_sha256=$(echo "${manifest_line}" | awk '{print $1}')
    echo "manifest: \t ${manifest_sha256}"
fi

# Get the hash of the binary
file_sha256=$(shasum -a 256 "${dmg_file}" | awk '{print $1}')
echo "shasum: \t ${file_sha256}"

# Compare hashes
if [[ "${manifest_sha256}" == "${file_sha256}" ]]; then
    echo "\nVerification successful, it's safe to install"
else
    echo "\nVerification failed, do not install! Contact the Decred team"
fi
