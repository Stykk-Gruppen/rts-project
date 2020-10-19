package body Servo_Controller is

   task body Steering is
   begin
      Servo.SetAngle(SteeringServo.Angle, SteeringServo.Pin);
   end Steering;
   
   task body Engine is
   begin
      null;
   end Engine;
   
   task body Dispenser is
   begin
      null;
   end Dispenser;

end Servo_Controller;
