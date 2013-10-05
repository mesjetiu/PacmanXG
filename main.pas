unit main;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface
uses
 mseglob,mseguiglob,mseguiintf,mseapplication,msemenus,msegui,msegraphics,
 msegraphutils,mseevent,mseclasses,mseforms,msesimplewidgets,msewidgets,
 msesplitter,msestatfile,msestream,msestrings,msetabs,sysutils,msedataedits,
 mseedit,msegrids,msetypes,msewidgetgrid,mseeditglob,msetextedit,msegraphedits,
 msefileutils,mseterminal,mseimage,msetimer, msekeyboard,msebitmap,
 msefiledialog,msedock, {libc,}mseifiglob, unix,msescrollbar,msestat,
 msedatanodes,mseificomp,mseificompglob,mselistbrowser,msesys,msecolordialog;

CONST Version = '4.14.19 beta';
 
type
 tmainfo = class(tmainform)
   s_menu: tspacer;
   b_home: trichbutton;
   b_packages: trichbutton;
   trichbutton6: trichbutton;
   trichbutton20: trichbutton;
   tw_main: ttabwidget;
   tp_main: ttabpage;
   s_main: tspacer;
   b_news: trichbutton;
   trichbutton37: trichbutton;
   trichbutton39: trichbutton;
   l_appname: tlabel;
   b_errors: trichbutton;
   l_newver: tlabel;
   tp_packages: ttabpage;
   ttabpage2: ttabpage;
   ttabpage3: ttabpage;
   tw_logs: ttabwidget;
   tp_pacmanlog: ttabpage;
   wg_log_dates: twidgetgrid;
   ttabpage24: ttabpage;
   wg_seslog: twidgetgrid;
   te_seslog: ttextedit;
   ttabpage32: ttabpage;
   s_pacmanlog: tspacer;
   l_logload: tlabel;
   b_clearlog: trichbutton;
   tspacer1: tspacer;
   s_findlog: tspacer;
   se_filterlog: tedit;
   b_clearsearchboxlog: trichbutton;
   wg_log: twidgetgrid;
   te_log: ttextedit;
   ttabpage1: ttabpage;
   tp_news: ttabpage;
   ttabpage6: ttabpage;
   s_bottom_about: tspacer;
   tlabel7: tlabel;
   tw_about: ttabwidget;
   tp_about: ttabpage;
   ttabpage22: ttabpage;
   tmemoedit3: tmemoedit;
   ttabpage30: ttabpage;
   l_tip: tlabel;
   l_tip3: tlabel;
   tlabel12: tlabel;
   tlabel6: tlabel;
   tlabel17: tlabel;
   tlabel8: tlabel;
   tp_thanks: ttabpage;
   sb_thanks: tscrollbox;
   l_thanks: tlabel;
   tspacer9: tspacer;
   l_translators: tlabel;
   ttabpage19: ttabpage;
   s_help_project: tspacer;
   tlabel1: tlabel;
   tstringedit5: tstringedit;
   tstringedit7: tstringedit;
   tlabel13: tlabel;
   tstringedit3: tstringedit;
   tstringedit2: tstringedit;
   tstringedit1: tstringedit;
   tlabel4: tlabel;
   tlabel2: tlabel;
   s_top_about: tspacer;
   trichbutton21: trichbutton;
   tspacer7: tspacer;
   trichbutton9: trichbutton;
   tspacer6: tspacer;
   trichbutton8: trichbutton;
   tspacer5: tspacer;
   trichbutton3: trichbutton;
   s_right: tspacer;
   s_left: tspacer;
   spl2: tsplitter;
   tlabel5: tlabel;
   s_top: tspacer;
   b_execute: trichbutton;
   b_del: trichbutton;
   b_collapce: trichbutton;
   b_update: trichbutton;
   b_cancel: trichbutton;
   trichbutton31: trichbutton;
   se_filter2: tdropdownlistedit;
   b_clearsearchbox: trichbutton;
   se_filter: tedit;
   s_packages: tspacer;
   tw1: ttabwidget;
   ttabpage21: ttabpage;
   lgf: tlabel;
   ttabpage7: ttabpage;
   sg_query: tstringgrid;
   tw_info: ttabwidget;
   ttabpage16: ttabpage;
   l_pkgname: tlabel;
   l_pkgname_capt: tlabel;
   l_pkginfo_capt: tlabel;
   tspacer21: tspacer;
   tspacer22: tspacer;
   l_repo: tlabel;
   tspacer20: tspacer;
   tlabel9: tlabel;
   ttabpage17: ttabpage;
   sg_info: tstringgrid;
   ttabpage8: ttabpage;
   wg: twidgetgrid;
   term_files: tterminal;
   ttabpage14: ttabpage;
   wg_check: twidgetgrid;
   term_check: tterminal;
   l_request: tlabel;
   trichbutton15: trichbutton;
   spl1: tsplitter;
   tlabel10: tlabel;
   sb_utils: tscrollbox;
   b_updatesystem: trichbutton;
   trichbutton19: trichbutton;
   b_sinh: trichbutton;
   trichbutton22: trichbutton;
   b_save_packagelist: trichbutton;
   b_cleancache: trichbutton;
   b_restore_from_file: trichbutton;
   b_findfastmirrors: trichbutton;
   trichbutton28: trichbutton;
   b_cleancachef: trichbutton;
   b_remove_orfans: trichbutton;
   b_dizz: trichbutton;
   b_install_file: trichbutton;
   b_expl: trichbutton;
   b_dep: trichbutton;
   s_utils: tspacer;
   d_texteditor: trichbutton;
   d_finav: trichbutton;
   d_term: trichbutton;
   b_update_editor: trichbutton;
   dd_texteditor: tdropdownlistedit;
   b_update_finav: trichbutton;
   dd_finav: tdropdownlistedit;
   b_update_term: trichbutton;
   dd_term: tdropdownlistedit;
   b_cache_management: trichbutton;
   s_findfile: tspacer;
   l_find_package_for_file: tlabel;
   b_findpackage_with_pacman: trichbutton;
   b_update_pkfile: trichbutton;
   tw_sets: ttabwidget;
   tp_sets_interface: ttabpage;
   tscrollbox6: tscrollbox;
   tspacer23: tspacer;
   b_set_font: trichstockglyphbutton;
   dd_fonts: tdropdownlistedit;
   ie_heightfont: tintegeredit;
   dd_langs: tdropdownlistedit;
   tspacer19: tspacer;
   tspacer30: tspacer;
   b_sinhmirrors: tbooleanedit;
   tspacer39: tspacer;
   ber_notify: tbooleanedit;
   ber_kdialog: tbooleanedit;
   be_notifyme: tbooleanedit;
   tp_utils: ttabpage;
   ttabpage26: ttabpage;
   tw_pacman_conf: twidgetgrid;
   te_pacman_conf: ttextedit;
   ttabpage27: ttabpage;
   tw_mirrorlist: twidgetgrid;
   te_mirrorlist: ttextedit;
   ttabpage28: ttabpage;
   tw_yaourtrc: twidgetgrid;
   te_yaourtrc: ttextedit;
   s_save1: tspacer;
   trichbutton13: trichbutton;
   tspacer16: tspacer;
   trichbutton16: trichbutton;
   s_save2: tspacer;
   trichbutton18: trichbutton;
   tspacer17: tspacer;
   trichbutton17: trichbutton;
   s_save3: tspacer;
   trichbutton25: trichbutton;
   tspacer18: tspacer;
   trichbutton24: trichbutton;
   tp_cache: ttabpage;
   wg_cache: twidgetgrid;
   ber_cache: tbooleanedit;
   se_file: tstringedit;
   se_status: tstringedit;
   s_topmenu: tspacer;
   tspacer10: tspacer;
   b_install_from_cache: trichbutton;
   trichbutton41: trichbutton;
   trichbutton42: trichbutton;
   trichbutton45: trichbutton;
   e_cache: tedit;
   timer: ttimer;
   pm: tpopupmenu;
   tab_downgrade: ttabpage;
   bmenu1: trichbutton;
   bmenu2: trichbutton;
   bmenu3: trichbutton;
   tspacer28: tspacer;
   tspacer29: tspacer;
   s_top_logs: tspacer;
   trichbutton4: trichbutton;
   tspacer32: tspacer;
   trichbutton10: trichbutton;
   trichbutton5: trichbutton;
   trichbutton2: trichbutton;
   trichbutton7: trichbutton;
   trichbutton14: trichbutton;
   b_mylist: trichbutton;
   s_top_sets: tspacer;
   trichbutton30: trichbutton;
   tspacer31: tspacer;
   trichbutton35: trichbutton;
   tspacer34: tspacer;
   trichbutton43: trichbutton;
   tspacer35: tspacer;
   trichbutton44: trichbutton;
   ttabpage29: ttabpage;
   trichbutton47: trichbutton;
   tspacer37: tspacer;
   trichbutton48: trichbutton;
   l_thumb: tlabel;
   im_thumb: timage;
   b_filterpanelpos: tbooleaneditradio;
   b_filterpanelpos1: tbooleaneditradio;
   sb_hotkeys: tscrollbox;
   l_hotkey_desc: tlabel;
   tspacer24: tspacer;
   tlabel3: tlabel;
   be_noscreenshot: tbooleanedit;
   f_topbuttons: tfacecomp;
   fr_topbuttons: tframecomp;
   f_topbuttons_click: tfacecomp;
   f_buttons: tfacecomp;
   fr_text_with_border: tframecomp;
   f_buttons_click: tfacecomp;
   fr_panels: tframecomp;
   b_find: trichbutton;
   b_find2: trichbutton;
   s_1: tspacer;
   trichbutton46: trichbutton;
   tspacer27: tspacer;
   b_find_in_cache: trichbutton;
   b_findpackage_with_pkgfile: trichbutton;
   tw_right: ttabwidget;
   ttabpage11: ttabpage;
   ber_aur: tbooleaneditradio;
   tspacer14: tspacer;
   l_expl: tlabel;
   ber_expls: tbooleaneditradio;
   l_deps: tlabel;
   tspacer25: tspacer;
   ber_deps: tbooleaneditradio;
   tspacer26: tspacer;
   l_orfans: tlabel;
   ber_orfans: tbooleaneditradio;
   tspacer13: tspacer;
   l_haveupdate: tlabel;
   ber_haveupdate: tbooleaneditradio;
   dd_cat_ins1: tbooleaneditradio;
   dd_ir1: tbooleaneditradio;
   dd_ig1: tbooleaneditradio;
   l_ins: tlabel;
   tspacer4: tspacer;
   ber_ins: tbooleaneditradio;
   dd_cat_all1: tbooleaneditradio;
   dd_ar1: tbooleaneditradio;
   dd_ag1: tbooleaneditradio;
   l_all: tlabel;
   tspacer8: tspacer;
   ber_all: tbooleaneditradio;
   l_query_del: tlabel;
   tspacer43: tspacer;
   be_query_del: tbooleaneditradio;
   be_query_ins: tbooleaneditradio;
   tspacer38: tspacer;
   l_query_ins: tlabel;
   l_query_all: tlabel;
   tspacer15: tspacer;
   be_query_all: tbooleaneditradio;
   ber_exact: tbooleanedit;
   dd_cat_ins: tdropdownlistedit;
   dd_ir: tdropdownlistedit;
   dd_ig: tdropdownlistedit;
   dd_cat_all: tdropdownlistedit;
   dd_ar: tdropdownlistedit;
   dd_ag: tdropdownlistedit;
   tspacer2: tspacer;
   ttabpage12: ttabpage;
   wg_mylist: twidgetgrid;
   ber_: tbooleanedit;
   se_package: tstringedit;
   tspacer11: tspacer;
   se_mylist_fname: tstringedit;
   s_oper: tspacer;
   s_oper_form: tspacer;
   s_exec_top: tspacer;
   l_oper_title: tlabel;
   tbooleanedit1: tbooleanedit;
   tspacer12: tspacer;
   b_install_from_list: trichbutton;
   trichbutton26: trichbutton;
   trichbutton12: trichbutton;
   b_save: trichbutton;
   b_open_list: trichbutton;
   tspacer36: tspacer;
   tbooleanedit2: tbooleanedit;
   tscrollbox1: tscrollbox;
   l_pkginfo: tlabel;
   b_about1: trichbutton;
   trichbutton32: trichbutton;
   trichbutton38: trichbutton;
   b_repacman: trichbutton;
   s_repacman: tstringedit;
   spacer_cache: tspacer;
   l_cache_info: tlabel;
   trichbutton34: trichbutton;
   trichbutton36: trichbutton;
   e_dgrd_searchbox: tedit;
   b_dowgrade_pkg: trichbutton;
   tw_drgd: twidgetgrid;
   se_dgd_pkg: tstringedit;
   se_dgd_pkg2: tstringedit;
   l_dgrd_info: tlabel;
   b_downgrade: trichbutton;
   b_remove_orfans2: trichbutton;
   tspacer40: tspacer;
   trichbutton49: trichbutton;
   tspacer41: tspacer;
   wg_newssite: twidgetgrid;
   timagelist1: timagelist;
   tw_oper: ttabwidget;
   tab_empty: ttabpage;
   tp_ins_ask: ttabpage;
   trichbutton53: trichbutton;
   tscrollbox2: tscrollbox;
   l_pins: tlabel;
   sb_ins_ask: tscrollbox;
   s_ins_opt: tspacer;
   be_downloadonly: tbooleanedit;
   be_asexpl: tbooleanedit;
   be_asdeps: tbooleanedit;
   be_force: tbooleanedit;
   s_trans_ask: tspacer;
   be_scriptlet: tbooleanedit;
   be_nodeps: tbooleanedit;
   be_nodeps2: tbooleanedit;
   tp_del_ask: ttabpage;
   tscrollbox4: tscrollbox;
   l_pdel: tlabel;
   trichbutton52: trichbutton;
   sb_del_ask: tscrollbox;
   s_del_opt: tspacer;
   be_nosave: tbooleanedit;
   be_cascade: tbooleanedit;
   be_recursive: tbooleanedit;
   be_checkhome: tbooleanedit;
   tp_task: ttabpage;
   pb: tprogressbar;
   tw_task: twidgetgrid;
   term_task: tterminal;
   l_operation: tlabel;
   s_task: tspacer;
   trichbutton51: trichbutton;
   trichbutton58: trichbutton;
   b_continue_del: trichbutton;
   b_continue_ins: trichbutton;
   trichbutton61: trichbutton;
   b_delete_dblock: trichbutton;
   trichbutton54: trichbutton;
   trichbutton55: trichbutton;
   trichbutton63: trichbutton;
   l_lastcommand: tlabel;
   l_aur: tlabel;
   trichbutton59: trichbutton;
   ber_left_menu: tbooleanedit;
   tspacer45: tspacer;
   l_cache_files_info: tlabel;
   se_filesize: tstringedit;
   tspacer46: tspacer;
   tspacer47: tspacer;
   b_install_file2: trichbutton;
   tab_dizz: ttabpage;
   wg_dizz: twidgetgrid;
   be_dizz: tbooleanedit;
   se_file_dizz: tstringedit;
   se_path_dizz: tstringedit;
   se_result_dizz: tstringedit;
   tspacer48: tspacer;
   trichbutton27: trichbutton;
   trichbutton40: trichbutton;
   tlabel14: tlabel;
   tspacer50: tspacer;
   tbooleanedit4: tbooleanedit;
   tspacer51: tspacer;
   l_count_dizz: tlabel;
   term_dizz: tterminal;
   tspacer52: tspacer;
   tspacer53: tspacer;
   ttabpage4: ttabpage;
   wg_tree: twidgetgrid;
   term_tree: tterminal;
   im_status: timagelist;
   twf: twidgetgrid;
   di_oper: tdataicon;
   se_oper: tstringedit;
   se_name: tstringedit;
   se_ins: tstringedit;
   se_aval: tstringedit;
   se_group: tstringedit;
   se_repo: tstringedit;
   se_desc: tstringedit;
   se_num: tstringedit;
   se_cat: tstringedit;
   di_status: tdataicon;
   im_oper: timagelist;
   se_collapce: tstringedit;
   se_name2: tstringedit;
   b_ins: trichbutton;
   dd_themes: tdropdownlistedit;
   fr_mainbuttons: tframecomp;
   fr_buttons: tframecomp;
   tspacer49: tspacer;
   tspacer54: tspacer;
   tspacer55: tspacer;
   tspacer56: tspacer;
   tspacer57: tspacer;
   pm_filelist: tpopupmenu;
   be_dbonly: tbooleanedit;
   tspacer33: tspacer;
   wg_news_all: twidgetgrid;
   te_news_all: ttextedit;
   wg_news_titles: twidgetgrid;
   te_news_titles: ttextedit;
   tspacer44: tspacer;
   l_news_title: tlabel;
   tsplitter2: tsplitter;
   tlabel11: tlabel;
   tsplitter3: tsplitter;
   tlabel15: tlabel;
   b_menu: trichbutton;
   s_taskA: tspacer;
   trichbutton11: trichbutton;
   trichbutton23: trichbutton;
   b_abort: trichbutton;
   b_clear_session: trichbutton;
   be_repeat: tbooleanedit;
   be_unneeded: tbooleanedit;
   tspacer58: tspacer;
   tspacer59: tspacer;
   b_show_pkg: trichbutton;
   b_check_errors: trichbutton;
   tsplitter4: tsplitter;
   tlabel16: tlabel;
   te_newssite: ttextedit;
   term_thumb: tterminal;
   term_thumb2: tterminal;
   te_log_dates: ttextedit;
   be_oldtablestyle: tbooleanedit;
   tscrollbox3: tscrollbox;
   l_inf: tlabel;
   term_edit: tterminal;
   tw_history: twidgetgrid;
   te_history: ttextedit;
   b_repeat: tdatabutton;
   tlabel18: tlabel;
   tspacer3: tspacer;
   wg_error: twidgetgrid;
   se_check: tstringedit;
   di_error: tdataicon;
   se_answer: tstringedit;
   tspacer42: tspacer;
   trichbutton29: trichbutton;
   trichbutton33: trichbutton;
   b_run: trichbutton;
   tspacer60: tspacer;
   timer_run: ttimer;
   timagelist2: timagelist;
   f_scrolls: tfacecomp;
   b_execparam: trichbutton;
   ber_pos: tbooleanedit;
   ber_reset_options: tbooleanedit;
   ttimer1: ttimer;
   tspacer61: tspacer;
   be_noconfirm: tbooleanedit;
   be_usecachedir: tbooleanedit;
   be_debug: tbooleanedit;
   pb2: tprogressbar;
   be_needed: tbooleanedit;
   ber_recursive22: tbooleanedit;
   l_mess: tlabel;
   dd_cachedir: tdirdropdownedit;
   tdockhandle1: tdockhandle;
   timer_resize: ttimer;
   s_external: tspacer;
   tspacer63: tspacer;
   ber_external: tbooleanedit;
   ber_external2: tbooleanedit;
   ttabpage5: ttabpage;
   trichbutton50: trichbutton;
   trichbutton56: trichbutton;
   fd: tfiledialog;
   tlabel20: tlabel;
   tlabel21: tlabel;
   tlabel22: tlabel;
   tlabel23: tlabel;
   l_file: tlabel;
   b_export_from_cache: trichbutton;
   tspacer62: tspacer;
   pb_copying: tprogressbar;
   tspacer64: tspacer;
   tp_copy_from_cache: ttabpage;
   dd_copyto: tdirdropdownedit;
   trichbutton57: trichbutton;
   tspacer65: tspacer;
   trichbutton60: trichbutton;
   be_overwrite: tbooleanedit;
   tlabel19: tlabel;
   tlabel24: tlabel;
   ttabpage9: ttabpage;
   tw_df: twidgetgrid;
   term_df: tterminal;
   be_colorize: tbooleanedit;
   ce_colorize: tcoloredit;
   tspacer66: tspacer;
   procedure on_formcreate(const sender: TObject);
   procedure on_resizeform(const sender: TObject);
   procedure on_loadedform(const sender: TObject);

   procedure on_showmenu(const sender: TObject);
   procedure on_navigate_menu(const sender: TObject);
   procedure on_updateutils(const sender: TObject);

   procedure on_close(const sender: TObject);
   
   procedure loadlog(const sender: TObject);
   procedure on_cell_event_log(const sender: TObject; var info: celleventinfoty);
   
   procedure on_find_in_log(const sender: TObject);
   procedure on_clear_findbox_log(const sender: TObject);
   procedure on_clear_log(const sender: TObject);
   
   procedure on_checkerrors(const sender: TObject);
   
   procedure on_navigate_about(const sender: TObject);
   
   procedure on_movedown_info(const sender: TObject);
   
   procedure on_show_findfile(const sender: TObject);
   procedure on_exectask(const sender: TObject);
   
   procedure onupdatelayout_spl(const sender: TObject);
   procedure on_show_screenshot(const sender: twidget;
                   var ainfo: mouseeventinfoty);
   procedure on_update_cachelist(const sender: TObject);
   procedure on_update_pkglist(const sender: TObject);
   procedure on_change_filter(const sender: TObject); 
   procedure filter_query(const oper : string);
   procedure on_change_repo_group(const sender: TObject);
   procedure on_clear_searchbox(const sender: TObject);
   procedure on_set_search_text(const sender: TObject; var avalue: msestring;
                   var accept: Boolean);
   procedure on_search_keyup(const sender: twidget; var ainfo: keyeventinfoty);
   procedure on_navigate_log(const sender: TObject);
   procedure on_navigate_sets(const sender: TObject);

   procedure clearinfo;   
   procedure on_cell_event_get_package_info(const sender: TObject;var info: celleventinfoty);
   procedure autoselect(r : integer);
   procedure on_info_changepage(const sender: TObject);
   procedure on_add_remove_clear(const sender: TObject);
   
   procedure on_clearquery(const sender: TObject);
   procedure countquery;
   
   procedure on_set_font(const sender: TObject);
   procedure on_changefilterpanelposition(const sender: TObject);
   procedure on_show_left_menu(const sender: TObject; var avalue: Boolean; var accept: Boolean);

   procedure loadfile(fname : string ; const tw : twidgetgrid; const te : ttextedit);
   procedure on_load_pacmanconf(const sender: TObject);
   procedure on_load_mirrorlist(const sender: TObject);
   procedure on_load_yaourtrc(const sender: TObject);
   procedure savefile(fname : string ; const tw : twidgetgrid; const te : ttextedit);
   procedure on_save_pacmanconf(const sender: TObject);
   procedure on_save_mirrorlist(const sender: TObject);
   procedure on_save_yaourtrc(const sender: TObject);   
   
   procedure on_run_util(const sender: TObject);
   procedure on_close_stop_oper(const sender: TObject);
   
   procedure on_add_to_mylist(const sender: TObject);
   procedure on_select_mylist(const sender: TObject; var avalue: Boolean;var accept: Boolean);
   procedure on_delete_in_my_list(const sender: TObject);
   procedure on_open_my_list(const sender: TObject);
   procedure open;
   procedure on_save_my_list(const sender: TObject);
   procedure save;
   procedure on_select_cache(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_delete_files_from_cache(const sender: TObject);
   
   procedure on_logs_keyup(const sender: twidget; var ainfo: keyeventinfoty);
   procedure on_cache_keyup(const sender: twidget; var ainfo: keyeventinfoty);
   procedure on_clear_dgrd_searchbox(const sender: TObject);
   procedure on_drgd_search(const sender: TObject);

   procedure on_cell_event_news(const sender: TObject; var info: celleventinfoty);
   procedure load_news_titles;
   procedure on_get_manjaronews(const sender: TObject);

   procedure on_get_news_archlinux(const sender: TObject);
   procedure on_get_news_archlinux_ru(const sender: TObject);
   procedure on_get_news_cinnarch(const sender : tobject);
   procedure on_get_news_pacmanxg(const sender: TObject);
   procedure on_get_news_chakra(const sender: TObject);
   procedure on_get_news_parabola(const sender: TObject);
   procedure on_get_news_ConnochaetOS(const sender: TObject);
   
   procedure on_cell_event_news_title_click(const sender: TObject;
                   var info: celleventinfoty);
   procedure on_oper_tw_activepage_change(const sender: TObject);
   procedure on_collase_oper(const sender: TObject);
   procedure on_start_operation(const sender: TObject);
   procedure on_task_receive_text(const sender: TObject; var atext: AnsiString;
                   const errorinput: Boolean);
   procedure on_setd(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_setdd(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_set_asdeps(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_set_asexpl(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_send_yes(const sender: TObject);
   procedure on_send_no(const sender: TObject);
   procedure on_task_finish(const sender: TObject);

   procedure on_timer(const sender: TObject);
   procedure on_add_to_query_pm(const sender: TObject);
   procedure on_remove_from_query_pm(const sender: TObject);
   procedure on_cancel_pm(const sender: TObject);
   procedure on_execute_pm(const sender: TObject);
   procedure on_upgrade_pm(const sender: TObject);
   procedure on_synhmirrors_pm(const sender: TObject);
   procedure on_mark_expl(const sender: TObject);
   procedure on_mark_deps_pm(const sender: TObject);
   procedure on_add_package_to_ignore_list(const sender: TObject);
   procedure on_repacman_pm(const sender: TObject);
   procedure on_downgrade_pm(const sender: TObject);
   procedure on_dngrd_keyup(const sender: twidget; var ainfo: keyeventinfoty);
   procedure on_restore_from_file(const sender: TObject);
   procedure on_save_packagelist(const sender: TObject);
   procedure on_install_file(const sender: TObject);
   procedure on_select_dizz(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_search_dizz(const sender: TObject);
   procedure on_dizz_finish(const sender: TObject);
   procedure on_errase_dizz_files(const sender: TObject);
   procedure on_go_to_select_xterminal(const sender: TObject);
   procedure on_terminate_form(var terminate: Boolean);
   procedure savesettings;
   procedure loadsettings;
   procedure on_set_old_table_style(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_collapce_all(const sender: TObject);
   procedure on_set_lang(const sender: TObject);
   procedure on_open_in_texteditor(const sender: TObject);
   procedure on_open_in_filemanager(const sender: TObject);
   procedure on_progfinish(const sender: TObject);
   procedure on_send_abourt(const sender: TObject);
   procedure on_deletedblock(const sender: TObject);
   procedure on_delete_historyrow(const sender: TObject);
   procedure on_execute_form_history(const sender: TObject);
   procedure on_createdform(const sender: TObject);
   procedure on_finish_download_thumb(const sender: TObject);
   procedure on_finish_download_screenshot(const sender: TObject);
   procedure on_clear_session_log(const sender: TObject);
   procedure on_search_package_from_tree(const sender: TObject);
   procedure on_cell_event_show_package_from_tree(const sender: TObject;
                   var info: celleventinfoty);
   procedure on_hotkey(const sender: twidget; var ainfo: keyeventinfoty);
   procedure on_timer_run(const sender: TObject);
   procedure on_add_to_searchlist(const sender: TObject);
   procedure getpacmanversion;
   function check_util_cmdline(cmd : string) : string;
   procedure on_cell_key_down_log(const sender: twidget;
                   var ainfo: keyeventinfoty);
   procedure show_empty(const capt, mess : string);
   procedure on_resizeform_via_dockhandle(const sender: TObject);
   procedure on_childmouseevents(const sender: twidget; var ainfo: mouseeventinfoty);
   procedure on_setvalue_extterm2(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_set_extterm1(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   function whoami : string;

   procedure on_copy_from_cache(const sender: TObject);
   procedure on_start_copy(const sender: TObject);
   procedure on_set_color_of_outofdate_packages(const sender: TObject;
                   var avalue: colorty; var accept: Boolean);
   procedure on_change_color_of_outofdate_packages(const sender: TObject);
 end;
 
var 
   mainfo : tmainfo;
 __needloadlog   : boolean = true;
 __firstshowpkglist : boolean = true;
 __programpath   : string;
 __langspath     : string;
 __themepath     : string;
 __pacmanlogfile : string;
 __cachedir      : string;
 __pacmanconf    : string;
 __mirrorlist    : string;
 __yaourtrc      : string;
 __imagesdir     : string;
 __settingsdir   : string;
 __pacmanxgnewsurl : string;
 __runnum : shortint = 0;
 __downgradepath : string;
 __del   : boolean;
 __colorpacmanoutput : boolean;
 pkgname : string;
 
 m_add : string = 'add'; 
 m_del : string = 'del';
 __runinstall : boolean = false;
 __YES : boolean;
 __ERROR : boolean;
 __updatepkglist : boolean;
 __infotabsize  : integer;
 __exitafterexec : boolean;
 __total : integer;
 __current:integer;
 __YES__, __NO__, __A__ : MSESTRING;

implementation

uses  main_mfm, messages, pacmanlog, screenshotform, engine, classes, msesysintf,
      mseformatpngread, msepointer, mseprocutils, inifiles,msedrawtext,
      typinfo, mseact, paramsform, process, easyrss;
      
var arr_log, arr_log_dates : tlogarray;
    arr, arr_yaourt : tarraytype; 
    //[0 - action 1 - name, 2- ins ver, 3 - aval ver, 4 - group, 5 - repo, 
    //6 - desc, 7 -size, 8 - expls or deps, 9 - orfans, 10 - have update, 
    //11 - number, 12 - category]         
    
    SL_orfans : Tstringlist;
    SL_expls  : Tstringlist;    
    slg       : tstringlist;
    slr       : tstringlist;
    slr_ins   : tstringlist;
    slg_ins   : tstringlist;
    slcat     : tstringlist;
    slcat_ins : tstringlist;
    rss : trss;
    rowheight : integer;
    rowheightEx : integer;
    RSSR : TRSSReader;
    moveXX, moveYY : integer;
    rowcountforcopy : integer;
    noconfirm : boolean;


///////////////////////////////////////////////////////////////
//      FORM
///////////////////////////////////////////////////////////////
procedure tmainfo.on_formcreate(const sender: TObject);
var i : integer;
    fs : tsearchrec;
    fi : tinifile;
    sl : tstringlist;
     s : string;
begin
  __yes__ := 'y';
  __no__ := 'n';
  __a__ := 'a';
  
  application.createform(tscreenshotfo,screenshotfo);
  application.createform(tparamsfo,paramsfo);
  
  l_appname.frame.caption := Version;
  caption := 'PacmanXG ' + Version;
  screenshotfo.caption := 'PacmanXG ' + Version + '(screenshot)';
  paramsfo.caption := 'PacmanXG ' + Version + '(check home directory)';
  
  __programpath   := '/opt/pacmanxg/';
  __langspath   := __programpath + 'langs/';
  __themepath   := __programpath;
  __pacmanlogfile := '/var/log/pacman.log';
  __cachedir   := '/var/cache/pacman/pkg/';
  __pacmanconf := '/etc/pacman.conf';
  __mirrorlist := '/etc/pacman.d/mirrorlist';
  __yaourtrc   := '/etc/yaourtrc';
  __imagesdir  := sys_getuserhomedir + '/.Almin-Soft/PacmanXG/images/';
  __settingsdir:= sys_getuserhomedir + '/.Almin-Soft/PacmanXG/';
  __pacmanxgnewsurl := 'wget --output-file=wget.log http://almin-soft.fsay.net/data/files/pacmanxg/history.txt';
  __downgradepath := sys_getuserhomedir + '/.Almin-Soft/PacmanXG/tmp/';
  
  tw_main.width := tw_main.width + 54;
  tw_about.width := tw_about.width + 54;
  tw_logs.width := tw_logs.width + 54;
  tw_sets.width := tw_sets.width + 54;
  tw1.height := tw1.height + tw1.tab_size + 10;
  tw1.activepageindex := 0;

  s_main.left := s_main.left + 32;
  tscrollbox3.left := tscrollbox3.left + 32;
  sb_utils.left := sb_utils.left + 32;
  s_help_project.width := s_help_project.width + 32;
  s_1.height := tw_right.height - tw_right.tab_size;

  tw_oper.height := tw_oper.height + tw_oper.tab_size + 1;
  twf.datacols[12].width := 0; 
  twf.datacols[12].linewidth := 0;
  b_run.width := 0;
  
  s_external.bringtofront;
  s_external.left := 0;
  screenshotfo.top := 50;
  screenshotfo.left := 0;

  rowheight := twf.datarowheight;
  rowheightEx := 160;
  __runnum := 0; 
  __exitafterexec := false;
  
  on_showmenu(sender); b_menu.width := 0;
  on_navigate_menu(b_home);
  loadsettings;

  //langs
  if findfirst(__langspath + '*.lang',faanyfile,fs) = 0 then
  repeat 
    dd_langs.dropdown.cols.addrow(msestring(fs.name));
  until findnext(fs) <> 0;
  findclose(fs);

  //themes
  if findfirst(__themepath + 'themes',faanyfile,fs) = 0 then
  begin
  fi := tinifile.create(__themepath + 'themes');
  sl := tstringlist.create;
  fi.readsections(sl);
  if sl.count > 0 then
    for i := 0 to sl.count - 1 do
      dd_themes.dropdown.cols.addrow(msestring(sl[i]));
  sl.free;
  fi.free;
  end;
  findclose(fs);
end;

//try get version
procedure tmainfo.getpacmanversion;
var s : string;
    i : integer;
begin
  __colorpacmanoutput := false;
  s := trim(exec('pacman -V | grep ''Pacman v'' | cut -d'' '' -f21', true));
  if system.pos('v',s) <> 1 
     then begin 
          writeln('Can`t get pacman version');
          showmessage('Can`t get pacman version! :-(' + 
                      'REMEMBER: As of version 4.1.0, pacman now has a color option' + 
                      'If you have problems with getting package list' +
                      'Switch off "Color" option in /etc/pacman.conf');
          end
     else begin
          writeln('pacman version=',s);
          delete(s,1,1);
          while system.pos('.',s) > 0 do delete(s,system.pos('.',s),1);
          i := strtoint(trim(s));
          if i >= 410 then   __colorpacmanoutput := true;
          end;
end;

procedure tmainfo.on_createdform(const sender: TObject);
var r : rectty;
begin
  on_set_font(b_set_font);  //its correct!!!
  on_resizeform(sender);
  on_load_pacmanconf(sender);
  on_load_mirrorlist(sender);
  on_load_yaourtrc(sender);
   s_topmenu.width := s_topmenu.width + 1; //bug fix , do not errase
end;

procedure tmainfo.on_loadedform(const sender: TObject);
var b : boolean;
    i : integer;
    //fs : tsearchrec;
    //fi : tinifile;
    //sl : tstringlist;
    __param : string;
begin
  s_main.top := tp_main.height div 2 - s_main.height div 2;
  s_main.left := tp_main.width div 2 - s_main.width div 2;  
  
  //on_set_lang(sender);
  //application.processmessages;
  if se_mylist_fname.VAlue > '' then
     if fileexists(se_mylist_fname.value) then open;
  on_updateutils(b_update_term);
  on_updateutils(b_update_finav);
  on_updateutils(b_update_editor);
  //interface
  if ber_left_menu.value 
     then begin 
          b := true;
          on_show_left_menu(ber_left_menu, b, b);
          end;
  b_filterpanelpos.onchange := @on_changefilterpanelposition; //it`s works!
  if b_filterpanelpos.value then on_changefilterpanelposition(sender);  
  b := be_oldtablestyle.value;
  on_set_old_table_style(be_oldtablestyle,b,b);

  SL_orfans := Tstringlist.create;
  SL_expls:= Tstringlist.create;
  se_filter2.dropdown.cols.clear;
  se_filter2.dropdown.cols.addrow(msestring('driver'));
  se_filter2.dropdown.cols.addrow(msestring('font'));
  se_filter2.dropdown.cols.addrow(msestring('game'));
  se_filter2.dropdown.cols.addrow(msestring('game (AUR)'));
  se_filter2.dropdown.cols.addrow(msestring('pacmanxg (AUR)'));
  se_filter2.dropdown.cols.addrow(msestring('pacmanexpress (AUR)'));
  se_filter2.dropdown.cols.addrow(msestring('systemdx (AUR)'));
  //fonts ...
  dd_fonts.dropdown.cols.addrow(msestring('default'));
  dd_fonts.dropdown.cols.addrow(msestring('courier'));
  dd_fonts.dropdown.cols.addrow(msestring('helvetica'));
  dd_fonts.dropdown.cols.addrow(msestring('roman'));
  dd_fonts.dropdown.cols.addrow(msestring('sans'));
  dd_fonts.dropdown.cols.addrow(msestring('arial'));
  dd_fonts.dropdown.cols.addrow(msestring('empty'));
  dd_fonts.dropdown.cols.addrow(msestring('fixed'));
  dd_fonts.dropdown.cols.addrow(msestring('menu'));
  dd_fonts.dropdown.cols.addrow(msestring('proportional'));
  dd_fonts.dropdown.cols.addrow(msestring('report'));
  dd_fonts.dropdown.cols.addrow(msestring('unicode'));
  if (dd_fonts.dropdown.cols.rowcount > 0)and(dd_fonts.value = '') then dd_fonts.dropdown.itemindex := 0;  

  //news
  wg_newssite.rowcount := 7;
  te_newssite[0] := 'Arch Linux news';
  te_newssite[1] := 'Arch Linux news(ru)';
  te_newssite[2] := 'PacmanXG news';
  te_newssite[3] := 'Antergos news';
  te_newssite[4] := 'Manjaro news';
  te_newssite[5] := 'Chakra news';
  te_newssite[6] := 'Parabola GNU/Linux-libre';
  //te_newssite[7] := 'ConnochaetOS';
  //rss := trss.create;   
  RSSR := TRSSReader.create;

 if paramcount > 0 then
 begin
   __param :='';
   if paramstr(1) = '--exec' then
   for i := 2 to paramcount do
     __param := __param + ' ' + paramstr(i);
   b_execparam.hint := __param;
   b_execparam.caption := __param;
   __exitafterexec := true;
   width := s_oper_form.width;
   height := 510;
   on_exectask(b_execparam);
 end;
 //on_collase_oper(sender);
 //application.processmessages;
 //on_collase_oper(sender);
end;

procedure tmainfo.on_resizeform(const sender: TObject);
begin
  s_main.top := tp_main.height div 2 - s_main.height div 2;
  s_main.left := tp_main.width div 2 - s_main.width div 2;  
  
  s_oper_form.top := tp_main.height div 2 - s_oper_form.height div 2;
  s_oper_form.left := tp_main.width div 2 - s_oper_form.width div 2;  
  
  sb_utils.top := tp_main.height div 2 - sb_utils.height div 2;
  sb_utils.left := tp_main.width div 2 - sb_utils.width div 2;  

  s_help_project.top  := tw_about.height div 2 - s_help_project.height div 2;
  s_help_project.left := tp_main.width div 2   - s_help_project.width div 2;  
  
  sb_thanks.left := tp_main.width div 2   - sb_thanks.width div 2;  
  sb_hotkeys.top  := tw_about.height div 2 - sb_hotkeys.height div 2;
  sb_hotkeys.left := tp_main.width div 2   - sb_hotkeys.width div 2;  

//  s_about.top  := tp_about.height div 2 - s_about.height div 2;  
  tscrollbox3.left := tp_main.width div 2   - tscrollbox3.width div 2; 
  //caption := inttostr(width) + ':' + inttostr(height); 
end;

procedure tmainfo.on_showmenu(const sender: TObject);
var t : byte;
begin
  t := 50;
  if s_menu.width = 0 
     then begin
          s_menu.width := t;
          se_filter.width := se_filter.width - t;
          se_filter.left := se_filter.left + t;
          end
     else begin 
          s_menu.width := 0;
          se_filter.left := se_filter.left - t;
          se_filter.width := se_filter.width + t;
          end;
  on_resizeform(sender);
end;

procedure tmainfo.on_navigate_menu(const sender: TObject);
var t : byte;
begin
  if sender.classname = 'tmenuitem'   then t := (sender as tmenuitem).tag;
  if sender.classname = 'trichbutton' then t := (sender as trichbutton).tag;

  if t = 0 then bmenu2.visible := false
           else bmenu2.visible := true;

  tw_main.activepageindex := t;
  s_top_about.parentwidget := tp_about;
  s_top_logs.parentwidget := tp_pacmanlog;
  s_top_sets.parentwidget := tp_sets_interface;
           
  if (sender = b_cache_management)
    then begin 
         bmenu3.tag := t;
         bmenu3.onexecute := nil;
         bmenu3.caption := twidget(sender).hint;
         bmenu3.hint := twidget(sender).hint;
         bmenu3.helpcontext := twidget(sender).helpcontext;
         bmenu3.visible := true;
         application.processmessages;
         on_update_cachelist(sender);
         end
  else  
  if (sender = b_dowgrade_pkg)
    then begin 
         bmenu3.tag := t;
         bmenu3.onexecute := nil;
         bmenu3.caption := twidget(sender).hint;
         bmenu3.hint := twidget(sender).hint;
         bmenu3.helpcontext := twidget(sender).helpcontext;
         bmenu3.visible := true;
         e_dgrd_searchbox.setfocus;
         application.processmessages;
         end
  else  
  if (sender = b_dizz)
    then begin 
         bmenu3.tag := t;
         bmenu3.onexecute := nil;
         bmenu3.caption := twidget(sender).hint;
         bmenu3.hint := twidget(sender).hint;
         bmenu3.helpcontext := twidget(sender).helpcontext;
         bmenu3.visible := true;
         application.processmessages;
         end
  else  
  if (t=1)
    then begin 
         tw_right.activepageindex := strtoint(twidget(sender).helpcontext);
         bmenu3.onexecute := @on_navigate_menu;
         bmenu2.tag := 1;
         bmenu2.caption := b_packages.hint;
         bmenu2.hint := b_packages.hint;
         bmenu2.helpcontext := b_packages.helpcontext;

         bmenu3.tag := 1;
         bmenu3.caption := b_mylist.hint;
         bmenu3.hint := b_mylist.hint;
         bmenu3.helpcontext := b_mylist.helpcontext;
         bmenu3.visible := true;
         end
  else  
  if sender.classname = 'tmenuitem'   
    then begin
         bmenu3.tag := t;
         bmenu3.onexecute := nil;
         bmenu3.hint := (sender as tmenuitem).caption;
         bmenu3.caption := (sender as tmenuitem).caption;
         bmenu3.visible := true;
         end
  else
  if sender.classname = 'trichbutton' 
    then begin 
         bmenu2.tag := t;
         bmenu2.caption := (sender as trichbutton).hint;
         bmenu2.hint := twidget(sender).hint;
         bmenu2.helpcontext := twidget(sender).helpcontext;
         bmenu3.visible := false;
         end;
  
  if (t = 1) then if __firstshowpkglist then 
    begin
      on_update_pkglist(b_update);
      
    end;
  tspacer29.linkright := bmenu3;
  
  if (t = 2) then begin
                  s_utils.parentwidget := sb_utils;
                  s_utils.left := 446;
                  s_utils.top := 164;
                  end;
  if (t = 3) then begin 
                  s_top_logs.parentwidget := s_topmenu;
                  tspacer29.linkright := s_top_logs;
                  tw_about.activepageindex := 0;
                   if sender = b_errors 
                      then tw_logs.activepageindex := 2
                      else begin 
                           tw_logs.activepageindex := 0;
                           if __needloadlog then loadlog(sender);
                           end;
                  end;
  if (t = 4) then begin 
                  s_top_sets.parentwidget := s_topmenu;
                  tw_sets.activepageindex := 0;
                  tspacer29.linkright := s_top_sets;
                  s_utils.parentwidget := tp_utils;
                  s_utils.left := 100;
                  s_utils.top := 20;
                  end;
  if (t = 6) then begin
                  s_top_about.parentwidget := s_topmenu;
                  s_top_about.sendtoback;
                  tspacer29.linkright := s_top_about;
                  tw_about.activepageindex := 0;
                  end;
end;

procedure tmainfo.on_close(const sender: TObject);
begin
  application.terminate;
end;

///////////////////// UTILS ////////////////////////////////////
procedure tmainfo.on_updateutils(const sender: TObject);
   procedure checkfile(const fname : string; const dd_ : tdropdownlistedit);
    begin
      if FindBinaryBool(fname) then dd_.dropdown.cols.addrow(msestring(fname));
    end;
    
begin
case (sender as trichbutton).tag of
0 : begin
    dd_term.dropdown.cols.clear;
    checkfile('lxterminal', dd_term);
    checkfile('xfce4-terminal', dd_term);
    checkfile('gnome-terminal', dd_term);
    checkfile('terminal', dd_term);
    checkfile('xterm', dd_term);
    checkfile('konsole', dd_term);
    checkfile('urxvt', dd_term);
    checkfile('vte', dd_term);
    checkfile('mate-terminal', dd_term);
    if (dd_term.dropdown.cols.rowcount > 0)and(dd_term.value = '') then dd_term.dropdown.itemindex := 0;
    end;
1 : begin
    dd_finav.dropdown.cols.clear;
    checkfile('pcmanfm', dd_finav);
    checkfile('thunar', dd_finav);
    checkfile('konqueror', dd_finav);
    checkfile('dolphin', dd_finav);
    checkfile('nautilus', dd_finav);
    checkfile('asfilemanager', dd_finav);
    checkfile('pantheon-files', dd_finav);
    checkfile('nemo', dd_finav);
    checkfile('caja', dd_finav);
    if (dd_finav.dropdown.cols.rowcount > 0) and (dd_finav.value = '') then dd_finav.dropdown.itemindex := 0;
    end;
2 : begin
    dd_texteditor.dropdown.cols.clear;
    checkfile('scribes', dd_texteditor);
    checkfile('KoalaWriter', dd_texteditor);
    checkfile('focuswriter', dd_texteditor);
    checkfile('medit', dd_texteditor);
    checkfile('mousepad', dd_texteditor);
    checkfile('screem', dd_texteditor);
    checkfile('leafpad', dd_texteditor);
    checkfile('scite', dd_texteditor);
    checkfile('geany', dd_texteditor);
    checkfile('gedit', dd_texteditor);
    checkfile('kwrite', dd_texteditor);
    checkfile('pluma', dd_texteditor);
    if (dd_texteditor.dropdown.cols.rowcount > 0)and (dd_texteditor.value = '') then dd_texteditor.dropdown.itemindex := 0;  
    end;
end; //case
end;


/////////// LOGS //////////////////////////////
procedure tmainfo.on_navigate_log(const sender: TObject);
begin
  tw_logs.activepageindex := (sender as trichbutton).tag;
end;

procedure tmainfo.loadlog(const sender : tobject);
var i : integer;
    fs : tsearchrec;
begin

 wg_log.clear;
 wg_log_dates.clear;
 wg_log_dates.rowcount := 1;
 te_log_dates[0] := mes_All_log;
 
 l_logload.caption := mes_Loading+', ' + mes_please_wait + ' ...';
  mainfo.cursor := cr_wait;  
  application.processmessages;
 
 findfirst(__pacmanlogfile,faanyfile,fs);
 if fs.size > 1024 * 1024 
   then if askyesno(mes_logfile)
        then on_clear_log(b_clearlog); 
 findclose(fs);
 
 ReadLog(__pacmanlogfile, arr_log, arr_log_dates); 
 se_filterlog.text := '';

 //dates
 wg_log_dates.rowcount := high(arr_log_dates) + 2;
 for i := 0 to high(arr_log_dates) do 
   te_log_dates[i+1] := arr_log_dates[i]; 
 //log
 wg_log.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
                    co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly];
 wg_log.rowcount := high(arr_log) + 1;
 for i := 0 to high(arr_log) do 
   te_log[i] := arr_log[i]; 
 wg_log.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
    co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly,co1_autorowheight];
 __needloadlog := false;
 l_logload.caption := '';
  mainfo.cursor := cr_default;  
end;

procedure tmainfo.on_cell_event_log(const sender: TObject; var info: celleventinfoty);
begin
  if iscellclick(info, [ccr_buttonpress]) then on_find_in_log(sender);
end;

procedure tmainfo.on_cell_key_down_log(const sender: twidget;var ainfo: keyeventinfoty);
begin
  if (ainfo.key = key_up)or(ainfo.key = key_down) then on_find_in_log(sender); 
end;


procedure tmainfo.on_find_in_log(const sender: TObject);
var arr_logf : array of integer;
    i : integer;
    s : string;
begin
  mainfo.cursor := cr_wait;  
  application.processmessages;
     if wg_log_dates.row > 0 
        then s := te_log_dates[wg_log_dates.row]
        else s := '';
       
     FindLog(s,se_filterlog.text,arr_log,arr_logf);
     wg_log.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
                    co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly];
     wg_log.rowcount := high(arr_logf) + 1;
     for i := 0 to high(arr_logf) do 
     begin
     te_log[i] := arr_log[arr_logf[i]]; 
     application.processmessages;
     end;
     wg_log.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
             co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly,co1_autorowheight];
  mainfo.cursor := cr_default;  
end;

procedure tmainfo.on_clear_findbox_log(const sender: TObject);
begin
  se_filterlog.text := '';
  on_find_in_log(sender);
end;

procedure tmainfo.on_clear_log(const sender: TObject);
begin
 if not fileexists(__pacmanlogfile)
 then show_empty(mes_error,mes_File_not_found + '!' + #10 + __pacmanlogfile)
 else begin
      if not  askyesno(mes_Clear_log + '?') then exit;
      if deletefile(__pacmanlogfile)
         then loadlog(sender);
  end;
end;

////////// CHECK FOR ERRORS IN SETTINGS FILES ////////////////////////////
procedure tmainfo.on_checkerrors(const sender: TObject);
  function checkfile(const num : integer; const fname : string; var b : boolean) : boolean;
  begin
    se_check[num] := fname + ' ' + mes_check;
    result := false;
    if system.pos('/',fname) = 0
       then result := FindBinaryBool(fname)
       else result := fileexists(fname);
    if result
       then begin 
              di_error[num] := 11; 
              se_answer[num] := mes_Ok; 
            end
       else begin 
              b := true; 
              di_error[num] := 13; 
              se_answer[num] := mes_Error; 
            end;
  end;
  
var f : textfile;
    s, s2 : string;
    b, b2 : boolean;
    i : integer;
    fs: tsearchRec;
begin
 wg_error.clear;
 wg_error.rowcount := 11;
 //se_check[6] := '   - ' + mes_verbosepkglists_switch_off;
 b := false;
 checkfile(0, 'pacman', b);
 checkfile(1, 'yaourt', b);
 checkfile(2, 'wget', b);
 checkfile(3, 'pkgfile', b);
 checkfile(4, __pacmanconf, b);
 checkfile(5, __mirrorlist, b);
{ 
 if not checkfile(5, __mirrorlist, b)
   then begin   
          di_error[6] := 13; 
          se_answer[6] := mes_Error;
        end
   else begin
          assignfile(f,__pacmanconf);
          reset(f);
          b2 := false;
          while not eof(f) do
            begin
              readln(f,s2);
              if length(s2) > 0 then  //delete all spaces in string :) 
                 for i := length(s2) downto 1 do 
                   if s2[i] = ' ' then delete(s2,i,1);
              if (system.pos('verbosepkglists', lowercase(s2)) = 1)
                 then b2 := true;
            end; 
          closefile(f); 
          if b2 then begin 
                       b := true; 
                       di_error[6] := 13;
                       se_answer[6] := mes_Error; 
                     end
                else begin
                       di_error[6] := 11;
                       se_answer[6] := mes_Ok;
                     end
        end;
}        
 checkfile(7, __yaourtrc, b) ;
 checkfile(8, 'repacman', b);
 s2 := getlocale;
 se_check[9] := 'Translate for current locale';
 if findfirst(__langspath + s2+ '.lang',faanyfile,fs) = 0
                then begin 
                       di_error[9] := 11;
                       se_answer[9] := mes_Ok;
                     end
                else begin
                       b := true; 
                       di_error[9] := 13;
                       se_answer[9] := mes_Error; 
                     end;
 findclose(fs);
 se_check[10] := 'Interface lang = Current locale';
 s := copy(dd_langs.value, 1,system.pos('.',dd_langs.value) - 1);
// writeln('s="',s,'"');
// writeln('s2="',s2,'"');
 if s = s2
                then begin 
                       di_error[10] := 11;
                       se_answer[10] := mes_Ok;
                     end
                else begin
                       b := true; 
                       di_error[10] := 13;
                       se_answer[10] := mes_Error; 
                     end;
 
 b_errors.visible := b; b_errors.update;
end;

/////////////////////////  about  /////////////////////////////////
procedure tmainfo.on_navigate_about(const sender: TObject);
begin
  tw_about.activepageindex := (sender as trichbutton).tag;
end;

procedure tmainfo.on_movedown_info(const sender: TObject);
begin
//  if spl1.top <> tw_info.top + tw_info.height - tw_info.tab_size - 5
//     then spl1.top := tw_info.top + tw_info.height - tw_info.tab_size - 5
//     else spl1.top := tw_info.top - 150 + tw_info.tab_size
//  if spl1.top = s_left.height - tw_info.height - spl1.height
//    then spl1.top := s_left.height - tw_info.tab_size
//    else spl1.top := s_left.height - tw_info.height - spl1.height
//  writeln(inttostr(s_left.height - tw_info.tab_size - spl1.height));  
//  writeln(inttostr(spl1.top));  

//  if spl1.top <  s_left.height - tw_info.tab_size - spl1.height
//    then spl1.top := s_left.height - tw_info.tab_size - spl1.height
//    else spl1.top := s_left.height - 145 - spl1.height;
//    writeln(tw_info.height);
//    writeln(s_left.height - __infotabsize - spl1.height);
//    writeln(__infotabsize);
   if spl1.top < s_left.height - __infotabsize - spl1.height
      then spl1.top := s_left.height - __infotabsize - spl1.height
      else spl1.top := s_left.height - 150 - __infotabsize - spl1.height;  
//    WRITELN(SPL1.TOP);  
end;
////////////////////////  find file  /////////////////////////////
procedure tmainfo.on_show_findfile(const sender: TObject);
begin
  s_findfile.visible := not s_findfile.visible;
  s_findfile.bringtofront;
end;

procedure tmainfo.onupdatelayout_spl(const sender: TObject);
begin
  s_findfile.left := s_left.left + b_find2.width + b_find.left + b_find.width - s_findfile.width;
end;
////////////// UPDATE PACKAGE LIST ////////////////////////////
procedure tmainfo.on_update_pkglist(const sender: TObject);
var i,c,y,_installed,_haveupdate : integer;
    output : string;
begin
 getpacmanversion;
    tw_df.clear;
    term_df.execprog('df /');
    wg_seslog.appendrow(false);
    te_seslog[wg_seslog.rowhigh] := '=======================================';
    wg_seslog.appendrow(false);
    te_seslog[wg_seslog.rowhigh] := mes_load_packagelist + ' ...';
    wg_seslog.appendrow(false);
    te_seslog[wg_seslog.rowhigh] := '=======================================';
    term_task.addline('=======================================');
    term_task.addline(mes_load_packagelist + ' ...');
    term_task.addline('=======================================');
  mainfo.cursor := cr_wait;
  application.processmessages;
  __firstshowpkglist := false;
  clearinfo;  
  on_clearquery(sender);
  if b_sinhmirrors.value then 
    begin
    lgf.caption := mes_sinh_mirrors + ' ...'; lgf.update;
    l_operation.caption := mes_sinh_mirrors + ' ...'; lgf.update;
    synhMirrors;
    end;

  lgf.caption := mes_orfans + ' ...'; lgf.update;  
  l_operation.caption := mes_orfans + ' ...'; lgf.update;  
  if __colorpacmanoutput
    then sl_orfans.text := exec('pacman -Qtdq --color never',true)
    else sl_orfans.text := getorfans;
    
//  writeln(sl_orfans.text);
  l_orfans.caption := '(' + inttostr( sl_orfans.count ) + ')';

  if __colorpacmanoutput
    then sl_expls.text := exec('pacman -Qe --color never',true)
    else sl_expls.text := getexpls;
  
  l_expl.caption := inttostr( sl_expls.count ); // here without '(' and ')' !!!
  
  c := sl_expls.count;
  if c > 0 then  
    for i := 0 to c - 1 do 
      if sl_expls[i] > '' then   //protect of ''
         sl_expls[i] := copy(sl_expls[i],1,system.pos(' ',sl_expls[i]) - 1);

  
  lgf.caption := mes_load_packagelist + ' ...'; lgf.update;
  l_operation.caption := mes_load_packagelist + ' ...'; lgf.update;

  if __colorpacmanoutput
    then output := exec('pacman -Ss --color never', true) + exec('pacman -Qs --color never', true)
    else output := getpackages;

  slg := tstringlist.create;
  slr := tstringlist.create;
  slr_ins := tstringlist.create;
  slg_ins := tstringlist.create;
  slcat := tstringlist.create;
  slcat_ins := tstringlist.create;

  updatearray(true, arr, output, sl_orfans, sl_expls, 
              slr, slg, slr_ins, slg_ins, slcat, slcat_ins, _installed,_haveupdate);

  l_all.caption := '(' + inttostr(high(arr) + 1) + ')';
  l_ins.caption := '(' + inttostr( _installed ) + ')';
  l_deps.caption := '(' + inttostr(_installed - strtoint(l_expl.caption)) + ')';
  l_haveupdate.caption := '(' + inttostr(_haveupdate) + ')';
  l_expl.caption := '(' + l_expl.caption + ')';
  
  slr.sort;
  slg.sort;
  slr_ins.sort;
  slg_ins.sort;
  slcat.sort;
  slcat_ins.sort;

  slg.Insert(0,mes_Without_group);
  slg_ins.Insert(0,mes_Without_group); 
  slcat.Insert(0,mes_all_packages);
  slcat_ins.Insert(0,mes_all_packages);

  dd_ar.dropdown.cols.clear;
  dd_ag.dropdown.cols.clear;
  dd_ir.dropdown.cols.clear;
  dd_ig.dropdown.cols.clear;
  dd_cat_all.dropdown.cols.clear;
  dd_cat_ins.dropdown.cols.clear;
 
  y := slg.count - 1;if y > 0 then for i := 0 to y do dd_ag.dropdown.cols.addrow(msestring(slg[i]));
  y := slr.count - 1;if y > 0 then for i := 0 to y do dd_ar.dropdown.cols.addrow(msestring(slr[i]));
  y := slg_ins.count - 1; if y > 0 then for i := 0 to y do dd_ig.dropdown.cols.addrow(msestring(slg_ins[i]));
  y := slr_ins.count - 1; if y > 0 then for i := 0 to y do dd_ir.dropdown.cols.addrow(msestring(slr_ins[i]));

  y := slcat.count - 1; if y > 0 then for i := 0 to y do dd_cat_all.dropdown.cols.addrow(msestring(slcat[i]));
  y := slcat_ins.count - 1; if y > 0 then for i := 0 to y do dd_cat_ins.dropdown.cols.addrow(msestring(slcat_ins[i]));

  lgf.caption := '';
  l_operation.caption := '';
  on_change_filter(sender);
  mainfo.cursor := cr_default;
  try
  if tw_main.activepage = tp_packages then 
       if se_filter.visible = true then se_filter.setfocus;
  except end;
    wg_seslog.appendrow(false);
    te_seslog[wg_seslog.rowhigh] := '==> ' + mes_done;
    wg_seslog.appendrow(false);
    te_seslog[wg_seslog.rowhigh] := '';
    term_task.addline('');
    term_task.addline('==> ' + mes_done);
    
end;

procedure tmainfo.on_change_filter(const sender: TObject);
var  s, ss : string;
     i, p : integer;
     arr_rows : tarrint;
     cat_all,cat_ins : string;
     sl : tstringlist;
     output : string;
  
  procedure showgrid(const ar_ : tarraytype);
  var i, r : integer;
  begin
  r := high(arr_rows);
  if r >= 0 then 
   begin
    twf.rowcount := r + 1;  
    for i := 0 to r do
     begin
      p := arr_rows[i];
      se_oper[i] := ar_[p,0];
      se_name[i] := ar_[p,1];
      se_name2[i] := ar_[p,1];
      se_ins[i] := ar_[p,2];
      se_aval[i] := ar_[p,3];
      se_group[i] := ar_[p,4];
      if ar_[p,4] = '(Out of Date)' then 
                    if be_colorize.value then twf.rowcolorstate[i] := 1;
      se_repo[i] := ar_[p,5];
      se_desc[i] := ar_[p,6];
      se_num[i]:= ar_[p,11]; 
      se_cat[i]:= ar_[p,12];
      se_collapce[i] := '+';
      if ar_[p,2] > '' then di_status.gridvalue[i] := 0;
      if ar_[p,10] > ''  
         then begin
              di_status.gridvalue[i] := 1;
              if be_colorize.value then twf.rowcolorstate[i] := 1;
              end;
      if ar_[p,0] = m_add then  di_oper.gridvalue[i] := 0;
      if ar_[p,0] = m_del then  di_oper.gridvalue[i] := 1;
     end; 
    twf.sort;  
   end;
  end;
     
begin
  mainfo.cursor := cr_wait;  
  clearinfo;
  if sender.classname = 'tbooleaneditradio' then          
     if not (sender as tbooleaneditradio).value 
        then exit //if value change  to false then exit
        ;
        
  if (sender = twf) then exit;
  s := LOWERCASE(trim(se_filter.text));

  if system.pos('(aur)',s) > 0
  then begin
       delete(s,system.pos(' (aur)',s),6);
       //ber_aur.value := true;
       l_aur.caption := 'true';
       end;
  //on_add_to_searchlist(sender);      
  
  cat_all := dd_cat_all.value; if cat_all = mes_all_packages then cat_all := '';
  cat_ins := dd_cat_ins.value; if cat_ins = mes_all_packages then cat_ins := '';

  lgf.caption := mes_search + ', ' + mes_please_wait + ' ...'; lgf.update;
  twf.clear;
  
  if ber_all.value then arr_rows := filter(s, arr, '', '', '', '', '','', '',ber_exact.value) //all
  else if dd_ag1.value  then arr_rows := filter(s, arr, '', '', dd_ag.value, '', '','', '',ber_exact.value) //all by group
  else if dd_ar1.value  then arr_rows := filter(s, arr, '', dd_ar.value, '', '', '','', '',ber_exact.value) //all by repo
  else if ber_ins.value then arr_rows := filter(s, arr, ' ', '', '', '', '','', '',ber_exact.value) //ins 
  else if dd_ig1.value  then arr_rows := filter(s, arr, ' ', '', dd_ig.value, '', '','', '',ber_exact.value)//ins by group
  else if dd_ir1.value     then arr_rows := filter(s, arr, ' ', dd_ir.value, '', '', '','', '',ber_exact.value)//ins by repo
  else if ber_expls.value  then arr_rows := filter(s, arr, ' ', '', '', 'e', '','', '',ber_exact.value) //expls
  else if ber_deps.value   then arr_rows := filter(s, arr, ' ', '', '', 'd', '','', '',ber_exact.value) //deps
  else if ber_orfans.value then arr_rows := filter(s, arr, ' ', '', '', '', 'o','', '',ber_exact.value) //orfans
  else if ber_haveupdate.value then arr_rows := filter(s, arr, ' ', '', '', '', '', ' ', '',ber_exact.value)   //have update
  else if dd_cat_all1.value then arr_rows := filter(s, arr, '', '', '', '', '', '',  cat_all, ber_exact.value)   //category
  else if dd_cat_ins1.value then arr_rows := filter(s, arr, ' ', '', '', '', '', '', cat_ins, ber_exact.value)   //category
  else if ber_aur.value then 
         begin
         lgf.caption := mes_search_in_AUR + ', ' + mes_please_wait + ' ...'; lgf.update;
         sl := tstringlist.create; //fake
         if s > '' then 
         begin
         output := '';
         s := s + ',';
         repeat
             ss := trim(copy(s,1,system.pos(',',s) - 1));
             delete(s,1,system.pos(',',s));
             if ss > '' then output := output + searchAur(ss);
         until system.pos(',',s) = 0;
         updatearray(false, arr_yaourt, output, sl_orfans, sl_expls, sl, sl, sl, sl, sl, sl, i, i);
         s := LOWERCASE(trim(se_filter.text));
         if system.pos('(aur)',s) > 0 then delete(s,system.pos(' (aur)',s),6);      
         arr_rows := filter(s, arr_yaourt, '', 'aur', '', '', '','', '',ber_exact.value);
         end;
       end
  else if be_query_all.value then filter_query('')
  else if be_query_ins.value then filter_query(m_add)
  else if be_query_del.value then filter_query(m_del);       

  if ber_aur.value then showgrid(arr_yaourt)
                   else showgrid(arr);
    
  lgf.caption := inttostr( twf.rowcount );
  mainfo.cursor := cr_default;
end;

//////////////////////////////// query filters //////////////////////////////////
procedure tmainfo.filter_query(const oper : string);
var i,r,c : integer;
begin
  twf.clear;
  c := sg_query.rowcount;
  if c > 0 then
  for i := 0 to c - 1 do
    begin
      if oper > '' then 
         if oper <> sg_query[0][i] then continue;
         
      twf.rowcount := twf.rowcount + 1;
      r := twf.rowcount - 1;
      se_oper[r] := sg_query[0][i];
      se_name[r] := sg_query[1][i];
      se_name2[r] := sg_query[1][i];
      se_ins [r] := sg_query[2][i];
      se_aval[r] := sg_query[3][i];
      se_group[r] := sg_query[4][i];
      se_repo[r] := sg_query[5][i];
      se_desc[r] := sg_query[6][i];
      se_num[r] := sg_query[11][i];
      se_cat[r] := sg_query[12][i];
      se_collapce[r] := '+';
      if sg_query[2][i] > '' then di_status.gridvalue[r]:= 0;
      if sg_query[10][i] > '' then di_status.gridvalue[r] := 1;
      if sg_query[0][i] = m_add then  di_oper.gridvalue[r] := 0;
      if sg_query[0][i] = m_del then  di_oper.gridvalue[r] := 1;
    end;
  lgf.caption := inttostr( twf.rowcount )
end;

procedure tmainfo.on_change_repo_group(const sender: TObject);
begin
  (findcomponent(twidget(sender).name + '1') as tbooleaneditradio).value := true;
  on_change_filter(sender);
end;
////////////////////////////////search /////////////////////////////////////////
procedure tmainfo.on_clear_searchbox(const sender: TObject);
begin
  se_filter.text := '';
  on_change_filter(sender);
end;
//drop down history search
procedure tmainfo.on_set_search_text(const sender: TObject;  var avalue: msestring; var accept: Boolean);
begin
  se_filter.text := avalue;
  if system.pos('(AUR)',avalue) = 0
  then begin 
       if ber_aur.value 
          then ber_all.value := true
          else on_change_filter(sender);
       end
  else begin
       if not ber_aur.value 
          then ber_aur.value := true
          else on_change_filter(sender);
       end;  
end;
// write search word(s)
procedure tmainfo.on_search_keyup(const sender: twidget; var ainfo: keyeventinfoty);
begin
  if ss_ctrl in ainfo.shiftstate then
  else
  if not ber_aur.value 
     then on_change_filter(sender)
     else if ainfo.key = key_return then on_change_filter(sender);
end;
//////////////////////////////// settings ////////////////////////
procedure tmainfo.on_navigate_sets(const sender: TObject);
begin
    tw_sets.activepageindex := (sender as trichbutton).tag;

end;

///////////////////////////// PACKAGE INFO /////////////////////////////////////
//clear all package info
procedure tmainfo.clearinfo;
begin
  l_pkgname.caption := '';
  l_pkginfo.caption := '';
  l_repo.caption := '';
  sg_info.clear;
  wg.clear;
  wg_check.clear;
  wg_tree.clear;
  im_thumb.bitmap.clear;
  l_thumb.caption := mes_No_screenshot;
end;

procedure tmainfo.on_cell_event_get_package_info(const sender: TObject;var info: celleventinfoty);
var r : integer;
begin
  r := twf.row;
  if r < 0 then exit;
  if (iscellclick(info, [ccr_buttonpress]))or
     (cellkeypress(info) = key_up)or
     (cellkeypress(info) = key_down)
  then begin 
  //writeln('r=',inttostr(r));
         if (cellkeypress(info) = key_up) then dec(r);
         if r < 0 then exit;
         if (cellkeypress(info) = key_down) then inc(r);
         if r = twf.rowcount then exit;

         if (iscellclick(info, [ccr_buttonpress])) then 
             begin
             if (twf.col = 0)or(twf.col = 1) then autoselect(r);
             if twf.col = 2 then 
                begin
                 if twf.rowheight[r] > rowheight
                 then begin
                      twf.rowheight[r] := rowheight;
                      se_collapce.gridvalue[r] := '+';
                      se_name2[r] := se_name[r];
                      end
                 else begin
                      twf.rowheight[r] := rowheightEx;
                      se_collapce.gridvalue[r] := '--';
                      se_name2[r] := se_name[r] + #10#10 +  
                      '     ' + se_desc[r] + #10#10 + 
                      '     ' + mes_Installed_version + ': ' + se_ins[r] + #10 + 
                      '     ' + mes_Available_version + ' : ' + se_aval[r] + #10 +
                      '     ' + mes_Group + ' : ' + se_group[r] + #10 + 
                      '     ' + mes_Repository + ' : ' + se_repo[r];
                      end;
                end;
             end;
         try
         
         clearinfo;
         //if l_pkgname.caption = trim(se_name[r]) then 
         on_info_changepage(sender);
         except end;
         end;
end;


//key press in table, if column = 0 then query management
procedure tmainfo.autoselect(r : integer);
begin
  
  if se_oper[r] = '' 
     then on_add_remove_clear(b_ins)
     else if (se_oper[r] = m_add) 
             then begin
                    if (se_ins[r] > '') 
                        then on_add_remove_clear(b_del)
                        else on_add_remove_clear(b_cancel)
                  end
             else if se_oper[r] = m_del then on_add_remove_clear(b_cancel);
  countquery;
end;

procedure tmainfo.on_info_changepage(const sender: TObject);
var s : string;
   sl : tstringlist;
    i,r : integer;
ainfo : mouseeventinfoty;
  pkg : string; 
begin
  if twf.row < 0 then exit;
  r := twf.row;
  pkg := se_name[r];
  if system.pos('/',pkg)> 0 then delete(pkg,1,system.pos('/',pkg));
  
  if term_check.running then term_check.killprocess;
  if term_files.running then term_files.killprocess;
  if term_thumb.running then term_thumb.killprocess;
  
  l_request.caption := mes_please_wait + ' ...';
  l_request.font.color := cl_red;  
  case tw_info.activepageindex of 
  0 : begin
     //screen shots
     BEGIN
         l_pkgname.caption := trim(se_name[r]);  //get info anyway
         l_pkginfo.caption := trim(se_desc[r]);  //one package may be in
         l_repo.caption := trim(se_repo[r]);     //different repos
     
     im_thumb.bitmap.clear;
     if not be_noscreenshot.value
     then l_thumb.caption := mes_Screenshots_are_switch_off
     else 
     BEGIN
       try  
        l_thumb.caption := mes_loading_screenshot + '...';
        im_thumb.bitmap.loadfromfile(__imagesdir + pkg);
        application.processmessages;
        l_thumb.caption := '';
       except
         deletefile(__imagesdir + pkg);
         l_thumb.caption := mes_Seaching_screenshot + '...';
         application.processmessages;
         forcedirectories(__imagesdir);

              term_thumb.execprog('wget --output-file=wget.log -P ' + __imagesdir
                + ' http://screenshots.debian.net/thumbnail/'
                + pkg + ' 2 > /dev/null');
         
      end; //TRY
     END;
     END;
       l_request.caption := '';
      end;
  1 : begin // format info request 
        if sg_info.rowcount > 0 then 
           begin
             l_request.caption := '';
             exit;
           end; 
        s := se_name[twf.row];
        if s = '' 
           then s := 'pacman -Sii ' + pkg
           else begin
                 if not ber_aur.value 
                    then begin 
                         if __colorpacmanoutput 
                           then s := 'pacman -Qii ' + pkg + ' --color never'
                           else s := 'pacman -Qii ' + pkg;
                         end
                    else s := 'yaourt -Qii ' + pkg;
                end;
//============
  l_request.caption := '';//mes_Done;
  //l_request.font.color := cl_black;
  sl := tstringlist.create;
  sl.text := engine.exec(s, true);
  if sl.count > 0 then   
  for i := 0 to sl.count - 1 do
    begin
         if trim(sl[i]) = '' then continue;
         s := sl[i];
         sg_info.rowcount := sg_info.rowcount + 1;
         if system.pos(' ',s) <> 1 
           then begin
                if system.pos(':',s) > 0
                then begin
                     sg_info[0][sg_info.rowcount - 1] := copy(s,1,system.pos(':',s) - 1);
                     delete(s,1,system.pos(':',s));
                     end;
                end;     
         if system.pos('	',s) > 0 //not work
            then begin
                 sg_info[0][sg_info.rowcount - 1] := copy(s,1,system.pos('	',s) - 1);
                 delete(s,1,system.pos('	',s));
                 end;
         sg_info[1][sg_info.rowcount - 1] := trim(s);
       end;
  sl.free; 
//============
      end;

  2 : begin
        if wg.rowcount > 0 then
         begin
            l_request.caption := '';//mes_Done;
            l_request.font.color := cl_black;
            exit;
         end;        
        s := se_name[twf.row];
        

        if s = '' 
         then s := 'pkgfile -l ' + pkg
         else begin
               if not ber_aur.value 
                 then begin 
                         if __colorpacmanoutput 
                           then s := 'pacman -Ql ' + pkg + ' --color never'
                           else s := 'pacman -Ql ' + pkg
                      end
                 else s := 'yaourt -Ql ' + pkg + ' --nocolor';
              end;  
              writeln(s);
        term_files.execprog(s);
      end;
  3 : begin         // check package
        if wg_check.rowcount > 0 then 
          begin 
            l_request.caption := '';//mes_Done;
            l_request.font.color := cl_black;
            exit;
          end;
        s := trim(pkg);
        if __colorpacmanoutput 
          then term_check.execprog('pacman -Qk ' + s + ' --color never')
          else term_check.execprog('pacman -Qk ' + s);
      end;
  4 : begin         // tree
      writeln(pkg);
        if wg_tree.rowcount > 0 then 
          begin 
            l_request.caption := '';//mes_Done;
            l_request.font.color := cl_black;
            exit;
          end;
        s := trim(pkg);
        writeln(pkg);
        term_tree.execprog('pactree ' + s);
      end;
  end;//case     
     IF screenshotfo.VISIBLE THEN BEGIN 
            ainfo.eventkind := ek_buttonpress;
            on_show_screenshot(im_thumb,AINFO);
            END;
end;

///////////////////////////   screen form  ////////////////////////
procedure tmainfo.on_show_screenshot(const sender: twidget;var ainfo: mouseeventinfoty);
var pkg : string;
begin
  if be_noscreenshot.value then
  if (sender = im_thumb) and (ainfo.eventkind = ek_buttonpress) then
     begin
       screenshotfo.im_.bitmap.clear;
       screenshotfo.show;
       //screenshotfo.bringtofront;
       application.processmessages;
       pkg := se_name[twf.row];
       if system.pos('/',pkg)> 0 then delete(pkg,1,system.pos('/',pkg));
       
//==============================================
       try  
        forcedirectories(__imagesdir);
        screenshotfo.l_screenshot_info.caption := mes_loading_screenshot + ' ...';
        screenshotfo.l_screenshot_info.update;
        screenshotfo.im_.bitmap.loadfromfile(__imagesdir + pkg + '.1');
        screenshotfo.l_screenshot_info.caption := '';
        screenshotfo.l_screenshot_info.update;
       except
         screenshotfo.l_screenshot_info.caption := mes_Seaching_screenshot + ' ...';
         screenshotfo.l_screenshot_info.update;
         deletefile(__imagesdir + pkg + '.1');
//         application.processmessages;
///         if DownloadHTTP('http://screenshots.debian.net/screenshot/' + pkg,__imagesdir + pkg + '.1')
//         Exec('wget http://screenshots.debian.net/screenshot/' + pkg +' -O '+
//                    __imagesdir + pkg + '.1 2 > /dev/null',true);
//    t_.execprog('wget --output-file=wget.log -P ' + sys_getuserhomedir + '/.Almin-Soft/PacmanXG/images 
//             'http://screenshots.debian.net/screenshot/' + sgf.datacols[1][sgf.row])

         term_thumb2.execprog('wget --output-file=wget.log http://screenshots.debian.net/screenshot/'
                    + pkg +' -P '+
                    __imagesdir + ' 2 > /dev/null');
       end;
//==============================================
     end;
end;

////////////////////////// QUERY (add, remove, clear) //////////////////////////////////
procedure tmainfo.on_add_remove_clear(const sender: TObject);
var  b : boolean;
     a : array of integer;
     i, z, r, c, cq : integer;
     operation, sq, sf : string;
begin
  if twf.rowcount <= 0 then exit;
  setlength(a, twf.datacols.selectedcellcount);
  a := twf.datacols.selectedrows;

  if sender = b_cancel then operation := ''; 
  if sender = b_ins then operation := m_add;
  if sender = b_del then operation := m_del;
  
  c := high(a);
//  writeln('c=',inttostr(c));

  for i := 0 to c do
    begin
      r := a[i];
      if operation = m_del then 
        if se_ins[r] = '' then continue;
       
      b := false;
      cq := sg_query.rowhigh;
      if cq >= 0 then
        for z := cq downto 0 do
        BEGIN
         sq := sg_query[1][z];
         if system.pos('/',sq)>0 then delete(sq,1,system.pos('/',sq));

         sf := se_name[r];

         if system.pos('/',sf)>0 then delete(sf,1,system.pos('/',sf));
         if (sq = sf) 
         then begin
              if (sg_query[0][z] = operation) 
              then begin
                   b := true;
                   break;
                   end;
              if (operation = '')
              then begin
                   sg_query.deleterow(z);
                   b := true;
                   break;
                   end;
              if (sg_query[0][z] <> operation)
              then begin
                   sg_query.deleterow(z);
                   break;
                   end;
              end;
      END;
      se_oper[r] := operation;  
      arr[strtoint(se_num[r]),0] := operation;  
      
      //writeln(operation);
      if operation = m_del then di_oper.gridvalue[r] := 1
      else if operation = m_add then di_oper.gridvalue[r] := 0
      else di_oper.gridvalue[r] := -1;
      
      if b then continue;
      z := sg_query.rowcount;
      sg_query.rowcount := z + 1;
      sg_query[0][z] := se_oper[r];
      if operation = m_add
         then  sg_query[1][z] := se_repo[r] + '/' + se_name[r]
         else  begin
               sf := se_name[r];
               if system.pos('/',sf) > 0 then delete(sf,1,system.pos('/',sf));
               sg_query[1][z] := sf;
               se_name[r] := sf;
               end;
      sg_query[2][z] := se_ins[r];
      sg_query[3][z] := se_aval[r];
      sg_query[4][z] := se_group[r];
      sg_query[5][z] := se_repo[r];
      sg_query[6][z] := se_desc[r];
      sg_query[11][z] := se_num[r];
    end;
  if (be_query_all.value)or(be_query_ins.value)or(be_query_del.value)
  then on_change_filter(sender);
  countquery;
end;

procedure tmainfo.on_clearquery(const sender: TObject);
var  i : integer;
begin
  sg_query.clear;  
  for i := 0 to twf.rowhigh do 
    begin
     se_oper[i] := '';
     di_oper.gridvalue[i] := -1;
    end;
  for i := 0 to high(arr) do arr[i,0] := '';
  l_query_all.caption := '0';
  l_query_ins.caption := '0';
  l_query_del.caption := '0';
  if (be_query_all.value)or(be_query_ins.value)or(be_query_del.value)
     then on_change_filter(sender);  
end;

procedure tmainfo.countquery;
var i, oi,od : integer;
begin
 oi := 0 ; od := 0;
 for i := 0 to sg_query.rowhigh do
     begin
       if sg_query[0][i] = m_add then inc(oi);
       if sg_query[0][i] = m_del then inc(od);
     end;
 l_query_ins.caption := inttostr(oi);
 l_query_del.caption := inttostr(od);
 l_query_all.caption := inttostr(oi+od);
end;
/////////////////////// SETTINGS //////////////////////////
procedure tmainfo.on_set_font(const sender: TObject);
var fi : tinifile;
     c : colorty;
begin
  //color theme
  fi := tinifile.create(__themepath + 'themes');
  
  mainfo.color := fi.readinteger(dd_themes.value,'FormColor',$FFFFFF);
  screenshotfo.color := mainfo.color;
  
  paramsfo.color := mainfo.color;
  
  twf.datacols.linecolor    := mainfo.color;
  twf.datacols.linecolorfix := mainfo.color;
  
  sg_info.datacols[0].color := fi.readinteger(dd_themes.value,'TextClientColor',$F0F0F0);

  //twf.zebra_color  := mainfo.color;
  
  mainfo.font.color := fi.readinteger(dd_themes.value,'FontColor',$FFFFFF);
  screenshotfo.font.color := mainfo.font.color;
  paramsfo.font.color := mainfo.font.color;
  tw_task.font.color := mainfo.font.color;
  
  tspacer23.frame.font.color := mainfo.font.color;
  tspacer30.frame.font.color := mainfo.font.color;
  tspacer19.frame.font.color := mainfo.font.color;
  tspacer39.frame.font.color := mainfo.font.color;

  ber_aur.frame.font.color := mainfo.font.color;
  ber_all.frame.font.color := mainfo.font.color;
  ber_ins.frame.font.color := mainfo.font.color;
  
  s_del_opt.frame.font.color := mainfo.font.color;
  s_ins_opt.frame.font.color := mainfo.font.color;
  s_trans_ask.frame.font.color := mainfo.font.color;
  
  l_pkgname.font.color := mainfo.font.color;
  l_repo.font.color := mainfo.font.color;
  
  s_topmenu.color := fi.readinteger(dd_themes.value,'toppanelcolor',$707070);
//  screenshotfo.tspacer1.font.color := font.color;
  b_menu.color := fi.readinteger(dd_themes.value,'toppanelcolor',$707070);
  s_topmenu.font.color := fi.readinteger(dd_themes.value,'TopFontcolor',$ffffff);
  b_menu.font.color := fi.readinteger(dd_themes.value,'TopFontcolor',$ffffff);
  
 
  f_topbuttons.template.fade_color[0] := fi.readinteger(dd_themes.value,'TopButtonColor1',$7D7D7D);
  f_topbuttons.template.fade_color[1] := fi.readinteger(dd_themes.value,'TopButtonColor2',$696969);
  f_topbuttons_click.template.fade_color[0] := fi.readinteger(dd_themes.value,'TopButtonColorClicked1',$7D7D7D);
  f_topbuttons_click.template.fade_color[1] := fi.readinteger(dd_themes.value,'TopButtonColorClicked2',$696969);
  
  fr_topbuttons.template.Colorframe := fi.readinteger(dd_themes.value,'TopButtonFrameColor',$707070);
  fr_topbuttons.template.frameWidth := fi.readinteger(dd_themes.value,'TopButtonFrameWidth',0);

  fr_mainbuttons.template.Colorframe := fi.readinteger(dd_themes.value,'MainButtonFrameColor',$707070);
  fr_mainbuttons.template.frameWidth := fi.readinteger(dd_themes.value,'MainButtonFrameWidth',0);

  f_buttons.template.fade_color[0] := fi.readinteger(dd_themes.value,'ButtonColor1',$7D7D7D);
  f_buttons.template.fade_color[1] := fi.readinteger(dd_themes.value,'ButtonColor2',$696969);
  f_buttons_click.template.fade_color[0] := fi.readinteger(dd_themes.value,'ButtonColorClicked1',$7D7D7D);
  f_buttons_click.template.fade_color[1] := fi.readinteger(dd_themes.value,'ButtonColorClicked2',$696969);
  
  fr_buttons.template.Colorframe := fi.readinteger(dd_themes.value,'ButtonFrameColor',$C2C2C2);
  fr_buttons.template.frameWidth := fi.readinteger(dd_themes.value,'ButtonFrameWidth',1);

  fr_panels.template.ColorClient := fi.readinteger(dd_themes.value,'PanelClientColor',$EDEDED);
  fr_panels.template.Colorframe  := fi.readinteger(dd_themes.value,'PanelFrameColor',$C2C2C2);
  fr_panels.template.frameWidth  := fi.readinteger(dd_themes.value,'PanelFrameWidth',1);

  fr_text_with_border.template.ColorClient := fi.readinteger(dd_themes.value,'TextClientColor',$F0F0F0);
  fr_text_with_border.template.Colorframe  := fi.readinteger(dd_themes.value,'TextFrameColor',$C2C2C2);
  fr_text_with_border.template.frameWidth  := fi.readinteger(dd_themes.value,'TextFrameWidth',1);

  l_appname.font.shadow_color := s_topmenu.color;
  l_appname.font.color := mainfo.font.color;
  
//  l_aboutcapt.font.shadow_color := s_topmenu.color;
//  l_aboutcapt.font.color := mainfo.font.color;
  
  c := fi.readinteger(dd_themes.value,'tableSelectColor',$707070);
//  writeln('color="' + inttostr(c) + '"');
  twf.datacols.colorfocused := c;
  twf.datacols.colorselect  := c;
  wg_dizz.datacols.colorfocused := c;
  tw_drgd.datacols.colorfocused := c;
  wg_cache.datacols.colorfocused := c;
  wg_newssite.datacols.colorfocused := c;
  wg_news_titles.datacols.colorfocused := c;
  tw_history.datacols.colorfocused := c;
  wg_mylist.datacols.colorfocused := c;
  wg_log_dates.datacols.colorfocused := c;
  wg_tree.datacols.colorfocused := c;
  paramsfo.wg_home.datacols.colorfocused := c;
  se_filter2.dropdown.cols.colorselect := c;
  dd_ag.dropdown.cols.colorselect := c;
  dd_ar.dropdown.cols.colorselect := c;
  dd_cat_all.dropdown.cols.colorselect := c;
  dd_ig.dropdown.cols.colorselect := c;
  dd_ir.dropdown.cols.colorselect := c;
  dd_cat_ins.dropdown.cols.colorselect := c;
  
  dd_term.dropdown.cols.colorselect := c;
  dd_finav.dropdown.cols.colorselect := c;
  dd_texteditor.dropdown.cols.colorselect := c;
  dd_fonts.dropdown.cols.colorselect := c;
  dd_themes.dropdown.cols.colorselect := c;
  dd_langs.dropdown.cols.colorselect := c;
  lgf.color := c;
  twf.datarowlinecolor := mainfo.color;

  pm.menu.font.color := mainfo.font.color;
  pm_filelist.menu.font.color := mainfo.font.color;
  
  
  fi.free;
  //FONTS
  FONT.NAME := dd_fonts.value;
  font.height := ie_heightfont.value;

  pm.menu.font.name := dd_fonts.value;
  pm.menu.font.height := ie_heightfont.value;

  pm_filelist.menu.font.name := dd_fonts.value;
  pm_filelist.menu.font.height := ie_heightfont.value;

// and how do it in realtime ? 
//  tw_drgd.rowfonts[0] := dd_fonts.value;
//  tw_drgd.rowfonts.items[0].name[0] := dd_fonts.value;
//  tw_drgd.rowfonts[0].height := ie_heightfont.value;

  paramsfo.FONT.NAME := dd_fonts.value;
  paramsfo.font.height := ie_heightfont.value;

  screenshotfo.FONT.NAME := dd_fonts.value;
  screenshotfo.font.height := ie_heightfont.value;

  s_topmenu.FONT.NAME := dd_fonts.value;
  s_topmenu.FONT.height := ie_heightfont.value;
  b_menu.FONT.NAME := dd_fonts.value;
  b_menu.FONT.height := ie_heightfont.value;
  //start
  L_newver.FONT.NAME := dd_fonts.value;
  L_newver.FONT.height := ie_heightfont.value;
  b_errors.FONT.NAME := dd_fonts.value;
  b_errors.FONT.height := ie_heightfont.value;
  //pkg management
  l_pkgname.FONT.NAME := dd_fonts.value;
  l_pkgname.FONT.height := ie_heightfont.value;
  l_repo.FONT.NAME := dd_fonts.value;
  l_repo.FONT.height := ie_heightfont.value;
  ber_aur.frame.FONT.NAME := dd_fonts.value;
  ber_aur.frame.FONT.height := ie_heightfont.value;
  ber_all.frame.FONT.NAME := dd_fonts.value;
  ber_all.frame.FONT.height := ie_heightfont.value;
  ber_ins.frame.FONT.NAME := dd_fonts.value;
  ber_ins.frame.FONT.height := ie_heightfont.value;
  be_query_all.frame.FONT.NAME := dd_fonts.value;
  be_query_all.frame.FONT.height := ie_heightfont.value;
  //settings - interface
  tspacer30.frame.FONT.NAME := dd_fonts.value;
  tspacer30.frame.FONT.height := ie_heightfont.value;
  tspacer23.frame.FONT.NAME := dd_fonts.value;
  tspacer23.frame.FONT.height := ie_heightfont.value;
  tspacer19.frame.FONT.NAME := dd_fonts.value;
  tspacer19.frame.FONT.height := ie_heightfont.value;
  tspacer39.frame.FONT.NAME := dd_fonts.value;
  tspacer39.frame.FONT.height := ie_heightfont.value;
  //exec window
  s_exec_top.FONT.NAME := dd_fonts.value;
  s_exec_top.FONT.height := ie_heightfont.value;
  //lang
  on_set_lang(sender);
  on_checkerrors(sender);
end;

/////////////// SETTINGS /////////////////////////////////////
procedure tmainfo.on_changefilterpanelposition(const sender: TObject);
begin
  spl2.linkleft := nil;
  spl2.linkright:= nil;
  if b_filterpanelpos.value 
     then begin
            s_right.anchors := [an_top,an_left,an_bottom];
            spl2.anchors := [an_top,an_left,an_bottom];
            
            s_right.left := s_left.left;
            spl2.left := s_right.left + s_right.width;
            s_left.left := spl2.left + spl2.width;
            
            spl2.linkleft := s_right;
            spl2.linkright := s_left;
          end
     else begin
            s_right.anchors := [an_top,an_right,an_bottom];
            spl2.anchors := [an_top,an_right,an_bottom];
            
            s_left.left := s_right.left;
            spl2.left := s_left.left + s_left.width;
            s_right.left := spl2.left + spl2.width;
            
            spl2.linkleft := s_left;
            spl2.linkright := s_right;
          end;
end;

procedure tmainfo.on_show_left_menu(const sender: TObject; var avalue: Boolean;var accept: Boolean);
begin
  if not avalue then begin 
                 s_menu.width := 50;
                 b_menu.width := 0;
                 bmenu1.optionswidget1 := [ow1_autoscale,ow1_autowidth];
                 b_about1.width := 38;
                 trichbutton32.width := 38;
                 on_showmenu(sender)
                 end
            else begin 
                 b_menu.width := 50;
                 b_about1.width := 0;
                 trichbutton32.width := 0;
                 bmenu1.optionswidget1 := [];
                 bmenu1.width := 0;
                 end;
end;

//////////////////////////////////////  settings files ////////////////////////
procedure tmainfo.loadfile(fname : string ; const tw : twidgetgrid; const te : ttextedit);
var s : string;
    f : textfile;
begin
  tw.clear;
  if not fileexists(fname) then 
    begin
    tw.appendrow(false);
    te[tw.rowhigh] := mes_File_not_found + ' ' + fname;
      exit;
    end;
  assignfile(f,fname);
  reset(f);
  while not eof(f) do begin
    readln(f,s);
    tw.appendrow(false);
    te[tw.rowhigh] := s;
  end; 
  closefile(f); 
end;

procedure tmainfo.on_load_pacmanconf(const sender: TObject);
begin  loadfile(__pacmanconf,tw_pacman_conf,te_pacman_conf);
end;

procedure tmainfo.on_load_mirrorlist(const sender: TObject);
begin  loadfile(__mirrorlist, tw_mirrorlist,te_mirrorlist);
end;

procedure tmainfo.on_load_yaourtrc(const sender: TObject);
begin  loadfile(__yaourtrc, tw_yaourtrc,te_yaourtrc);
end;

procedure tmainfo.savefile(fname : string ; const tw : twidgetgrid; const te : ttextedit);
var f : textfile;
    i : integer;
begin
  assignfile(f,fname);
  {$I-}rewrite(f);{$I+}
  if ioresult <> 0 then
    begin
      show_empty(mes_error,mes_Cant_save_file + '! ' + mes_Have_you_rights_to_do_it);
      exit;
    end;
  append(f);
  for i := 0 to tw.rowhigh do writeln(f,te[i]); 
  closefile(f); 
  show_empty('',mes_Saved);
end;

procedure tmainfo.on_save_pacmanconf(const sender: TObject);
begin  savefile(__pacmanconf,tw_pacman_conf,te_pacman_conf);
end;

procedure tmainfo.on_save_mirrorlist(const sender: TObject);
begin  savefile(__mirrorlist,tw_mirrorlist,te_mirrorlist);
end;

procedure tmainfo.on_save_yaourtrc(const sender: TObject);
begin  savefile(__yaourtrc,tw_yaourtrc,te_yaourtrc);
end;

function tmainfo.check_util_cmdline(cmd : string) : string;
begin
  result := cmd;
  if cmd = 'konsole' then result := cmd + ' --nofork';
  if cmd = 'gedit' then result := cmd + ' -s';
end;

procedure tmainfo.on_run_util(const sender: TObject);
var cmd : string;
begin
  cmd := (findcomponent('d' + (sender as trichbutton).name) as tdropdownlistedit).value;
  cmd := check_util_cmdline(cmd);
  shell(cmd + ' &');
  //Exec(cmd, false);
end;


procedure tmainfo.on_close_stop_oper(const sender: TObject);
begin
  if term_task.running then 
  if not askyesno(MES_TERMINATEPROCESS) then exit;
    s_oper.visible := false;
    tw_main.enabled := true;
    s_topmenu.enabled := true;
    if term_task.running then term_task.killprocess;
    if __exitafterexec then application.terminate;
end;
//////////////////   MY PLAYLIST ///////////////////////////////////////
procedure tmainfo.on_add_to_mylist(const sender: TObject);
var a : array of integer;
    i : integer;
begin
  setlength(a, twf.datacols.selectedcellcount);
  a := twf.datacols.selectedrows;
  
  if (high(a) = -1)and(twf.row > -1) 
     then begin
          setlength(a,1);
          a[0] := twf.row;
          end;
  
  for i := 0 to high(a) do  
    begin 
    wg_mylist.rowcount := wg_mylist.rowcount + 1;
    se_package[wg_mylist.rowcount - 1] := se_repo[a[i]] + '/' + se_name[a[i]]
    end;
end;

procedure tmainfo.on_select_mylist(const sender: TObject; var avalue: Boolean; var accept: Boolean);
var i : integer;
begin
  if wg_mylist.rowcount > 0 then 
    for i := 0 to wg_mylist.rowcount - 1 do ber_[i] := avalue;
end;

procedure tmainfo.on_delete_in_my_list(const sender: TObject);
var row : integer;
      b : boolean;
begin
   b := false;
   if wg_mylist.rowcount > 0 then 
   for row := wg_mylist.rowcount - 1 downto 0 do
       if ber_[row]
          then begin 
               b := true;
               wg_mylist.deleterow(row);
               application.processmessages;
               end;
   if not b then
      if wg_mylist.row >= 0
      then wg_mylist.deleterow(wg_mylist.row);
end;

procedure tmainfo.on_open_my_list(const sender: TObject);
begin
 if fd.execute = mr_ok then
 begin
  se_mylist_fname.value := fd.controller.filename;
  open;
 end;
end;

procedure tmainfo.open;
var f : textfile;
    s : string;
begin
   assignfile(f,se_mylist_fname.value);
   {$i-} reset(f); {$i+}
   If IOResult<>0 Then
     begin
       Show_empty(mes_error,mes_File_not_found + ' ' + se_mylist_fname.value);
       closefile(f);
       exit;
     end;
   wg_mylist.clear;
   while not eof(f) do 
     begin
       readln(f,s);
       wg_mylist.rowcount := wg_mylist.rowcount + 1;
       se_package[wg_mylist.rowhigh] := s;
     end;
   closefile(f);
end;

procedure tmainfo.on_save_my_list(const sender: TObject);
begin
 if fd.execute = mr_ok then
 begin
  se_mylist_fname.value := fd.controller.filename;
  save;
 end;
end;

procedure tmainfo.save;
var   f : textfile;
    row : integer;
begin
   if wg_mylist.rowcount > 0 then 
   BEGIN
   assignfile(f,se_mylist_fname.value);
   {$i-} rewrite(f); {$i+}
   If IOResult<>0 Then
     begin
       Show_empty(mes_error,mes_Cant_save_file + ' ' + se_mylist_fname.value);
       closefile(f);
       exit;
     end;
   for row := 0 to wg_mylist.rowcount - 1 do writeln(f,se_package[row]);
   closefile(f);
   END;
end;

procedure tmainfo.on_select_cache(const sender: TObject; var avalue: Boolean;
               var accept: Boolean);
var i : integer;
begin
  if wg_cache.rowcount > 0 then 
    for i := 0 to wg_cache.rowcount - 1 do ber_cache[i] := avalue;
end;

procedure tmainfo.on_delete_files_from_cache(const sender: TObject);
var row : integer;
begin
  mainfo.cursor := cr_wait;  
  if wg_cache.rowcount > 0 then 
    for row := 0 to wg_cache.rowcount - 1 do
       if ber_cache[row]
         then begin 
              if not trydeletefile('/var/cache/pacman/pkg/' + se_file[row])
                 then se_status[row] := mes_Cant_delete_file
                 else se_status[row] := mes_Ok;
              application.processmessages;
              end;
  mainfo.cursor := cr_default;
end;

//////////////////////////   cache ///////////////////////////
procedure tmainfo.on_update_cachelist(const sender: TObject);

  function countfilesize(const fz : integer) : string;
    begin
      result := inttostr(fz) + ' b';
      if fz > 1024 then result := inttostr(fz div 1024) + ' Kb';
      if fz > 1024 * 1024 then result := inttostr(fz div (1024 * 1024) ) + ' Mb';
      if fz > 1024 * 1024 * 1024 then result := inttostr(fz div (1024 * 1024 * 1024) ) + ' Gb';
    end;
    
var fs : tsearchrec;
    r  : integer;
    fz : integer;
begin
  mainfo.cursor := cr_wait;  
  l_cache_info.caption := mes_please_wait + ' ...';
  application.processmessages;
  wg_cache.clear;
  if sender <> b_find_in_cache then e_cache.text := '';
  tbooleanedit2.value := false;
  fz:= 0;
  
  if findfirst(__cachedir + '*' + e_cache.text + '*tar.xz',faanyfile,fs) = 0
  then repeat
          r := wg_cache.rowcount;
          wg_cache.rowcount := r + 1;
          se_file[r] := fs.name;
          se_filesize[r] := countfilesize(fs.size);
          fz := fz + fs.size;
          application.processmessages;
       until findnext(fs) <> 0;
  wg_cache.sort;
  mainfo.cursor := cr_default;
  l_cache_info.caption := '';
  l_cache_files_info.caption := inttostr(r) + ' ' + mes_files + ', ' + countfilesize(fz);
  e_cache.setfocus;
end;

procedure tmainfo.on_logs_keyup(const sender: twidget; var ainfo: keyeventinfoty);
begin
  if ainfo.key = key_return then on_find_in_log(sender);
end;

procedure tmainfo.on_cache_keyup(const sender: twidget; var ainfo: keyeventinfoty);
begin
  if ainfo.key = key_return then on_update_cachelist(b_find_in_cache);
end;

procedure tmainfo.on_clear_dgrd_searchbox(const sender: TObject);
begin
  e_dgrd_searchbox.text := '';
  tw_drgd.clear;
end;

procedure tmainfo.on_drgd_search(const sender: TObject);
var fs : tsearchrec;
    r : integer;
    arh : string;
    s, s_f, sname : string;
    i : integer;
    
begin
  l_dgrd_info.caption := mes_please_wait + ' ...';
  mainfo.cursor := cr_wait;  
  application.processmessages;
  tw_drgd.clear;
  tw_drgd.rowcount := 1;
  //tw_drgd.rowcolorstate[0] := 1;
  tw_drgd.rowfontstate[0] := 0;
  se_dgd_pkg[0] := mes_cache;
  if findfirst(__cachedir + e_dgrd_searchbox.text + '*tar.xz',faanyfile,fs) = 0
  then repeat
          r := tw_drgd.rowcount;
          tw_drgd.rowcount := r + 1;
          se_dgd_pkg[r]  := fs.name;
          se_dgd_pkg2[r] := __cachedir + fs.name;
          tw_drgd.update;
       until findnext(fs) <> 0;

  tw_drgd.rowcount := tw_drgd.rowcount + 1;
  //tw_drgd.rowcolorstate[tw_drgd.rowhigh] := 1;
  tw_drgd.rowfontstate[tw_drgd.rowhigh] := 0;
  se_dgd_pkg[tw_drgd.rowhigh] := __downgradepath;
  
  if findfirst(__downgradepath + e_dgrd_searchbox.text + '*tar.xz',faanyfile,fs) = 0
  then repeat
          r := tw_drgd.rowcount;
          tw_drgd.rowcount := r + 1;
          se_dgd_pkg[r]  := fs.name;
          se_dgd_pkg2[r] := __downgradepath + fs.name;
          tw_drgd.update;
       until findnext(fs) <> 0;

  arh := GetArch;
  if arh = 'i686' then arh := '32' else arh := '64';

// Exec('wget --output-file=wget.log https://www.archlinux.org/feeds/news/ -O '+
//                    __settingsdir + 'news.tmp 2 > /dev/null',true);

 Exec('wget --output-file=wget.log "http://arm.konnichi.com/search/index.php'+
              '?a='+arh+'&q=' + e_dgrd_searchbox.text +
              '&core=1&extra=1&community=1&testing=1&community-testing=1" -O '+
              __settingsdir + 'dgrd.tmp',true);

//  DownloadHTTP({pref + }'wget --output-file=wget.log -q -O - "http://arm.konnichi.com/search/index.php'+
//              '?a='+arh+'&q=' + e_dgrd_searchbox.text +
//              '&core=1&extra=1&community=1&testing=1&community-testing=1"',
//              __settingsdir + 'dgrd.tmp');
              
  s := filetostring(__settingsdir + 'dgrd.tmp');
  delete(s,1,system.pos('</form>',s));
  for i := 1 to 5 do 
  begin
    delete(s,1,system.pos('<div class=''header''>',s));
    delete(s,1,system.pos('>',s));
          r := tw_drgd.rowcount;
          tw_drgd.rowcount := r + 1;
          //tw_drgd.rowcolorstate[tw_drgd.rowhigh] := 1;
          tw_drgd.rowfontstate[tw_drgd.rowhigh] := 0;
          se_dgd_pkg[r]  := copy(s,1,system.pos('<',s) - 1);
          tw_drgd.update;
          application.processmessages;
    
    if i = 5 then s_f  := '</body>' else s_f := '<div class=''header';
    while (system.pos('<div class=''row',s) < system.pos(s_f,s)) 
          and (system.pos('<div class=''row',s) > 0) do
      begin
        delete(s,1,system.pos('<a href=',s) + 8);
        sname := copy(s,1,system.pos('''>', s) - 1);
        if extractfileext(sname) = '.sig' then continue;
        r := tw_drgd.rowcount;
        tw_drgd.rowcount := r + 1;
        se_dgd_pkg[r]  := extractfilename(sname);
        se_dgd_pkg2[r] := sname;
        tw_drgd.update;
      end;
  end;
  {tw_drgd.rowcolors.count := tw_drgd.rowcount;
  for i := 0 to tw_drgd.rowcount -1 do 
    if se_dgd_pkg2[i] = '' //then
    //tw_drgd[0][i].color := cl_red;
     then tw_drgd.rowcolors[i] := cl_red
     else tw_drgd.rowcolors[i] := cl_green;
  }mainfo.cursor := cr_default;
  l_dgrd_info.caption := '';
  e_dgrd_searchbox.setfocus;
  trydeletefile(__settingsdir + 'dgrd.tmp');
  trydeletefile('wget.log');
end;


procedure tmainfo.on_cell_event_news(const sender: TObject;var info: celleventinfoty);
begin
  if iscellclick(info, [ccr_buttonpress]) then 
  begin
  mainfo.cursor := cr_wait;
  l_news_title.caption := mes_please_wait + ' ...';
  wg_news_all.rowcount := 0;
  wg_news_titles.rowcount := 0;
  application.processmessages;
  deletefile(__settingsdir + 'news.tmp');
  try
  case wg_newssite.row of 
  0: on_get_news_archlinux(sender);
  1: on_get_news_archlinux_ru(sender);
  2: on_get_news_pacmanxg(sender);
  3: on_get_news_cinnarch(sender);
  4: on_get_manjaronews(sender);
  5: on_get_news_chakra(sender);
  6: on_get_news_parabola(sender);
  //7: on_get_news_ConnochaetOS(sender);
  end; 
  load_news_titles;
  except
  l_news_title.caption := mes_Error + ' !';
  end;
  mainfo.cursor := cr_default;
  end; 
end;

procedure tmainfo.load_news_titles;
var i : integer;
begin
 RSSR.clear;
 if not fileexists(__settingsdir + 'news.tmp') then exit;
 RSSR.loadfromfile(__settingsdir + 'news.tmp');
 //writeln(RSSR.content);//

 wg_news_titles.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
                    co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly];

 l_news_title.caption := rssr.title;// + ' (last update : ' + rss.lastBuildDate + ')';
 
 if rssr.count > 0 then 
 for i := 0 to rssr.count - 1 do 
   begin
     wg_news_titles.rowcount := wg_news_titles.rowcount + 1;
     te_news_titles[wg_news_titles.rowhigh] := rssr.items[i].title;
   end;
 wg_news_titles.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
            co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly,co1_autorowheight];

 //RSSR.free;
 exit;
{ if not fileexists(__settingsdir + 'news.tmp')
 then l_news_title.caption := mes_error_news
 else
 BEGIN
 rss.clear;
 rss.LoadFromFile(__settingsdir + 'news.tmp');

 wg_news_titles.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
                    co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly];

 l_news_title.caption := rss.title;// + ' (last update : ' + rss.lastBuildDate + ')';
 
 if rss.itemcount > 0 then 
 for i := 0 to rss.itemcount - 1 do 
   begin
     wg_news_titles.rowcount := wg_news_titles.rowcount + 1;
     te_news_titles[wg_news_titles.rowhigh] := rss.items[i].title;
   end;
 wg_news_titles.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
            co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly,co1_autorowheight];
 END;}
end;

function cleartext(const txt : string) : string;
label a,c,d,e,f,g;
var s, s2,ss : string;
    l,i : integer;
    b : boolean;
begin
   s := txt;
   
   l := length(s);
   i := 0;
   if l > 1 then 
   while i < l do
     begin
       inc(i);
       a:
       b := false;
       
       if pos('&lt;pre',s) = i then begin delete(s,i,7);b := true; end;
       if pos('&lt;/pre',s) = i then begin delete(s,i,8);b := true; end;

       if pos('&lt;p',s) = i then begin delete(s,i,5);b := true; end;
       if pos('&lt;/p',s) = i then begin delete(s,i,6);b := true; end;

       if pos('&lt;code',s) = i then begin delete(s,i,8);b := true;end;
       if pos('&lt;/code',s) = i then begin delete(s,i,9);b := true;end;

       if pos('&lt;ul',s) = i then begin delete(s,i,6);insert(#10,s,i);b := true;end;
       if pos('&lt;/ul',s) = i then begin delete(s,i,7);insert(#10,s,i);b := true;end;

       if pos('&lt;em',s) = i then begin delete(s,i,6); b := true;end;
       if pos('&lt;/em',s) = i then begin delete(s,i,7); b := true;end;

       if pos('&lt;li',s) = i then begin delete(s,i,6);insert(' - ',s,i);b := true;end;
       if pos('&lt;/li',s) = i then begin delete(s,i,7);b := true;end;

       if pos('&quot;',s) = i then begin delete(s,i,6);b := true;end;

       if pos('&lt;strong',s) = i then begin delete(s,i,10);insert(' ',s,i);b := true;end;
       if pos('&lt;/strong',s) = i then begin delete(s,i,11);insert(' ',s,i);b := true;end;
        
       if pos('&lt;div class="code"',s) = i then begin delete(s,i,20);insert(#10+'[code]----------------------------------------------------------'+#10,s,i);b := true;end;
       if pos('&lt;/div',s) = i then begin delete(s,i,8);insert(#10+'[end]-----------------------------------------------------------'+#10,s,i);b := true;end;

       if pos('<pre>',s) = i then begin delete(s,i,5);b := true;end;
       if pos('</pre>',s) = i then begin delete(s,i,6);b := true;end;
       if pos('<code>',s) = i then begin delete(s,i,6);insert(#10+'[code]----------------------------------------------------------'+#10,s,i);b := true;end;
       if pos('</code>',s) = i then begin delete(s,i,7);insert(#10+'[end]-----------------------------------------------------------'+#10,s,i);b := true;end;
        
       if pos('</a>',s) = i then begin delete(s,i,4);b := true;end;
       if pos('&lt;/a',s) = i then begin delete(s,i,6);b := true;end;
       if pos('&qt;',s) = i then begin delete(s,i,4);b := true; end;
       
       if pos('<![CDATA[',s) = i then begin delete(s,i,9);b := true; end;
       if pos(']]>',s) = i then begin delete(s,i,3);b := true; end;


       if (pos('&lt;a',s) = i)or(pos('<a href',s) = i) then 
           begin 
            d:
            delete(s,i,1); 
            if s[i] <> '"' then goto d;
            e:
            delete(s,i,1); 
            if s[i] <> '"' then goto e;
            delete(s,i,1); 
            delete(s,i,1); 
            b := true;
           end;

       if pos('&#',s) = i then 
           begin 
            f:
            delete(s,i,1); 
            if s[i] <> ';' then goto f;
            delete(s,i,1); 
            b := true;
           end;
       
       if pos('&lt;img',s) = i then 
           begin 
            g:
            delete(s,i,1); 
            if pos('&lt;br /',s) <> i then goto g;
            b := true;
           end;
       
       if pos('&lt;br /',s) = i then begin delete(s,i,8);insert(#10,s,i); b := true; end; //must be last!!!
       if pos('&lt;br/',s) = i then begin delete(s,i,7);insert(#10,s,i); b := true; end; //must be last!!!
       if pos('&lt;strike',s) = i then begin delete(s,i,10);insert(' ',s,i);b := true; end; //must be last!!!
       if pos('&lt;/strike',s) = i then begin delete(s,i,11);insert(' ',s,i);b := true; end; //must be last!!!
       if pos('&amp;rdquo;',s) = i then begin delete(s,i,11);insert(' ',s,i);b := true; end; //must be last!!!
       if pos('&amp;ldquo;',s) = i then begin delete(s,i,11);insert(' ',s,i);b := true; end; //must be last!!!

       if pos('<p>',s) = i then begin delete(s,i,3); b := true; end;
       if pos('</p>',s) = i then begin delete(s,i,4);insert(#10,s,i); b := true; end;
       if pos('<br>',s) = i then begin delete(s,i,4);insert(#10,s,i); b := true; end;
       if pos('<br />',s) = i then begin delete(s,i,6);insert(#10,s,i); b := true; end;
       if pos('<br/>',s) = i then begin delete(s,i,5);insert(#10,s,i); b := true; end;
       if pos('<ul>',s) = i then begin delete(s,i,4);insert(#10,s,i); b := true; end;
       if pos('</ul>',s) = i then begin delete(s,i,5);insert(#10,s,i); b := true; end;
       if pos('<li>',s) = i then begin delete(s,i,4);insert(' - ',s,i); b := true; end;
       if pos('</li>',s) = i then begin delete(s,i,5);insert(#10,s,i); b := true; end;
       if pos('<strong>',s) = i then begin delete(s,i,8);insert(' ',s,i); b := true; end;
       if pos('</strong>',s) = i then begin delete(s,i,9);insert(' ',s,i); b := true; end;
       if pos('<em>',s) = i then begin delete(s,i,4);insert(' ',s,i); b := true; end;
       if pos('</em>',s) = i then begin delete(s,i,5);insert(' ',s,i); b := true; end;
       if pos('<hr />',s) = i then begin delete(s,i,6);insert(#10,s,i); b := true; end;



       if b = true then goto a;
       l := length(s);
     end;


  for i := 1 to length(s) do
     begin
       c:
       b := false;
       if pos('&gt;',s) = i then begin delete(s,i,4);b := true; end;
       if b = true then goto c;
     end;     

     
   result := s;
end;

procedure tmainfo.on_cell_event_news_title_click(const sender: TObject;
               var info: celleventinfoty);
var r : integer;
    sl:tstringlist;
    s : string;
    i : integer;
begin
  r := wg_news_titles.row;
  if r < 0 then exit;
  if iscellclick(info, [ccr_buttonpress])
  then begin 
       wg_news_all.clear;
       //wg_news_all.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
       //     co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly];

       wg_news_all.optionsgrid := [og_focuscellonenter,
         og_colchangeontabkey,og_wrapcol,og_autopopup,og_mousescrollcol];

       wg_news_all.appendrow(false);
       if {(wg_newssite.row = 4)or}(wg_newssite.row = 5)
         then s := rssr.items[wg_news_titles.row].Contentencoded
                   //rssr.items[wg_news_titles.row].title + #10 + 
                   //rssr.items[wg_news_titles.row].author + #10 + 
       //            rssr.items[wg_news_titles.row].Content 
         else 
       s := rssr.items[wg_news_titles.row].description;
       sl:=tstringlist.create;
       sl.text := cleartext(s);
       wg_news_all.rowcount := sl.count;
       if sl.count > 0 then
         for i := 0 to sl.count - 1 do te_news_all[i] := trim(sl[i]);
           
       wg_news_all.optionsgrid := [og_focuscellonenter,og_rowheight,
         og_colchangeontabkey,og_wrapcol,og_autopopup,og_mousescrollcol];

       //te_news_all[0]  := cleartext(s);
       //wg_news_all.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
       //     co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly,co1_autorowheight];
         
       end;

{  r := wg_news_titles.row;
  if r < 0 then exit;
  if iscellclick(info, [ccr_buttonpress])
  then begin 
       wg_news_all.clear;
       wg_news_all.datacols.options1 := [co1_rowfont,co1_rowcolor,co1_zebracolor,
            co1_rowcoloractive,co1_rowcolorfocused,co1_rowreadonly,co1_autorowheight];
       wg_news_all.appendrow(false);
       if wg_newssite.row = 4
         then te_news_all[0] := rss.items[wg_news_titles.row].Contentencoded
         else te_news_all[0] := rss.items[wg_news_titles.row].description;
       end;}
end;

procedure tmainfo.on_get_news_archlinux(const sender: TObject);
begin
 Exec('wget --output-file=wget.log https://www.archlinux.org/feeds/news/ -O '+
                    __settingsdir + 'news.tmp 2 > /dev/null',true);
end;

procedure tmainfo.on_get_news_archlinux_ru(const sender: TObject);
begin
 Exec('wget --output-file=wget.log http://archlinux.org.ru/news/feed/ -O '+
                    __settingsdir + 'news.tmp 2 > /dev/null',true);
end;

procedure tmainfo.on_get_news_ConnochaetOS(const sender: TObject);
begin
 Exec('wget --output-file=wget.log http://www.connochaetos.org/wiki/feed.php?mode=list -O '+
                    __settingsdir + 'news.tmp 2 > /dev/null',true);
end;


procedure tmainfo.on_get_news_cinnarch(const sender: TObject);
begin
// DownloadHTTP('http://www.cinnarch.com/feed/', __settingsdir + 'news.tmp');
 Exec('wget --output-file=wget.log http://antergos.com/feed/ -O '+
                    __settingsdir + 'news.tmp 2 > /dev/null',true);
end;

procedure tmainfo.on_get_news_chakra(const sender: TObject);
begin
 // DownloadHTTP('http://www.chakra-project.org/news/index.php?/feeds/index.rss2', __settingsdir + 'news.tmp');
 //Exec('wget --output-file=wget.log http://www.chakra-project.org/news/index.php?/feeds/index.rss2 -O '+
 //                   __settingsdir + 'news.tmp 2 > /dev/null',true);
 Exec('wget --output-file=wget.log http://chakra-project.org/news/index.php?/feeds/index.rss2 -O '+
                    __settingsdir + 'news.tmp 2 > /dev/null',true);
end;

procedure tmainfo.on_get_manjaronews(const sender: TObject);
begin
// DownloadHTTP('http://manjaro.org/feed/', __settingsdir + 'news.tmp');
 Exec('wget --output-file=wget.log http://manjaro.org/feed/ -O '+
                    __settingsdir + 'news.tmp 2 > /dev/null',true);
end;

procedure tmainfo.on_get_news_parabola(const sender: TObject);
begin
// DownloadHTTP('http://manjaro.org/feed/', __settingsdir + 'news.tmp');
 Exec('wget --output-file=wget.log https://parabolagnulinux.org/feeds/news/ -O '+
                    __settingsdir + 'news.tmp 2 > /dev/null',true);
end;

procedure tmainfo.on_get_news_pacmanxg(const sender: TObject);
var sl : tstringlist;
     i : integer;
begin
  l_news_title.caption := mes_please_wait + ' ...';
  l_news_title.update;
//  DownloadHTTP(__pacmanxgnewsurl, __settingsdir + 'history.txt');

 Exec('wget --output-file=wget.log ' + __pacmanxgnewsurl + ' -O ' + 
              __settingsdir + 'history.txt',true);
  
  wg_news_all.clear;
  if fileexists(__settingsdir + 'history.txt') then 
  begin
    sl := tstringlist.create;
    sl.loadfromfile(__settingsdir + 'history.txt');
    if sl.count > 0 then 
    for i := 0 to sl.count - 1 do
     begin
      wg_news_all.appendrow(false);
      te_news_all[wg_news_all.rowhigh] := sl[i];
     end;
    sl.free;
    //wg_news_titles.rowcount := wg_news_titles.rowcount + 1;
    //te_news_titles[wg_news_titles.rowhigh] := 'No titles';
    l_news_title.caption := 'PacmanXG News';
  end
  else
  begin
    wg_news_all.appendrow(false);
    te_news_all[wg_news_all.rowhigh] := mes_error_news;
  end;
end;

procedure tmainfo.show_empty(const capt, mess : string);
begin
  s_oper.visible := true;
  s_oper.bringtofront;
  l_mess.caption := mess;
  l_oper_title.caption := capt;
  tw_oper.activepage := tab_empty;
  if s_oper_form.height = 510
    then begin 
         tw_task.visible := false;
         s_oper_form.height := s_oper_form.height div 3 - 20;
         on_resizeform(mainfo);
         end;
  trichbutton59.setfocus;
end;

procedure tmainfo.on_exectask(const sender: TObject);
var s : string;
    i : integer;
    checkaur : boolean;
    r : integer;
    sl : tstringlist;
    fi : tinifile;
begin
  //needconfirm := false;
  getpacmanversion;
  //on_add_to_searchlist(sender);
  s_findfile.visible := false;
  s_oper.visible := true;
  tw_main.enabled := false;
  s_topmenu.enabled := false;
  s_oper.setfocus;
  s_oper.bringtofront;
  __runinstall := false;
  __del :=false;
  __updatepkglist := true;
  __YES := false;
  
  if ber_reset_options.value then 
  begin
    be_recursive.value := false;
    be_cascade.value   := false;
    be_nosave.value    := false;
    be_unneeded.value  := false;
    be_checkhome.value  := false;
    
    be_nodeps.value    := false;
    be_nodeps2.value   := false;
    be_scriptlet.value := false;
    be_dbonly.value    := false;
    be_noconfirm.value    := false;
    be_usecachedir.value  := false;

    be_force.value  := false;
    be_downloadonly.value := false;
    be_asdeps.value := false;
    be_asexpl.value := false;
    be_needed.value := false;
    ber_recursive22.value := false;
  end;
  
  noconfirm := be_noconfirm.value;
  
  if (sender = b_execute)or(sender = b_install_from_list)
  or(sender = b_install_file)or(sender = b_install_from_cache) then 
    BEGIN
      be_repeat.value := false;
      l_pdel.caption := '';
      l_pins.caption := '';
      l_file.caption := '';
      
      r := twf.row;
      
      checkaur := false;
      
      
      if sender = b_install_from_list then
        BEGIN
          s := '';
          if wg_mylist.rowcount > 0 then 
             for i := 0 to wg_mylist.rowcount - 1 do
              BEGIN
                if ber_[i] then s := s + ' ' + se_package[i];
                if system.pos('aur', se_package[i]) = 1 then checkaur := true;
              END;
          
          if trim(s) = '' then
             if wg_mylist.row >= 0
                then s := se_package[wg_mylist.row];

          if trim(s) = ''
            then begin 
             show_empty(mes_error, mes_Please_select_package);
	         exit;
           end;
          l_pins.caption := s;
        END;

      if sender = b_install_file then
        BEGIN
          s := trim(b_install_file.hint);
          if trim(s) = ''
            then begin 
             show_empty(mes_error, mes_Please_select_package);
	         exit;
           end;
          checkaur := false;
          l_file.caption := 'true';
          l_pins.caption := s;
        END;

      if sender = b_install_from_cache then
        BEGIN
          s := '';
          if wg_cache.rowcount > 0 then 
             for i := 0 to wg_cache.rowcount - 1 do
                if ber_cache[i] then s := s + ' ''' + __cachedir + se_file[i] + '''';
          if trim(s) = ''
            then begin 
             show_empty(mes_error, mes_Please_select_package);
	         exit;
           end;
          checkaur := false;
          l_file.caption := 'true';
          l_pins.caption := s;
        END;        
        
     if sender = b_execute then
     BEGIN 
      if sg_query.rowcount = 0 
      then if r < 0 then
           begin
             show_empty(mes_error,mes_Please_select_package);
	         exit;
           end 
           else autoselect(r);

      for i := 0 to sg_query.rowhigh do
        begin  
          if (sg_query[0][i] = m_del) then l_pdel.caption := l_pdel.caption + ' ' + trim(sg_query[1][i]);
          if (sg_query[0][i] = m_add) then l_pins.caption := l_pins.caption + ' ' + trim(sg_query[1][i]);
          if 'aur' = sg_query[5][i] then checkaur := true;
        end;
      END;
      
      //needconfirm := not be_noconfirm.value;
      if checkaur then l_aur.caption := 'true' else l_aur.caption := 'false';

      if s_oper_form.height = 510
          then on_collase_oper(sender);//s_oper_form.height := s_oper_form.height div 3 - 20;
      //on_resizeform(sender);

      if trim(l_pdel.caption) > '' then
        begin
         tw_oper.activepage := tp_del_ask;
         l_oper_title.caption := mes_remove;
         if trim(l_pins.caption) > '' then 
           begin
           __runinstall := true;
           end;
        end      
      else  
      if trim(l_pins.caption) > '' then 
        begin
         tw_oper.activepage := tp_ins_ask;
         l_oper_title.caption := mes_install;
        end;
    END
  ELSE
    BEGIN
      noconfirm := false;
      
      if sender = b_repeat 
          then be_repeat.value := true
          else be_repeat.value := false;
    
      s := (sender as trichbutton).caption;
      if system.pos(#10,s) > 0 then delete(s,system.pos(#10,s),1);
      l_oper_title.caption := s;
      l_lastcommand.caption := twidget(sender).hint;
      
      if system.pos('pacman -Syu',l_lastcommand.caption) > 0 then 
         begin
           writeln('Check It pacman -Syu !!');
           __current := 0;
           sl := tstringlist.create;
           fi := tinifile.create(__pacmanconf);
           fi.readsections(sl);
           fi.free;
           __total := sl.count - 1;
           sl.free;
         end;
      s_oper_form.height := 510;
      tw_task.visible := true;
      on_resizeform(sender);
      if (sender = b_findpackage_with_pacman) then 
        begin
          __updatepkglist := false;
          l_lastcommand.caption := l_lastcommand.caption + ' ' + se_filter.text;
        end;
      if (sender = b_findpackage_with_pkgfile) then 
        begin
          __updatepkglist := false;
          l_lastcommand.caption := l_lastcommand.caption + ' ' + se_filter.text;
        end;
      
      if (sender = b_repacman) then 
        begin
          __updatepkglist := false;
          l_lastcommand.caption := l_lastcommand.caption + ' ' + s_repacman.value;
        end;
        
      if sender = b_update_pkfile then __updatepkglist := false;

      if (sender = b_dep) or (sender = b_expl) then 
      BEGIN
          if twf.row < 0 then exit; 
          l_lastcommand.caption := l_lastcommand.caption + ' ' + se_name[twf.row];
          __YES := true;
      END;
        


     { if sender = b_install_from_list then
        BEGIN
          s := '';
          if wg_mylist.rowcount > 0 then 
             for i := 0 to wg_mylist.rowcount - 1 do
                if ber_[i] then s := s + ' ' + se_package[i];
          if trim(s) = ''
            then begin 
	         l_oper_title.caption := mes_Please_select_package;
        	 tw_oper.activepage := tab_empty;
	         exit;
           end;
          l_lastcommand.caption := 'pacman -S ' + s;
        END;
    }  
      if sender = b_downgrade then 
        begin
          if tw_drgd.row < 0
            then begin 
             show_empty(mes_error, mes_Please_select_package);
	         exit;
           end
          else
          begin
            forcedirectories(__downgradepath);
            s := trim(se_dgd_pkg2[tw_drgd.row]);
            if s > '' then 
            begin
              if s[1] = '/' 
                then begin 
                      //if __colorpacmanoutput
                      // then l_lastcommand.caption := 'pacman -U ' + s + ' --color never'
                       //else 
                       l_lastcommand.caption := 'pacman -U ' + s
                     end
                else begin 
                      //if __colorpacmanoutput
                       //then l_lastcommand.caption := 'wget -O ' + __downgradepath + extractfilename(s) + ' ' + s 
                       //     + '; pacman -U ' + __downgradepath + extractfilename(s)  + s + ' --color never'
                       //else
                        l_lastcommand.caption := 'wget -O ' + __downgradepath + extractfilename(s) + ' ' + s 
                            + '; pacman -U ' + __downgradepath + extractfilename(s);
                     end;
            end
            else begin
                 s_oper.visible := false;
                 tw_main.enabled := true;
                 s_topmenu.enabled := true;
                 exit;
                 end;
          end;
          
        end;
      on_start_operation(sender);
    END;
end;


procedure tmainfo.on_oper_tw_activepage_change(const sender: TObject);
begin
  s_external.visible := false;
  if tw_oper.activepage = tp_ins_ask 
  then begin
       s_trans_ask.linktop := nil;
       s_trans_ask.parentwidget := sb_ins_ask;
       s_trans_ask.linktop := s_ins_opt;
       s_external.visible := true;
       end;
  if tw_oper.activepage = tp_del_ask
  then begin
       s_trans_ask.linktop := nil;
       s_trans_ask.parentwidget := sb_del_ask;
       s_trans_ask.linktop := s_del_opt;
       s_external.visible := true;
       end;
end;

procedure tmainfo.on_collase_oper(const sender: TObject);
begin
  if s_oper_form.height = 510 
     then begin 
          tw_task.visible := false;
          s_oper_form.height := s_oper_form.height div 3 - 20;
          end
	 else begin 
	            tw_task.visible := true;
	            s_oper_form.height := 510;
	            end;
  on_resizeform(sender);
end;

procedure tmainfo.on_start_operation(const sender: TObject);

  function prepare_del : string;
  var cmd : string;
  begin
  __del := true;
  cmd := 'pacman -R';
  if be_recursive.value then cmd := cmd + ' --recursive';
  if be_cascade.value   then cmd := cmd + ' --cascade';
  if be_nosave.value    then cmd := cmd + ' --nosave';
  if be_unneeded.value  then cmd := cmd + ' --unneeded';
  
  if be_nodeps.value    then cmd := cmd + ' --nodeps';
  if be_nodeps2.value   then cmd := cmd + ' --nodeps --nodeps';
  if be_dbonly.value then  cmd := cmd + ' --dbonly';
  if be_scriptlet.value then cmd := cmd + ' --noscriptlet';

  cmd := cmd + ' ' + l_pdel.caption;
  
  if be_noconfirm.value then  cmd := cmd + ' --noconfirm';
  if be_debug.value then  cmd := cmd + ' --debug';
  if be_usecachedir.value then  cmd := cmd + ' --cachedir ''' + dd_cachedir.value + '''';

  result := cmd;
  end;
  
  function prepare_ins : string;
  var cmd : string;
  begin
  if l_file.caption > '' 
  then cmd := 'pacman -U'
  else begin
       if l_aur.caption = 'false' 
          then cmd := 'pacman -S'
          else cmd := 'yaourt -S';
       end;   
  if be_force.value then cmd := cmd + ' --force';
  if be_downloadonly.value then cmd := cmd + ' --downloadonly';
  cmd := cmd + ' ' + l_pins.caption;
  if be_asdeps.value then cmd := cmd + ' --asdeps';
  if be_asexpl.value then cmd := cmd + ' --asexplicit';
  if be_needed.value then cmd := cmd + ' --needed';
//  if ber_recursive.value then cmd := cmd + ' --recursive';

  if be_scriptlet.value then cmd := cmd + ' --noscriptlet';
  if be_nodeps.value then cmd := cmd + ' --nodeps';
  if be_nodeps2.value then cmd := cmd + ' --nodeps --nodeps';
  if be_dbonly.value then  cmd := cmd + ' --dbonly';
  
  if be_noconfirm.value then  cmd := cmd + ' --noconfirm';
  if be_debug.value then  cmd := cmd + ' --debug';
  if be_usecachedir.value then  cmd := cmd + ' --cachedir ''' + dd_cachedir.value + '''';

  if l_aur.caption = 'true'  then cmd := cmd + ' --nocolor';
  result := cmd;
  end;
  
var sl : tstringlist;

begin
  tw_oper.activepage := tp_task;
  __total := 0;
  __current := 0;
  
  sl := tstringlist.create;
  if sender = b_continue_del then 
     begin
       l_lastcommand.caption := prepare_del;
       sl.text := exec(prepare_del + ' --print',true);
       __total := sl.count;
     end;       
       
  if sender = b_continue_ins then
     begin
       l_lastcommand.caption := prepare_ins;
       sl.text := exec(prepare_ins + ' --print',true);
       __total := sl.count;
     end;       
//  showmessage(inttostr(__total));
  sl.free;
  if (__colorpacmanoutput)and(system.pos('pacman', l_lastcommand.caption) = 1)
     then l_lastcommand.caption := l_lastcommand.caption + ' --color never'; /// h-m-m, really need ?
  tw_task.clear;
  b_delete_dblock.visible := false;
  s_task.visible := false;
  s_taskA.visible := false;
  pb.value := 0;
  pb2.value := 0;
  pb.visible := true;
  pb2.visible := true;
  __ERROR := false;
  l_operation.caption := mes_please_wait;
  
  if ber_external.value
  then begin
       exec(dd_term.value + ' -e "' + l_lastcommand.caption + '"', true);
       on_task_finish(sender);
       end
  else begin
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := '=====================================================';
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := '=> EXECUTE: ' + l_lastcommand.caption;
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := '=====================================================';

       term_task.addline('=====================================================');
       term_task.addline('=> EXECUTE: ' + l_lastcommand.caption);
       term_task.addline('=====================================================');
       term_task.execprog(l_lastcommand.caption);
       timer_run.enabled:= true;
       b_run.width := 20;
       end;
end;

procedure tmainfo.on_setd(const sender: TObject; var avalue: Boolean; var accept: Boolean);
begin  if avalue then be_nodeps2.value := false;
end;

procedure tmainfo.on_setdd(const sender: TObject; var avalue: Boolean; var accept: Boolean);
begin  if avalue then be_nodeps.value := false;
end;

procedure tmainfo.on_set_asdeps(const sender: TObject; var avalue: Boolean;var accept: Boolean);
begin  if avalue then be_asexpl.value := false;
end;

procedure tmainfo.on_set_asexpl(const sender: TObject; var avalue: Boolean;var accept: Boolean);
begin  if avalue then be_asdeps.value := false;
end;

//========================================
//      ищем файл через whereis
//========================================
function tmainfo.whoami : string;
var p : tprocess;
   sl:tstringlist;
   s : string;
begin
p := tprocess.create(nil);
sl:= tstringlist.create;
p.options := p.options + [powaitonexit,pousepipes];
p.commandline := 'whoami';
p.execute;
sl.loadfromstream(p.output);
if sl.count > 0 then s := trim(sl[0]);
sl.free;
p.free;
result := s;
end;

procedure tmainfo.on_send_yes(const sender: TObject);
begin
  if term_task.running then 
     begin 
       __YES := true; 

 if system.pos('pkgbuild', l_operation.caption) > 0 then
 begin
   showmessage(mes_edit_PKGBUILD1 + #10
               + '/tmp/yaourt-tmp-' + whoami + '/aur-' + pkgname + '/PKGBUILD' + #10
               + mes_edit_PKGBUILD2);
               
  if mainfo <> nil then  
  begin         
   term_edit.execprog(check_util_cmdline(mainfo.dd_texteditor.value) + ' ' + '/tmp/yaourt-tmp-' + whoami + '/aur-' + pkgname + '/PKGBUILD');
   WRITELN('TRY OPEN:',check_util_cmdline(mainfo.dd_texteditor.value) + ' ' + '/tmp/yaourt-tmp-' + whoami + '/aur-' + pkgname + '/PKGBUILD');
  end;
   __YES := false;   
   exit;
 end;

      if system.pos('==',l_operation.caption) > 0 
        then term_task.writestr(__yes__)//('y')
        else term_task.writestrln(__yes__);//('y');
      term_task.addchars(__yes__+#10);//('y' + #10 );
     end;
  s_task.visible := false;
  s_taskA.visible := false;
end;

procedure tmainfo.on_send_no(const sender: TObject);
begin
  if term_task.running then
     begin 
      if system.pos('==',l_operation.caption) > 0 
        then term_task.writestr(__no__)//('n')
        else term_task.writestrln(__no__);//('n');
      term_task.addchars(__no__+#10);//('n' + #10 );
     end;
  s_task.visible := false;
  s_taskA.visible := false;
end;

procedure tmainfo.on_send_abourt(const sender: TObject);
begin
  if term_task.running then
     begin 
       term_task.addchars(__a__+#10);//('a' + #10 );
       term_task.writestrln(__a__);//('a');
     end;
  s_task.visible := false;
  s_taskA.visible := false;
end;



procedure tmainfo.on_task_receive_text(const sender: TObject;var atext: AnsiString; const errorinput: Boolean);
label a;
var sl : tstringlist;
     s,ss : string;
     i,y : integer;
begin
  //some clear
{  while system.pos('[?1034h', atext) > 0 do
    begin
      i := system.pos('[?1034h', atext);
      delete(atext, i, 7);
    end;
  while system.pos('', atext) > 0 do
    begin
      i := system.pos('', atext);
      delete(atext, i, length(''));
      insert(' ', atext, i);
    end;
  while system.pos('	', atext) > 0 do 
    begin
      i := system.pos('	', atext);
      delete(atext, i, length('	'));
      insert('     ', atext, i);
    end;   

     if sl.count > 0 then
     for i := sl.count - 1 downto 0 do
       begin
        //if sl[i] = '==> [?1034h' then sl.delete(i);
        //if trim(sl[i]) = '==>' then sl.delete(i,system.pos(),3);
        if system.pos('tput:',sl[i]) > 0 then sl.delete(i);
        if sl[i] = '==> ------------------------------------' then sl.delete(i);
       end;
}
  for i := length(atext) downto 1 do 
    begin
     a:
     if system.pos('[?1034h', atext) = i 
       then begin
            delete(atext, i, 7);
            goto a;
            end;
     if system.pos('', atext) = i
       then begin
            delete(atext, i, length(''));
            insert(' ', atext, i);
            goto a;
            end;
     if system.pos('	', atext) = i  
       then begin
            delete(atext, i, length('	'));
            insert('     ', atext, i);
            goto a;
            end;   
     if system.pos('tput:',atext) = i
       then begin
            delete(atext, i, 5);
            goto a;
            end;
     if system.pos('==> ------------------------------------', atext) = i
       then begin
            delete(atext, i, length('==> ------------------------------------'));
            goto a;
            end;
    end;       
      
  sl := tstringlist.create;
  sl.text := trim(atext);
  if sl.count > 0 then 
    BEGIN
    if (system.pos('/var/lib/pacman/db.lck',sl.text) > 1) or
      (system.pos('Pacman is currently in use',sl.text) > 1) then 
        begin
         __error := true;
         b_delete_dblock.visible := true;
         exit;   //not good idea to use exit, but .....
       end; 
       
    if (system.pos('==> Downloading',sl.text) > 0) then //downgrade
      begin 
       pkgname := sl.text;
       delete(pkgname, 1, system.pos('==> Downloading',sl.text) + length('==> Downloading'));
       pkgname := trim(pkgname);
       pkgname := copy(pkgname,1,system.pos(' ',pkgname) - 1);
      end;

      s := sl[sl.count - 1];

      if (system.pos('[',s)>0)and(system.pos('%',s)>0) then 
         begin
          l_operation.caption := copy(s,1,system.pos('[',s) - 1);
          if system.pos('%',s) > system.pos('[',s) then
            begin
             delete(s,1,system.pos(']',s));
             delete(s,system.pos('%',s),1);
            end
          else 
            begin
              s:= l_operation.caption;
              delete(s,system.pos('%',s),1);
            end;

          try
            pb.value := strtoint(trim(s)) / 100;
            pb.update;
          except 
          end;
         end
      else if length(s) > 5 then l_operation.caption := s;
      
      for i := 0 to sl.count - 1 do
        BEGIN
        s := trim( LOWERCASE(sl[i]) );
        if system.pos('100%',s) > 0 then 
          begin
            inc(__current);
            if __total > 0 then pb2.value := __current / __total;
          end;
          
        if (system.pos('(',s) = 1)and(system.pos(')',s) < 12)
          and(system.pos('/',s) < 12) then 
          try
            ss := copy(s,system.pos('(',s)+1, system.pos('/',s) - system.pos('(',s) - 1);
            __current := strtoint(trim(ss));

            ss := copy(s,system.pos('/',s)+1, system.pos(')',s) - system.pos('/',s) - 1);
            __total := strtoint(trim(ss));
            if __total > 0 then pb2.value := __current / __total;
          except
          end;
          
        if pb2.value > 1 then pb2.value:= 1;  

       if system.pos('cp:',s) > 0 then 
          begin
          s_task.visible := true;
          s_taskA.visible := false;
          end;
       
       if not noconfirm then
        if system.pos('[',s) > 0 //support not english langs (for example in italian [S/n]
         then begin
              y := system.pos('[',s);
              //if ask request
              if (system.pos('/',s) = y + 2) and (system.pos(']',s) = y + 4) then
              begin
              l_operation.caption := s;
              //check yes and no
              __yes__ := copy(s,y+1,1);
              __no__ := copy(s,y+3,1);
              writeln('yes="',__yes__,'" no="',__no__,'"');
              if system.pos('("',s) > 0 then 
                 begin
                 y := system.pos('("',s);
                 __a__ := s[y+2];
                 writeln('abort="',__a__,'"');
                 s_taskA.visible := true;
                 s_task.visible := false;
                 end
              else
                 begin
                 s_task.visible := true;
                 s_taskA.visible := false;
                 end;
              pb.value := 0;
              end;
              end;

        if (system.pos(mes_error, s) > 0)or(system.pos('error', s) > 0) then 
         begin
           __ERROR := true;
           l_operation.caption := s;
           pb.value := 0;
         end;
        END;
    END;

   if sl.count > 0 then //??? but work
    for i := 0 to sl.count - 1 do 
      begin
        begin
          wg_seslog.appendrow(false);
          te_seslog[wg_seslog.rowhigh] := sl[i];
        end;
      end;
  sl.free;
  //if libc.kill(term_task.prochandle,SIGCONT)<> 0 then writeln('yaourt manage error2');
end;

procedure tmainfo.on_task_finish(const sender: TObject);
begin
  //on_add_to_searchlist;
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := '  ';
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := '=>' + ' ' + mes_Done;
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := '';

  term_task.addline('');   term_task.addline('=>' + ' ' + mes_Done);
  pb.visible := false;
  pb2.visible := false;
  s_taskA.visible := false;
  s_task.visible := false;
  
  sleep(200);
  if not be_repeat.value then
  begin
  tw_history.insertrow(0);//rowcount := tw_history.rowcount + 1;
  te_history[0] := l_lastcommand.caption;
  end;
  timer.enabled := true;
  if be_notifyme.value then begin
//        if ber_notify.value then execmse('notify-send "' + l_lastcommand.caption +#10 + #10 + mes_Done + '"');
//        if ber_kdialog.value then execmse('kdialog --passivepopup "' + l_lastcommand.caption +#10 +  #10 + mes_Done + '" 3');
        if ber_notify.value then execmse('export DISPLAY=:0; notify-send " PacmanXG' + #10 + #10 + mes_Done + '"');
        if ber_kdialog.value then execmse('export DISPLAY=:0; kdialog --passivepopup PacmanXG"' + #10 +  #10 + mes_Done + '" 3');
     end;

 if __del then 
   if be_checkhome.value then 
     begin
     __del := false;
     writeln('START check home directory');
     paramsfo.on_CHECK_homedirectory(sender);
     if paramsfo.wg_home.rowcount > 0 then 
        paramsfo.show(true);
     end;
  writeln(__yes);   
  writeln(__updatepkglist);   
  writeln(__runinstall);   
  writeln(__error);   
  
  (*
  if ber_external.value 
    then on_update_pkglist(b_update)
    else
  if (__YES){or(be_noconfirm.value)} then
  if __updatepkglist then 
  if {(not __runinstall) and }(not __error) then
   begin
    on_update_pkglist(b_update);
   end;
  *)
  if (ber_external.value) or (l_aur.caption <> 'false') or (noconfirm)
    then on_update_pkglist(b_update)
    else begin
         if (__YES) and (__updatepkglist) and (not __error) 
            then on_update_pkglist(b_update);
         end;
    
  timer_run.enabled:= false;
  b_run.width := 0;
  if not __error then l_operation.caption := mes_Done;  
end;

procedure tmainfo.on_timer(const sender: TObject);
begin
 timer.enabled := false;
 
 if __runinstall then 
   begin
     __runinstall := false;
     tw_oper.activepage := tp_ins_ask;
     l_oper_title.caption := mes_install;     
   end;
end;
////////////// MAIN POPUP MENU //////////////////////////////////////
procedure tmainfo.on_add_to_query_pm(const sender: TObject);
begin  on_add_remove_clear(b_ins);
end;

procedure tmainfo.on_remove_from_query_pm(const sender: TObject);
begin on_add_remove_clear(b_del);
end;

procedure tmainfo.on_cancel_pm(const sender: TObject);
begin on_add_remove_clear(b_cancel);
end;

procedure tmainfo.on_execute_pm(const sender: TObject);
begin on_exectask(b_execute);
end;

procedure tmainfo.on_upgrade_pm(const sender: TObject);
begin on_exectask(b_updatesystem);
end;

procedure tmainfo.on_synhmirrors_pm(const sender: TObject);
begin on_exectask(b_sinh);
end;

procedure tmainfo.on_mark_expl(const sender: TObject);
begin on_exectask(b_expl);
end;

procedure tmainfo.on_mark_deps_pm(const sender: TObject);
begin on_exectask(b_dep);
end;

procedure tmainfo.on_add_package_to_ignore_list(const sender: TObject);
var  i : integer;
     s : string;
begin 
  if tw_pacman_conf.rowcount = 0 then exit;
  for i := 0 to tw_pacman_conf.rowhigh do 
    begin
      s := te_pacman_conf[i];
      if (system.pos('IgnorePkg', s) > 0) and (system.pos('=',s) > 0)
       then begin 
              s := trim(s) + ' ' + se_name[twf.row];
              if s[1] = '#' then delete(s,1,1);
              te_pacman_conf[i] := s;
              on_save_pacmanconf(sender);
              break;
            end;  
    end;
end;

procedure tmainfo.on_repacman_pm(const sender: TObject);
var r : integer;
begin
  r := twf.row; 
                 
  if r < 0 then exit;
  s_repacman.value := se_name[r];
  on_exectask(b_repacman);
end;

procedure tmainfo.on_downgrade_pm(const sender: TObject);
begin
  on_navigate_menu(sender);
  e_dgrd_searchbox.text := se_name[twf.row];
  application.processmessages;
  on_drgd_search(sender);
end;

procedure tmainfo.on_dngrd_keyup(const sender: twidget;
               var ainfo: keyeventinfoty);
begin
if ainfo.key = key_return then on_drgd_search(sender);
end;

procedure tmainfo.on_restore_from_file(const sender: TObject);
begin
  fd.controller.filter := '';
  fd.controller.filterlist.clear;
  fd.dialogkind := fdk_open;
  if fd.execute = mr_ok then
  begin
    b_restore_from_file.hint := 'pacman -S $(cat ' + fd.controller.filename + ')';
    on_exectask(b_restore_from_file);
  end;
end;

procedure tmainfo.on_save_packagelist(const sender: TObject);
begin
  fd.controller.filter := '';
  fd.dialogkind := fdk_save;
  fd.controller.filterlist.clear;
  if fd.execute = mr_ok then
  begin
    b_save_packagelist.hint := 'pacman -Qqe | grep -v "$(pacman -Qmq)" > ' + fd.controller.filename;
    on_exectask(b_save_packagelist);
  end;
end;

procedure tmainfo.on_install_file(const sender: TObject);
begin
 fd.controller.filter := '*.pkg.tar.xz';
 fd.controller.filterlist.clear;
 fd.controller.filterlist.add('Archlinux Packages','*.pkg.tar.xz');
 fd.controller.filterlist.add('Old Archlinux Packages','*.pkg.tar.gz');
 if fd.execute = mr_ok then
 begin
//   b_install_file.hint := 'pacman -U ''' + fd.controller.filename + '''';
   b_install_file.hint :=  '''' + fd.controller.filename + '''';
   on_exectask(b_install_file);
 end;
end;

procedure tmainfo.on_select_dizz(const sender: TObject; var avalue: Boolean;  var accept: Boolean);
var i : integer;
begin
  if wg_dizz.rowcount > 0 then 
    for i := 0 to wg_dizz.rowcount - 1 do be_dizz[i] := avalue;
end;

procedure tmainfo.on_search_dizz(const sender: TObject);
begin
  if not fileexists(__programpath + 'dizz.sh') then 
  begin
    show_empty(mes_error,mes_File_not_found + ' dizz.sh');
    exit;
  end; 
  if not askyesno(mes_long_time) then exit;
  
  deletefile('db.txt'); 
  deletefile('fs.txt'); 
  deletefile('non-db.txt'); 
  l_count_dizz.caption := '';
  wg_dizz.clear;
  mainfo.cursor := cr_wait;
  term_dizz.execprog(__programpath + 'dizz.sh');
end;

procedure tmainfo.on_dizz_finish(const sender: TObject);
var f : textfile;
    s : string;
    r : integer;
begin
  mainfo.cursor := cr_default;
  if not fileexists('non-db.txt') then
  begin
    show_empty(mes_error,mes_File_not_found + ' non-db.txt');
    exit;
  end;   
  assignfile(f,'non-db.txt');
  reset(f);
  while not eof(f) do
    begin
      readln(f,s);
      r := wg_dizz.rowcount;
      wg_dizz.rowcount := r + 1;
      be_dizz[r] := false;
      se_file_dizz[r] := extractfilename(s);
      se_path_dizz[r] := s;
    end;
  closefile(f);
  l_count_dizz.caption := inttostr(wg_dizz.rowcount) + ' files';
  trydeletefile('db.txt');
  trydeletefile('fs.txt');
  trydeletefile('non-db.txt');
  trydeletefile('wget.log');
end;

procedure tmainfo.on_errase_dizz_files(const sender: TObject);
var i : integer;
begin
  for i := wg_dizz.rowhigh downto 0 do 
   if be_dizz[i] = true then
    if trydeletefile(se_path_dizz[i]) 
      then wg_dizz.deleterow(i)
      else se_result_dizz[i] := mes_Error;
  show_empty('',mes_Done);
end;

procedure tmainfo.on_go_to_select_xterminal(const sender: TObject);
begin
  tw_sets.activepage := tp_utils;
end;

procedure tmainfo.on_terminate_form(var terminate: Boolean);
begin
  savesettings;
  trydeletefile('wget.log');  
end;

procedure tmainfo.savesettings;
var fi : tinifile;
begin
  forcedirectories(sys_getuserhomedir + '/.Almin-Soft/PacmanXG');
  fi := tinifile.create(sys_getuserhomedir + '/.Almin-Soft/PacmanXG/pacmanxg4.conf');

  fi.writebool('remove options', 'recursive', be_recursive.value);
  fi.writebool('remove options', 'cascade', be_cascade.value);
  fi.writebool('remove options', 'nosave', be_nosave.value);
  fi.writebool('remove options', 'unneed', be_unneeded.value);
  fi.writebool('remove options', 'check_home', be_checkhome.value);

  fi.writebool('install options','force',be_force.value);
  fi.writebool('install options', 'downloadonly', be_downloadonly.value);
  fi.writebool('install options', 'asdeps', be_asdeps.value);
  fi.writebool('install options', 'asexpl', be_asexpl.value);
  fi.writebool('install options', 'dbonly', be_dbonly.value);
  fi.writebool('install options', 'needed', be_needed.value);
//  fi.writebool('install options', 'recursive', ber_recursive.value);
  
  fi.writebool('options', 'noconfirm', be_noconfirm.value);
  fi.writebool('options', 'debug',     be_debug.value);
  fi.writebool('options', 'usecachedir',  be_usecachedir.value);
  fi.writestring('options', 'cachedir', dd_cachedir.value);

  fi.writebool('transaction options', 'nodeps', be_nodeps.value);
  fi.writebool('transaction options', 'nodeps2', be_nodeps2.value);
  fi.writebool('transaction options', 'noscriptlet',be_scriptlet.value);
  fi.writebool('transaction options', 'dbonly',be_dbonly.value);

  fi.writebool('Package management', 'alwayssinhmirrors', b_sinhmirrors.value);
  fi.writebool('Package management', 'externalterminal', ber_external.value);
  fi.writebool('Package management', 'externalterminal', ber_external2.value);
  fi.writebool('Package management', 'load_screenshots', be_noscreenshot.value);
  fi.writebool('Package management', 'oldtablestyle', be_oldtablestyle.value);
  fi.writebool('Package management', 'Reset_options', ber_reset_options.value);

  fi.writebool('Package management', 'Colorizeoutofdatepackages', be_colorize.value);
  fi.writeinteger('Package management', 'Coloroutofdatepackages', ce_colorize.value);
  
  fi.writebool('Filter panel', 'filterpanelpos', b_filterpanelpos.value);

  fi.writebool('Notification', 'notify', be_notifyme.value);
  fi.writebool('Notification', 'kdialog',ber_kdialog.value);
  fi.writebool('Notification', 'notifysend', ber_notify.value);

  fi.writestring('interface', 'fontname', dd_fonts.value);
  fi.writeinteger('interface', 'fontheight', ie_heightfont.value);
  fi.writestring('interface', 'language', dd_langs.value);
  fi.writebool('interface', 'leftmenu', ber_left_menu.value);
  fi.writestring('interface', 'Theme', dd_themes.value);
  fi.writebool  ('interface', 'Remember_position', ber_pos.value);

  fi.writestring('utils', 'terminal', dd_term.value);
  fi.writestring('utils', 'filenavigator', dd_finav.value);
  fi.writestring('utils', 'texteditor', dd_texteditor.value);

  fi.writeinteger('form', 'top', top);
  fi.writeinteger('form', 'left', left);
  fi.writeinteger('form', 'width', width);
  fi.writeinteger('form', 'height', height);

  fi.writestring('MyPackageList', 'lastfile', se_mylist_fname.value);

  fi.free;
end;


procedure tmainfo.loadsettings;
var fi : tinifile;
begin
  forcedirectories(sys_getuserhomedir + '/.Almin-Soft/PacmanXG');
  fi := tinifile.create(sys_getuserhomedir + '/.Almin-Soft/PacmanXG/pacmanxg4.conf');

  be_recursive.value := fi.readbool('remove options', 'recursive', false);
  be_cascade.value   := fi.readbool('remove options', 'cascade',false);
  be_nosave.value    := fi.readbool('remove options', 'nosave', false);
  be_unneeded.value  := fi.readbool('remove options', 'unneed', false);
  be_checkhome.value := fi.readbool('remove options', 'check_home', false);

  be_force.value     := fi.readbool('install options','force', false);
  be_downloadonly.value := fi.readbool('install options', 'downloadonly', false);
  be_asdeps.value    := fi.readbool('install options', 'asdeps', false);
  be_asexpl.value    := fi.readbool('install options', 'asexpl', false);
  be_dbonly.value    := fi.readbool('install options', 'dbonly', false);
  be_needed.value    := fi.readbool('install options', 'needed', false);
//  ber_recursive.value    := fi.readbool('install options', 'recursive', false);

  be_noconfirm.value := fi.readbool('options', 'noconfirm', false);
  be_debug.value := fi.readbool('options', 'debug', false);
  be_usecachedir.value := fi.readbool('options', 'usecachedir',  false);
  dd_cachedir.value := fi.readstring('options', 'cachedir', '');
  
  be_nodeps.value    := fi.readbool('transaction options', 'nodeps', false);
  be_nodeps2.value   := fi.readbool('transaction options', 'nodeps2', false);
  be_scriptlet.value := fi.readbool('transaction options', 'noscriptlet', false);

  b_sinhmirrors.value   := fi.readbool('Package management', 'alwayssinhmirrors', false);
  ber_external.value    := fi.readbool('Package management', 'externalterminal', false);
  be_noscreenshot.value := fi.readbool('Package management', 'load_screenshots', false);
  be_oldtablestyle.value  := fi.readbool('Package management', 'oldtablestyle', true);
  ber_reset_options.value := fi.readbool('Package management', 'Reset_options', false);

  be_colorize.value := fi.readbool('Package management', 'Colorizeoutofdatepackages', false);
  ce_colorize.value := fi.readinteger('Package management', 'Coloroutofdatepackages', $FFCFCF);
  twf.rowcolors[1] := ce_colorize.value;

  b_filterpanelpos.value := fi.readbool('Filter panel', 'filterpanelpos', false);

  be_notifyme.value   := fi.readbool('Notification', 'notify', false);
  ber_kdialog.value   := fi.readbool('Notification', 'kdialog',false);
  ber_notify.value    := fi.readbool('Notification', 'notifysend', false);

  dd_fonts.value      := fi.readstring('interface', 'fontname', 'default');
  ie_heightfont.value := fi.readinteger('interface', 'fontheight', 0);
  dd_langs.value      := fi.readstring('interface', 'language', 'en.lang');
  ber_left_menu.value := fi.readbool('interface', 'leftmenu', false);
  dd_themes.value     := fi.readstring('interface', 'Theme', 'Gray');
  ber_pos.value    := fi.readbool  ('interface', 'Remember_position', true);

  dd_term.value         := fi.readstring('utils', 'terminal', '');
  dd_finav.value        := fi.readstring('utils', 'filenavigator', '');
  dd_texteditor.value   := fi.readstring('utils', 'texteditor', '');
  
  if ber_pos.value then 
  begin
    options := options - [fo_screencentered];
    left  := fi.readinteger('form', 'left', left);
    top   := fi.readinteger('form', 'top', top);
    width  := fi.readinteger('form', 'width', bounds_cx);
    height := fi.readinteger('form', 'height', bounds_cy);
  end;
  se_mylist_fname.value := fi.readstring('MyPackageList', 'lastfile', '');

  fi.free;
end;

procedure tmainfo.on_set_old_table_style(const sender: TObject;var avalue: Boolean; var accept: Boolean);
var i : integer;
 
begin
  if avalue 
  then 
    begin //old
      twf.datacols[4].options := twf.datacols[1].options - [co_fill];
      twf.datarowlinewidth := 0;
      
      twf.datacols[0].width := 40; 
      twf.datacols[0].linewidth := 1;
       
      twf.datacols[1].width := 0; 
      twf.datacols[1].linewidth := 0; 

      twf.datacols[2].width := 0; 
      twf.datacols[2].linewidth := 0;

      twf.datacols[3].width := 180; 
      twf.datacols[3].linewidth := 1; 

      twf.datacols[4].width := 0; 
      twf.datacols[4].linewidth := 0; 

      twf.datacols[5].width := 20; 
      twf.datacols[5].linewidth := 0;
      
      for i := 6 to 10 do 
       begin
         twf.datacols[i].width := 120; 
         twf.datacols[i].linewidth := 1;
       end;

      twf.datacols[11].width := 500; 
      twf.datacols[11].linewidth := 1;
      b_collapce.visible := false;
      b_collapce.tag := 1;
      on_collapce_all(b_collapce);
    end
  else 
    begin
      twf.datarowlinewidth := 1;
    
      twf.datacols[0].width := 40; 
      twf.datacols[0].linewidth := 1; 

      twf.datacols[1].width := 0; 
      twf.datacols[1].linewidth := 0; 

      twf.datacols[2].width := 20; 
      twf.datacols[2].linewidth := 0;

      twf.datacols[3].width := 0; 
      twf.datacols[3].linewidth := 0;

      twf.datacols[5].width := 70; 
      twf.datacols[5].linewidth := 1;

      for i := 6 to 11 do 
       begin
         twf.datacols[i].linewidth := 0;
         twf.datacols[i].widthmin := 0; 
         twf.datacols[i].width := 0; 
       end;
      twf.datacols[4].options := twf.datacols[1].options + [co_fill];
      b_collapce.visible := true;
    end;
end;

procedure tmainfo.on_collapce_all(const sender: TObject);
var t : byte;
    i : integer;
begin
  t := b_collapce.tag;
  if t = 1 then t := 0 else t := 1;
  b_collapce.tag := t;
  for i := 0 to twf.rowcount - 1 do
  if t = 0 
     then begin 
          twf.rowheight[i] := rowheight;
          se_collapce[i] := '+';
          se_name2[i] := se_name[i];
          se_name2.height := rowheight;
          end
     else begin
          twf.rowheight[i] := rowheightex;
          se_collapce[i] := '--';
          se_name2[i] := se_name[i] + #10#10 +  
                     '     ' + se_desc[i] + #10#10 + 
                     '     ' + mes_Installed_version + ' : ' + se_ins[i] + #10 + 
                     '     ' + mes_Available_version + ' : ' + se_aval[i] + #10 +
                     '     ' + mes_Group + ' : ' + se_group[i] + #10 + 
                     '     ' + mes_Repository + ' : ' + se_repo[i];


          end
end;
/////////////////////////// SET LANG ///////////////////////////////

procedure tmainfo.on_set_lang(const sender: TObject);

function prepare_message(st : string) : string;
var I : integer;
    ss: string;
begin
  ST := TRIM(ST);
  IF length(st) = 0 then
    begin
      result := '[MESSAGE_NOT_FOUND]';
      exit;
    end;
  for i := length(st) downto 1 do 
   begin
    ss := copy(st,i,3);
//    if pos_('#10',st) = i then 
    if ss = '#10' then
       begin
         delete(st,i,3);
         insert(#10,st,i);
       end;
   end;
  result := st;
end;

function HasProperty(Obj: TObject; PropName: String; PropKinds: TTypeKinds = []): boolean;
begin
  Result := (GetPropInfo(Obj,PropName,PropKinds) <> nil);
end;

function prepare(s : string) : string;
var i, y : integer;
    ss : string;
begin
 if length(s) = 0 then 
  begin
    result := '';
    exit;
  end;
  
 y := length(s);
 for i := y downto 1 do
   begin
     ss := copy(s, i, 3);
     if (ss = '#13') or (ss = '#10') then
                 begin 
                   delete(s, i, 3);
                   if s[i] = '''' then delete(s,i,1);
                   insert(#10, s, i);
                   if s[i - 1] = '''' then delete(s,i - 1, 1);
                 end;  
   end;
 result := s;
end;

procedure setcaption(form, component, typ, prop, caption : string; num : integer);
var  formobj : twidget;
     ob : tobject;
begin
  if application.findwidget(form,formobj) then
  begin
    with formobj do 
    begin
    if findcomponent(component) = nil then
      begin
      writeln('component "' + component + '" on form "'+form+'" not found');
      exit;
      end
      ;//else writeln('component "' + component + '" on form "'+form+'" found!');
    end;//with
    
    if system.pos('frame.',prop) = 1 
    then with formobj do
         begin
           begin
           try
           (findcomponent(component) as twidget).createframe;
           except 
           end;
           ob := GetObjectProp(findcomponent(component),'frame');
           if HasProperty(ob,'caption') then 
              SetStrProp(ob,'caption',prepare(caption));
           end;
         end
    else 
    if system.pos('caption',prop) = 1 then
    BEGIN    
    try
    BEGIN
      if system.pos('grid', typ) > 0 
      then with formobj do 
           begin
           if findcomponent(component) as tcustomgrid <> nil then
           (findcomponent(component) as tcustomgrid).fixrows[-1].captions[num].caption := prepare(caption);
           end;
      if typ = 'tpopupmenu' 
      then with formobj do 
           begin
           if findcomponent(component) as tmenu <> nil then
             begin
             if caption = '<separator>'
                then(findcomponent(component) as tmenu).menu.items[num].options := [mao_separator, mao_shortcutcaption]
                else(findcomponent(component) as tmenu).menu.items[num].caption := prepare(caption);
             end;
           end
      else with formobj do 
           begin
           if findcomponent(component) <> nil then
           if HasProperty(tobject(findcomponent(component)),'caption') then
           SetStrProp(tobject(findcomponent(component)),'caption',prepare(caption));
           end;
    END;
    except writeln('Component not found ' + component);
    end; //try
    END
    else
    if system.pos('hint',prop) = 1 then
    BEGIN
    try
          with formobj do 
           begin
           if findcomponent(component) <> nil then
           if HasProperty(tobject(findcomponent(component)),'hint') then
           SetStrProp(tobject(findcomponent(component)),'hint',prepare(caption));
           end;
    except writeln('Component not found ' + component);
    end; //try
    END;
  end;
end;

var i : integer;
    sl : tstringlist;
    s : string;
    c : integer;
    form__ : string;
    component__ : string;
    caption__ : string;
    property__ : string;
    typ__ : string;
    fi : tinifile;
begin 
  i := 0; //important
  s := '';
  c := -1;
  form__ := '';
  typ__ := '';
  component__ := '';
  WRITELN('LANG="' + __langspath + dd_langs.value + '"');
  if dd_langs.value = '' then exit; 
  sl := tstringlist.create;
  sl.text := filetostring(__langspath + dd_langs.value);
  if sl.count > 0 then
    for i := 0 to sl.count - 1 do
      begin
        s := trim(sl[i]);
        if s = 'MESSAGES' then break;
        if (system.pos('#',s) = 1)or(length(s)=0) then continue;

        if (system.pos('caption',s) = 1)or(system.pos('frame.caption',s) = 1)
           or(system.pos('hint',s) = 1)
        then begin
             property__ := copy(s,1,system.pos('=',s) - 1);
             delete(s,1,system.pos('=',s));
             caption__ := s;
             inc(c);
             setcaption(form__,component__,typ__,property__,caption__, c);
             end
        else begin
             form__ := copy(s,1,system.pos(' ',s) - 1);
             delete(s,1,system.pos(' ',s));
             component__ := trim(copy(s,1,system.pos(':',s) - 1));
             delete(s,1,system.pos(':',s));
             typ__ := trim(s);
             c := -1;
             end;
      end;
      
      b_packages.hint := trichbutton37.caption;
      b_errors.hint := trichbutton5.hint;
      trichbutton6.hint := trichbutton39.caption;
      trichbutton48.hint := b_news.caption;
      trichbutton2.hint := trichbutton5.hint;
      trichbutton14.hint := trichbutton38.hint;
      trichbutton7.hint := b_about1.hint;
      b_dizz.hint := b_dizz.caption;
      trichbutton37.hint := trichbutton37.caption;
      trichbutton39.hint := trichbutton39.caption;
      b_mylist.hint := b_mylist.caption;
      b_news.hint := b_news.caption;
      
      trichbutton18.caption := trichbutton16.caption;
      trichbutton25.caption := trichbutton16.caption;
      b_remove_orfans2.caption := b_remove_orfans.caption;
      
      trichbutton51.caption := trichbutton59.caption;
      trichbutton58.caption := trichbutton59.caption;
      b_continue_ins.caption := b_continue_del.caption;
      trichbutton60.caption := b_continue_del.caption;
      
      trichbutton57.caption := trichbutton58.caption;
      trichbutton63.caption := trichbutton59.caption;
      
      dd_ig1.frame.caption      := dd_ag1.frame.caption;
      dd_ir1.frame.caption      := dd_ar1.frame.caption;
      dd_cat_ins1.frame.caption := dd_cat_all1.frame.caption;
      b_clear_session.caption := b_clearlog.caption;
      ber_external2.frame.caption := ber_external.frame.caption;

      
      wg_mylist.fixrows[-1].captions[1].caption := twf.fixrows[-1].captions[3].caption;
      
      paramsfo.trichbutton4.caption := b_continue_del.caption;
      sl.free;
    fi := tinifile.create(__langspath + dd_langs.value);
    mes_File_not_found := prepare_message(fi.readstring('MESSAGES','File_not_found','mes_File_not_found'));
    mes_Clear_log := prepare_message(fi.readstring('MESSAGES','Clear_log_file','mes_Clear_log_file'));
    mes_check := prepare_message(fi.readstring('MESSAGES','check','mes_check'));
    mes_Ok := prepare_message(fi.readstring('MESSAGES','Ok','mes_Ok'));
    mes_Error := prepare_message(fi.readstring('MESSAGES','Error','mes_Error'));
    mes_verbosepkglists_switch_off := prepare_message(fi.readstring('MESSAGES','verbosepkglists_switch_off','mes_verbosepkglists_switch_off'));
    mes_sinh_mirrors := prepare_message(fi.readstring('MESSAGES','sinh_mirrors','mes_sinh_mirrors'));
    mes_orfans := prepare_message(fi.readstring('MESSAGES','orfans','mes_orfans'));
    mes_load_packagelist := prepare_message(fi.readstring('MESSAGES','load_packagelist','mes_load_packagelist'));
    mes_Without_group := prepare_message(fi.readstring('MESSAGES','Without_group','mes_Without_group'));
    mes_all_packages := prepare_message(fi.readstring('MESSAGES','all_packages','mes_all_packages'));
    mes_please_wait := prepare_message(fi.readstring('MESSAGES','please_wait','mes_please_wait'));
    mes_search := prepare_message(fi.readstring('MESSAGES','search','mes_search'));
    mes_search_in_AUR := prepare_message(fi.readstring('MESSAGES','search_in_AUR','mes_search_in_AUR'));
    mes_Installed_version := prepare_message(fi.readstring('MESSAGES','Installed_version','mes_Installed_version'));
    mes_Available_version := prepare_message(fi.readstring('MESSAGES','Available_version','mes_Available_version'));
    mes_Group := prepare_message(fi.readstring('MESSAGES','Group','mes_Group'));
    mes_Repository := prepare_message(fi.readstring('MESSAGES','Repository','mes_Repository'));
    mes_Screenshots_are_switch_off := prepare_message(fi.readstring('MESSAGES','Screenshots_are_switch_off_in options','mes_Screenshots_are_switch_off_in options='));
    mes_loading_screenshot := prepare_message(fi.readstring('MESSAGES','Loading_screenshot','mes_Loading_screenshot'));
    mes_Seaching_screenshot := prepare_message(fi.readstring('MESSAGES','Seaching_screenshot','mes_Seaching_screenshot'));
    mes_No_screenshot := prepare_message(fi.readstring('MESSAGES','No_screenshot','mes_No_screenshot'));
    mes_Cant_save_file := prepare_message(fi.readstring('MESSAGES','Can`t_save_file','mes_Can`t_save_file'));
    mes_Cant_delete_file := prepare_message(fi.readstring('MESSAGES','Can`t_delete_file','mes_Can`t_delete_file'));
    mes_files := prepare_message(fi.readstring('MESSAGES','files','mes_files'));
    mes_cache := prepare_message(fi.readstring('MESSAGES','Cache','mes_Cache'));
    mes_error_news := prepare_message(fi.readstring('MESSAGES','error_news','mes_error_news'));
    mes_Please_select_package := prepare_message(fi.readstring('MESSAGES','Please_select_package','mes_Please_select_package'));
    mes_install := prepare_message(fi.readstring('MESSAGES','install','mes_install'));
    mes_remove := prepare_message(fi.readstring('MESSAGES','remove','mes_remove'));
    mes_Done := prepare_message(fi.readstring('MESSAGES','Done','mes_Done'));
    mes_long_time := prepare_message(fi.readstring('MESSAGES','long_time','long_time'));
    mes_logfile := prepare_message(fi.readstring('MESSAGES','log_file_is_more_then_1Mbt','mes_log_file_is_more_then_1Mbt'));
    mes_Loading := prepare_message(fi.readstring('MESSAGES','Loading','mes_Loading'));
    mes_All_log := prepare_message(fi.readstring('MESSAGES','All_log','mes_All_log'));
    mes_Saved := prepare_message(fi.readstring('MESSAGES','Saved','mes_Saved'));
    mes_Have_you_rights_to_do_it := prepare_message(fi.readstring('MESSAGES','Have_you_rights_to_do_it','mes_Have_you_rights_to_do_it'));

    mes_edit_PKGBUILD1  := prepare_message(fi.readstring('MESSAGES','edit_PKGBUILD1','mes_edit_PKGBUILD1'));
    mes_edit_PKGBUILD2  := prepare_message(fi.readstring('MESSAGES','edit_PKGBUILD2','mes_edit_PKGBUILD2'));
    
    mes_File_exsists  := prepare_message(fi.readstring('MESSAGES','File_exsists','mes_File_exsists'));
    MES_TERMINATEPROCESS  := prepare_message(fi.readstring('MESSAGES','TERMINATEPROCESS','MES_TERMINATEPROCESS'));
    fi.free;
  
  if (system.pos(#10, ttabpage16.caption) > 0) 
    or (system.pos(#10, ttabpage17.caption) > 0) 
     or (system.pos(#10, ttabpage6.caption) > 0)
      or (system.pos(#10, ttabpage14.caption) > 0)
      then tw_info.tab_size := 40
      else tw_info.tab_size := 20;
  application.processmessages;
  __infotabsize := tw_info.tab_size;
  m_add := mes_install;
  m_del := mes_remove;
end;

procedure tmainfo.on_open_in_texteditor(const sender: TObject);
var s,cmd : string;
    fs: tsearchrec;
begin
  if wg.row < 0 then exit;
  s := term_files[wg.row];
  delete(s,1,system.pos(' ',s));
  findfirst(s,faanyfile,fs);

  cmd := dd_texteditor.value;
  if cmd = 'gedit' then cmd := cmd + ' -s';

  if ((fs.Attr and faDirectory) <> 0)                  //если каталог
     then exec(dd_finav.value + ' "' + extractfilepath(s) + '"',false)
     else exec(cmd + ' "' + s + '"',false);
  findclose(fs);  
end;

procedure tmainfo.on_open_in_filemanager(const sender: TObject);
var s : string;
    fs: tsearchrec;
begin
  if wg.row < 0 then exit;
  s := term_files[wg.row];
  delete(s,1,system.pos(' ',s));
  findfirst(s,faanyfile,fs);
  if ((fs.Attr and faDirectory) = 0)                  //если каталог
    then exec(dd_finav.value + ' "' + extractfilepath(s) + '"',false)
    else exec(dd_finav.value + ' "' + s + '"',false);
end;

procedure tmainfo.on_progfinish(const sender: TObject);
var i : integer;
begin
  l_request.caption := '';
  if wg.rowcount > 0 then
  for i := wg.rowhigh downto 0 do
    if term_files[i] = 'tput: No value for $TERM and no -T specified' then 
      wg.deleterow(i);
end;

procedure tmainfo.on_deletedblock(const sender: TObject); 
begin
  if not trydeletefile('/var/lib/pacman/db.lck')
  then begin
	         //l_oper_title.caption := mes_Please_select_package;
        	 //tw_oper.activepage := tab_empty;
        	 show_empty(mes_error,mes_Cant_delete_file + ' /var/lib/pacman/db.lck');
	         exit;
       end;
  if l_aur.caption = 'true' then exit;
  
  b_delete_dblock.visible := false; 
  __error := false;

  if sender = b_delete_dblock then
  begin
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := '=====================================================';
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := 'Restart last command :';
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := '=> EXECUTE: ' + l_lastcommand.caption;
       wg_seslog.appendrow(false);
       te_seslog[wg_seslog.rowhigh] := '=====================================================';
  
    term_task.addline('Restart last command :');
    term_task.addline('=====================================================');
    term_task.addline('=> EXECUTE : ' + l_lastcommand.caption);
    term_task.addline('=====================================================');
    pb.visible := true;
    pb2.visible := true;
    pb.value := 0;
    pb2.value := 0;
    term_task.execprog(l_lastcommand.caption);
    timer_run.enabled:= true;
    b_run.width := 20;
    
  end;
end;

procedure tmainfo.on_delete_historyrow(const sender: TObject);
begin
  tw_history.deleterow(tw_history.row);
end;

procedure tmainfo.on_execute_form_history(const sender: TObject);
begin
  b_repeat.hint := te_history[tw_history.row];
  b_repeat.caption := 'Repeat operation';
  on_exectask(b_repeat);
end;

procedure tmainfo.on_finish_download_thumb(const sender: TObject);
begin
  if fileexists(__imagesdir + se_name[twf.row]) 
     then try
          im_thumb.bitmap.loadfromfile(__imagesdir + se_name[twf.row]);
          l_thumb.caption := '';
          except 
          l_thumb.caption := 'mes_Error_while_loading_screenshot';
          end
     else l_thumb.caption := mes_No_screenshot;
  deletefile('wget.log'); 
end;

procedure tmainfo.on_finish_download_screenshot(const sender: TObject);
begin
  writeln(__imagesdir + se_name[twf.row] + '.1');
  if fileexists(__imagesdir + se_name[twf.row] + '.1')
            then try 
                 screenshotfo.l_screenshot_info.caption := mes_loading_screenshot + ' ...';
                 screenshotfo.l_screenshot_info.update;
                 screenshotfo.im_.bitmap.loadfromfile(__imagesdir + se_name[twf.row] + '.1');
                 finally
                 screenshotfo.l_screenshot_info.caption := '';
                 end
            else screenshotfo.l_screenshot_info.caption := mes_No_screenshot;
  deletefile('wget.log'); 
end;

procedure tmainfo.on_clear_session_log(const sender: TObject);
begin
  wg_seslog.clear;
end;

procedure tmainfo.on_search_package_from_tree(const sender: TObject);

var pkg : msestring; //don`t use here type "string"!!!
      i : integer;
      
      sr: set of 'a'..'z';
      
begin
  if wg_tree.row < 0 then exit;
  pkg := trim(term_tree[wg_tree.row]);
  if pkg = '' then exit;
  
  //pacman 4.0.x support  
  if system.pos(' ',pkg) > 0 then pkg := copy(pkg,1,system.pos(' ',pkg) - 1);
  if system.pos('--',pkg) > 0 then delete(pkg,1,system.pos('--',pkg) + 1);

  //pacman 4.1.x support  
  while system.pos('─',pkg) > 0 do delete(pkg,1,system.pos('─',pkg));
  while system.pos('?',pkg) > 0 do delete(pkg,1,system.pos('?',pkg));



  se_filter.text := trim(pkg);
  on_change_filter(sender);
  if twf.rowcount = 0 then exit;
  for i := 0 to twf.rowhigh do 
      if se_name[i] = pkg then twf.row := i;
  wg_tree.clear; //main!!!
  term_tree.execprog('pactree ' + pkg);
end;

procedure tmainfo.on_cell_event_show_package_from_tree(const sender: TObject;var info: celleventinfoty);
begin
  if iscellclick(info,[ccr_dblclick]) then on_search_package_from_tree(sender);
end;

procedure tmainfo.on_hotkey(const sender: twidget; var ainfo: keyeventinfoty);
var info : keyeventinfoty;
    i,y : integer;
    gr : gridcoordty;
begin
 if s_oper.visible then 
 begin
   if ainfo.key = key_Escape then
      if s_oper.visible then on_close_stop_oper(sender);
   exit;
 end;
 if ss_ctrl in ainfo.shiftstate then
 begin
 if (tw_main.activepageindex = 1) then
 begin
 case ainfo.key of
   key_A : for i := 0 to twf.datacols.count - 1 do 
              for y := 0 to twf.rowcount - 1 do 
                begin
                 gr.row := y;
                 gr.col := i; 
                 twf.selectcell(gr, csm_select);
                end; 
   key_C : on_add_remove_clear(b_cancel);
   key_I : on_add_remove_clear(b_ins);
   key_R : on_add_remove_clear(b_del);
   key_F : if se_filter.visible then se_filter.setfocus;
   key_L : begin
             if twf.visible then twf.setfocus;
           end;
   key_E : on_exectask(b_execute);
 end;
 end
 else
 if (tw_main.activepageindex = 4) then
 begin
 case ainfo.key of
   key_S : begin
           if tw_sets.activepageindex = 2 then on_save_pacmanconf(sender);
           if tw_sets.activepageindex = 3 then on_save_mirrorlist(sender);
           if tw_sets.activepageindex = 4 then on_save_yaourtrc(sender);
           end; 
 end;
 end
 else
 case ainfo.key of
   key_U : on_exectask(b_updatesystem);
   key_S : on_exectask(b_sinh);
 end;
 
 end
 else
 if (tw_main.activepageindex = 1)
   and(not se_filter.focused) then 
   begin
    if ainfo.key in [key_0..key_9, key_A..key_Z] then
       begin 
         if se_filter.visible then se_filter.setfocus;
         se_filter.text := se_filter.text + keytomsechar(ainfo.key);
         info.key := key_End;
         se_filter.editor.dokeyDown(info);
       end;
   end; 
end;

procedure tmainfo.on_timer_run(const sender: TObject);
begin
  if b_run.caption = '--' 
  then b_run.caption := '/'
  else 
  if b_run.caption = '/'
  then b_run.caption := '|'
  else 
  if b_run.caption = '|'
  then b_run.caption := '\'
  else 
  if b_run.caption = '\'
  then b_run.caption := '--'
  ;
  if __runnum > 9 then __runnum := -1;
  inc(__runnum);
  b_run.imagenr := __runnum;
  b_run.update;
end;

procedure tmainfo.on_add_to_searchlist(const sender: TObject);
var s, s2 : string;
    i : integer;
    b : boolean;
begin
  s := trim(se_filter.text);
  if s > '' then
  begin
    if (ber_aur.value)and(system.pos(' (AUR)',s) = 0)
      then s2 := s + ' (AUR)'
      else s2 := s;
    b := false;
    for i := 0 to se_filter2.dropdown.cols[0].count - 1 do
      if se_filter2.dropdown.cols[0].items[i] = s2 then b := true;
    if not b then se_filter2.dropdown.cols.addrow(msestring(s2));
  end;
end;

procedure tmainfo.on_resizeform_via_dockhandle(const sender: TObject);
begin
  width := gui_getpointerpos.x - moveXX;
  height := gui_getpointerpos.y - moveYY;
end;

procedure tmainfo.on_childmouseevents(const sender: twidget;
               var ainfo: mouseeventinfoty);
begin
  if (gui_getpointerpos.x >= width - tdockhandle1.width + left) and 
     (gui_getpointerpos.y >= height - tdockhandle1.height + top) then
        tdockhandle1.visible := true
        else tdockhandle1.visible := false;
          
  if (ainfo.eventkind = ek_buttonpress) then 
    if sender = mainfo.tdockhandle1 then 
     begin
       moveXX := gui_getpointerpos.x - width;
       moveYY := gui_getpointerpos.y - height;
       timer_resize.enabled := true;
     end;     
  if (ainfo.eventkind = ek_buttonrelease) then 
   begin
     if timer_resize.enabled then timer_resize.enabled := false;
   end;

end;

procedure tmainfo.on_setvalue_extterm2(const sender: TObject;
               var avalue: Boolean; var accept: Boolean);
begin
  ber_external.value := avalue; 
end;

procedure tmainfo.on_set_extterm1(const sender: TObject; var avalue: Boolean;
               var accept: Boolean);
begin
  ber_external2.value := avalue; 
end;

procedure tmainfo.on_copy_from_cache(const sender: TObject);
var i : integer;
    s : string;
begin
  s := '';
  rowcountforcopy := 0;
  if wg_cache.rowcount > 0 then 
     for i := 0 to wg_cache.rowcount - 1 do
        if ber_cache[i] then 
         begin
           s := s + ' ''' + __cachedir + se_file[i] + '''';
           inc(rowcountforcopy);
         end;
         
  if trim(s) = ''
    then begin 
         show_empty(mes_error, mes_Please_select_package);
         exit;
         end;

  if s_oper_form.height = 510
    then begin 
         tw_task.visible := false;
         s_oper_form.height := s_oper_form.height div 3 - 20;
         on_resizeform(mainfo);
         end;
  
  l_oper_title.caption := b_export_from_cache.caption;
  tw_oper.activepage := tp_copy_from_cache;
  s_oper.visible := true;
  s_oper.bringtofront;
end;

procedure tmainfo.on_start_copy(const sender: TObject);
var i : integer;
    s : string;
    dir : string;
begin
  mainfo.cursor := cr_wait;  
  s_oper.visible := false;
  application.processmessages;

  pb_copying.value := 0;
  pb_copying.visible := true;

  dir := dd_copyto.value;
  if length(dir) > 0 then if dir[length(dir)] <> '/' then dir := dir + '/';
  
  if wg_cache.rowcount > 0 then 
     for i := 0 to wg_cache.rowcount - 1 do
        if ber_cache[i] then 
          begin
            if not be_overwrite.value
            then begin
                 if fileexists(dir + se_file[i]) then se_status[i] := mes_File_exsists
                 end
            else
            if trycopyfile(__cachedir + se_file[i], dir + se_file[i], be_overwrite.value)
               then se_status[i] := mes_Ok
               else se_status[i] := mes_Error;
            pb_copying.value := i / rowcountforcopy;
            application.processmessages;
          end;
  mainfo.cursor := cr_default;
  pb_copying.visible := false;
end;

procedure tmainfo.on_set_color_of_outofdate_packages(const sender: TObject;
               var avalue: colorty; var accept: Boolean);
begin

end;

procedure tmainfo.on_change_color_of_outofdate_packages(const sender: TObject);
begin
  twf.rowcolors[1] := ce_colorize.value;
end;


end. 

