package body Servo_Controller is

   --------------
   -- Steering --
   --------------

   task body Steering is
   begin
      loop
         Servo.SetAngle(SteeringServo.Angle, SteeringServo.Pin);
      end loop;
   end Steering;

   ------------
   -- Engine --
   ------------

   task body Engine is
   begin
      null;
   end Engine;

   ---------------
   -- Dispenser --
   ---------------

   task body Dispenser is
   begin
      null;
   end Dispenser;

end Servo_Controller;
