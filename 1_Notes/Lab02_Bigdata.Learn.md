---
created: 2026-10-10
tags:
  - lab
category:
  - "[[Agents]]"
subject:
  - "[[Class. Kỹ thuật và công nghệ dữ liệu lớn - INT3229 1|BigData]]"
---
---


> [!quote] YOU

md-log /mnt/lamviec/keepskyclear.Obsidian/1_Notes/Lab02_Bigdata.Learn.md

> [!quote] YOU

md-log /mnt/lamviec/keepskyclear.Obsidian/1_Notes/Lab02_Bigdata.Learn.md


> [!abstract] OPENCODE

Linked this session to `1_Notes/Lab02_Bigdata.Learn.md`.

- 2 existing entries backfilled into the file
- Future messages in **this** session will be mirrored there
- Other sessions are unaffected

You can check status anytime with `md-log-status`, or stop with `md-unlog`.


> [!quote] YOU

Tôi muốn học các khái niệm và kiến thức liên quan để làm được bài lab này:

Skip To Content
Dashboard
Đỗ Hoàng Đạt
Account
Dashboard
Courses
Groups
Inbox
Help
2627I_INT3229_1AssignmentsLab 2 - Data Curation, Quality & Metadata Governance
Học kỳ I năm học 2026 - 2027
Home
Announcements
Assignments
Discussions
Grades3
People
Pages
Files
Syllabus
Outcomes
Quizzes
Modules
Collaborations
Class Notebook
Website UET
Dev Courses
Convert GIFT Moodle
GIFT to QTI Converter
Lab 2 - Data Curation, Quality & Metadata Governance
Due Monday by 11:59pm Points 100 Submitting a text entry box or a file upload Available Oct 6 at 9am - Oct 12 at 11:59pm
LAB 2 - Data Curation, Quality & Metadata Governance

Curate, validate and publish a trustworthy research-data release

Duration

Team

Working mode

150 minutes

5 students

SQL pipeline, controlled defects, evidence-based review

Material:

Lab2-datasets.zipDownload Lab2-datasets.zip
trusted_manifest.jsonDownload trusted_manifest.json
The engineering challenge
Your research platform now has the private object store and access boundaries built in Lab 1. Two laboratories deliver temperature observations in different formats. Some records are incomplete, duplicated, late or inconsistent; some plausible measurements disagree with a reference sample. Analysts must not receive an unreviewed dataset simply because a cleaning script ran successfully.

Build a repeatable curation pipeline and a release gate. Preserve the original inputs, account for every record, measure quality on explicit populations, and publish enough metadata and lineage for another person to verify the release.

What you will build
A versioned input snapshot; a SQL curation pipeline; curated Parquet, a restricted quarantine and a duplicate ledger; a quality report; a machine-readable metadata catalog; OpenLineage run events; and one owner-approved, analyst-readable release manifest.

Learning outcome

Observable evidence

Reconcile heterogeneous inputs without silent loss.

Every physical record has one terminal disposition and a source reference.

Measure quality rather than merely claim it.

Numerators, denominators, cohort definitions and counterexample tests.

Implement reproducible curation.

Stable winners and identical logical output under reordered execution.

Make a dataset discoverable and traceable.

Validated metadata, actual run events and two independent trace queries.

Enforce a release decision.

One passing case and seven rejected mutation cases; owner/analyst checks.

 

Scope boundary  This is a single-node curation exercise running inside a Kubernetes tenant. It uses big-data engineering practices, but does not claim distributed processing or large-scale performance. Distributed lakehouse processing belongs in Lab 3.

 

 

READ BEFORE CLASS

1. Academic basis and technology choices
The design adapts teaching practices from public university materials. The research-telemetry fixture, governance rules, group work, acceptance tests and 150-minute schedule below are newly designed for this course; they are not assignments supplied or endorsed by the institutions listed here.

University material

What the source teaches

Adaptation in this lab

Harvard CS109A, Lab 2: Pandas for Data Cleaning (2018). [U1]

Inspect types and missing values; parse columns; clean and export a dataset.

T2–T3: investigate defects, define transformations, then verify the exported result.

UC Berkeley Data 100, Lab 3: Data Cleaning and EDA (Spring 2022). [U2]

Acquire/cache data, examine fields and non-null counts, transform data, and submit individually authored answers.

T1–T3: frozen inputs and testable transformations; independent individual checks within the team.

Cornell Data Services, Writing READMEs for Research Data. [U3]

Document files, variables, units, processing, quality assurance and reuse conditions.

T4: README and catalog fields tied to real artifacts; this source is guidance, not a timed lab.

University of Cambridge, Adding metadata to your research data. [U4]

Explain context, creators, structure and software; support machine-readable metadata.

T4: validated JSON metadata and a consumer handover; this source is guidance, not a deployment lab.

 

A small core stack, not a tool-installation exercise
Use Python 3.11, DuckDB SQL, Parquet, boto3 and JSON Schema validation in an instructor-prepared container. Reuse the Kubernetes and S3-compatible object storage from Lab 1. Record exact installed package versions and the actual image digest. DuckDB 1.4 LTS is the reference API family; the exact patch build is fixed in the prepared image. [T1–T4]

DuckDB is used here to make SQL-based curation accessible before the Spark lab. Download this bounded input snapshot through boto3 and query it locally; direct S3 extensions are not required. OpenLineage provides a standard run/dataset event structure, without requiring a catalog server. [T5–T6]

Not required in the 150-minute core  No Spark cluster deployment, Kafka, full DataHub/OpenMetadata/Marquez installation, LLM-based cleaning, automatic imputation or fuzzy entity matching. These are extensions, not prerequisites or hidden grading requirements.

 

 

ENVIRONMENT AND ACCESS CONTRACT

2. Continue the governed landing zone
Use the Lab 1 namespace bd-gXX, the private objects Service on TCP 8333, and the existing research-raw and research-release buckets. Do not rebuild the object store, relax the quota or give the curator owner credentials. A prepared equivalent tenant is allowed if Lab 1 is incomplete; record that dependency explicitly.

Actor / identity

Permitted work in Lab 2

Evidence

Curator Pod / s3-ingestor

Read research-raw inputs; write only course staging artifacts in research-raw by convention. No release-bucket access.

Positive raw GET and an actual denied release PUT.

Publisher Pod / s3-owner

Recheck the candidate, record independent review, then publish approved artifacts.

Gate result, named reviewer and manifest-last publication record.

Consumer Pod / s3-analyst

Read approved release objects; no raw/quarantine access and no writes.

Verified release GET; actual raw GET denied.

 

The existing ingestor identity can modify the raw bucket. Therefore the authoritative input manifest is supplied independently by the instructor, mounted read-only or distributed through the course repository. Matching two files controlled by the same writer is not a trustworthy integrity check. An in-bucket copy is only a convenience copy.

Workspace and data locations
S3 endpoint:  http://objects:8333   (isolated teaching network only)

Input prefix: research-raw/lab2/inputs/batch-01/

Stage prefix: research-raw/lab2/staging/<run_id>/

Release:      research-release/lab2/releases/<release_id>/

Local work:   /work/{snapshot,candidate,evidence}

STORE_ID:     bd-gXX-objects  (include it in every run record)

 

Use the prepared image for curate, publisher and analyst, each with label access: s3 and token automount disabled. Curate and publisher each request 500m CPU / 512 MiB and limit 1 CPU / 1 GiB; analyst requests 100m / 128 MiB and limits 500m / 512 MiB. Together with the Lab 1 store, totals are 1.6 CPU / 1,664 MiB requested and 3.5 CPU / 3.5 GiB limited. Remove replaced role/probe Pods first. Provide writable scratch; DuckDB uses two threads and a 512 MB memory limit. These are limits, not guaranteed performance.

Security boundary  Curator, publisher and consumer operations run in separate credential contexts. Record human operators separately from workload identities. Never include Secret values, kubeconfig tokens, credentials, or raw operator_email values in general reports or the analyst release. Metadata labels are not access controls.

 

 

PREPARE RESPONSIBILITIES, NOT A REPORT-ONLY ROLE

3. Team workflow and the 150-minute plan
Time

