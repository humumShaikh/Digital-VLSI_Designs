**TOP MODULE**

This depicts how all the 3 individual blocks can be configured together to make a UART module.

Steps:  1. Create individual custom IPs of - Frequency Divider , Transmitter and Receiver
        2. Create another project and generate a block design.
        3. Import these 3 custom IPs to your project.
        4. Place the blocks from the IP menu.
        5. Configure the blocks as shown in the image below and save.
        6. Select the current block design from the sources menu in the left and create an HDL wrapper for it.
        7. Done, now you may simulate it , synthesize it or implement it by giving constraints as well.

<img width="1421" height="685" alt="image" src="https://github.com/user-attachments/assets/064006eb-bdd8-4153-8083-31dcb7426f33" />
