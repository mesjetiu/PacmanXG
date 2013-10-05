unit engine;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface

uses msegui, msestrings, mseterminal, mseclasses, sysutils,
     inifiles,  {httpsend,}
     msetimer, classes, msewindowwidget, msewidgets, mseprocess, process, msekeyboard,
     msefileutils;

type
 tarraytype = array of array[0..12] of string;
     //[0 - action 1 - name, 2- ins ver, 3 - aval ver, 4 - group, 5 - repo, 
     //6 - desc, 7 -size, 8 - expls or deps, 9 - orfans, 10 - have update, 
     //11 - number, 12 - category] 
     
 tarrint = array of integer;

 function compversions(ver1, ver2 : string) : integer;
// function DownloadHTTP(URL, TargetFile: string): boolean;
 function FileToString(FileName:String):String;
 
 procedure updatearray(const upd : boolean; 
                var ar_ : tarraytype; output : string;
                sl_orfans, sl_expls : tstringlist;
                var slr, slg, slr_ins, slg_ins, slcat, slcat_ins : tstringlist;
                var _installed, _haveupdate : integer);

 function filter(var txt : string; 
                const ar_ : tarraytype; 
                const ins, repo, group, expl_dep, orfan, haveupdate, category : string; 
                const exact : boolean) : tarrint;

 function getorfans : string;
 function getExpls  : string;
 function getPackages : string;
 function synhMirrors : string;
 function searchAur(packagename : string) : string;
 function Exec(cmd : string; wait : boolean) : string;
 function FindBinaryBool(fname : string): boolean;
 function GetArch : string;
 function GetLocale : string;
 
implementation
type 
 tt = class(tterminal)
 private
   function exec(const cmd : string; const wait : boolean) : string;
 public
   procedure ongettext(const sender : TObject; var atext: AnsiString; const errorinput: Boolean);
 end;
 
var __output : string;
    fterm : tt;
     
function compversions(ver1, ver2 : string) : integer;

function comparestrings(str1, str2 : string) : integer;
var i : integer;
begin
  if length(str1) > length(str2)
     then begin
            result := -1;
            exit;
          end;  
  
  if length(str1) < length(str2)
     then begin
            result := 1;
            exit;
          end;
            
  result := 0;
  for i := 1 to length(str1) do
    begin
      if str1[i] < str2[i] 
         then begin
                result := 1;
                break;
              end;

      if str1[i] > str2[i] 
         then begin
                result := -1;
                break;
              end;
    end;
end;

var a1, a2,
    b1, b2,
    c1, c2,
    d1, d2 : string;
begin
  ver1 := trim(ver1);
  ver2 := trim(ver2);

   
  if (length(ver1) = 0)or(length(ver2) = 0) then    
    begin
      result := -2;
      exit;
    end;

  if ver1 = ver2 then
    begin
      result := 0;
      exit;
    end;

  a1 := '';  a2 := '';
  b1 := '';  b2 := '';
  c1 := '';  c2 := '';
  d1 := '';  d2 := '';

  if pos('-',ver1) > 0 then
    begin
      d1 := copy(ver1,pos('-',ver1) + 1, length(ver1)- pos('-',ver1));
      delete(ver1,pos('-',ver1), length(ver1)- pos('-',ver1) + 1);
    end;

  if pos('-',ver2) > 0 then
    begin
      d2 := copy(ver2,pos('-',ver2) + 1, length(ver2)- pos('-',ver2));
      delete(ver2,pos('-',ver2), length(ver2)- pos('-',ver2) + 1);
    end;

  if pos('.', ver1) > 0 then
     begin
      a1 := copy(ver1,1,pos('.',ver1) - 1);
      delete(ver1,1,pos('.',ver1));
     end;
     
  if pos('.', ver2) > 0 then
     begin
      a2 := copy(ver2,1,pos('.',ver2) - 1);
      delete(ver2,1,pos('.',ver2));
     end;

   if pos('.', ver1) > 0 then
     begin
      b1 := copy(ver1,1,pos('.',ver1) - 1);
      delete(ver1,1,pos('.',ver1));
     end;
     
   if pos('.', ver2) > 0 then
     begin
      b2 := copy(ver2,1,pos('.',ver2) - 1);
      delete(ver2,1,pos('.',ver2));
     end;

  c1 := ver1;
  c2 := ver2;

  result := comparestrings(a1,a2);
  if result = 0 then result := comparestrings(b1,b2);
  if result = 0 then result := comparestrings(c1,c2);
  if result = 0 then result := comparestrings(d1,d2);
  