Activity

Checkpoint

00–10 / 10 min

Briefing, roles, environment checks

Inputs and role identities available; image/runtime versions captured.

10–30 / 20 min

T1 — freeze inputs and the contract

Verified snapshot, provenance envelope and signed-off rule plan.

30–60 / 30 min

T2 — profile and measure quality

Before-quality report with explicit eligible populations.

60–95 / 35 min

T3 — deterministic curation

Curated/quarantine/duplicate outputs; reconciliation and replay checks.

95–120 / 25 min

T4 — metadata and lineage

Catalog validation, two traces and retention dry-run results.

120–135 / 15 min

T5 — challenge the release gate

Eight gate cases; approved release and consumer verification.

135–150 / 15 min

Individual demonstration and exit check

Five short independent demonstrations and five exit responses.

 

Role

Technical responsibility

Independent cross-check

A / Ingestion

S3 snapshot, manifest verification, source mapping.

Verify D’s source-to-output trace.

B / Quality

quality.sql, metric definitions, before/after evidence.

Recompute C’s conservation and uniqueness checks.

C / Curation

curate.sql, deterministic winner selection, output schema.

Verify A’s tampered-object rejection.

D / Metadata

Catalog, README, run events, retention record.

Verify E’s missing-metadata gate rejection.

E / Release

Mutation harness, owner publication and consumer handover.

Recompute B’s QA agreement and coverage separately.

 

Work in parallel: D starts the catalog shell during T1; E prepares mutation cases while B and C implement SQL. A checks that all technical artifacts refer to the same snapshot. Integrate at minutes 30, 60, 95 and 120. Do not wait until T4 to start documentation.

Each member must author one technical change, execute one independent check, and explain one design decision. Keep an evidence index with operator, reviewer, command/query, run ID, input version and output filename. After five minutes of blocked progress, request a hint and keep an incident note. A platform-blocked check is never recorded as passed.

Prerequisites  Students need basic Python, SQL SELECT/JOIN/GROUP BY and the concept of a window function. Review ROW_NUMBER before class if you have not used it. All packages, images, templates and fixture objects are already available.

 

 

READ THE MEANING BEFORE CLEANING THE VALUES

4. Data products and the curation contract
Students receive a fixed Lab2-datasets.zip. The package contains 10,205 physical observation records across two source objects, a 20-sensor registry, 100 reference measurements, machine-readable schemas/templates and a convenience source manifest. Students do not regenerate the fixture during the 150-minute lab. No real personal or research data are used. The fixture is deliberately small so correctness tests complete quickly; its size is not evidence of distributed scalability.

Canonical input

CSV source A

JSON Lines source B

Business identifier

record_id

id

Sensor identifier

sensor_id

sensor

Observation time

event_time

timestamp

Recorded arrival time

ingest_time

arrived_at

Measured value

reading

temperature

Measurement unit

unit

temperature_unit

Optional restricted attribute

operator_email

operator

 

sensors.csv maps sensor_id to site. qa_reference.csv maps record_id to reference_c; it is used only to evaluate agreement, not to repair, impute or select measurements. The student ZIP contains manifests/source_manifest.json as a convenience copy describing byte size, physical record count and SHA-256. The authoritative trusted_manifest.json is distributed separately from the data through an instructor-controlled read-only channel.

Dataset distribution — provided before class
The student archive below accompanies this handout. The authoritative trusted_manifest.json is not included in it; it is supplied separately through an instructor-controlled read-only channel. The separation is intentional: integrity must be checked against a manifest controlled independently from the writer of the raw bucket.

Lab2-datasets.zip
  input/{observations_a.csv, observations_b.jsonl, sensors.csv, qa_reference.csv}
  manifests/source_manifest.json        # convenience, not authoritative
  schemas/{observation_contract_schema.json, metadata_catalog_schema.json}
  templates/{catalog_template.json, openlineage_event_template.json}
  README.md

The known inventory count of 10,205 physical observation records is part of the task specification.

Versioned contract: research-telemetry-v1
Rule

Required interpretation

Normalization

Trim and uppercase record_id, sensor_id and unit. Missing means null or a blank/whitespace-only value. Do not invent identifiers.

Time and units

Parse the documented UTC format YYYY-MM-DDTHH:MM:SSZ. C and F are supported; temperature_c = (F − 32) × 5/9 for F. Reject unsupported units.

Validity

Require a finite numeric reading and a converted temperature in [−30, 60] °C. Validate before rounding; export DECIMAL(8,2).

Chronology

Require event_time ≤ ingest_time ≤ 2026-02-09T00:00:00Z. This fixed AS_OF is the data-evaluation cutoff, not the execution timestamp.

Late but usable

lag_seconds = ingest_time − event_time. If lag > 900, retain an otherwise valid observation with is_late = true.

Privacy

operator_email is optional and restricted. Its absence is not a row error. Exclude it from the curated release; keep diagnostic raw payloads restricted.

 

Policy, not a universal standard  The ranges, timing limits and thresholds are course-specific research requirements. A valid measurement can still be inaccurate, and a passing release can contain documented residual uncertainty.

 

 

20 MINUTES / 10 GROUP POINTS

5. Task 1 — Freeze inputs and declare rules
Implementation sequence
Obtain Lab2-datasets.zip and the separately supplied read-only trusted_manifest.json. If the instructor has not preloaded the inputs, upload only the four files under input/ to research-raw/lab2/inputs/batch-01/. As the curator, read those four objects through the S3 API. Check each downloaded object’s byte length and SHA-256 against trusted_manifest.json, not against the convenience manifest that travelled with the data. Download to snapshot/ without rewriting the objects. Capture the store ID, bucket/key, format, physical record count and retrieval time.
Use the supplied stage_inputs.py (Appendix C) to create an envelope for every source record. Verify the CSV-to-JSON field mapping yourself. Preserve malformed JSON as a record with parse_ok = false rather than silently skipping it.
Identify each physical observation by (source_object, source_row). A CSV source_row is the 1-based data-record ordinal excluding the header; a JSON source_row is the 1-based line number. source_sha256 is the hash of the source object, not of an individual row.
Save contract.json with the rules in Sections 4 and 7, the fixed AS_OF, schema version, deduplication ordering, reason precedence, and release thresholds. A second member reviews it. Freeze its hash before measuring quality; any later edit creates a new contract version and a new run.
Four acceptance checks
ID

What to execute

Passing evidence

I01

Compare all four downloaded objects with the trusted manifest.

4/4 byte/hash matches; exact input inventory.

I02

Count envelopes by source and test physical-key uniqueness.

10,205 envelopes; no repeated physical key; parse failures retained.

I03

Flip one byte in a disposable local copy, then verify against the trusted manifest.

The verification fails with INPUT_INTEGRITY; original input remains unchanged.

I04

Check one allowed raw GET and one forbidden release PUT as curator.

Successful authorized read; HTTP 403/AccessDenied for the intended release request, not a timeout or bad credentials.

 

# /work; instructor supplies trusted_manifest.json and the scripts.

python stage_inputs.py s3 trusted_manifest.json

python -c "import duckdb; print(duckdb.__version__)"

# Save runtime versions, STORE_ID, contract hash and evidence/I01-I04.

# Never print environment variables containing AWS credentials.

 

Submit input_inventory.json, contract.json, integrity-test.json and access-test.json. A screenshot of a bucket listing is not proof of snapshot identity. Do not use ETag as a substitute for SHA-256; the checksum is checked against the trusted manifest, not inferred from an object identifier. [T4]

Failure handling  Stop ingestion if an expected file, schema or hash does not match. Do not update the trusted hash to make the check pass. Restore only the disposable copy, or ask the instructor to provide a correctly versioned input bundle.

 

 

30 MINUTES / 15 GROUP POINTS

6. Task 2 — Profile and measure quality
Build typed, key_eligible and winners views using the supplied normalization and the winner policy in Task 3. The before-quality population W is the deterministic set of winners before row-validity filtering; it is not all raw records. Report the raw count, parse failures, key-rejected count and duplicate count separately so exclusions remain visible.

Dimension / rule

Numerator

Denominator / population

Required-field completeness

