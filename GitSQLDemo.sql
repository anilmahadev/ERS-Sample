/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      HR Database
 *
 * Date Created : Monday, August 05, 2024 11:44:27
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: ADR 
 */

CREATE TABLE ADR(
    ADRID       int             IDENTITY(1,1),
    ADRLINE1    varchar(100)    NOT NULL,
    ADRLINE2    varchar(100)    NULL,
    CITY        varchar(100)    NULL,
    CTY         varchar(4)      NULL,
    P_CDE       char(6)         NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY CLUSTERED (ADRID)
)

go


IF OBJECT_ID('ADR') IS NOT NULL
    PRINT '<<< CREATED TABLE ADR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ADR >>>'
go


/* 
 * TABLE: AGY 
 */

CREATE TABLE AGY(
    ID          int              IDENTITY(1,1),
    AGYNME      varchar(10)      NULL,
    MAINCCT     varchar(100)     NULL,
    CONTRACT    varchar(1000)    NULL,
    CONSTRAINT PK9 PRIMARY KEY CLUSTERED (ID)
)

go


IF OBJECT_ID('AGY') IS NOT NULL
    PRINT '<<< CREATED TABLE AGY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE AGY >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'AGY', default, default))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'AGY'
END
exec sys.sp_addextendedproperty 'MS_Description', 'Employement agenecies manage provision of contract employees', 'schema', '', 'table', 'AGY'
go

/* 
 * TABLE: CNR 
 */

CREATE TABLE CNR(
    EMPNMB      varchar(12)      NOT NULL,
    DAYRAT      numeric(7, 0)    NULL,
    AGENCYID    int              NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY CLUSTERED (EMPNMB)
)

go


IF OBJECT_ID('CNR') IS NOT NULL
    PRINT '<<< CREATED TABLE CNR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CNR >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'CNR', 'column', 'EMPNMB'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'CNR', 'column', 'EMPNMB'
END
exec sys.sp_addextendedproperty 'MS_Description', 'The mechanism used to identify an employee of the organization', 'schema', '', 'table', 'CNR', 'column', 'EMPNMB'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'CNR', default, default))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'CNR'
END
exec sys.sp_addextendedproperty 'MS_Description', 'A contractor has a specific type of contract and rights within the organization', 'schema', '', 'table', 'CNR'
go

/* 
 * TABLE: [Commission Payment] 
 */

CREATE TABLE [Commission Payment](
    EMPNMB              varchar(12)    NOT NULL,
    [Order Number]      char(10)       NOT NULL,
    [Commission Value]  int            NULL,
    Paid                bit            NULL,
    [Payment Date]      date           NULL,
    CONSTRAINT PK26 PRIMARY KEY CLUSTERED (EMPNMB, [Order Number])
)

go


IF OBJECT_ID('Commission Payment') IS NOT NULL
    PRINT '<<< CREATED TABLE Commission Payment >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Commission Payment >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'Commission Payment', 'column', 'EMPNMB'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'Commission Payment', 'column', 'EMPNMB'
END
exec sys.sp_addextendedproperty 'MS_Description', 'The mechanism used to identify an employee of the organization', 'schema', '', 'table', 'Commission Payment', 'column', 'EMPNMB'
go

/* 
 * TABLE: DEP 
 */

CREATE TABLE DEP(
    ID     char(10)    NOT NULL,
    NME    char(10)    NULL,
    CONSTRAINT PK7 PRIMARY KEY CLUSTERED (ID)
)

go


IF OBJECT_ID('DEP') IS NOT NULL
    PRINT '<<< CREATED TABLE DEP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DEP >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'DEP', default, default))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'DEP'
END
exec sys.sp_addextendedproperty 'MS_Description', 'Made a Department Change -- 

A part of the organization that has a manager and employees. ', 'schema', '', 'table', 'DEP'
go

/* 
 * TABLE: EMP 
 */

CREATE TABLE EMP(
    EMPNMB                      varchar(12)       NOT NULL,
    EMPTYP                      char(1)           NOT NULL,
    STTDTE                      date              NULL,
    PHONENMB                    numeric(15, 0)    NULL,
    SLRY                        char(10)          NULL,
    FRSNME                      varchar(200)      NOT NULL,
    SURNAME                     varchar(200)      NOT NULL,
    MEMBER                      char(10)          NOT NULL,
    MANAGER                     char(10)          NULL,
    ADRID                       int               NOT NULL,
    [Performance Review Score]  int               NULL,
    [Promotion Flag]            bit               NULL,
    CONSTRAINT PK1 PRIMARY KEY CLUSTERED (EMPNMB)
)

go


