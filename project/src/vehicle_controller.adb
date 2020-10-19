package body Vehicle_Controller is

   task body Compute is
   begin
      if DistanceSensorsController.front.value < 20.0 then
         Servo_Controller.SteeringServo.Angle := -90;
      else
         Servo_Controller.SteeringServo.Angle := 90;
      end if;
   end Compute;

end Vehicle_Controller;
