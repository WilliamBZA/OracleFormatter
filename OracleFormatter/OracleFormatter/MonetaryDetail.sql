CONNECT nbpd01/bbd@sn23

SET HEADING OFF
SPOOL C:\Users\ruddyr\Documents\FinSurv\FinSurv.Web\FinSurv.Data.SI\MonetaryDetails.log

select 'LAST RUN: '||to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') "LASTRUN" from dual;

REMARK TABLE

DROP TABLE MonetaryDetails CASCADE CONSTRAINTS;

CREATE TABLE MonetaryDetails
(
  SARBAuthApplicSequenceNumber number(10)
 ,MonetaryDetailsSequenceNumber number(10)
 ,OriginalTransactionLineNumber number(10)
 ,MoneyTransferAgentIndicator number(10)
 ,RandValue number(15,2)
 ,ForeignValue number(15,2)
 ,ForeignCurrencyCode varchar2(50)
 ,BoPCategory number(10)
 ,SubBoPCategory number(10)
 ,SWIFTDetails varchar2(50)
 ,STRATERefNumber varchar2(50)
 ,LoanReferenceNumber number(10)
 ,LoanTenor number(10)
 ,LoanInterestRate number(15,4)
 ,RulingsSection varchar2(50)
 ,ADInternalAuthNumber number(10)
 ,ADInternalAuthNumberDate date
 ,SARBAuthReferenceNumber varchar2(50)
 ,CannotCategorise varchar2(50)
 ,Subject varchar2(50)
 ,Description varchar2(50)
 ,LocationCountry number(10)
 ,ReversalTrnRefNumber varchar2(50)
 ,ReversalSequence number(10)
 ,UserID number(10)
 ,TmStamp date
) /* approx row size 641 */ TABLESPACE nbpt008k1;

REMARK SEQUENCE

DROP SEQUENCE MonetaryDetailsSeq;

CREATE SEQUENCE MonetaryDetailsSeq
  MINVALUE 0
  MAXVALUE 999999999
  CYCLE
  ORDER;

REMARK CONTRAINTS

ALTER TABLE MonetaryDetails
MODIFY(
  SARBAuthApplicSequenceNumber CONSTRAINT MonetaryDetails_NN01 NOT NULL
, MonetaryDetailsSequenceNumber CONSTRAINT MonetaryDetails_NN02 NOT NULL
, OriginalTransactionLineNumber CONSTRAINT MonetaryDetails_NN03 NOT NULL
, MoneyTransferAgentIndicator CONSTRAINT MonetaryDetails_NN04 NOT NULL
, RandValue CONSTRAINT MonetaryDetails_NN05 NOT NULL
, ForeignValue CONSTRAINT MonetaryDetails_NN06 NOT NULL
, ForeignCurrencyCode CONSTRAINT MonetaryDetails_NN07 NOT NULL
, BoPCategory CONSTRAINT MonetaryDetails_NN08 NOT NULL
, SubBoPCategory CONSTRAINT MonetaryDetails_NN09 NOT NULL
, SWIFTDetails CONSTRAINT MonetaryDetails_NN10 NOT NULL
, STRATERefNumber CONSTRAINT MonetaryDetails_NN11 NOT NULL
, LoanReferenceNumber CONSTRAINT MonetaryDetails_NN12 NOT NULL
, LoanTenor CONSTRAINT MonetaryDetails_NN13 NOT NULL
, LoanInterestRate CONSTRAINT MonetaryDetails_NN14 NOT NULL
, RulingsSection CONSTRAINT MonetaryDetails_NN15 NOT NULL
, ADInternalAuthNumber CONSTRAINT MonetaryDetails_NN16 NOT NULL
, ADInternalAuthNumberDate CONSTRAINT MonetaryDetails_NN17 NOT NULL
, SARBAuthReferenceNumber CONSTRAINT MonetaryDetails_NN18 NOT NULL
, CannotCategorise CONSTRAINT MonetaryDetails_NN19 NOT NULL
, Subject CONSTRAINT MonetaryDetails_NN20 NOT NULL
, Description CONSTRAINT MonetaryDetails_NN21 NOT NULL
, LocationCountry CONSTRAINT MonetaryDetails_NN22 NOT NULL
, ReversalTrnRefNumber CONSTRAINT MonetaryDetails_NN23 NOT NULL
, ReversalSequence CONSTRAINT MonetaryDetails_NN24 NOT NULL
, UserID CONSTRAINT MonetaryDetails_NN25 NOT NULL
, TmStamp CONSTRAINT MonetaryDetails_NN26 NOT NULL
);
REMARK PRIMARY KEY