end;

procedure updatearray(const upd : boolean; 
                        var ar_ : tarraytype; output : string;
                        sl_orfans, sl_expls : tstringlist;
                        var slr, slg, slr_ins, slg_ins, slcat, slcat_ins : tstringlist;
                        var _installed, _haveupdate : integer);
                      
var i, y, y2, y3, slcount : integer;
    s, ss : string;
    _repo, _group, _size, _name, _category : string; 
    row : integer;
    packageexists : boolean;
    t : ttime;
    sl_packs  : tstringlist;

   fi : tinifile;
begin
 t := now;
 sl_packs  := tstringlist.create;
 sl_packs.text := output;
 
 setlength(ar_, 0);
 fi := tinifile.create('/opt/pacmanxg/sections.ini');
 if upd then begin
   _haveupdate := 0;
   _installed  := 0;
 end;
 
 row := -1;
 slcount := sl_packs.count;
 y2 := 0;
 
 if slcount > 0 then 
 for i := 0 to slcount - 1 do
   begin
     s := sl_packs[i];
     
     if trim(s) = '' then continue;
     if pos('directive ''showsize''',s) > 0 then continue; //pacman 3.5 capability
     if pos('error:',s) > 0 then continue; 
     if pos('warning: database file',s) > 0 then continue; //bug in Nosonja OS (only first run)
     if (pos('tput:',s) > 0)
       and(s[1] <> ' ') //ignore because package "potrace" has this string in description
       then continue; //bug found by mehanoid, but i don`t know where it
     
     if s[1] <> ' '
     then begin
            //repository
            _repo := copy(s,1,pos('/',s) - 1);
            delete(s,1,pos('/',s));

            //packagename check
            packageexists := false;
            _name := trim(copy(s,1,pos(' ',s) - 1));

            if upd then 
            if _repo = 'local' 
            then if high(ar_) > 1 then
                 begin
                  if y2 = 0 then y2 := high(ar_);
                  for y := 0 to y2 do
                     if ar_[y,1] = _name 
                     then begin
                            packageexists := true;
                            break;
                          end;
                 end;
                 
            if packageexists then continue;
            inc(row);
            setlength(ar_,row + 1);

            //number
            ar_[row,11] := inttostr(row);
            //packagename
            ar_[row,1] := _name;
            delete(s,1,pos(' ',s));
            ar_[row,2] := '';
            ar_[row,3] := '';
            
            //category
            _category := fi.readstring(_name,'Section','');
            ar_[row,12] := _category;
            
            if upd then begin

            //type - expl or dep
            ar_[row,8] := 'd';  // first write deps, then rewrite if expl

            y3 := sl_expls.count - 1;
            if y3 > - 1 then
            begin
            for y := 0 to y3 do 
              if sl_expls[y] = _name then
              begin
                ar_[row,8] := 'e';
                sl_expls.delete(y);
                break;
              end;
            end;
      
            // orfans 
            y3 := sl_orfans.count - 1;
            if y3 > - 1 then
            begin
            for y := 0 to y3 do // if orfan 
              if sl_orfans[y] = _name then 
              begin 
                ar_[row,9] := 'o'; //// !!!!
                sl_orfans.delete(y);
                break;
              end;
            end;
            end; // if upd ...
            
            //aval version
            if pos(' ',s) > 0 
               then begin 
                     if _repo = 'local' 
                        then ar_[row,2] := copy(s,1,pos(' ',s) - 1)
                        else ar_[row,3] := copy(s,1,pos(' ',s) - 1);
                     delete(s,1,pos(' ',s));
                    end
               else begin
                     if _repo = 'local' 
                        then ar_[row,2] := s
                        else ar_[row,3] := s;
                    end;
                    
            //group
            if (pos('(',s) > 0)and(pos(')',s) > 0)
               then _group := copy(s,pos('(',s),pos(')',s) - pos('(',s) + 1)
               else _group := '';
            ar_[row,4] := _group;
            
            //size for pacman versions < 4.0.0
            if (pos('[',s) > 0)and(pos('B]',s)>0) then
            begin
              s := trim(s);
              _size := trim(copy(s,pos('[',s) + 1, (pos('B]',s) - pos('[',s) ) - 3));
              delete(s,pos('[',s), (pos('B]',s) - pos('[',s) ) + 2);
            end
            else _size := '';
            
            //installed version
            if (pos('[',s) > 0)and(pos(']',s) > 0) then 
            begin
              s := trim(s);
              if pos(':',s) > 0 // if installed version < aval version 
                then ar_[row,2] := copy(s,pos(':',s) + 2, pos(']',s) - pos(':',s) - 2)
                else ar_[row,2] := ar_[row,3];
              inc(_installed);
            end;
            if _repo = 'local' then inc(_installed);
            
            //have update
            if compversions(ar_[row,2], ar_[row,3]) = 1 then 
                  begin
                    inc(_haveupdate);
                    ar_[row,10] := 'h';
                  end; 
            // == here write repo to table ==//
            ar_[row,5] := _repo;
            
            if upd then begin
            
            //parce categories
            if _category > '' then
              begin
               if ar_[row,2] > '' 
                  then if slcat_ins.indexof(_category) = -1 then slcat_ins.add(_category);
               if slcat.indexof(_category) = -1 then slcat.add(_category);
              end;
              
            //parce repos
            if slr.indexof(_repo) = -1 then slr.add(_repo);
             if ar_[row,1] > '' then 
                 if slr_ins.indexof(_repo) = -1 then slr_ins.add(_repo);

            //parce groups 
            if trim(_group) > '' then
               begin
                 if pos('(',_group) > 0 then delete(_group,1,1);
                 if pos(')',_group) > 0 then delete(_group,length(_group),1);
                 if pos(' ', _group) > 0 then 
                    while pos(' ', _group) > 0 do
                       begin
                         ss := copy(_group, 1, pos(' ', _group) - 1);
                         if slg.indexof(ss) = -1 then slg.add(ss);
                         if ar_[row,2] > '' then 
                             if slg_ins.indexof(ss) = -1 then slg_ins.add(ss);
                         delete(_group, 1, pos(' ', _group) );
                         _group := trim(_group);
                       end;
                 if slg.indexof(_group) = -1 then slg.add(_group);
                 if ar_[row,2] > '' then 
                       if slg_ins.indexof(_group) = -1 then slg_ins.add(_group);
                end;
             end //if upd ...
          end
     //package desc string
     else begin
            if not packageexists then ar_[row,6] := ar_[row,6] + ' ' + trim(s);
          end;
   end; // for i := 0 to ...

 writeln('Build array time:' + floattostr(now - t)); 
 fi.free;
 sl_packs.free;
