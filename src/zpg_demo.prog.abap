*&---------------------------------------------------------------------*
*& Report ZPG_DEMO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZPG_DEMO.
CLASS lcl_flight DEFINITION.
PUBLIC SECTION.
DATA: lt_flight TYPE TABLE OF spfli.
DATA: lo_salv TYPE REF TO cl_salv_table.
DATA: ls_color TYPE lvc_s_colo.
METHODS: get_data.
METHODS: color_column.
METHODS: display_data.
ENDCLASS.


CLASS lcl_flight IMPLEMENTATION.
METHOD get_data.
SELECT * FROM spfli INTO TABLE lt_flight UP TO 10 ROWS.
ENDMETHOD.

METHOD color_column.
INCLUDE <color>.
DATA: lo_cols TYPE REF TO cl_salv_columns_table.
DATA: lo_col TYPE REF TO cl_salv_column_table.
lo_cols = lo_salv->get_columns( ).
lo_col ?= lo_cols->get_column( 'CITYFROM' ).
ls_color-col = col_positive.
lo_col->set_color( ls_color ).
ENDMETHOD.

METHOD display_data.
TRY.
cl_salv_table=>factory(
IMPORTING
r_salv_table = lo_salv
CHANGING
t_table = lt_flight ).


lo_salv->display( ).
CATCH cx_salv_msg.
ENDTRY.
ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
DATA(lo_flight) = NEW lcl_flight( ).
lo_flight->get_data( ).
lo_flight->display_data( ).
WRITE: 'Test update commit git'.
