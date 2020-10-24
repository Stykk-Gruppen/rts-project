pragma Task_Dispatching_Policy(FIFO_Within_Priorities);
with Vehicle_Controller;

procedure Main with Priority => 0 is
begin
   loop
      null;
   end loop;
end Main;
