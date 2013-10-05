{ Copyright (c) 2011-2012 by Alexandre Minoshi
   
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; version 2 of the License.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
}
unit paramsform;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface
uses
 mseglob,mseguiglob,mseguiintf,mseapplication,msestat,msemenus,msegui,
 msegraphics,msegraphutils,mseevent,mseclasses,mseforms,msescrollbar,msetabs,
 msewidgets,sysutils,msesplitter,msesimplewidgets,msegraphedits,mseifiglob,
 msetypes,msedataedits,mseedit,msegrids,msestrings,msewidgetgrid,mseterminal,
 msetimer,msestatfile,msestream;
type
 tparamsfo = class(tmseform)
   sp5: tspacer;
   trichbutton8: trichbutton;
   wg_home: twidgetgrid;
   be_yes: tbooleanedit;
   se_type: tstringedit;
   se_name2: tstringedit;
   se_status: tstringedit;
   tspacer36: tspacer;
   l_check: tlabel;
   b_downgrade: trichbutton;
   tspacer47: tspacer;
   tbooleanedit1: tbooleanedit;
   trichbutton4: trichbutton;
   procedure on_closeform(const sender: TObject);
   //CHECK HOME DIRECTORY
   procedure on_CHECK_homedirectory(const sender: TObject);
   procedure on_deletefiles(const sender: TObject);
   procedure on_set_select_all(const sender: TObject; var avalue: Boolean; var accept: Boolean);
 end;
var
 paramsfo: tparamsfo;
 __runnum : integer;
 
implementation
uses
 paramsform_mfm, classes, messages, main;

procedure tparamsfo.on_closeform(const sender: TObject);
begin
  close;
end;

///////// CHECK HOME DIRECTORY ///////////////////////////////////
function FullRemoveDir(Dir: string; DeleteAllFilesAndFolders,
  StopIfNotAllDeleted, RemoveRoot: boolean): Boolean;
var
  i: Integer;
  SRec: TSearchRec;
  FN: string;
begin
  Result := False;
  if not DirectoryExists(Dir) then
    exit;
  Result := True;
  // Добавляем слэш в конце и задаем маску - "все файлы и директории"
  Dir := Dir + '/';
  i := FindFirst(Dir + '*', faAnyFile, SRec);
  try
    while i = 0 do
    begin
      // Получаем полный путь к файлу или директорию
      FN := Dir + SRec.Name;
      // Если это директория
      if (faDirectory and SRec.Attr) = faDirectory then
      begin
        // Рекурсивный вызов этой же функции с ключом удаления корня
        if (SRec.Name <> '') and (SRec.Name <> '.') and (SRec.Name <> '..') then
        begin
          if DeleteAllFilesAndFolders then FileSetAttr(FN, faArchive);
          Result := FullRemoveDir(FN, DeleteAllFilesAndFolders, StopIfNotAllDeleted, True);
          if not Result and StopIfNotAllDeleted then exit;
        end;
      end
      else // Иначе удаляем файл
      begin
        if DeleteAllFilesAndFolders then FileSetAttr(FN, faArchive);
        Result := DeleteFile(FN);
        if not Result and StopIfNotAllDeleted then exit;
      end;
      // Берем следующий файл или директорию
      i := FindNext(SRec);
    end;
  finally
    FindClose(SRec);
  end;
  if not Result then exit;
  if RemoveRoot then // Если необходимо удалить корень - удаляем
    if not RemoveDir(Dir) then Result := false;
end;

procedure tparamsfo.on_CHECK_homedirectory(const sender: TObject);
 
 procedure addinhometable(typ, fname : string);
 begin
   wg_home.rowcount := wg_home.rowcount + 1;
   se_type[wg_home.rowcount - 1] := typ;
   se_name2[wg_home.rowcount - 1] := fname;
 end;

 procedure checkhomedirectory(dir, fname : string);
 var fss : tsearchrec;
  begin
    writeln('Searching:' + fname + '  in ' + dir);
    if findfirst(dir + '*'+fname + '*', faanyfile, fss) = 0 then
      repeat
        writeln(fss.name);
        if (fss.name = '.')or(fss.name = '..') then continue;
        if (fadirectory and fss.attr) = fadirectory 
           then addinhometable('directory', dir + fss.name)
           else addinhometable('file', dir + fss.name);
      until findnext(fss) <> 0;
 end;
 
 procedure checkdir(fname : string);
 var i : integer;
 begin
   writeln('==> check files in ' + fname);
   if mainfo <> nil then          
   with mainfo do begin
   if sg_query.rowcount > 0 then 
   for i := 0 to sg_query.rowcount - 1 do
     begin
       if sg_query[0][i] = m_del then 
         begin
           writeln('sg_query=' + sg_query[1][i]);
           checkhomedirectory(fname + '/', sg_query[1][i]);
           checkhomedirectory(fname + '/.config/', sg_query[1][i]);
           checkhomedirectory(fname + '/.cache/', sg_query[1][i]);
           checkhomedirectory(fname + '/.local/', sg_query[1][i]);
           checkhomedirectory(fname + '/.kde4/', sg_query[1][i]);
           checkhomedirectory(fname + '.Almin-Soft/', sg_query[1][i]);
           if sg_query[1][i] = 'pacmanxg4-bin' then
             begin
              checkhomedirectory(fname + '/.Almin-Soft/PacmanXG/', 'pacmanxg.conf');
             end;
         end;
     end;
   end; //with
 end;
 
type 
     styp = set of '0'..'9';
 
var fs : tsearchrec;
     i : integer;
     _whoami : string;
     //s : string;
begin
      _whoami := mainfo.whoami + '/';
      writeln('whoami=' + _whoami);
      l_check.caption := mes_please_wait + ' ...'; l_check.update;
      wg_home.clear;
      
      if findfirst('/home/*', faanyfile, fs) = 0 then
      repeat 
        if (fadirectory and fs.attr) = fadirectory then
          begin
            if (fs.name = '.')or(fs.name = '..') then continue;
            checkdir('/home/' + fs.name);
          end;
      until findnext(fs) <> 0;
      checkdir('/root');
      
      findclose(fs);
      l_check.caption := '';//mes_Done;
    writeln('Total found :' + inttostr(wg_home.rowcount));
end;

procedure tparamsfo.on_set_select_all(const sender: TObject;var avalue: Boolean; var accept: Boolean);
var i : integer;
begin
  if wg_home.rowcount > 0 then 
    for i := 0 to wg_home.rowcount - 1 do be_yes[i] := avalue;
end;

procedure tparamsfo.on_deletefiles(const sender: TObject);
var i : integer;
begin
  if wg_home.rowcount > 0 then 
    for i := 0 to wg_home.rowcount - 1 do
     begin
       if se_type[i] = 'directory' 
         then begin
              if not FullRemoveDir(se_name2[i], true, true, true)
                then se_status[i] := 'Error'
                else se_status[i] := 'Deleted';
              enD
         else begin
              if not deletefile(se_name2[i])
                then se_status[i] := 'Error'
                else se_status[i] := 'Deleted';
              end;
     end;  
end;
 
end.
