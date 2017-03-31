The test programs here were created to investigate some bug or the other. Below is a status report.

* cq2.c - this tests for a bug that was causing invalid linearized output. This is now fixed. See [this for details](http://marc.info/?l=linux-sparse&m=149011047532104&w=3).
* cq3.c and simplifybug.c both illustrate a bug that occurs when the IR is simplified. The work around for now is to avoid IR optmisations, by not passng -O option to the compiler. See [here for a discussion](http://marc.info/?l=linux-sparse&m=149017414417644&w=3).
* floatarith.c - this illustrates a bug related to division of float with int. This is now fixed.