ALTER TABLE MonetaryDetails
ADD(
  CONSTRAINT MonetaryDetails_PK01 PRIMARY KEY
  (
    MonetaryDetailsSequenceNumber
  ) USING INDEX TABLESPACE nbpt008k1
);
GRANT SELECT ON nbpd01.MonetaryDetailsSeq TO PUBLIC;

GRANT delete ON nbpd01.MonetaryDetails TO PUBLIC;

GRANT SELECT ON nbpd01.MonetaryDetailsSeq TO PUBLIC;

GRANT insert ON nbpd01.MonetaryDetails TO PUBLIC;

GRANT SELECT ON nbpd01.MonetaryDetailsSeq TO PUBLIC;

GRANT select ON nbpd01.MonetaryDetails TO PUBLIC;

GRANT SELECT ON nbpd01.MonetaryDetailsSeq TO PUBLIC;

GRANT update ON nbpd01.MonetaryDetails TO PUBLIC;

CREATE OR REPLACE PROCEDURE MonetaryDetailsSelectOne
(
  aSARBAuthApplicSequenceNumber in out number
, aMonetaryDetailsSequenceNumber in number
, aOriginalTransactionLineNumber in out number
, aMoneyTransferAgentIndicator in out number
, aRandValue in out number
, aForeignValue in out number
, aForeignCurrencyCode in out varchar2
, aBoPCategory in out number
, aSubBoPCategory in out number
, aSWIFTDetails in out varchar2
, aSTRATERefNumber in out varchar2
, aLoanReferenceNumber in out number
, aLoanTenor in out number
, aLoanInterestRate in out number
, aRulingsSection in out varchar2
, aADInternalAuthNumber in out number
, aADInternalAuthNumberDate in out varchar2
, aSARBAuthReferenceNumber in out varchar2
, aCannotCategorise in out varchar2
, aSubject in out varchar2
, aDescription in out varchar2
, aLocationCountry in out number
, aReversalTrnRefNumber in out varchar2
, aReversalSequence in out number
, aUserID in out number
, aTmStamp in out varchar2
) as
BEGIN
  select
    SARBAuthApplicSequenceNumber
  , OriginalTransactionLineNumber
  , MoneyTransferAgentIndicator
  , RandValue
  , ForeignValue
  , ForeignCurrencyCode
  , BoPCategory
  , SubBoPCategory
  , SWIFTDetails
  , STRATERefNumber
  , LoanReferenceNumber
  , LoanTenor
  , LoanInterestRate
  , RulingsSection
  , ADInternalAuthNumber
  , to_char(ADInternalAuthNumberDate,'YYYYMMDD')
  , SARBAuthReferenceNumber
  , CannotCategorise
  , Subject
  , Description
  , LocationCountry
  , ReversalTrnRefNumber
  , ReversalSequence
  , UserID
  , to_char(TmStamp,'YYYYMMDDHH24MISS')
  into
    aSARBAuthApplicSequenceNumber
  , aOriginalTransactionLineNumber
  , aMoneyTransferAgentIndicator
  , aRandValue
  , aForeignValue
  , aForeignCurrencyCode
  , aBoPCategory
  , aSubBoPCategory
  , aSWIFTDetails
  , aSTRATERefNumber
  , aLoanReferenceNumber
  , aLoanTenor
  , aLoanInterestRate
  , aRulingsSection
  , aADInternalAuthNumber
  , aADInternalAuthNumberDate
  , aSARBAuthReferenceNumber
  , aCannotCategorise
  , aSubject
  , aDescription
  , aLocationCountry
  , aReversalTrnRefNumber
  , aReversalSequence
  , aUserID
  , aTmStamp
  from MonetaryDetails
  where MonetaryDetailsSequenceNumber=aMonetaryDetailsSequenceNumber
  ;
