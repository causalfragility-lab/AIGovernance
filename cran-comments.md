## R CMD check results

0 errors | 0 warnings | 1 note

The NOTE is:

> New submission

This is the first CRAN submission of this package.

> Possibly misspelled words in DESCRIPTION: NIST (14:51), ths (12:37)

"NIST" is the standard abbreviation for the National Institute of Standards
and Technology, a well-known US federal agency. The description now spells
out "four-fifths" in full to avoid the "ths" flag.

> DOI format

Fixed: <https://doi.org/10.6028/NIST.AI.100-1> replaced with
<doi:10.6028/NIST.AI.100-1> per CRAN policy.

> Possibly invalid URLs (Status 202)

The eur-lex.europa.eu URLs return HTTP 202 (Accepted) rather than 200 due to
the site's redirect/authentication layer — the content is publicly accessible.
These have been replaced with the stable EC digital strategy page URL which
returns 200.

## Test environments

* Local: Windows 11, R 4.5.1
* win-builder: R-release (R 4.6.0, 2026-05-14) — 0 errors, 0 warnings, 1 note
* GitHub Actions: ubuntu-latest R-release (via r-lib/actions)

## Downstream dependencies

None. This is a new package.
