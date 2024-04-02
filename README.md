# The EHRI Online Editions
The EHRI project has been working, for several years, on publishing corpora from various subjects pertaining to the Holocaust. Those documents were encoded in [TEI](https://tei-c.org/) XML, a standard for the represensation of texts in digital form, annotated for named entities, linked to the [EHRI portal](https://portal.ehri-project.eu/) and then published.  

The EHRI editions shared on this repository are the following:
- Diplomatic Reports (diplomatic_reports)
- From Vienna to Nowhere: The 1939 Nisko Deportations (nisko)
- Early Holocaust Testimony (early_testimonies)
- Begrentze Flucht (begrentze_flucht)

In this repository, there are two versions of those XML files: Version 1 and Version 2.

---

## Version 1

Version 1 includes the XML files, as they can be found in the OMEKA website where they have been published:
- https://diplomatic-reports.ehri-project.eu/
- https://nisko-transports.ehri-project.eu/
- https://early-testimony.ehri-project.eu/
- https://begrenzte-flucht.ehri-project.eu/

All the folders contain the corpus in their original languages, except for the "Early Holocaust Testimonies" which also have its English translation.

---

## Version 2

Version 2 includes an upgraded version of the XML files, following the [ODD schema](https://gitlab.inria.fr/dh-projects/workflow-ehri/-/blob/main/ODD/ODD-EHRI.xml?ref_type=heads) that has been created in order to homogeneize the editions. The "Early Holocaust Testimonies" edition includes both version (original and translation) in the same document. This version also contains indexes, which are a centralised version of the various lists of named entities that were found in each XML document, across all editions.

This upgrade has been made as part as an intended migration of the collections to a [TEI Publisher](https://teipublisher.com/exist/apps/tei-publisher-home/index.html) application, whhich would centralised all the collections, and would propose the same features as the OMEKA websites.