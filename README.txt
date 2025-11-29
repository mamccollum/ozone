OZone -- OpenSolaris community packages
=======================================

TODO: write proper description

Questions, comments, or concerns?
Email: operz@coralcmd.net

To install:
# export NONABI_SCRIPTS=TRUE
# pkgadd -d pkgspool_or_dstream

Some packages, when being added with pkgadd(1M), need the use of the environment variable NONABI_SCRIPTS=TRUE.
This is so that the install scripts can have user interaction.
Please enable this if the postinstall hook scripts have unexpected results.

