program sudoku;

type
  TLentele = array [0..8] of array [0..8] of Integer;

var
  masyvas, atsakymo_masyvas: TLentele;

function input_value(x, y, value: integer): integer;
var
  i, j: integer;
begin
  //Scan horizontally and vertically
  for i := 0 to 8 do
  begin
       if (value = atsakymo_masyvas[i][y]) or (value = atsakymo_masyvas[x][i]) then
       begin
         input_value := 0;
         exit;
       end;
  end;
  //Scan its own square
  if (x<3) then
  begin
      if (y<3) then
      begin
        for i := 0 to 2 do
        begin
             for j := 0 to 2 do
             begin
                  if(value = atsakymo_masyvas[i][j]) then
                  begin
                    input_value := 0;
                    exit;
                  end;
             end;
        end;
      end
      else if (y<6) then
      begin
        for i := 0 to 2 do
        begin
             for j := 3 to 5 do
             begin
                  if(value = atsakymo_masyvas[i][j]) then
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
                     if(value = atsakymo_masyvas[i][j]) then
                     begin
                       input_value := 0;
                       exit;
                     end;
                end;
           end;
      end;
  end
  else if (x<6) then
  begin
      if (y<3) then
      begin
        for i := 3 to 5 do
        begin
             for j := 0 to 2 do
             begin
                  if(value = atsakymo_masyvas[i][j]) then
                  begin
                    input_value := 0;
                    exit;
                  end;
             end;
        end;
      end
      else if (y<6) then
      begin
        for i := 3 to 5 do
        begin
             for j := 3 to 5 do
             begin
                  if(value = atsakymo_masyvas[i][j]) then
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
                     if(value = atsakymo_masyvas[i][j]) then
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
      if (y<3) then
      begin
        for i := 6 to 8 do
        begin
             for j := 0 to 2 do
             begin
                  if(value = atsakymo_masyvas[i][j]) then
                  begin
                    input_value := 0;
                    exit;
                  end;
             end;
        end;
      end
      else if (y<6) then
      begin
        for i := 6 to 8 do
        begin
             for j := 3 to 5 do
             begin
                  if(value = atsakymo_masyvas[i][j]) then
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
                     if(value = atsakymo_masyvas[i][j]) then
                     begin
                       input_value := 0;
                       exit;
                     end;
                end;
           end;
      end;
  end;
  input_value := value;
end;

function backtracking(x, y: integer): integer;
var
  i, j, temp: integer;
begin
  if(atsakymo_masyvas[x][y] = 0) then
  begin
    for i := 1 to 9 do
    begin
        temp = input_value(x, y, i);
        if(temp>0) then
                   atsakymo_masyvas[x][y] = temp;
    end;
  end;
  if(x = 8) and (y = 8) then
  begin
    backtracking := 1;
    exit;
  end
  else if (x = 8) then
  begin
      if(backtracking(0, y+1)>0) then
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

begin

end.

