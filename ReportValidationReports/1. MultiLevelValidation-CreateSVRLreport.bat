cd..
cd dita
cd out
del *.svrl /Q/F
del *.html /Q/F
del ErrorReport.dita /Q/F
cd ..
C:\GSA-Acquisition-tools\TOOLS\DITA-OT\dita-ot-2.5.4\bin\dita -f svrl -o out -i FAR.ditamap