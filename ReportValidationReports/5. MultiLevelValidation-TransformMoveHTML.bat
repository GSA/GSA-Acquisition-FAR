cd..
cd dita
cd out
mkdir HTMLreports
copy *.css .\HTMLreports /y
copy *.html .\HTMLreports /y
del *.html /Q/F
del *.css /Q/F