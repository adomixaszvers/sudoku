program sudoku;

type
  TLentele = array [0..8] of array [0..8] of integer;

var
  masyvas, atsakymo_masyvas: TLentele;

  function input_value(x, y, Value: integer): integer;
  var
    i, j: integer;
  begin
    //Scan horizontally and vertically
    for i := 0 to 8 do
    begin
      if (Value = atsakymo_masyvas[i][y]) or (Value = atsakymo_masyvas[x][i]) then
      begin
        input_value := 0;
        exit;
      end;
    end;
    //Scan its own square
    if (x < 3) then
    begin
      if (y < 3) then
      begin
        for i := 0 to 2 do
        begin
          for j := 0 to 2 do
          begin
            if (Value = atsakymo_masyvas[i][j]) then
            begin
              input_value := 0;
              exit;
            end;
          end;
        end;
      end
      else if (y < 6) then
      begin
        for i := 0 to 2 do
        begin
          for j := 3 to 5 do
          begin
            if (Value = atsakymo_masyvas[i][j]) then
            begin
              input_value := 0;
              exit;
            end;
          end;
        end;
      end
      else
      begin
        for i := 0 to 2 do
        begin
          for j := 6 to 8 do
          begin
            if (Value = atsakymo_masyvas[i][j]) then
            begin
              input_value := 0;
              exit;
            end;
          end;
        end;
      end;
    end
    else if (x < 6) then
    begin
      if (y < 3) then
      begin
        for i := 3 to 5 do
        begin
          for j := 0 to 2 do
          begin
            if (Value = atsakymo_masyvas[i][j]) then
            begin
              input_value := 0;
              exit;
            end;
          end;
        end;
      end
      else if (y < 6) then
      begin
        for i := 3 to 5 do
        begin
          for j := 3 to 5 do
          begin
            if (Value = atsakymo_masyvas[i][j]) then
            begin
              input_value := 0;
              exit;
            end;
          end;
        end;
      end
      else
      begin
        for i := 3 to 5 do
        begin
          for j := 6 to 8 do
          begin
            if (Value = atsakymo_masyvas[i][j]) then
            begin
              input_value := 0;
              exit;
            end;
          end;
        end;
      end;
    end
    else
    begin
      if (y < 3) then
      begin
        for i := 6 to 8 do
        begin
          for j := 0 to 2 do
          begin
            if (Value = atsakymo_masyvas[i][j]) then
            begin
              input_value := 0;
              exit;
            end;
          end;
        end;
      end
      else if (y < 6) then
      begin
        for i := 6 to 8 do
        begin
          for j := 3 to 5 do
          begin
            if (Value = atsakymo_masyvas[i][j]) then
            begin
              input_value := 0;
              exit;
            end;
          end;
        end;
      end
      else
      begin
        for i := 6 to 8 do
        begin
          for j := 6 to 8 do
          begin
            if (Value = atsakymo_masyvas[i][j]) then
            begin
              input_value := 0;
              exit;
            end;
          end;
        end;
      end;
    end;
    input_value := Value;
  end;

  function backtracking(x, y: integer): integer;
  var
    i, j, temp: integer;
  begin
    if (atsakymo_masyvas[x][y] = 0) then
    begin
      i := 1;
      while (i<10) do
      begin
        temp := input_value(x, y, i);
        if (temp > 0) then
        begin
          atsakymo_masyvas[x][y] := temp;
          if (x = 8) and (y = 8) then
          begin
            backtracking := 1;
            exit;
          end
          else if (x = 8) then
          begin
            if (backtracking(0, y + 1) > 0) then
            begin
              backtracking := 1;
              exit;
            end;
          end
          else
          begin
            if (backtracking(x + 1, y) > 0) then
            begin
              backtracking := 1;
              exit;
            end;
          end;
        end;
        i := i+1;
      end;
      if(i = 10) then
      begin
        if(atsakymo_masyvas[x][y] <> masyvas[x][y]) then
                                  atsakymo_masyvas[x][y] := 0;
        backtracking := 0;
        exit;
      end;
    end
    else
    begin
      if (x=8) and (y=8) then
      begin
        backtracking := 1;
        exit;
      end
      else if (x=8) then
      begin
        if (backtracking(0, y+1)>0) then
        begin
          backtracking := 1;
          exit;
        end;
      end
      else
      begin
        if(backtracking(x+1,y)>0) then
        begin
          backtracking := 1;
          exit;
        end;
      end;
    end;
  end;
var
  i, j: integer;
  df: text;
begin
   WriteLn('Original outputArray');
   Assign(df, 'myfile.txt'); Reset(df);
   for i := 0 to 8 do
   begin
     Read(df, masyvas[i][0], masyvas[i][1], masyvas[i][2], masyvas[i][3], masyvas[i][4], masyvas[i][5], masyvas[i][6], masyvas[i][7], masyvas[i][8]);
   end;
   Close(df);
   for i := 0 to 8 do
   begin
     for j := 0 to 8 do
     begin
       atsakymo_masyvas[i][j] := masyvas[i][j];
     end;
   end;
   for i := 0 to 8 do
   begin
     for j := 0 to 8 do
     begin
       Write(masyvas[i][j], ' ');
     end;
     WriteLn;
   end;
   if(backtracking(0,0)>0) then
   begin
     WriteLn('Soln is :');
     for i := 0 to 8 do
     begin
       for j := 0 to 8 do
       begin
         Write(atsakymo_masyvas[i][j], ' ');
       end;
       WriteLn;
     end;
   end
   else
       WriteLn('Not Soln');
end.

