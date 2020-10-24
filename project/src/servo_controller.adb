package body Servo_Controller is
   ------------
   -- Engine --
   ------------

   task body Engine is
   begin
      loop
         case Engine_Servo.Current_Direction is
            when Forward =>
               Servo.Write(1800, Engine_Servo.Pin);
            when Backward =>
               Servo.Write(1000, Engine_Servo.Pin);
            when Stop =>
               Servo.Write(1500, Engine_Servo.Pin);
         end case;
      end loop;
   end Engine;

end Servo_Controller;
