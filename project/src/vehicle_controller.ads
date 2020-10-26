package Vehicle_Controller is
   type Colour is (Red, Green, Blue, Yellow);
   type Direction is (Forward, Backward, Stop, Braking);

   task Compute with Priority => 3;
   task Status_Light with Priority => 1;

   procedure Change_Direction;

private
   Status_Light_Colour : Colour := Blue;
   Current_Direction : Direction := Stop;
   Next_Direction : Direction := Stop;
   Stop_Distance_Front : Float := 50.0;
   Stop_Distance_Back : Float := 40.0;
     
end Vehicle_Controller;