Rows with nonblank record_id, sensor_id, event_time, ingest_time, reading and unit.

All rows in W; separately report required-field failures in parsed intake.

Business-key uniqueness

Distinct normalized record_id values.

Key-eligible records before deduplication; curated records after curation. Also report duplicate excess.

Value validity

Finite, convertible temperatures in [−30,60] °C.

W before curation; curated records afterwards. Invalid numeric/unit values count as failures.

Referential consistency

Rows whose normalized sensor_id exists in sensors.csv.

W before curation; curated records afterwards.

Temporal consistency

Rows with parseable timestamps and event ≤ ingest ≤ AS_OF.

W before curation; curated records afterwards.

Timeliness

Chronologically valid rows with lag_seconds ≤ 900.

Chronologically valid rows only, before/after. State excluded rows separately.

Reference agreement and coverage

Agreement: matched IDs within 0.05 °C of reference. Coverage: matched reference IDs.

Agreement / matched reference IDs; coverage / all 100 reference IDs. Compute on the curated candidate in T3.

 

Metric record and investigation
Each metric needs rule_id, dataset version, cohort/filter, numerator, denominator, value, threshold, severity and observed status. A zero denominator is NOT_EVALUATED, never 100% quality. NULL must count as a failure for a required rule; SQL expressions must not accidentally exclude it from the denominator.

Use counts and sample source references to investigate at least three defect categories. Do not include raw email addresses in the report. Add one before/after chart with labelled populations and counts, generated from the metric records; do not average the dimensions into a single unexplained “quality score”.

A completeness score that improves after rows are removed is not evidence that missing values were recovered. Explain the retained fraction, rejected fraction and remaining late observations. Reference agreement evaluates this supplied sample only; it cannot establish the accuracy of every real-world sensor reading.

Acceptance  The report must be recomputable from SQL, include every denominator, and distinguish validity, reference agreement, coverage and timeliness. The after metrics and reference comparison are filled after T3; quality_before.json is the minute-60 checkpoint.

 

 

35 MINUTES / 20 GROUP POINTS

7. Task 3 — Curate without losing evidence
Required operation order
Separate malformed records into quarantine with reason PARSE. Before deduplication, quarantine records with missing/invalid IDs (pattern R[0-9]{6}) or unparseable arrival times. Record both reasons when both apply; assign primary precedence PARSE, then KEY, then INGEST_PARSE.
Deduplicate the remaining records by normalized record_id. Select the largest parsed ingest_time; break ties with source_object ascending, then source_row ascending. Every non-selected version enters duplicates.csv with its winner’s physical key and reason SUPERSEDED. Do not use arbitrary file order or an unordered DISTINCT.
Validate the selected winners. For each, retain all failing reason codes and one primary reason in this order: REQUIRED, NUMERIC, UNIT, RANGE, TIME_PARSE, TIME_ORDER, REFERENCE. These diagnostic reasons may overlap; the primary reason is used for disjoint count summaries.
If a newer winner is invalid, quarantine it. Do not silently substitute an older valid version. Retain an otherwise valid late winner and mark it late. Join the registry to attach site; never use qa_reference.csv to construct the curated measurement.
Read rule parameters from contract.json. Write candidate/curated.parquet, quarantine.csv and duplicates.csv. Restrict the latter two and any raw payload to research-raw staging. Record input, code and contract hashes and recompute all quality metrics.
Released columns — explicit allowlist
record_id VARCHAR         sensor_id VARCHAR        site VARCHAR

event_time_utc TIMESTAMP   ingest_time_utc TIMESTAMP

temperature_c DECIMAL(8,2)     is_late BOOLEAN

source_object VARCHAR     source_row BIGINT        source_sha256 VARCHAR

 

All released timestamps are UTC by contract. Remove operator_email and raw_payload entirely from the release. source_object is an identifier, not a signed URL or a grant to read the restricted source. This minimization is not a claim of formal anonymization.

Counterexample

Required behaviour

32 °F and an otherwise valid record

Convert to 0.00 °C; retain.

Unsupported K unit or a non-finite numeric value

Quarantine; never silently treat it as Celsius.

An otherwise valid record with blank operator_email

Retain; omit that column from the release.

Newer invalid version and older valid version of one ID

Newer version quarantined; older one in the duplicate ledger.

 

SQL details  TRY_CAST/try_strptime avoid aborting the whole batch, but a NULL result must then be classified. Check finiteness explicitly. Implement the deterministic order using ROW_NUMBER. Supplied typing does not constitute a complete curation pipeline. [T1–T3]

 

 

TASK 3 / MANDATORY VERIFICATION

8. Verify the transformation, not just the count
Reconciliation is a set partition of physical input identities. Equal totals alone could hide one lost record and one accidental duplicate. Use anti-joins or set comparisons as well as counts.

N_raw = N_curated + N_quarantine + N_duplicates

physical_ids(raw) = union(ids(curated), ids(quarantine), ids(duplicates))

The three output physical-ID sets are pairwise disjoint.

Each output has unique physical IDs; curated record_id is also unique.

 

ID

Measurement

Acceptance

C01 / Conservation

Count and physical-ID set comparisons.

No loss, no invented physical ID, no overlap, no duplicate physical output.

C02 / Determinism

Run the same logic twice with reversed input enumeration and shuffled envelope order. Preserve source_row/source_object.

Same business rows, winner IDs, quarantine IDs and duplicate IDs.

C03 / Schema and privacy

Inspect Parquet schema and the exact column-name allowlist.

10 documented columns; no operator_email or raw_payload; correct types.

C04 / Edge cases

Execute the four counterexamples in Task 3 in a separate small fixture.

4/4 correct dispositions and explanations.

C05 / Residual quality

Recompute after metrics plus reference agreement and coverage.

Required rules pass; late data is reported and retained; QA coverage not sacrificed.

 

Two different checksums, two purposes
Use a file SHA-256 to verify that an uploaded Parquet object has the expected bytes. For replay equivalence, compare sorted canonical rows or a deterministic content digest of that projection. Parquet file bytes can change with writer settings or layout even when the logical data are equal. Exclude run timestamps and random run IDs from the logical equivalence projection. [T3]

Release thresholds to implement
A candidate must be nonempty, reconcile exactly, have unique business IDs, pass schema, required-field, value, registry-integrity and chronology checks at 100%, and contain no restricted columns. Timeliness must be at least 95% of chronologically valid candidate rows. Reference coverage must equal 100/100, and sample agreement must be at least 95%.

These numeric checks are necessary but not sufficient for publication: the source integrity, metadata, lineage and independent review checks in T4–T5 must also pass. Do not revise thresholds after seeing the results of a mutation test.

What does not earn full credit  Deleting all questionable rows without a ledger; replacing late timestamps with the current time; using the reference answers to “clean” the data; or claiming byte-for-byte Parquet reproducibility without testing logical equivalence.

 

 

25 MINUTES TOTAL FOR SECTIONS 9–10 / 15 GROUP POINTS

9. Task 4 — Make metadata operational
Create catalog.json with at least three dataset records: the raw observation collection, the quarantine collection, and the curated candidate. Describe source-specific aliases for the raw collection. The duplicate ledger is a supporting artifact referenced by the curation record. Populate technical metadata from measured artifacts, not manually invented values.

Required catalog fields

Validation / observable behaviour

Business: dataset_id, title, purpose, owner, steward, classification, allowed_use.

All nonempty; owner and steward name actual team roles/people; allowed_use states synthetic teaching use.

Technical: location, schema_version, columns, as_of, row_count.

Locations identify actual objects; column definitions include name, type, meaning, unit and nullability; AS_OF is fixed.

Reproducibility: input_manifest_sha256, contract_sha256, code_sha256.

Hashes match the submitted manifest, contract and exact executed code bundle.

Operations: quality_report, retention, provenance.

Links resolve to the run’s evidence; retention has duration, time basis, hold/dependency policy; provenance identifies jobs and run IDs.

 

Use JSON Schema validation for structure and a semantic validator for existence, measured counts, required column meanings and hash agreement. A JSON file that parses is not automatically a correct catalog. The example in Appendix E defines the required profile; extend it for the three dataset types.