end;


function filter(var txt : string; const ar_ : tarraytype; 
                const ins, repo, group, expl_dep, orfan, haveupdate, category : string; 
                const exact : boolean) : tarrint;
var r, i, y, p, c, z : integer;
    b, searchwords : boolean;
    s : string;
    arr_rows : array of integer;
    sl2 : tstringlist;
    sl  : tstringlist;
    
    procedure addtoarray(rnum : integer);
    begin
      inc(r);
      setlength(arr_rows, r);
      arr_rows[r - 1] := rnum;
    end;
    
begin
  sl  := tstringlist.create; 
  
  //writeln('==seaching text==');
  //writeln(txt);
  //writeln('======');
  //make list of searched strings
  if system.pos(',', txt) > 0 then 
  while system.pos(',', txt) > 0 do
     begin
        sl.add(copy(txt, 1, system.pos(',', txt) - 1) );
        delete(txt, 1, system.pos(',', txt) );
        txt := trim(txt);
     end;
     
  if trim(txt) > '' then sl.add(trim(txt)); 
  
  if trim(sl.text) > '' 
     then searchwords := true 
     else searchwords := false;
    
  r := 0;
  c := high(ar_);
  FOR i := 0 to c do
    BEGIN
      if repo  > '' then if ar_[i,5] <> repo then continue;
      if ins > '' then if ar_[i,2] = ''   then continue;
      if expl_dep > '' then if ar_[i,8] <> expl_dep then continue; 
      if orfan > '' then if ar_[i,9] = '' then continue; 
      if haveupdate > '' then if ar_[i,10] = '' then continue; 
      if category > '' then if ar_[i,12] <> category then continue; 

      if group > '' then 
           if group = ' ' 
             then begin if ar_[i,4] <> '' then continue; end
             else begin 
                   s := lowercase(ar_[i,4]); 
                   p := pos(group, s);
                   if (p <= 0)and(group <> s)
                       then continue
                       else begin 
                            if (s[p-1]<>' ')and(s[p-1]<>'(') then continue;
                            b := false;
                            while p > 0 do
                             begin
                               if (s[p + length(group)] = ' ')or(s[p + length(group)] = ')') then b := true;
                               delete(s, pos(group, s), length(group) );
                               s := trim(s);
                               p := pos(group, s);
                             end;
                            if (s[p + length(group)] = ' ')or(s[p + length(group)] = ')') then b := true;
                            if not b then continue;
                            end;
                  end;  
                       
  //if length(txt) > 5 then                
  //if (pos(txt, lowercase(ar_[i,6])) > 0) then writeln('Searched=',ar_[i,6]);
   
  if not searchwords
   then addtoarray(i)
   else begin
        for z := 0 to sl.count - 1 do
        BEGIN
        if exact 
        then begin
              if (sl[z] = ar_[i,1])or(sl[z] = ar_[i,6]) then addtoarray(i);
             end
        else begin
              sl2 := tstringlist.create;
              s := sl[z];
              if pos(' ', s) > 0 then 
              while pos(' ', s) > 0 do
                begin
                  sl2.add(copy(s, 1, pos(' ', s) - 1) );
                  delete(s, 1, pos(' ', s) );
                  s := trim(s);
                end;
              sl2.add(trim(s)); 

