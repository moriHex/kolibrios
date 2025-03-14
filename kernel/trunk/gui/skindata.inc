;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                              ;;
;; Copyright (C) KolibriOS team 2004-2024. All rights reserved. ;;
;; Distributed under terms of the GNU General Public License    ;;
;;                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;
;   WINDOW SKIN DATA.
;

iglobal
  _skin_file_default db '/sys/DEFAULT.SKN',0
endg

struct  SKIN_DATA
        colors.inner dd ?
        colors.outer dd ?
        colors.frame dd ?
        left.data    dd ?
        left.left    dd ?
        left.width   dd ?
        oper.data    dd ?
        oper.left    dd ?
        oper.width   dd ?
        base.data    dd ?
        base.left    dd ?
        base.width   dd ?
ends

struct  SKIN_BUTTON
        left   dd ?
        top    dd ?
        width  dd ?
        height dd ?
ends

uglobal

align 4

skin_udata:
  _skinh            dd ?

  _skinmargins: ;   rw 4
    .right          dw ?
    .left           dw ?
    .bottom         dw ?
    .top            dw ?

  skin_btn_close    SKIN_BUTTON
  skin_btn_minimize SKIN_BUTTON

  skin_active       SKIN_DATA
  skin_inactive     SKIN_DATA

align 4

skin_udata.size = $ - skin_udata

endg
