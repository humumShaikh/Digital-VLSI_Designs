Generating and simulating a sine wave on Vivado using the inbuilt DDS Compiler IP


In the block design, when you instantiate the DDS Compiler IP:
- Change the 'Parameter Selection' to 'Hardware Parameters' in the configuration section
- Change the 'Phase width' to 32 bits in the configuration section
- Change the 'Output width' to 16 bits in the configuration section
- Untick the 'Has Phase Out' option in the 'Implementation' section

Now in the 'Phase Angle Increment Value' section, enter the binary value of the 'Phase Increment Value'

Formula : 
          Phase Increment Value  =  [ (2^(phase_width)) x required_frequency ] / system_frequency