//  if length(txt) > 5 then      
//  if (pos(txt, lowercase(ar_[i,6])) > 0) then 
//  begin          
//    writeln('Searched=',sl2.text, ':' ,ar_[i,6]);
//  end;
  
               b := true;
//               b := false;
               for y := 0 to sl2.count - 1 do
                 if sl2[y] > '' 
                 then begin
                      s := lowercase(trim(sl2[y]));

//  if length(txt) > 5 then 
//  if (pos(txt, lowercase(ar_[i,6])) > 0) then 
//  writeln('sl2.count=',sl2.count, ' s=',s,' ',ar_[i,1]);

                      if (pos(s, lowercase(ar_[i,1])) = 0)and(pos(s, lowercase(ar_[i,6])) = 0) 
//                      if (pos(s, lowercase(ar_[i,1])) > 0)or(pos(s, lowercase(ar_[i,6])) > 0) 
                         then b := false;
//                         then b := true;
//                         else

//  if length(txt) > 5 then      
//    writeln('Searched2=',s, ':' ,ar_[i,6]);

                      end;

               if b then addtoarray(i);
               SL2.FREE;       
             end;
        END;
      end;
      
    END;
  result := arr_rows;
end;
//from lazarus wiki
{
function DownloadHTTP(URL, TargetFile: string): boolean;
// Download file; retry if necessary.
// Deals with SourceForge download links
// Could use Synapse HttpGetBinary, but that doesn't deal
// with result codes (i.e. it happily downloads a 404 error document)
const
  MaxRetries=3;
var
  HTTPGetResult: boolean;
  HTTPSender: THTTPSend;
  RetryAttempt: integer;
begin
  result:=false;
  RetryAttempt:=2;
  //Optional: mangling of Sourceforge file download URLs; see below.
  //URL:=SourceForgeURL(URL); //Deal with sourceforge URLs
  HTTPSender:=THTTPSend.Create;
  try
    try
      // Try to get the file
      HTTPGetResult:=HTTPSender.HTTPMethod('GET', URL);
      // If we have an answer from the server, check if the file
      // was sent to us.
      case HTTPSender.Resultcode of
        100..299:
          begin
            with TFileStream.Create(TargetFile,fmCreate or fmOpenWrite) do
            try
              Seek(0, soFromBeginning);
              CopyFrom(HTTPSender.Document, 0);
            finally
              Free;
            end;
            result:=true;
          end; //informational, success
        300..399: result:=false; //redirection. Not implemented, but could be.
        400..499: result:=false; //client error; 404 not found etc
        500..599: result:=false; //internal server error
        else result:=false; //unknown code
      end;
    except
      // We don't care for the reason for this error; the download failed.
      result:=false;
    end;
  finally
    HTTPSender.Free;
  end;
end;
}
function FileToString(FileName:String):String;
var hFile : Integer; nSize : Integer;
begin
  hFile := FileOpen(FileName,fmOpenRead);
  try
    nSize := FileSeek(hFile,0,2); FileSeek(hFile,0,0);
    SetLength(Result,nSize);
    FileRead(hFile,Result[1],nSize);
  finally
    FileClose(hFile);
  end;
