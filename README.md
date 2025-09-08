# Solus Docker

A minimal Docker image for Solus Project. It should provide base packages for using Solus tooling for building Solus packages or even using Solus Docker on its own.

While building Solus Docker it downloads latest ISO of Budgie edition, mounts it to extract rootfs, installs everything from system.base component to a different directory, exports it and pushes the result to GitHub Container Registry. Based on the work of [holo-docker](https://github.com/SteamDeckHomebrew/holo-docker).
