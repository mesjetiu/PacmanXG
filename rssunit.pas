unit rssunit;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface

type 
 
  TRSSItem = class
  private
    FAuthor: string;
    FCategory: string;
    FComments: string;
    FDescription: string;
    FGuid: string;
    FLink: string;
    FPubDate: string;
    FTitle: string;
    fContent: string;
    fContentencoded: string;
  public
    constructor Create;
    property Content: string read fContent;
    property Title: string read FTitle;
    property Link: string read FLink;
    property Guid: string read FGuid;
    property Category: string read FCategory;
    property PubDate: string read FPubDate;
    property Description: string read FDescription;
    property Author: string read FAuthor;
    property Comments: string read FComments;
    property Contentencoded : string read fContentencoded;
  end;
 
 titemsarr = array of TRSSItem;
 
 tRss = class
 private
   ftext : string;
   ftitle, 
   flink,
   fdescription,
   flastBuildDate,
   flanguage,
   fgenerator : string;
   
   fitems : titemsarr;
   fitemcount : integer;
   
   procedure parsetext(var txt : string);
 public
   constructor Create;
   destructor Destroy; override;
   procedure LoadFromFile(const fName: string);
   procedure clear;
   
   property title         : string read ftitle;  
   property link          : string read flink;
   property description   : string read fdescription;
   property lastBuildDate : string read flastBuildDate;
   property language      : string read flanguage;
   property generator     : string read fgenerator;
   
   property items         : titemsarr read fitems;
   property itemcount     : integer read fitemcount;
   
 end;

 
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
        
       if pos('&lt;/a',s) = i then begin delete(s,i,6);b := true;end;
       if pos('&qt;',s) = i then begin delete(s,i,4);b := true; end;
       
       if pos('<![CDATA[',s) = i then begin delete(s,i,9);b := true; end;
       if pos(']]>',s) = i then begin delete(s,i,3);b := true; end;


       if pos('&lt;a',s) = i then 
           begin 
            d:
            delete(s,i,1); 
            if s[i] <> '"' then goto d;
            e:
            delete(s,i,1); 
            if s[i] <> '"' then goto e;
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

function getparam(const fparam : string; var ftext : string) : string;
var txt : string;
    p : integer;
begin
  {
  txt := copy(ftext, pos('<' + fparam + '>', ftext) 
                        + length('<' + fparam + '>'),
                        pos('</' + fparam + '>', ftext) 
                        - pos('<' + fparam + '>', ftext) 
                        - length('<' + fparam + '>'));
                        
  delete(ftext, pos('<' + fparam + '>', ftext),
                        pos('</' + fparam + '>', ftext) 
                        - pos('<' + fparam + '>', ftext)
                        + length('</' + fparam + '>'));
         }     
   p := pos('<' + fparam, ftext);
   if p > 0 then 
   begin
   while ftext[p] <> '>' do delete(ftext,p,1); 
   delete(ftext,p,1);
   txt := copy(ftext,p,pos('</' + fparam + '>',ftext) - p);
   //writeln(fparam,'===',txt);
   delete(ftext,p,pos('</' + fparam + '>',ftext) - p + length('</' + fparam + '>'));
   //writeln('ftxt=================================================',ftext);
   end;
   result := cleartext(txt);
end;

constructor TRSS.Create;
begin
end;

destructor TRSS.Destroy;
begin
  inherited Destroy;
end;

procedure TRSS.LoadFromFile(const fname : string);
begin
  ftext := filetostring(fName);
  parsetext(ftext);
end;

procedure TRSS.parsetext(var txt : string);
var itemtxt : string;
    itm : TRSSItem;
      r : integer;
begin

  delete(txt,1,pos('<chanel',txt) - 1);
  ftitle := getparam('title',txt);
  flink  := getparam('link',txt);
  fdescription  := getparam('description',txt);
  flastBuildDate:= getparam('lastBuildDate',txt);
  flanguage     := getparam('language',txt);
  fgenerator    := getparam('generator',txt);

  r := 0;
  while system.pos('<item',txt) <> 0 do 
    begin
      itemtxt := getparam('item',txt);
     // writeln('==================================',txt);
      itm := TRSSItem.create;
      itm.FAuthor  := getparam('author',itemtxt);
      itm.FCategory:= getparam('category',itemtxt);
      itm.FComments:= getparam('comments',itemtxt);
      itm.FDescription := getparam('description',itemtxt);
      itm.FGuid        := getparam('guid',itemtxt);
      itm.FLink        := getparam('link',itemtxt);
      itm.FPubDate     := getparam('pubdate',itemtxt);
      itm.FTitle       := getparam('title',itemtxt);
      itm.fContentencoded := getparam('content:encoded',itemtxt);
      itm.fContent     := getparam('content',itemtxt);
      setlength(fitems,r + 1);
      fitems[r] := itm;
      inc(r);
    end;
  fitemcount := r;  
end;

procedure TRSS.clear;
begin
  ftitle := '';
  flink  := '';
  fdescription  := '';
  flastBuildDate:= '';
  flanguage     := '';
  fgenerator    := '';
  setlength(fitems,0);
  fitemcount := 0;  
end;

constructor TRSSItem.Create;
begin
end;

end.
