
xquery version "3.1";

module namespace pm-config="http://www.tei-c.org/tei-simple/pm-config";

import module namespace pm-odd_ehri-web="http://www.tei-c.org/pm/models/odd_ehri/web/module" at "../transform/odd_ehri-web-module.xql";
import module namespace pm-odd_ehri-print="http://www.tei-c.org/pm/models/odd_ehri/print/module" at "../transform/odd_ehri-print-module.xql";
import module namespace pm-odd_ehri-latex="http://www.tei-c.org/pm/models/odd_ehri/latex/module" at "../transform/odd_ehri-latex-module.xql";
import module namespace pm-odd_ehri-epub="http://www.tei-c.org/pm/models/odd_ehri/epub/module" at "../transform/odd_ehri-epub-module.xql";
import module namespace pm-odd_ehri-fo="http://www.tei-c.org/pm/models/odd_ehri/fo/module" at "../transform/odd_ehri-fo-module.xql";
import module namespace pm-docx-tei="http://www.tei-c.org/pm/models/docx/tei/module" at "../transform/docx-tei-module.xql";

declare variable $pm-config:web-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "odd_ehri.odd" return pm-odd_ehri-web:transform($xml, $parameters)
    default return pm-odd_ehri-web:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:print-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "odd_ehri.odd" return pm-odd_ehri-print:transform($xml, $parameters)
    default return pm-odd_ehri-print:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:latex-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "odd_ehri.odd" return pm-odd_ehri-latex:transform($xml, $parameters)
    default return pm-odd_ehri-latex:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:epub-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "odd_ehri.odd" return pm-odd_ehri-epub:transform($xml, $parameters)
    default return pm-odd_ehri-epub:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:fo-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "odd_ehri.odd" return pm-odd_ehri-fo:transform($xml, $parameters)
    default return pm-odd_ehri-fo:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:tei-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "docx.odd" return pm-docx-tei:transform($xml, $parameters)
    default return error(QName("http://www.tei-c.org/tei-simple/pm-config", "error"), "No default ODD found for output mode tei")
            
    
};
            
    