end;

procedure tt.ongettext(const sender : TObject; var atext: AnsiString; const errorinput: Boolean);
BEGIN
  __OUTPUT := __OUTPUT + ATEXT;
END;

function tt.exec(const cmd : string; const wait : boolean) : string;
begin
  __output := '';
  fterm.onreceivetext := @ongettext;
  fterm.optionsprocess := [pro_output,pro_input,pro_errorouttoout,pro_shell,
                           pro_inactive,pro_newconsole,pro_sessionleader,pro_settty,
                           pro_tty,pro_echo,pro_winpipewritehandles,pro_ctrlc];
  writeln('exec cmd="'+cmd+'"');
  fterm.execprog(cmd);
  if wait then fterm.waitforprocess;  
  result := trim(__output);
end;

function getorfans : string;
begin
  result := fterm.exec('pacman -Qtdq', true);
end;

function getExpls  : string;
begin
  result := fterm.exec('pacman -Qe', true);
end;

function getPackages  : string;
begin
  result := fterm.exec('pacman -Ss', true) + fterm.exec('pacman -Qs', true);
end;

function synhMirrors : string;
begin
  result := fterm.exec('pacman -Sy', true);
end;

function searchAur(packagename : string) : string;
begin
  result := fterm.exec('yaourt -Ss ' + packagename + ' --nocolor', true);
end;

function Exec(cmd : string; wait : boolean) : string;
begin
  result := fterm.exec(cmd, wait);
end;

function FindBinaryBool(fname : string): boolean;
begin
  result := findfile(fname,['/bin','/sbin','/usr/bin','/usr/sbin']);
end;

function GetArch : string;
begin
  result := fterm.exec('uname -m', true);
end;

function GetLocale : string;
var s : string;
begin
  s := exec('locale | grep LANG', true);
  if s > '' then 
    begin
      delete(s,1,pos('=',s));
      s := copy(s,1,pos('_',s) - 1);
    end;
  result := s;    
end;

initialization 
  fterm := tt.create(nil);

finalization 
  fterm.free;

end.
