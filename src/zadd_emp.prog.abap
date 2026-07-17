*&---------------------------------------------------------------------*
*& Report ZADD_EMP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZADD_EMP.

PARAMETERS P_ID TYPE ZEMPLOYEE_ID.
PARAMETERS P_NAME TYPE ZEMPLOYEE_NAME.
PARAMETERS P_DEPID TYPE ZDEP_ID.

DATA WA_EMP LIKE ZEMP.
WA_EMP-ID = P_ID.
WA_EMP-NAME = P_NAME.
WA_EMP-ID_DEP = P_DEPID.

INSERT ZEMP FROM WA_EMP.
