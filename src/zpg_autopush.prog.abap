*&---------------------------------------------------------------------*
*& Report ZPG_AUTOPUSH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZPG_AUTOPUSH.
CLASS sales_order_disp DEFINITION.

  PUBLIC SECTION.

    DATA : o_salv TYPE REF TO cl_salv_table.

    METHODS : build_salesorder,

                           disp_salesorder.

  PRIVATE SECTION.

    DATA : lt_vbak TYPE TABLE OF vbak.

ENDCLASS.

CLASS sales_order_disp IMPLEMENTATION.


  METHOD build_salesorder.

    SELECT * FROM vbak INTO TABLE lt_vbak UP TO 50 ROWS.

  ENDMETHOD.

  METHOD disp_salesorder.

    try.

    cl_salv_table=>factory(

      IMPORTING

        r_salv_table   = o_salv    "Basis Class Simple ALV Tables

      CHANGING

        t_table        = lt_vbak ).


     CATCH cx_salv_msg.

     endtry.

 o_salv->display( ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA: o_salesord TYPE REF TO sales_order_disp.

  CREATE OBJECT o_salesord.

  o_salesord->build_salesorder( ).

  o_salesord->disp_salesorder( ).
  WRITE: 'Test auto push.'.