Two catalog queries and one consumer test
M01: Find the curated dataset for this run with temperature_c measured in Celsius and a nonempty quality-report link. Return its dataset ID, owner, steward, row count, location and schema version.

M02: Find all restricted datasets with a retention period and a declared hold/dependency rule. Return raw and quarantine entries; demonstrate that the release schema has no email attribute.

M03: Give another member only the catalog, README and draft manifest; confirm the approved versions during T5. Ask that member to identify the unit, reference population, evaluation cutoff, known limitations and contact role. Record five correct answers without opening your notebook. Cornell and Cambridge provide the documentation principles; the JSON profile here is course-defined. [U3–U4]

README: concise but usable
Write 250–400 words: purpose and synthetic origin; files and keys; timestamps and units; curation/deduplication policy; quality cohorts and residual limitations; permitted use; access boundary; software versions; reproduction instructions. Link to the machine-readable artifacts rather than reproducing long tables.

Modern metadata without server overhead  This catalog is a queryable, validated JSON artifact, not a deployed enterprise catalog. A DataHub/OpenMetadata UI or OpenLineage receiver is an optional extension only if already available. Installing one is not part of the assessed core.

 

 

TASK 4 / CONNECTIONS HAVE PRECISE MEANINGS

10. Capture real lineage and retention decisions
Emit OpenLineage START and COMPLETE events for a successful curation run, using one UUID for the pair. A successful publish run has its own UUID and its own START/COMPLETE pair. Policy rejection uses ABORT; an execution error uses FAIL. Emit events when those states actually occur. Validate against the cached official schema and the additional lab checks below. [T5–T6]

Job / source

Inputs actually read

Outputs actually produced

curate

Observation A, observation B, sensors registry, contract.

Candidate Parquet, quarantine and duplicate ledger in restricted staging.

validate-and-publish

Candidate, input manifest, contract, QA reference, registry, catalog and quality evidence; source objects rechecked for integrity.

Approved artifacts and final manifest if the gate and review pass; otherwise a restricted rejection record, not an approved dataset.

 

The reference sample is a validation input, not an input to computing temperature_c. The registry is a transformation input because it supplies site. A catalog describes a dataset; it does not carry data between processing blocks. Row-level source tracing comes from the provenance columns and manifests, not merely from a dataset-level OpenLineage event.

Lineage acceptance
L01: By minute 120, validate the curate START/COMPLETE pair. Complete the separate publish pair during T5; a successful path then has four events. Require nonempty job/run/dataset identities and store-qualified dataset names. A failed publication must not have a COMPLETE event claiming an approved output. A sidecar run record binds code/contract/input hashes and named human review to the run UUID.

L02: Trace one accepted row back to the input object, source SHA-256, row ordinal, selected version and transformation rule. L03: Trace one quarantined record to the same source evidence and its primary/all reasons. A peer must reproduce both traces from stored artifacts; save the queries and results.

Retention is a decision with dependencies
Course policy: raw input 30 days from retrieval; quarantine 7 days from run completion; approved release 90 days from publication. A legal hold or an active approved release depending on an input overrides normal deletion eligibility. Retain manifests/audit records for at least the release lifetime. Record the time basis; do not infer retention from the simulated AS_OF.

Dry-run case

Expected result

Expired scratch object; no hold; no dependent release.

ELIGIBLE, not actually deleted.

Expired quarantine object under hold.

KEEP / HOLD.

Expired raw input referenced by an active approved release.

KEEP / ACTIVE_DEPENDENCY.

Unexpired object, no hold or dependency.

KEEP / NOT_EXPIRED.

 

Submit retention-plan.json and four dry-run decisions. This demonstrates policy logic, not automatic enforcement by S3 lifecycle rules. No real deletion is permitted in the core lab. [U3–U4]

 

 

15 MINUTES / 10 GROUP POINTS

11. Task 5 — Challenge a fail-closed release gate
Prepare these tests during earlier tasks. Each mutation starts from a fresh copy of the valid candidate or metadata; do not mutate the frozen raw objects. Recompute checks from candidate bytes and trusted inputs. A supplied JSON field saying “passed” is not evidence that the data passed.

ID

Candidate / change

Expected outcome

P01

Unmodified candidate with complete, consistent metadata and lineage.

PASS; eligible for independent owner review.

P02

Set one temperature_c to 100.00.

REJECT / VALUE.

P03

Set one required temperature_c to NULL.

REJECT / REQUIRED or VALUE; NULL must not vanish from counts.

P04

Append a duplicate business record.

REJECT / UNIQUENESS or RECONCILIATION.

P05

Remove the steward from the curated metadata record.

REJECT / METADATA.

P06

Tamper with a disposable source copy or its claimed hash.

REJECT / INPUT_INTEGRITY against the trusted manifest.

P07

Remove or misidentify a required curation lineage output.

REJECT / LINEAGE; a diagram alone is insufficient.

P08

Remove a mismatching QA-sample ID from the candidate.

REJECT / COVERAGE, even if apparent agreement improves.

 

Owner-controlled publication
The publisher rechecks the actual staged candidate, all required predicates, metadata, source integrity and curation lineage. A reviewer other than the main curation author records the decision, reason, run ID and candidate hash. A preflight or validation error blocks publication; it is not a pass.
Only after the checks and review pass, copy the approved data/metadata/evidence to a new immutable-by-convention release_id prefix. Verify their uploaded hashes. Write release_manifest.json last, listing artifact keys, SHA-256, row counts, versions and approval details. Do not overwrite a published release.
As analyst, fetch the final manifest and candidate, verify hashes, and recompute the record count. Repeat an actual raw GET denial. Confirm that none of the seven rejected probe IDs has an approved manifest. Save the eight result records and the consumer check.
Do not overclaim atomicity  Manifest-last publication is a consumer protocol, not a multi-object S3 transaction. An interrupted upload can leave orphan objects. Consumers must require a valid final manifest; no unapproved candidate may be uploaded into the analyst-readable bucket. [T4]

 

 

70 GROUP POINTS + 30 INDIVIDUAL POINTS

12. Assessment and evidence-based handover
Group criterion

Points

Full-credit evidence

T1 / Snapshot and access

10

4 verified input objects, row envelopes, trusted tamper rejection and correct identity checks.

T2 / Quality measurement

15

Correct cohorts/denominators (7); SQL-derived metrics and chart (5); three explained defect categories (3).

T3 / Deterministic curation

20

Correct rules and dispositions (8); set/count conservation (5); reordered replay equivalence (4); edge cases and privacy schema (3).

T4 / Metadata and governance

15

Valid, accurate catalog and consumer questions (6); real lineage and two traces (6); four retention decisions (3).

T5 / Release safety

10

8/8 correctly interpreted gate cases (5); reviewed manifest-last publication (3); analyst read/hash/denial verification (2).

 

Award partial credit for an implemented, honestly diagnosed check with reproducible evidence. Award no evidence credit for fabricated measurements or a skipped check labelled PASS. If an invalid candidate is published, the publication-safety points are zero until it is revoked and retested; do not erase otherwise demonstrated skills.

Individual component

Points

How assessed

Authored technical work

10

A traceable SQL/code/metadata change, its test and the student’s explanation. Commit counts alone do not earn marks.

Independent hands-on check

10

A two-minute demonstration on another member’s artifact: predict the outcome, execute, interpret the evidence.

Exit response

10

Five-minute individual written explanation of one assigned trade-off or failure case, using evidence from the run.

 

Exit response: each member receives a different prompt at the end of the session.

Submission
Submit one ZIP containing code/ (SQL and student helpers), contract.json, trusted-manifest hash, input_inventory.json, quality_before/after.json, candidate artifact manifests, catalog.json, README.md, lineage.jsonl, run-record.json, retention-plan.json, gate-tests.json, consumer-check.json and contributions.csv. Include quarantine/duplicate ledgers only in the restricted course submission, never the analyst release. Exclude credentials and raw email values from general reports.

Working integrity  AI assistance may be used if the course permits it; disclose assisted sections and verify every generated rule. Never upload credentials or restricted data to external services. Students must still explain and reproduce their own assessed contribution.

 

 

