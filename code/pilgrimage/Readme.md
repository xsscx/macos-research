# Reproduction for CVE_2022_44268
Reproduction is based on the pilgrimage bug: The researchers at MetabaseQ discovered CVE-2022-44268, i.e. ImageMagick 7.1.0-49 is vulnerable to Information Disclosure. When it parses a PNG image (e.g., for resize), the resulting image could have embedded the content of an arbitrary remote file (if the ImageMagick binary has permissions to read it).