END;
/
l
show errors

DROP PUBLIC SYNONYM MonetaryDetailsSelectOne;
CREATE PUBLIC SYNONYM MonetaryDetailsSelectOne for MonetaryDetailsSelectOne;
GRANT EXECUTE on MonetaryDetailsSelectOne to nbpd01;

CREATE OR REPLACE PROCEDURE MonetaryDetailsDeleteOne
(
  aMonetaryDetailsSequenceNumber in number
) as
BEGIN
  delete from MonetaryDetails
  where MonetaryDetailsSequenceNumber=aMonetaryDetailsSequenceNumber
  ;
END;
/
l
show errors

DROP PUBLIC SYNONYM MonetaryDetailsDeleteOne;
CREATE PUBLIC SYNONYM MonetaryDetailsDeleteOne for MonetaryDetailsDeleteOne;
GRANT EXECUTE on MonetaryDetailsDeleteOne to nbpd01;

CREATE OR REPLACE PROCEDURE MonetaryDetailsUpdate
(
  aSARBAuthApplicSequenceNumber number
, aMonetaryDetailsSequenceNumber number
, aOriginalTransactionLineNumber number
, aMoneyTransferAgentIndicator number
, aRandValue number
, aForeignValue number
, aForeignCurrencyCode varchar2
, aBoPCategory number
, aSubBoPCategory number
, aSWIFTDetails varchar2
, aSTRATERefNumber varchar2
, aLoanReferenceNumber number
, aLoanTenor number
, aLoanInterestRate number
, aRulingsSection varchar2
, aADInternalAuthNumber number
, aADInternalAuthNumberDate varchar2
, aSARBAuthReferenceNumber varchar2
, aCannotCategorise varchar2
, aSubject varchar2
, aDescription varchar2
, aLocationCountry number
, aReversalTrnRefNumber varchar2
, aReversalSequence number
, aUserID number
, aTmStamp varchar2
) as
wSYSDATE date;
BEGIN
  wSYSDATE := SYSDATE;
  aTmStamp := to_char(wSYSDATE, 'YYYYMMDDHH24MISS');
  update MonetaryDetails
  set
    SARBAuthApplicSequenceNumber = aSARBAuthApplicSequenceNumber
  , OriginalTransactionLineNumber = aOriginalTransactionLineNumber
  , MoneyTransferAgentIndicator = aMoneyTransferAgentIndicator
  , RandValue = aRandValue
  , ForeignValue = aForeignValue
  , ForeignCurrencyCode = aForeignCurrencyCode
  , BoPCategory = aBoPCategory
  , SubBoPCategory = aSubBoPCategory
  , SWIFTDetails = aSWIFTDetails
  , STRATERefNumber = aSTRATERefNumber
  , LoanReferenceNumber = aLoanReferenceNumber
  , LoanTenor = aLoanTenor
  , LoanInterestRate = aLoanInterestRate
  , RulingsSection = aRulingsSection
  , ADInternalAuthNumber = aADInternalAuthNumber
  , ADInternalAuthNumberDate = to_date(aADInternalAuthNumberDate,'YYYYMMDD')
  , SARBAuthReferenceNumber = aSARBAuthReferenceNumber
  , CannotCategorise = aCannotCategorise
  , Subject = aSubject
  , Description = aDescription
  , LocationCountry = aLocationCountry
  , ReversalTrnRefNumber = aReversalTrnRefNumber
  , ReversalSequence = aReversalSequence
  , UserID = aUserID
  , TmStamp = wSYSDATE
  where MonetaryDetailsSequenceNumber = aMonetaryDetailsSequenceNumber
  ;