SUPPLIED PREPARATION / NOT A CLUSTER INSTALLATION TASK

Appendix A. Runtime launch and work contract
Reuse the hardened Lab 1 client Pod pattern. Replace its name with curate, mount only s3-ingestor credentials, add a writable /work, and use the prepared image with Python, DuckDB, boto3 and jsonschema. Keep the other two roles in separate Pods. The snippet below is a fragment to merge into the approved template, not a complete Pod manifest.

metadata:

  name: curate

  labels: {access: s3}

spec:

  automountServiceAccountToken: false

  containers:

  - name: client

    image: <instructor-approved-image@sha256:digest>

    command: ["sleep", "infinity"]

    workingDir: /work

    envFrom:

    - secretRef: {name: s3-ingestor}

    env:

    - {name: S3_ENDPOINT, value: "http://objects:8333"}

    - {name: STORE_ID, value: "bd-gXX-objects"}

    resources:

      requests: {cpu: "500m", memory: "512Mi"}

      limits: {cpu: "1", memory: "1Gi"}

    volumeMounts:

    - {name: work, mountPath: /work}

  volumes:

  - name: work

    emptyDir: {sizeLimit: "2Gi"}

 

Retain runAsNonRoot, runAsUser, seccomp and dropped capabilities from Lab 1. Ensure /work is writable by that user (for example an appropriate Pod fsGroup). An emptyDir is temporary scratch, not durable storage; stage the evidence before Pod deletion. Never mount all three identities into this Pod.

Commands after the instructor has mounted/copied the starter files
kubectl -n "$NS" exec curate -- python -m pip freeze

kubectl -n "$NS" exec curate -- python stage_inputs.py s3 trusted_manifest.json

# Inside /work, use a Python notebook or create driver.py:

from pathlib import Path

import duckdb

con = duckdb.connect('work.duckdb')

con.execute(Path('typed.sql').read_text())

# Student-authored files, not supplied answers:

con.execute(Path('curate.sql').read_text())

con.execute(Path('quality.sql').read_text())

# Use COPY ... TO ... (FORMAT PARQUET) to export the curated view.

 

Time protection  Images, Secrets, connectivity, source objects and scaffold files are prepared before class. Students implement and test data rules, metadata and the release decision; they do not spend the session installing a platform.

 

 

SUPPLIED NON-ASSESSED PLUMBING / STAGE_INPUTS.PY

Appendix C1. Verified acquisition and envelopes
Save C1 and C2 consecutively as stage_inputs.py. The S3 mode uses the Pod’s single role credentials. The local mode exists for instructor fixture tests or a recorded platform fallback; local mode is not evidence of S3 governance.

"""Supplied plumbing: verify input bytes and preserve every physical row.

Run from /work: python stage_inputs.py s3 trusted_manifest.json

Local fixture check: python stage_inputs.py local fixture/source_manifest.json

"""

import csv, hashlib, json, os, sys

from pathlib import Path

 

mode, manifest_path = sys.argv[1:3]

assert mode in {'local', 's3'}

manifest = json.loads(Path(manifest_path).read_text())

root = Path('snapshot'); root.mkdir(exist_ok=True)

keys = {'observations_a.csv', 'observations_b.jsonl',

        'sensors.csv', 'qa_reference.csv'}

assert {x['key'] for x in manifest['objects']} == keys

prefix = 'lab2/inputs/batch-01/'

store = os.environ.get('STORE_ID', 'bd-gXX-objects')

if mode == 's3':

    import boto3

    from botocore.config import Config

    client = boto3.client('s3', endpoint_url=os.environ['S3_ENDPOINT'],

        region_name='us-east-1', config=Config(signature_version='s3v4',

        s3={'addressing_style': 'path'}))

for obj in manifest['objects']:

    key = obj['key']

    if mode == 's3':

        response = client.get_object(Bucket='research-raw', Key=prefix+key)

        body = response['Body']

        try: data = body.read()

        finally: body.close()

    else:

        data = (Path(manifest_path).parent/key).read_bytes()

    digest = hashlib.sha256(data).hexdigest()

    if len(data) != obj['bytes'] or digest != obj['sha256']:

        raise RuntimeError('INPUT_INTEGRITY: '+key)

    (root/key).write_bytes(data)

fields = ['record_id','sensor_id','event_time','ingest_time',

          'reading','unit','operator_email']

bkeys = ['id','sensor','timestamp','arrived_at',

         'temperature','temperature_unit','operator']

 

The helper does bounded local staging for this small exercise. Production pipelines need streaming/chunked transfers, resource-aware parsing and explicit source-change handling. CSV multiline field handling uses data-record ordinals; JSON uses line ordinals.

 

 

CONTINUE STAGE_INPUTS.PY

Appendix C2. Preserve malformed records
extra = ['source_object','source_row','source_sha256',

         'parse_ok','raw_payload']

inventory = []

with Path('envelopes.csv').open('w', newline='', encoding='utf-8') as out:

    writer = csv.DictWriter(out, fieldnames=fields+extra)

    writer.writeheader()

    for key in sorted(keys):

        if not key.startswith('observations_'): continue

        p = root/key; digest = hashlib.sha256(p.read_bytes()).hexdigest()

        n = 0

        with p.open(encoding='utf-8', newline='') as src:

            records = csv.DictReader(src) if key.endswith('.csv') else src

            for n, raw in enumerate(records, 1):

                payload = json.dumps(raw) if isinstance(raw, dict) else raw

                ok = True

                try:

                    r = raw if isinstance(raw, dict) else json.loads(raw)

                    if not isinstance(r, dict): raise ValueError('not object')

                    if key.endswith('.jsonl'):

                        r = {a:r.get(b) for a,b in zip(fields,bkeys)}

                    r = {k: '' if r.get(k) is None else str(r[k]) for k in fields}

                except (ValueError, TypeError):

                    r = {k:'' for k in fields}; ok = False

                r.update(source_object='s3://research-raw/'+prefix+key,

                         source_row=n, source_sha256=digest,

                         parse_ok=str(ok).lower(), raw_payload=payload)

                writer.writerow(r)

        expected = next(x['records'] for x in manifest['objects'] if x['key']==key)

        if n != expected: raise RuntimeError('ROW_COUNT: '+key)

        inventory.append(dict(store_id=store, key=prefix+key,

                              records=n, sha256=digest))

Path('input_inventory.json').write_text(json.dumps(inventory, indent=2))

print(json.dumps({'status':'VERIFIED', 'observation_rows':sum(

    x['records'] for x in inventory), 'store_id':store}))

 

Do not replace parse failures with an empty dataset, use ignore_errors to skip malformed records, or renumber provenance after sorting. The semantic key record_id and the physical key (source_object, source_row) have different jobs.

 

 

SAVE THE SUPPLIED BLOCK AS TYPED.SQL

Appendix D. SQL starting point and student work
-- Supplied normalization; curation and quality SQL are student work.

-- DuckDB 1.4 LTS; the patch build is pinned in the prepared image.

SET TimeZone='UTC';

SET threads=2;

SET memory_limit='512MB';

CREATE OR REPLACE TABLE raw_envelopes AS

SELECT * FROM read_csv('envelopes.csv', header=true, all_varchar=true);

CREATE OR REPLACE VIEW typed AS

WITH normalized AS (

  SELECT * EXCLUDE(record_id,sensor_id,unit,source_row,parse_ok),

    upper(trim(record_id)) AS record_id,

    upper(trim(sensor_id)) AS sensor_id,

    upper(trim(unit)) AS unit,

    cast(source_row AS BIGINT) AS source_row,

    cast(parse_ok AS BOOLEAN) AS parse_ok

  FROM raw_envelopes

)

SELECT *,

  try_cast(reading AS DOUBLE) AS value_num,

  try_strptime(event_time,'%Y-%m-%dT%H:%M:%SZ') AS event_ts,

  try_strptime(ingest_time,'%Y-%m-%dT%H:%M:%SZ') AS ingest_ts

FROM normalized;

CREATE OR REPLACE TABLE registry AS

SELECT * FROM read_csv('snapshot/sensors.csv', all_varchar=true);

