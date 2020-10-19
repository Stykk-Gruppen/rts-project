with Distance_Sensor_Controller;
with Servo_Controller;

package body Vehicle_Controller is

   -------------
   -- Compute --
   -------------

   task body Compute is
   begin
      loop
         if Distance_Sensor_Controller.Front.Value < 20.0 then
            Servo_Controller.SteeringServo.Angle := -90;
         else
            Servo_Controller.SteeringServo.Angle := 90;
         end if;
      end loop;
   end Compute;

end Vehicle_Controller;
