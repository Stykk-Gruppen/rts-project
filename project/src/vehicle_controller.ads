package Vehicle_Controller is
   
   type Colour is (Red, Green, Blue);
   type Steering_Angle is (Straight, Left, Hard_Left, Right, Hard_Right);
   type Direction is (Forward, Backward, Stop);

   task Compute with Priority => 10;
   task Status_Light with Priority => 1;
   procedure Set_Steering_Angle (Angle : Steering_Angle);
   procedure Set_Velocity (Velocity : Float);
   procedure Activate_Dispenser;

private
   Status_Light_Colour : Colour := Green;
   Wheel_Radius : Float := 5.0;
     
end Vehicle_Controller;
