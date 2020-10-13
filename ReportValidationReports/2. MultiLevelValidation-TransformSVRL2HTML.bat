cd..
cd dita
cd out
java -cp "C:\GSA-Acquisition-Tools\TOOLS\SaxonHE9-7-0-20J\resolver.jar";"C:\GSA-Acquisition-Tools\TOOLS\SaxonHE9-7-0-20J\saxon9he.jar" net.sf.saxon.Transform -s:FAR.svrl -xsl:"C:\GSA-Acquisition-Tools\TOOLS\StructureGSA_FAR\xml\DITA_1.2\app\technicalContent\xslt\svrl2html.xsl" -catalog:"C:\GSA-Acquisition-Tools\TOOLS\SaxonHE9-7-0-20J\dummy_catalog.xml"