END;
/
l
show errors

DROP PUBLIC SYNONYM MonetaryDetailsUpdate;
CREATE PUBLIC SYNONYM MonetaryDetailsUpdate for MonetaryDetailsUpdate;
GRANT EXECUTE on MonetaryDetailsUpdate to nbpd01;

CREATE OR REPLACE PROCEDURE MonetaryDetailsInsert
(
  aSARBAuthApplicSequenceNumber number
, aMonetaryDetailsSequenceNumber number
, aOriginalTransactionLineNumber number
, aMoneyTransferAgentIndicator number
, aRandValue number
, aForeignValue number
, aForeignCurrencyCode varchar2
, aBoPCategory number
, aSubBoPCategory number
, aSWIFTDetails varchar2
, aSTRATERefNumber varchar2
, aLoanReferenceNumber number
, aLoanTenor number
, aLoanInterestRate number
, aRulingsSection varchar2
, aADInternalAuthNumber number
, aADInternalAuthNumberDate varchar2
, aSARBAuthReferenceNumber varchar2
, aCannotCategorise varchar2
, aSubject varchar2
, aDescription varchar2
, aLocationCountry number
, aReversalTrnRefNumber varchar2
, aReversalSequence number
, aUserID number
, aTmStamp varchar2
) as
BEGIN
  select MonetaryDetailsSeq.NEXTVAL into aMonetaryDetailsSequenceNumber from dual;
  aTmStamp := to_char(SYSDATE, 'YYYYMMDDHH24MISS');
  insert into MonetaryDetails
  (
    SARBAuthApplicSequenceNumber
  , MonetaryDetailsSequenceNumber
  , OriginalTransactionLineNumber
  , MoneyTransferAgentIndicator
  , RandValue
  , ForeignValue
  , ForeignCurrencyCode
  , BoPCategory
  , SubBoPCategory
  , SWIFTDetails
  , STRATERefNumber
  , LoanReferenceNumber
  , LoanTenor
  , LoanInterestRate
  , RulingsSection
  , ADInternalAuthNumber
  , ADInternalAuthNumberDate
  , SARBAuthReferenceNumber
  , CannotCategorise
  , Subject
  , Description
  , LocationCountry
  , ReversalTrnRefNumber
  , ReversalSequence
  , UserID
  , TmStamp
  ) values
  (
    aSARBAuthApplicSequenceNumber
  , aMonetaryDetailsSequenceNumber
  , aOriginalTransactionLineNumber
  , aMoneyTransferAgentIndicator
  , aRandValue
  , aForeignValue
  , aForeignCurrencyCode
  , aBoPCategory
  , aSubBoPCategory
  , aSWIFTDetails
  , aSTRATERefNumber
  , aLoanReferenceNumber
  , aLoanTenor
  , aLoanInterestRate
  , aRulingsSection
  , aADInternalAuthNumber
  , to_date(aADInternalAuthNumberDate,'YYYYMMDD')
  , aSARBAuthReferenceNumber
  , aCannotCategorise
  , aSubject
  , aDescription
  , aLocationCountry
  , aReversalTrnRefNumber
  , aReversalSequence
  , aUserID
  , SYSDATE
  );
END;
/
l
show errors

DROP PUBLIC SYNONYM MonetaryDetailsInsert;
CREATE PUBLIC SYNONYM MonetaryDetailsInsert for MonetaryDetailsInsert;
GRANT EXECUTE on MonetaryDetailsInsert to nbpd01;

