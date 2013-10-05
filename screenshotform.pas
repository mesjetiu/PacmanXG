unit screenshotform;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface
uses
 mseglob,mseguiglob,mseguiintf,mseapplication,msestat,msemenus,msegui,
 msegraphics,msegraphutils,mseevent,mseclasses,mseforms,msesplitter,
 msesimplewidgets,msewidgets,mseimage,msegraphedits,mseifiglob,msetypes;
type
 tscreenshotfo = class(tmseform)
   tspacer1: tspacer;
   tbooleaneditradio1: tbooleaneditradio;
   tspacer2: tspacer;
   tbooleaneditradio2: tbooleaneditradio;
   tspacer3: tspacer;
   l_screenshot_info: tlabel;
   b_execute: trichbutton;
   im_: timage;
   b_update: trichbutton;
   procedure on_closeform(const sender: TObject);
   procedure on_set100(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_set_stretch(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure on_update(const sender: TObject);
 end;
var
 screenshotfo: tscreenshotfo;
implementation
uses
 screenshotform_mfm, main;
procedure tscreenshotfo.on_closeform(const sender: TObject);
begin
  close;
end;

procedure tscreenshotfo.on_set_stretch(const sender: TObject; var avalue: Boolean;
               var accept: Boolean);
begin
  im_.bitmap.alignment := [al_xcentered,al_ycentered,al_fit];  
end;

procedure tscreenshotfo.on_set100(const sender: TObject; var avalue: Boolean;
               var accept: Boolean);
begin
  im_.bitmap.alignment := [al_xcentered,al_ycentered];
end;

procedure tscreenshotfo.on_update(const sender: TObject);
var ainfo : mouseeventinfoty;
begin
            ainfo.eventkind := ek_buttonpress;
            mainfo.on_show_screenshot(mainfo.im_thumb,AINFO); 
end;

end.