IF OBJECT_ID('EMP') IS NOT NULL
    PRINT '<<< CREATED TABLE EMP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EMP >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'EMPNMB'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'EMPNMB'
END
exec sys.sp_addextendedproperty 'MS_Description', 'The mechanism used to identify an employee of the organization', 'schema', '', 'table', 'EMP', 'column', 'EMPNMB'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'EMPTYP'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'EMPTYP'
END
exec sys.sp_addextendedproperty 'MS_Description', 'can be F (full time) or P (part time) or C (contractor)', 'schema', '', 'table', 'EMP', 'column', 'EMPTYP'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'STTDTE'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'STTDTE'
END
exec sys.sp_addextendedproperty 'MS_Description', 'The date when the employee started their employment', 'schema', '', 'table', 'EMP', 'column', 'STTDTE'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'PHONENMB'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'PHONENMB'
END
exec sys.sp_addextendedproperty 'MS_Description', 'the telphone number of the emoloyee', 'schema', '', 'table', 'EMP', 'column', 'PHONENMB'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'SLRY'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'SLRY'
END
exec sys.sp_addextendedproperty 'MS_Description', 'The remunertaion paid to the employee', 'schema', '', 'table', 'EMP', 'column', 'SLRY'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'FRSNME'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'FRSNME'
END
exec sys.sp_addextendedproperty 'MS_Description', 'First name', 'schema', '', 'table', 'EMP', 'column', 'FRSNME'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'SURNAME'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'SURNAME'
END
exec sys.sp_addextendedproperty 'MS_Description', 'Surname of the employeee', 'schema', '', 'table', 'EMP', 'column', 'SURNAME'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'MEMBER'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'MEMBER'
END
exec sys.sp_addextendedproperty 'MS_Description', 'Which department the employee is a member of', 'schema', '', 'table', 'EMP', 'column', 'MEMBER'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'MANAGER'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'MANAGER'
END
exec sys.sp_addextendedproperty 'MS_Description', 'Which department the employee is a manager of', 'schema', '', 'table', 'EMP', 'column', 'MANAGER'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'ADRID'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'ADRID'
END
exec sys.sp_addextendedproperty 'MS_Description', 'the id of the address of the employee', 'schema', '', 'table', 'EMP', 'column', 'ADRID'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'Performance Review Score'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'Performance Review Score'
END
exec sys.sp_addextendedproperty 'MS_Description', 'What score did they acheive at their last performance review', 'schema', '', 'table', 'EMP', 'column', 'Performance Review Score'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', 'column', 'Promotion Flag'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP', 'column', 'Promotion Flag'
END
exec sys.sp_addextendedproperty 'MS_Description', 'Are they flagged for promotion', 'schema', '', 'table', 'EMP', 'column', 'Promotion Flag'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMP', default, default))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMP'
END
exec sys.sp_addextendedproperty 'MS_Description', 'Made a Change ---

An employee is someone who works under an employment contract.



A person may be an employee in employment law but have a different status for tax purposes. Employers must work out each worker’s status in both employment law and tax law.

Employment rights
All employees are workers, but an employee has extra employment rights and responsibilities that do not apply to workers who are not employees.

These rights include all of the rights workers have and:

Statutory Sick Pay
statutory maternity pay and leave (workers only get pay, not leave)
statutory paternity pay and leave (workers only get pay, not leave)
statutory adoption pay and leave (workers only get pay, not leave)
statutory shared parental pay and leave (workers only get pay, not leave)
minimum notice periods if their employment will be ending, for example if an employer is dismissing them
protection against unfair dismissal
the right to request flexible working
time off for emergencies
Statutory Redundancy Pay

Some of these rights require a minimum length of continuous employment before an employee qualifies for them. An employment contract may state how long this qualification period is.

Working out employment status for an employee
Someone who works for a business is probably an employee if most of the following are true:

they’re required to work regularly unless they’re on leave, for example they’re on holiday or on sick leave or on maternity leave
they’re required to do a minimum number of hours and expect to be paid for time worked
a manager or supervisor is responsible for their workload, saying when a piece of work should be finished and how it should be done
they cannot send someone else to do their work
they get paid holiday
they’re entitled to contractual or Statutory Sick Pay and to maternity pay or to paternity pay
they can join the business’s pension scheme
the business’s disciplinary and grievance procedures apply to them
they work at the business’s premises or at an address specified by the business
their contract sets out redundancy procedures
the business provides the materials, tools and equipment for their work
they only work for the business or if they do have another job, it’s completely different from their work for the business
their contract, statement of terms and conditions or offer letter (which can be described as an ‘employment contract’) uses terms like ‘employer’ and ‘employee’
If most of these do not apply, you should work out if the person is self-employed.
', 'schema', '', 'table', 'EMP'
go

