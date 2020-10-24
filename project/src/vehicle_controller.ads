package Vehicle_Controller is
   type Colour is (Red, Green, Blue);
   type Steering_Angle is (Straight, Left, Hard_Left, Right, Hard_Right);
   type Direction is (Forward, Backward, Stop);

   task Compute with Priority => 3;
   task Status_Light with Priority => 1;

   procedure Change_Direction(Next_Direction : Direction);

private
   Status_Light_Colour : Colour := Blue;
   Wheel_Radius : Float := 5.0;
   
   Current_Direction : Direction := Stop;
   Next_Dir : Direction := Stop;
   Stop_Distance_Front : Float := 50.0;
   Stop_Distance_Back : Float := 30.0;
     
end Vehicle_Controller;
