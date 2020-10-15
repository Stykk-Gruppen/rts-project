pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E095 : Short_Integer; pragma Import (Ada, E095, "ada__tags_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "ada__exceptions_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "system__soft_links_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "system__bb__timing_events_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "system__exception_table_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "ada__streams_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__finalization_root_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "ada__finalization_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "system__storage_pools_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "system__pool_global_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "hal__gpio_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "hal__i2c_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "hal__spi_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "hal__uart_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "memory_barriers_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "cortex_m__nvic_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "nrf__events_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "nrf__gpio_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "nrf__gpio__tasks_and_events_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "nrf__gpio2_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "nrf__interrupts_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "nrf__rtc_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "nrf__spi_master_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "nrf__tasks_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "nrf__adc_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "nrf__ppi_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "nrf__timers_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "nrf__twi_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "nrf__uart_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "nrf__device_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "arduino_nano_33_ble_sense__ios_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Bb.Timing_Events'Elab_Spec;
      E109 := E109 + 1;
      Ada.Tags'Elab_Body;
      E095 := E095 + 1;
      System.Exception_Table'Elab_Body;
      E048 := E048 + 1;
      E050 := E050 + 1;
      E022 := E022 + 1;
      Ada.Streams'Elab_Spec;
      E132 := E132 + 1;
      System.Finalization_Root'Elab_Spec;
      E141 := E141 + 1;
      Ada.Finalization'Elab_Spec;
      E139 := E139 + 1;
      System.Storage_Pools'Elab_Spec;
      E143 := E143 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E136 := E136 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E145 := E145 + 1;
      HAL.GPIO'ELAB_SPEC;
      E134 := E134 + 1;
      HAL.I2C'ELAB_SPEC;
      E172 := E172 + 1;
      HAL.SPI'ELAB_SPEC;
      E165 := E165 + 1;
      HAL.UART'ELAB_SPEC;
      E176 := E176 + 1;
      E203 := E203 + 1;
      Cortex_M.Nvic'Elab_Spec;
      E201 := E201 + 1;
      E194 := E194 + 1;
      Nrf.Gpio'Elab_Spec;
      Nrf.Gpio'Elab_Body;
      E127 := E127 + 1;
      E196 := E196 + 1;
      Nrf.Gpio2'Elab_Spec;
      Nrf.Gpio2'Elab_Body;
      E157 := E157 + 1;
      Nrf.Interrupts'Elab_Body;
      E198 := E198 + 1;
      E160 := E160 + 1;
      Nrf.Spi_Master'Elab_Spec;
      Nrf.Spi_Master'Elab_Body;
      E163 := E163 + 1;
      E182 := E182 + 1;
      E180 := E180 + 1;
      E205 := E205 + 1;
      Nrf.Timers'Elab_Spec;
      Nrf.Timers'Elab_Body;
      E167 := E167 + 1;
      Nrf.Twi'Elab_Spec;
      Nrf.Twi'Elab_Body;
      E170 := E170 + 1;
      Nrf.Uart'Elab_Spec;
      Nrf.Uart'Elab_Body;
      E174 := E174 + 1;
      Nrf.Device'Elab_Spec;
      Nrf.Device'Elab_Body;
      E117 := E117 + 1;
      Arduino_Nano_33_Ble_Sense.Ios'Elab_Spec;
      Arduino_Nano_33_Ble_Sense.Ios'Elab_Body;
      E178 := E178 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   /home/kent/Source/School/RealTimeProject/rts-project/testing/servo/obj/main.o
   --   -L/home/kent/Source/School/RealTimeProject/rts-project/testing/servo/obj/
   --   -L/home/kent/Source/School/RealTimeProject/rts-project/testing/servo/obj/
   --   -L/home/kent/Source/School/RealTimeProject/Ada_Drivers_Library/boards/Arduino_Nano_33_BLE_Sense/obj/full_lib_Debug/
   --   -L/home/kent/opt/GNAT/2020-arm-elf/arm-eabi/lib/gnat/ravenscar-full-nrf52840/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
