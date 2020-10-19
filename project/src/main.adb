pragma Task_Dispatching_Policy(FIFO_Within_Priorities);
with Vehicle_Controller;
--with tasktest;

procedure Main with Priority => 0 is
begin
   loop
      null;
   end loop;
end Main;
