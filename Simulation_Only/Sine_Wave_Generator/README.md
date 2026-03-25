Generating and simulating a sine wave on Vivado using the inbuilt DDS Compiler IP


In the block design, when you instantiate the DDS Compiler IP:
- Change the 'Parameter Selection' to 'Hardware Parameters' in the configuration section
- Change the 'Phase width' to 32 bits in the configuration section
- Change the 'Output width' to 16 bits in the configuration section
- Untick the 'Has Phase Out' option in the 'Implementation' section

Now in the 'Phase Angle Increment Value' section, enter the binary value of the 'Phase Increment Value'

Formula : 
          Phase Increment Value  =  [ (2^(phase_width)) x required_frequency ] / system_frequency


Click Ok

Then extend the ports of the DDS Compiler
Then disconnect the 'm_axis_data_tvalid_0' port

<img width="668" height="173" alt="image" src="https://github.com/user-attachments/assets/17d75ad2-0dfc-43de-8ad7-69b70ad8cd1d" />
**Should look like this**


Now create it's HDL Wrapper
Note the module name and the I/O ports
Create testbench and instantitate the wrapper
Assign an input clock and an output wire to the wrapper's output
Write testbench to simulate an input clock to the wrapper
Here we are assuming an input clock freqeuncy of 100MHz
