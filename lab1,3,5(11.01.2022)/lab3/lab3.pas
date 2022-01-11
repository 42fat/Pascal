program lab3;
uses timers;
Function my_pos ( const pattern, ss : string ) : Integer;
var
  F: array of Integer;
  k, i: integer;
begin
  SetLength(F, 1+Length(pattern));
  F[1] := 0;
  k := 0;
  for i := 2 to Length(pattern) do
  begin
    while (k > 0) and (pattern[k+1] <> ss[i]) do
      k := F[k];
    if pattern[k+1] = pattern[i] then
      k:=k+1;
    F[i] := k;
  end;
  k := 0;
  for i := 1 to Length(ss) do
   begin
    while (k > 0) and (pattern[k+1] <> ss[i]) do
      k := F[k];
    if pattern[k+1] = ss[i] Then
      k:=k+1;
    if k = Length(pattern) Then
    begin
      Result := i-length(pattern)+1;
      Break;
    end;
  end;
end;

Function my_pos_Reg ( const pattern, ss : string ) : Integer;
var
  F: array of Integer;
  k, i: integer;
begin
  SetLength(F, 1+Length(pattern));
  F[1] := 0;
  k := 0;
  for i := 2 to Length(pattern) do
  begin
    while (k > 0) and (upcase(pattern[k+1]) <> upcase(ss[i])) do
      k := F[k];
    if upcase(pattern[k+1]) = upcase(pattern[i]) then
      k:=k+1;
    F[i] := k;
  end;
  k := 0;
  for i := 1 to Length(ss) do
   begin
    while (k > 0) and (upcase(pattern[k+1]) <> upcase(ss[i])) do
      k := F[k];
    if upcase(pattern[k+1]) = upcase(ss[i]) Then
      k:=k+1;
    if k = Length(pattern) Then
    begin
      Result := i-length(pattern)+1;
      Break;
    end;
  end;
end;


var 
  ss,pattern:string;
  i : integer;
  start,finish: longint;
  time_my,time_pa:longint;
begin
  ss := 'abpeterabbape';
  pattern := 'peter';
  start:=Milliseconds;
  
  i:=my_pos(pattern,ss);
  finish:=Milliseconds;
  time_my:=finish - start;
 
  start:=Milliseconds;
  i:=pos(pattern,ss);
  finish:=Milliseconds;
  time_pa:=finish - start;
  
  pattern := 'PeTeR';
  
  ss := 'abapeteraba';
  
  i:=my_pos_reg(pattern,ss);
  
  
  writeln('Время поиска строки peter в строке abpeterabbape составило (ms)',time_my);
  writeln('Время поиска строки peter в строке abpeterabbape составило (ms)',time_pa);
  
end. 