/* 
 * TABLE: EMPSKLMTX 
 */

CREATE TABLE EMPSKLMTX(
    ID        char(10)       NOT NULL,
    EMPNMB    varchar(12)    NOT NULL,
    LVL       char(10)       NULL,
    CONSTRAINT PK13 PRIMARY KEY CLUSTERED (ID, EMPNMB)
)

go


IF OBJECT_ID('EMPSKLMTX') IS NOT NULL
    PRINT '<<< CREATED TABLE EMPSKLMTX >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EMPSKLMTX >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMPSKLMTX', 'column', 'EMPNMB'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMPSKLMTX', 'column', 'EMPNMB'
END
exec sys.sp_addextendedproperty 'MS_Description', 'The mechanism used to identify an employee of the organization', 'schema', '', 'table', 'EMPSKLMTX', 'column', 'EMPNMB'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'EMPSKLMTX', default, default))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'EMPSKLMTX'
END
exec sys.sp_addextendedproperty 'MS_Description', 'A record of a skill that an employee has with the rating of that skill for the employee', 'schema', '', 'table', 'EMPSKLMTX'
go

/* 
 * TABLE: FULL_TIMEEMP 
 */

CREATE TABLE FULL_TIMEEMP(
    EMPNMB     varchar(12)    NOT NULL,
    SALARY     money          NULL,
    VCTDAYS    int            NULL,
    CONSTRAINT PK2 PRIMARY KEY CLUSTERED (EMPNMB)
)

go


IF OBJECT_ID('FULL_TIMEEMP') IS NOT NULL
    PRINT '<<< CREATED TABLE FULL_TIMEEMP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FULL_TIMEEMP >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'FULL_TIMEEMP', 'column', 'EMPNMB'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'FULL_TIMEEMP', 'column', 'EMPNMB'
END
exec sys.sp_addextendedproperty 'MS_Description', 'The mechanism used to identify an employee of the organization', 'schema', '', 'table', 'FULL_TIMEEMP', 'column', 'EMPNMB'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'FULL_TIMEEMP', default, default))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'FULL_TIMEEMP'
END
exec sys.sp_addextendedproperty 'MS_Description', 'A full time employee has a specific type of contract with associated responsibilities and benefits', 'schema', '', 'table', 'FULL_TIMEEMP'
go

/* 
 * TABLE: Order 
 */

CREATE TABLE Order(
    [Order Number]                    char(10)       NOT NULL,
    [Order Date]                      date           NULL,
    [Customer Purchase Order Number]  varchar(18)    NULL,
    [Sales Person]                    varchar(12)    NOT NULL,
    [Customer Reference Number]       char(10)       NOT NULL,
    CONSTRAINT PK22 PRIMARY KEY CLUSTERED ([Order Number])
)

go


IF OBJECT_ID('Order') IS NOT NULL
    PRINT '<<< CREATED TABLE Order >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Order >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'Order', 'column', 'Sales Person'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'Order', 'column', 'Sales Person'
END
exec sys.sp_addextendedproperty 'MS_Description', 'The mechanism used to identify an employee of the organization', 'schema', '', 'table', 'Order', 'column', 'Sales Person'
go

/* 
 * TABLE: SKL 
 */

CREATE TABLE SKL(
    ID     char(10)    NOT NULL,
    NME    char(10)    NOT NULL,
    DSP    char(10)    NULL,
    CTY    char(10)    NULL,
    CONSTRAINT PK5 PRIMARY KEY CLUSTERED (ID)
)

go


IF OBJECT_ID('SKL') IS NOT NULL
    PRINT '<<< CREATED TABLE SKL >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SKL >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'SKL', default, default))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'SKL'
END
exec sys.sp_addextendedproperty 'MS_Description', 'A defined skill that an employee can have.', 'schema', '', 'table', 'SKL'
go

/* 
 * TABLE: [SKL TRGCRS] 
 */

CREATE TABLE [SKL TRGCRS](
    ID       char(10)    NOT NULL,
    CRSID    char(10)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY CLUSTERED (ID, CRSID)
)

go


IF OBJECT_ID('SKL TRGCRS') IS NOT NULL
    PRINT '<<< CREATED TABLE SKL TRGCRS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SKL TRGCRS >>>'
go


/* 
 * TABLE: TRGCRS 
 */

CREATE TABLE TRGCRS(
    CRSID       char(10)    NOT NULL,
    TITLE       char(10)    NULL,
    SYNOPSIS    char(10)    NULL,
    CONSTRAINT PK8 PRIMARY KEY CLUSTERED (CRSID)
)

