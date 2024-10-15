xquery version "3.1";

module namespace idx="http://teipublisher.com/index";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace dbk="http://docbook.org/ns/docbook";

declare variable $idx:app-root :=
    let $rawPath := system:get-module-load-path()
    return
        (: strip the xmldb: part :)
        if (starts-with($rawPath, "xmldb:exist://")) then
            if (starts-with($rawPath, "xmldb:exist://embedded-eXist-server")) then
                substring($rawPath, 36)
            else
                substring($rawPath, 15)
        else
            $rawPath
    ;

(:~
 : Helper function called from collection.xconf to create index fields and facets.
 : This module needs to be loaded before collection.xconf starts indexing documents
 : and therefore should reside in the root of the app.
 :)
declare function idx:get-metadata($root as element(), $field as xs:string) {
    let $header := $root/tei:teiHeader
    return
        switch ($field)
            case "title" return
                string-join((
                    $header//tei:msDesc/tei:head, $header//tei:titleStmt/tei:title[@xml:lang = 'en'],
                    $header//tei:titleStmt/tei:title,
                    $root/dbk:info/dbk:title 
                ), " - ")
            case "to" return (
                $header//tei:correspAction[@type='received']/tei:persName
            )
            
            case "place" return head ((
                $header//tei:correspAction[@type='sent']/tei:placeName,
                $header//tei:history/tei:origin/tei:origPlace,
                $header//tei:creation/tei:placeName
            ))
            case "date" return head ((
                $header//tei:correspDesc/tei:correspAction/tei:date/@when-iso,
                $header//tei:sourceDesc/(tei:bibl|tei:biblFull)/tei:publicationStmt/tei:date,
                $header//tei:sourceDesc/(tei:bibl|tei:biblFull)/tei:date/@when-iso,
                $header//tei:fileDesc/tei:editionStmt/tei:edition/tei:date,
                $header//tei:publicationStmt/tei:date,
                $header//tei:creation/tei:date/@when
            ))
            case "genre" return (
                idx:get-genre($header),
                $root/dbk:info/dbk:keywordset[@vocab='#genre']/dbk:keyword,
                $header//tei:seriesStmt/tei:title[@type='genre']
            )
            case "from" return head ((
                $header//tei:correspAction[@type='sent']/tei:persName,
                $header//tei:titleStmt/tei:author/tei:persName,
                $header//tei:creation/tei:persName,
                $root/dbk:info/dbk:author))
            case "language" return
                head((
                    $header//tei:langUsage/tei:language/@ident,
                    $root/@xml:lang,
                    $header/@xml:lang
                ))
            case "institution" return (
                $header//tei:sourceDesc//tei:institution
            )
            case "status" return (
                $header//tei:revisionDesc/@status
            )
            case "keyword" return (
                $header//tei:msItem/tei:note[@type='keyword'],
                $header//tei:textClass/tei:keywords/tei:term
            )
            case "topic" return (
                $header//tei:seriesStmt/tei:title[@type='topic']
            )
            default return
                ()
};

declare function idx:get-genre($header as element()?) {
    for $target in $header//tei:textClass/tei:catRef[@scheme="#genre"]/@target
    let $category := id(substring($target, 2), doc($idx:app-root || "/data/taxonomy.xml"))
    return
        $category/ancestor-or-self::tei:category[parent::tei:category]/tei:catDesc
};

declare function idx:get-classification($header as element()?, $scheme as xs:string) {
    for $target in $header//tei:textClass/tei:catRef[@scheme="#" || $scheme]/@target
    let $category := id(substring($target, 2), doc($idx:app-root || "/data/taxonomy.xml"))
    return
        $category/ancestor-or-self::tei:category[parent::tei:category]/tei:catDesc
};
