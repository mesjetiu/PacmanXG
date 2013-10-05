unit pacmanlog;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface
type 
  tlogarray = array of string;
  tlogarrayint = array of integer;
  
  function ReadLog(const fname : string; var arr, arr_dates : tlogarray) : boolean;
  function FindLog(const txt1,txt2 : string; const arr : tlogarray;var arrf : tlogarrayint) : boolean;
  
implementation

uses sysutils,classes;


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

function ReadLog(const fname : string; var arr, arr_dates : tlogarray) : boolean;
label a;
var sl_log : tstringlist;
    i, z, y,
    logcount  : longint;
    s, ss : string;
begin

  sl_log := tstringlist.create;
  sl_log.text := filetostring(fname);
  logcount := sl_log.count;

  setlength(arr, 0);
  setlength(arr_dates,0);

  z := 0;
  y := 0;
  
  if logcount > 0 then 
   for i := 0 to logcount - 1 do
    begin
      s := sl_log[i];
      if length(s) = 0 then continue;
      if s[1] <> '[' then 
         begin
           if z > 0 then arr[z-1] := arr[z-1] + ' ' + s;
           continue;
         end;
      ss := copy(s,2,10);
            
      if (y > 0) then if (arr_dates[y-1] = ss) then goto a;
      inc(y);
      setlength(arr_dates,y);
      arr_dates[y-1] := ss;
      
      a:
      inc(z);
      setlength(arr,z);
      arr[z-1] := s;
    end;
  sl_log.free;  
end;

function FindLog(const txt1,txt2 : string; const arr : tlogarray;var arrf : tlogarrayint) : boolean;
var i,r,y : longint;
begin
  r := high(arr);
  y := 0;
  setlength(arrf,0);
  if r > 0 then 
    for i := 0 to r do
    begin
      if txt1 > '' then 
        if pos(txt1,arr[i]) <> 2 then continue;
      if txt2 > '' then   
        if pos(txt2,arr[i]) = 0 then continue;
      inc(y);
      setlength(arrf,y);
      arrf[y-1] := i;
    end;
      
end;
  
end.
