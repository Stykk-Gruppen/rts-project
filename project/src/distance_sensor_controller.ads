with Arduino_Nano_33_Ble_Sense.IOs;

package Distance_Sensor_Controller is
   
   task Measure with Priority => 2;

   type Distance_Sensor is record
      TrigPin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      EchoPin : Arduino_Nano_33_Ble_Sense.IOs.Pin_Id;
      Value : Float;
   end record;

   Front : Distance_Sensor :=
     (TrigPin => 47,
      EchoPin => 45,
      Value => 50.0);

   Back : Distance_Sensor :=
     (TrigPin => 43,
      EchoPin => 44,
      Value => 50.0);

end Distance_Sensor_Controller;
