# DBMS Lab

This lab follows the experiments in `DBMS LAB-1.docx` and uses Oracle Database Free for SQL and PL/SQL execution.

## Setup

Start the database from this directory:

```bash
docker compose up -d
```

The first startup can take a few minutes. The database listener is available at `localhost:1521/FREEPDB1`.

Connect with SQL Developer, SQLcl, or another Oracle client using:

```text
Host: localhost
Port: 1521
Service: FREEPDB1
User: SYSTEM
Password: OracleLab123
```

Stop the database with `docker compose down`. Use `docker compose down -v` only when you want to delete the stored database data.

## Keep program outputs

Run all experiments and save their SQL*Plus/SQLcl output to individual files:

```bash
sqlplus SYSTEM/OracleLab123@localhost:1521/FREEPDB1 @run_outputs.sql
```

The captured results are written to `EXP-1/output.md` through
`EXP-11/output.md`, alongside the program for each experiment.
Run this command from the `DBMS-Lab` directory after starting the database. The
output files are intentionally generated locally because they include the
database client's formatting and the current database state.

### Local SQLite fallback

When Oracle is unavailable, generate equivalent checked-in-style output with
Python's built-in SQLite support:

```bash
python3 generate_sqlite_outputs.py
```

This writes Markdown files `EXP-1/output.md` through `EXP-11/output.md`,
alongside each experiment program. The Oracle scripts are preserved unchanged;
Oracle-only DCL and PL/SQL features are represented by documented local
equivalents.

## Experiments

Each experiment directory contains the executable SQL or PL/SQL program and a short theory/procedure note. Run scripts in numerical order when an experiment has multiple files.

| Experiment | Topic |
| --- | --- |
| 1 | Database creation and retrieval queries |
| 2 | DML and DDL operations |
| 3 | DCL and TCL commands |
| 4 | Integrity constraints |
| 5 | Subqueries and set operators |
| 6 | Aggregate functions, `GROUP BY`, and `HAVING` |
| 7 | Views, sequences, indexes, and savepoints |
| 8 | Functional dependencies and normalization |
| 9 | Relationships, joins, and subqueries |
| 10 | PL/SQL blocks, exceptions, procedures, functions, triggers, and cursors |
| 11 | Mini database design projects |

## Notes

The supplied manual mixes MySQL and Oracle syntax. The completed executable scripts use Oracle syntax so that the PL/SQL experiment can run in the same environment. Where Oracle differs from the manual, the experiment notes identify the equivalent operation.