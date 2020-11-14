with Arduino_Nano_33_Ble_Sense.IOs;
with HCSR04;

procedure Main is
   Testing_Sensor_Echo : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 44;
   Testing_Sensor_Trig : constant Arduino_Nano_33_Ble_Sense.IOs.Pin_Id := 43;
   Distance_Value : Float;
begin
   loop
      Distance_Value := HCSR04.Distance(Testing_Sensor_Trig, Testing_Sensor_Echo);
   end loop;
end Main;
