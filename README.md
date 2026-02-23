# RELAX NG schema for CommonMark

The schema is located at `CommonMark.rnc`.

## Generation

Generate RELAX NG compact syntax schema:

Download Trang from [jing-trang][jing-trang] release page (with `download` script).

Option 1: Run `./generate` script.

Option 2: Run below.

``` shell
guix shell openjdk
java -jar trang-20241231/trang-20241231/trang.jar \
     -I dtd \
     -O rnc \
     vendor/commonmark-spec/CommonMark.dtd \
     CommonMark.gen.rnc
```

[jing-trang]: https://github.com/relaxng/jing-trang/releases/tag/V20241231

## Test

Option 1: Run `./check` script.

Option 2: Generate CommonMark XML file as:

``` shell
perl \
    -MCommonMark \
    -e 'my$s=do{local$/;<STDIN>};print CommonMark->parse_document($s)->render_xml' \
    < /path/to/spec.txt \
    > /tmp/spec.xml
```

Then use Emacs nXML mode for instance.

## References

About [XML Schema namespace usage][xsd-namespace].

[xsd-namespace]: https://www.w3.org/TR/xmlschema-2/#:~:text=XMLSchema-,To,datatypes,-This

## License

The RELAX NG file `CommonMark.rnc` is distributed under the [Creative
Commons CC-BY-SA 4.0 license][cc] since it was generated and modified
from the source DTD `CommonMark.dtd`, which is [distributed][original]
as follows:

> The CommonMark spec (spec.txt) and DTD (CommonMark.dtd) are
>
> Copyright (C) 2014-16 John MacFarlane
>
> Released under the Creative Commons CC-BY-SA 4.0 license:
> <https://creativecommons.org/licenses/by-sa/4.0/>.

[cc]: https://creativecommons.org/licenses/by-sa/4.0

[original]: https://github.com/commonmark/commonmark-spec/blob/c31a288a66aa070ab2f3fe5fdaa122f856348fa4/LICENSE#L1-L6
