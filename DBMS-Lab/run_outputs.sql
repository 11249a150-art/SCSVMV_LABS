-- Run from the DBMS-Lab directory with SQL*Plus or SQLcl.
-- The output files are written beside each experiment as output.md.

SET ECHO ON
SET FEEDBACK ON
SET HEADING ON
SET LINESIZE 200
SET LONG 10000
SET PAGESIZE 100
SET SERVEROUTPUT ON
SET SQLBLANKLINES ON
SET TRIMSPOOL ON
WHENEVER SQLERROR EXIT SQL.SQLCODE

SPOOL EXP-1/output.md
@EXP-1/Exp1.sql
SPOOL OFF

SPOOL EXP-2/output.md
@EXP-2/Exp2.sql
SPOOL OFF

SPOOL EXP-3/output.md
@EXP-3/Exp3.sql
SPOOL OFF

SPOOL EXP-4/output.md
@EXP-4/Exp4.sql
SPOOL OFF

SPOOL EXP-5/output.md
@EXP-5/Exp5.sql
SPOOL OFF

SPOOL EXP-6/output.md
@EXP-6/Exp6.sql
SPOOL OFF

SPOOL EXP-7/output.md
@EXP-7/Exp7.sql
SPOOL OFF

SPOOL EXP-8/output.md
@EXP-8/Exp8.sql
SPOOL OFF

SPOOL EXP-9/output.md
@EXP-9/Exp9.sql
SPOOL OFF

SPOOL EXP-10/output.md
@EXP-10/Exp10.sql
SPOOL OFF

SPOOL EXP-11/output.md
@EXP-11/Exp11.sql
SPOOL OFF

EXIT