CREATE OR REPLACE TABLE qa_reference AS

SELECT record_id, cast(reference_c AS DECIMAL(8,2)) AS reference_c

FROM read_csv('snapshot/qa_reference.csv', all_varchar=true);

-- Run through Python, not an assumed preinstalled CLI:

-- import duckdb

-- con = duckdb.connect('work.duckdb')

-- con.execute(Path('typed.sql').read_text())

-- con.execute(Path('curate.sql').read_text())  # student implementation

-- con.execute(Path('quality.sql').read_text()) # student implementation

 

Student implementation contract
File / relation

What students must add

curate.sql

Pre-key quarantine; deterministic ranked versions; winner validity/reasons; duplicates and final curated projection.

quality.sql

Named before/after metric queries with explicit cohorts; reference coverage/agreement; physical-ID anti-joins and duplicate checks.

Export logic

Create output directories; write Parquet/CSV; hash artifacts; generate the observed schema/count metadata. Reruns use fresh output paths.

 

Suggested SQL building blocks: COALESCE(predicate, false), regexp_full_match, isfinite, ROW_NUMBER() OVER (...), LEFT JOIN and anti-join/set difference. These are building blocks, not a substitute for the specified operation order. Unknown or missing mandatory conditions must not silently pass. [T1–T3]

 

 

SUPPLIED HELPER FUNCTIONS / HELPERS.PY

Appendix E1. Metric and lineage helpers
"""Small supplied helpers. They do not compute or certify data quality."""

import hashlib, json, uuid

from datetime import datetime, timezone

from pathlib import Path

 

def sha256(path):

    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

 

def ratio(numerator, denominator):

    if denominator == 0:

        return dict(n=numerator, d=0, value=None, status='NOT_EVALUATED')

    if not 0 <= numerator <= denominator:

        raise ValueError('Invalid numerator or denominator')

    return dict(n=numerator, d=denominator,

                value=numerator/denominator, status='EVALUATED')

 

def new_run():

    return str(uuid.uuid4())

 

def lineage_event(kind, run_id, job, inputs, outputs, store_id):

    if kind not in {'START','COMPLETE','ABORT','FAIL'}:

        raise ValueError('Unsupported run event')

    def dataset(name):

        return {'namespace':'urn:bigdata:'+store_id, 'name':name}

    return dict(eventType=kind,

        eventTime=datetime.now(timezone.utc).isoformat(),

        producer='urn:vnu-uet:bigdata:lab2:student-pipeline',

        schemaURL='https://openlineage.io/spec/2-0-2/'

                  'OpenLineage.json#/$defs/RunEvent',

        run={'runId':run_id},

        job={'namespace':'vnu-uet.bigdata.lab2', 'name':job},

        inputs=[dataset(x) for x in inputs],

        outputs=[dataset(x) for x in outputs])

 

def append_event(path, event):

    with Path(path).open('a', encoding='utf-8') as f:

        f.write(json.dumps(event)+'\n')

 

def validate_event(event, schema_path):

    from jsonschema import Draft202012Validator, FormatChecker

    schema = json.loads(Path(schema_path).read_text())

    # The official root has RunEvent, DatasetEvent and JobEvent alternatives.

    Draft202012Validator(schema, format_checker=FormatChecker()).validate(event)

 

Cache the official OpenLineage 2-0-2 schema before class. Schema validation checks event structure; add semantic checks for paired run IDs, terminal state, actual inputs/outputs and store identity. Do not fabricate COMPLETE events for failed or unexecuted steps. [T5–T6]

 

 

TEMPLATES TO POPULATE FROM ACTUAL RESULTS

Appendix E2. Machine-readable artifact profiles
Quality record
{

  "rule_id": "Q_TIMELY", "dataset_id": "curated-candidate",

  "run_id": "<actual UUID>", "contract_version": "research-telemetry-v1",

  "cohort": "curated rows with event <= ingest <= AS_OF",

  "numerator": 0, "denominator": 0, "value": null,

  "status": "NOT_EVALUATED", "threshold": 0.95, "severity": "BLOCK"

}

 

Replace the zero counters with SQL results; keep value = null only when the denominator is zero. Store raw metric observations separately from the final gate result. Add source/code/contract hashes to the report envelope.

Catalog record: required top-level fields
dataset_id, title, purpose, owner, steward, classification, allowed_use,

location, schema_version, columns, as_of, row_count,

input_manifest_sha256, contract_sha256, code_sha256,

quality_report, retention, provenance

 

# columns is an array of objects with these five required fields:

{"name":"temperature_c", "type":"DECIMAL(8,2)", "unit":"Celsius",

 "nullable":false, "meaning":"Selected observation converted to Celsius"}

 

# retention includes the clock and dependency rules:

{"days":90, "start_basis":"publication_time", "hold":false,

 "dependent_release_ids":[], "action":"dry-run only"}

 

Use an object JSON Schema with all 18 top-level fields in required. Require nonempty strings for IDs/roles/text; location as a nonempty array of object URIs; columns as a nonempty array with the five fields above; row_count as a nonnegative integer; hashes as 64 hexadecimal characters; quality_report as an artifact reference; retention and provenance as objects. Add a uniqueness check for column names and validate measured schema/count/hash equality separately. This is the lab’s metadata profile, not an external catalog standard.

Run and release records
run-record.json: run UUID; actual start/end time; AS_OF; store ID; source manifest, contract and executed code hashes; software/image versions; output keys and hashes; operator and reviewer; status/reason codes. Compute a code-bundle digest from a canonical, filename-sorted list of per-file SHA-256 values.

release_manifest.json: immutable-by-convention release ID; approved run UUID; reviewer and approval time; curated row count; schema version; artifact keys and hashes. The manifest cannot include its own hash. Store the manifest hash in the external evidence index. Lineage event files likewise must not recursively contain their own checksum.

 

 

IMPLEMENTATION CONTRACT / SAFETY TESTS

Appendix F. Gate evaluation and publication protocol
Execute checks, then decide
A gate function accepts the actual candidate relation, frozen input/reference/registry data, metadata, lineage and run record. It recomputes the following check IDs and returns a result with observed values and failure reasons. A missing artifact, failed query or unvalidated schema produces BLOCKED or REJECT, never PASS.

Check ID

Predicate

G01 / Integrity

All source and staged-artifact bytes match their trusted or independently reviewed hashes.

G02 / Conservation

Physical-ID union/disjointness, per-output uniqueness and count reconciliation are exact.

G03 / Released schema

Exact 10-column allowlist, declared types, no restricted fields and nonempty data.

G04 / Required values

All mandatory released values are present; required source fields met the contract.

G05 / Values and keys

Finite in-range temperature, unique record_id, known sensor, correct registry-derived site.

G06 / Time

Valid chronology and at least 95% timely rows; retained late rows still visible.

G07 / Reference

100/100 coverage and at least 95% sample agreement within 0.05 °C.

G08 / Metadata

Required fields, semantic relationships, actual locations and measured counts/hashes agree.

G09 / Lineage and reproducibility

Actual curation events and trace links valid; replay equivalence demonstrated; exact code/contract identified.

 

Gate result = PASS only if G01–G09 pass. Independent approval is a separate required step before copying any approved data. The publisher recomputes the checks; it must not trust a student-edited list of booleans. Each of P01–P08 produces its own observed record: case ID, changed artifact, expected result, measured failures, operator and execution time.

Avoid a circular lineage dependency
At pre-publication validation, inspect the completed curate run plus the current publish START event; do not require a publish COMPLETE event before publishing. After approved artifacts and the final manifest exist and are verified, emit publish COMPLETE to the restricted audit log. On rejection emit ABORT without an approved output. The immutable release manifest references the publish run UUID, not a future event-file checksum.

Consumers verify the final manifest and the listed uploaded objects. Do not publish the full restricted audit log, quarantine or raw payload. An approved lineage summary may expose source identifiers without granting raw access. Failed test cases must have no approved manifest. The owner remains privileged; this is procedural separation for teaching, not protection from a malicious namespace administrator.

 

 

PRIMARY UNIVERSITY AND TECHNICAL SOURCES / ACCESSED 18 SEPTEMBER 2026

