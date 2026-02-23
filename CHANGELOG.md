# Change log for RELAX NG schema for CommonMark

## Unreleased

## 0.2.0 - 2026-02-23

* Schema files are now acquired at Actions artifacts or release page.
  You can also generate one from source.
* Fix `sourcepos` attribute specification.  We didn't actually fix
  this at 0.1.1 version...

## 0.1.2 - 2026-02-23

* Update generated schema, while hand-tweaked schema is not changed.
* Add some utility scripts.

## 0.1.1 - 2026-02-16

* Allow `xml:space` attribute in `text` element.
* Allow `delim` attribute in `list` element.
* Renamed from `attlist.ANY` to `attlist.common`.
* Removed unused `ANY` definition.

## 0.1.0 - 2026-02-16

Initial release.

Note that `CommonMark.rnc` utilize the XML Schema Datatypes feature
for the `sourcepos` attribute value.