go


IF OBJECT_ID('TRGCRS') IS NOT NULL
    PRINT '<<< CREATED TABLE TRGCRS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TRGCRS >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'TRGCRS', default, default))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'TRGCRS'
END
exec sys.sp_addextendedproperty 'MS_Description', 'A training course that adds skills to an employee', 'schema', '', 'table', 'TRGCRS'
go

/* 
 * TABLE: TRGHST 
 */

CREATE TABLE TRGHST(
    EMPNMB           varchar(12)    NOT NULL,
    CRSID            char(10)       NOT NULL,
    COMPLETIONDTE    char(10)       NULL,
    RESULT           char(10)       NULL,
    CONSTRAINT PK12 PRIMARY KEY CLUSTERED (EMPNMB, CRSID)
)

go


IF OBJECT_ID('TRGHST') IS NOT NULL
    PRINT '<<< CREATED TABLE TRGHST >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TRGHST >>>'
go

if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'TRGHST', 'column', 'EMPNMB'))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'TRGHST', 'column', 'EMPNMB'
END
exec sys.sp_addextendedproperty 'MS_Description', 'The mechanism used to identify an employee of the organization', 'schema', '', 'table', 'TRGHST', 'column', 'EMPNMB'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', '', 'table', 'TRGHST', default, default))
BEGIN
    exec sys.sp_dropextendedproperty 'MS_Description', 'schema', '', 'table', 'TRGHST'
END
exec sys.sp_addextendedproperty 'MS_Description', 'A training history record which shows which training courses an employee has attended', 'schema', '', 'table', 'TRGHST'
go

/* 
 * TABLE: CNR 
 */

ALTER TABLE CNR ADD CONSTRAINT FK 
    FOREIGN KEY (EMPNMB)
    REFERENCES EMP(EMPNMB)
go

ALTER TABLE CNR ADD CONSTRAINT FK2 
    FOREIGN KEY (AGENCYID)
    REFERENCES AGY(ID)
go


/* 
 * TABLE: [Commission Payment] 
 */

ALTER TABLE [Commission Payment] ADD CONSTRAINT RefEMP20 
    FOREIGN KEY (EMPNMB)
    REFERENCES EMP(EMPNMB)
go

ALTER TABLE [Commission Payment] ADD CONSTRAINT RefOrder31 
    FOREIGN KEY ([Order Number])
    REFERENCES Order([Order Number])
go


/* 
 * TABLE: EMP 
 */

ALTER TABLE EMP ADD CONSTRAINT FK1 
    FOREIGN KEY (ADRID)
    REFERENCES ADR(ADRID)
go

ALTER TABLE EMP ADD CONSTRAINT FK3 
    FOREIGN KEY (MANAGER)
    REFERENCES DEP(ID)
go

ALTER TABLE EMP ADD CONSTRAINT FK4 
    FOREIGN KEY (MEMBER)
    REFERENCES DEP(ID)
go


/* 
 * TABLE: EMPSKLMTX 
 */

ALTER TABLE EMPSKLMTX ADD CONSTRAINT FK5 
    FOREIGN KEY (EMPNMB)
    REFERENCES EMP(EMPNMB)
go

ALTER TABLE EMPSKLMTX ADD CONSTRAINT FK7 
    FOREIGN KEY (ID)
    REFERENCES SKL(ID)
go


/* 
 * TABLE: FULL_TIMEEMP 
 */

ALTER TABLE FULL_TIMEEMP ADD CONSTRAINT FK 
    FOREIGN KEY (EMPNMB)
    REFERENCES EMP(EMPNMB)
go


/* 
 * TABLE: Order 
 */

ALTER TABLE Order ADD CONSTRAINT RefEMP9 
    FOREIGN KEY ([Sales Person])
    REFERENCES EMP(EMPNMB)
go


/* 
 * TABLE: [SKL TRGCRS] 
 */

ALTER TABLE [SKL TRGCRS] ADD CONSTRAINT RefTRGCRS26 
    FOREIGN KEY (CRSID)
    REFERENCES TRGCRS(CRSID)
go

ALTER TABLE [SKL TRGCRS] ADD CONSTRAINT RefSKL38 
    FOREIGN KEY (ID)
    REFERENCES SKL(ID)
go


/* 
 * TABLE: TRGHST 
 */

ALTER TABLE TRGHST ADD CONSTRAINT FK6 
    FOREIGN KEY (EMPNMB)
    REFERENCES FULL_TIMEEMP(EMPNMB)
go

ALTER TABLE TRGHST ADD CONSTRAINT FK9 
    FOREIGN KEY (CRSID)
    REFERENCES TRGCRS(CRSID)
go