References and adaptation notes
[U1] Harvard University, CS109A (2018). Lab 2: Pandas for Data Cleaning — student version. Open sourceLinks to an external site.

Actual practical exercises in inspection, missing values, parsing and export. The original uses pandas and a books dataset; neither its dataset nor its implementation is copied here.

[U2] University of California, Berkeley, Data 100 (Spring 2022). Lab 3: Data Cleaning and EDA. Open sourceLinks to an external site.

Actual lab notebook with acquisition, exploration, transformations and automated checks. Individual authorship in that source informs the separate individual evidence in this team lab.

[U3] Cornell Data Services. Writing READMEs for Research Data. Open sourceLinks to an external site.

Research-data documentation guidance, not a Kubernetes or 150-minute lab.

[U4] University of Cambridge, Research Data Management. Adding metadata to your research data. Open sourceLinks to an external site.

Metadata and reuse guidance, not a runnable software assignment.

[T1] DuckDB documentation. Casting; Date Format Functions. Open sourceLinks to an external site.

TRY_CAST semantics; consult the date-format page for try_strptime.

[T2] DuckDB documentation. Window Functions. Open sourceLinks to an external site.

Ordered row numbering for deterministic version selection.

[T3] DuckDB documentation. Reading and Writing Parquet Files. Open sourceLinks to an external site.

Parquet reading/writing and inspection; exported file layout is not the logical dataset definition.

[T4] Boto3 documentation. S3 client. Open sourceLinks to an external site.

Object GET/PUT and explicit client configuration; use the role-specific credential context.

[T5] OpenLineage documentation. Object Model. Open sourceLinks to an external site.

Job, run and dataset identities and runtime events.

[T6] OpenLineage. JSON Schema, version 2-0-2. Open sourceLinks to an external site.

Cache this versioned schema for offline validation; additional lab semantics must also be checked.

Additional API detail: DuckDB Date Format FunctionsLinks to an external site.

Attribution boundary  The university sources support the pedagogical practices noted above. The cloud workflow, fixture, numerical key, SQL contract, release thresholds, time allocation and rubric are this course’s design. Reference APIs must be pilot-tested in the instructor’s pinned environment; the document does not certify live cloud integration.

Submission
 Not Submitted!
Submission Details
Grade: 0 (100 pts possible)
Graded Anonymously: no
Comments:
No Comments


> [!question] Quiz
> Bạn có bảng observations(record_id, ingest_time, source_object, source_row). Một record_id có nhiều bản ghi (nhiều bản cũ và mới). Muốn giữ lại ĐÚNG MỘT bản ghi mới nhất của mỗi record_id — tức là giữ cả dòng dữ liệu đó, không chỉ giữ thời gian. Câu SQL nào làm được?
>
> Chạy trên DuckDB. Bảng có thể có 10.000+ dòng và hàng trăm record_id khác nhau.
>
> 1. SELECT record_id, ingest_time
FROM (
  SELECT record_id, ingest_time,
         ROW_NUMBER() OVER (PARTITION BY record_id ORDER BY ingest_time DESC) AS rn
  FROM observations
)
WHERE rn = 1
> 2. SELECT record_id, ingest_time
FROM observations
ORDER BY ingest_time DESC
LIMIT 1
> 3. SELECT DISTINCT record_id, ingest_time
FROM observations
> 4. SELECT record_id, MAX(ingest_time) AS ingest_time
FROM observations
GROUP BY record_id


> [!abstract] OPENCODE

Hiểu rồi — bạn muốn học nền tảng để làm được Lab 2 (Data Curation, Quality & Metadata Governance). Lab này trải trên rất nhiều mảng: SQL curation, data quality, metadata/lineage, S3 governance. Trước khi lên kế hoạch, mình cần biết điểm xuất phát của bạn ở đâu — đặc biệt vì đề bài tự nhắc "review ROW_NUMBER trước nếu chưa dùng".

Mình sẽ dò từng chút một bằng câu hỏi, không phải kiểm tra — chỉ để tìm đúng biên giới hiểu biết của bạn. Bắt đầu từ chỗ trọng tâm nhất: SQL.


> [!abstract] OPENCODE

Quiz đang mở trong TUI — chọn đáp án của bạn nhé. Mình sẽ tiếp tục sau khi có câu trả lời.


> [!success] Quiz — correct ✓
> Your answer: 1. SELECT record_id, ingest_time
FROM (
  SELECT record_id, ingest_time,
         ROW_NUMBER() OVER (PARTITION BY record_id ORDER BY ingest_time DESC) AS rn
  FROM observations
)
WHERE rn = 1
> Correct answer: 1
>
> ROW_NUMBER() OVER (PARTITION BY record_id ORDER BY ingest_time DESC) gán rn=1 cho bản ghi có ingest_time lớn nhất trong từng nhóm record_id. WHERE rn = 1 giữ nguyên cả dòng đó (bao gồm source_object, source_row...).
>
> Ba lựa chọn kia đều sai theo cách hiểu 'giữ cả dòng':
> - MAX(ingest_time) GROUP BY chỉ trả về thời gian, làm mất các cột khác của dòng; và nếu bạn muốn lấy cả dòng thì phải tự join lại — dễ sai.
> - DISTINCT chỉ loại dòng trùng lặp HOÀN TOÀN, hai bản ghi khác ingest_time vẫn còn cả.
> - LIMIT 1 chỉ lấy một dòng cho TOÀN BỘ bảng, không phải mỗi record_id một dòng.
>
> Đây chính là mảnh ghép trung tâm của Task 3 (chọn 'winner' một cách tất định).


> [!question] Quiz
> Trong câu trên, hai bản ghi CÙNG record_id và CÙNG ingest_time (ví dụ hai bản ghi đến từ hai file khác nhau cùng một thời điểm). ROW_NUMBER không nói trước được ai được rn=1. Lab yêu cầu chạy lại với thứ tự input đảo ngược mà kết quả vẫn phải giống hệt. Sửa ORDER BY nào giải quyết điều này?
>
> Bảng observations có các cột: record_id, ingest_time, source_object (tên file gốc), source_row (số thứ tự dòng trong file).
>
> 1. ORDER BY ingest_time DESC, source_object ASC, source_row ASC
> 2. ORDER BY ingest_time DESC
> 3. ORDER BY ingest_time DESC, record_id ASC
> 4. ORDER BY ingest_time DESC NULLS LAST


> [!abstract] OPENCODE

Đúng rồi — window function bạn đã vững. Giờ mình nhảy khó hơn một bậc, vẫn trong cùng mảnh: tính **tất định** (determinism) — thứ mà Task 3 và kiểm chứng C02 của lab chấm trực tiếp.


> [!abstract] OPENCODE

Quiz đang mở — chọn đáp án nhé.


> [!question] Quiz — I don't know
> Your answer: I don't know
> Correct answer: 1
>
> ROW_NUMBER chỉ tất định khi ORDER BY tạo ra THỨ TỰ TỔNG (total order) — không hai dòng nào bằng nhau ở khóa sắp xếp. Trong một PARTITION, mọi dòng đã cùng record_id nên record_id không giúp gì; NULLS LAST xử lý NULL chứ không xử lý hoà.
>
> Chỉ khi thêm source_object rồi source_row (đều là duy nhất theo từng dòng vật lý) thì mọi cặp dòng đều phân biệt được, và kết quả không phụ thuộc thứ tự đọc file. Đây chính là tie-break 'source_object ascending, then source_row ascending' mà contract của lab quy định — và là lý do lab yêu cầu bạn nhận diện mỗi dòng vật lý bằng (source_object, source_row).


> [!question] Quiz
> Cohort W có 1000 dòng, trong đó 50 dòng có reading = NULL. Bạn muốn đo 'độ đầy đủ bắt buộc' của trường reading. Bộ nào dưới đây cho numerator = 950 và denominator = 1000?
>
> Lab ghi rõ: 'NULL must count as a failure for a required rule; SQL expressions must not accidentally exclude it from the denominator.'
>
> 1. SELECT COUNT(*) FILTER (WHERE reading IS NOT NULL) AS n,
       COUNT(*) FILTER (WHERE reading IS NOT NULL) AS d
