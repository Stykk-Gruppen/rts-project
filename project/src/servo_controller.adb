package body Servo_Controller is

   --------------
   -- Steering --
   --------------

   task body Steering is
   begin
      loop
         Servo.Set_Angle (Steering_Servo.Angle, Steering_Servo.Pin);
      end loop;
   end Steering;

   ------------
   -- Engine --
   ------------

   task body Engine is
   begin
      loop
         Servo.Set_Rpm (Engine_Servo.Rpm, Engine_Servo.Pin);
      end loop;
   end Engine;

   --------------------
   -- Left Dispenser --
   --------------------

   task body Dispenser_Left is
   begin
      loop
         Servo.Set_Angle (Dispenser_Servo_Left.Angle, Dispenser_Servo_Left.Pin);
      end loop;
   end Dispenser_Left;

   ---------------------
   -- Right Dispenser --
   ---------------------

   task body Dispenser_Right is
   begin
      loop
         Servo.Set_Angle (Dispenser_Servo_Right.Angle, Dispenser_Servo_Right.Pin);
      end loop;
   end Dispenser_Right;

end Servo_Controller;