FROM winners
> 2. SELECT COUNT(reading) AS n,
       COUNT(reading) AS d
FROM winners
> 3. SELECT COUNT(*) FILTER (WHERE reading IS NOT NULL) AS n,
       COUNT(*) AS d
FROM winners
> 4. SELECT COUNT(*) FILTER (WHERE reading IS NOT NULL) AS n,
       COUNT(DISTINCT sensor_id) AS d
FROM winners


> [!abstract] OPENCODE

Biết cơ bản ROW_NUMBER, nhưng khái niệm "thứ tự tổng / tính tất định" là lỗ hổng thật — mình ghi nhận và sẽ giảng lại kỹ ở phần sau. Giờ mình dò tiếp một sợi khác mà lab chấm thẳng: **định nghĩa mẫu (population) khi đo chất lượng** — chỗ dễ sai nhất là NULL bị biến mất khỏi denominator.


> [!abstract] OPENCODE

Quiz đang mở — chọn đáp án nhé.


> [!failure] Quiz — incorrect ✗
> Your answer: 1. SELECT COUNT(*) FILTER (WHERE reading IS NOT NULL) AS n,
       COUNT(*) FILTER (WHERE reading IS NOT NULL) AS d
FROM winners
> Correct answer: 3
>
> COUNT(*) đếm MỌI dòng trong cohort, kể cả dòng có NULL — nên NULL bị tính vào denominator như một failure. COUNT(reading) thì ngược lại: nó bỏ qua NULL, cho cả numerator lẫn denominator đều = 950.
>
> Hai lựa chọn bị lọc ở FROM/WHERE hoặc lọc cả hai phía đều cho kết quả 950/950 = 100% — độ đầy đủ luôn luôn đạt 100% bất kể dữ liệu có bao nhiêu NULL. Đây chính là cái bẫy lab cảnh báo: 'A completeness score that improves after rows are removed is not evidence that missing values were recovered.'
>
> COUNT(DISTINCT sensor_id) dùng sai population — nó đo số cảm biến, không phải số dòng.
>
> Hai khái niệm cần tách bạch: numerator/denominator PHẢI cùng một cohort (mẫu), và một metric 100% chỉ có ý nghĩa khi denominator đúng.


> [!question] Quiz
> Pipeline của bạn có 3 output: curated (8000 dòng), quarantine (1500 dòng), duplicates (705 dòng). Tổng đúng bằng 10.205 dòng input. Lab nói: 'Equal totals alone could hide one lost record and one accidental duplicate.' Kiểm tra nào chứng minh được không có record nào bị mất hoặc bị bịa ra?
>
> Mỗi dòng vật lý có khóa duy nhất (source_object, source_row).
>
> 1. Đếm tổng ba bảng và so với 10.205
> 2. Đếm tổng ba bảng, VÀ lấy anti-join giữa tập khóa vật lý của input và tập hợp ba output (input \ outputs) — kết quả phải rỗng
> 3. Đếm riêng từng bảng và chắc chắn không bảng nào âm
> 4. So sánh tổng ba bảng với số dòng DISTINCT record_id trong input


> [!abstract] OPENCODE

Mình bắt được một **quan niệm sai có hệ统**: bạn lọc cả hai phía, tức là bạn đang nghĩ numerator và denominator là "hai con số tùy ý cần khớp nhau". Thực tế chúng phải cùng một cohort — và cohort của metric completeness là **tất cả dòng**, kể cả dòng lỗi. Mình sẽ quay lại chỗ này khi giảng.

Còn hai sợi nữa cần dò: cách chứng minh không mất dữ liệu, và tầng metadata/lineage.


> [!abstract] OPENCODE

Quiz đang mở — chọn đáp án nhé.


> [!success] Quiz — correct ✓
> Your answer: 2. Đếm tổng ba bảng, VÀ lấy anti-join giữa tập khóa vật lý của input và tập hợp ba output (input \ outputs) — kết quả phải rỗng
> Correct answer: 2
>
> Chỉ so số lượng là không đủ: một dòng bị mất ở đây và một dòng bị nhân đôi ở kia vẫn cho cùng tổng. Khóa (source_object, source_row) là tập danh sách vật lý, nên phải so TẬP: anti-join input \ outputs phải rỗng, outputs \ input cũng phải rỗng, và ba output phải đôi một không giao nhau.
>
> Lab gọi đây là 'set partition' — phân hoạch tập hợp. Số lượng là hệ quả của phân hoạch, không phải chứng minh của nó.
>
> So với DISTINCT record_id là sai vì record_id là khóa NGHIỆP VỤ, có thể lặp (đó là lý do có duplicates.csv) — tập record_id của input nhỏ hơn tập dòng vật lý.
>
> Đây là nội dung kiểm chứng C01 (Conservation) trong lab.


> [!question] Quiz
> Lab yêu cầu chạy lại pipeline lần hai và chứng minh kết quả 'giống hệt' (C02 Determinism). Lần 1 xuất candidate.parquet. Lần 2 xuất file khác. Theo lab, bạn phải so cái gì để kết luận hai lần chạy cho cùng một bộ dữ liệu logic?
>
> Lab ghi: 'Parquet file bytes can change with writer settings or layout even when the logical data are equal.'
>
> 1. So số dòng của hai file Parquet
> 2. SHA-256 của hai file Parquet phải bằng nhau
> 3. So các hàng đã sắp xếp ổn định của phần cột được phát hành, hoặc một content digest tính trên phần chiếu đó (loại trừ timestamp chạy và run ID ngẫu nhiên)
> 4. So tên cột và kiểu dữ liệu trong schema của hai file


> [!abstract] OPENCODE

Tập-học (set thinking) của bạn vững — anti-join đúng hướng. Còn hai sợi mình chưa dò: định nghĩa "giống hệt" khi xuất Parquet, và tầng lineage. Dò tiếp cái đầu vì nó là l坑 kinh điển.


> [!abstract] OPENCODE

Quiz đang mở — chọn đáp án nhé.


> [!success] Quiz — correct ✓
> Your answer: 3. So các hàng đã sắp xếp ổn định của phần cột được phát hành, hoặc một content digest tính trên phần chiếu đó (loại trừ timestamp chạy và run ID ngẫu nhiên)
> Correct answer: 3
>
> Parquet là định dạng nhị phân: bytes phụ thuộc vào cài đặt của writer (compression, row group size, metadata) nên hai file cùng dữ liệu logic vẫn có thể khác hash. Lab cảnh báo thẳng: 'Do not claim byte-for-byte Parquet reproducibility without testing logical equivalence.'
>
> Do đó có HAI checksum với HAI mục đích khác nhau: SHA-256 của file để xác minh upload đúng bytes; và content digest trên logical projection (các cột phát hành, đã sort ổn định, loại trừ timestamp/run ID) để chứng minh replay equivalence.
>
> Chỉ so số dòng hoặc chỉ so schema đều quá yếu: số dòng equal vẫn có thể giấu một dòng mất và một dòng nhân đôi (giống câu anti-join trước đó).


> [!question] Quiz
> Trong OpenLineage, một 'curate run' phát hai sự kiện START và COMPLETE chung một run UUID. Lab nhấn mạnh 'Emit events when those states actually occur.' Pipeline chạy curate thành công nhưng bước publish bị chính sách từ chối (REJECT). Bộ sự kiện nào đúng?
>
> Lab: 'A policy rejection uses ABORT; an execution error uses FAIL.' và 'A failed publication must not have a COMPLETE event claiming an approved output.'
>
> 1. curate START + curate COMPLETE, rồi publish START + publish ABORT
> 2. Chỉ curate START + curate COMPLETE, không phát sự kiện nào cho publish
> 3. curate START + curate COMPLETE, rồi publish START + publish FAIL
> 4. curate START + curate COMPLETE, rồi publish START + publish COMPLETE


> [!abstract] OPENCODE

Cuối cùng, dò sợi còn lại — OpenLineage, thứ có thể hoàn toàn mới với bạn.


> [!abstract] OPENCODE

Quiz đang mở — chọn đáp án cuối vòng dò này nhé.
