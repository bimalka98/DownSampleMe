# Image-Downsampler
Custom processor implemented on an FPGA for image downsampling for UOM's EN3030 Circuits and Systems Design module.

## Micro Instructions

* [Google Doc](https://docs.google.com/document/d/1028hsUJKepAL6kfoBulOBk_25bebY80FS1wIMX07NTk/edit?usp=sharing)

## Look Up Table for the Control Unit

* [Google Doc](https://docs.google.com/spreadsheets/d/1q-KNqPpNZ8ltx9Im-CNCMf2_ZTri1Vfy2qa3QgV4cFc/edit?usp=sharing)

## Verifying DRAM
```
# run 1000ns
time=                   0, w_en=0, r_en=1, address=     x, pixel value=xxxxxxxx
time=                  20, w_en=0, r_en=1, address=    20, pixel value=10100101 // read
time=                  30, w_en=0, r_en=1, address=    21, pixel value=10100001 // read
time=                  40, w_en=0, r_en=1, address=    22, pixel value=10011101 // read
time=                  50, w_en=0, r_en=1, address=    23, pixel value=10011101 // read
time=                  60, w_en=0, r_en=1, address=    24, pixel value=10100001 // read
time=                  70, w_en=0, r_en=1, address=    25, pixel value=10100011 // read
time=                  90, w_en=1, r_en=0, address=    20, pixel value=zzzzzzzz // write 1111_1111; read will be high impedance
time=                 100, w_en=1, r_en=0, address=    21, pixel value=zzzzzzzz // write 1111_1111; read will be high impedance
time=                 110, w_en=1, r_en=0, address=    22, pixel value=zzzzzzzz // write 1111_1111; read will be high impedance
time=                 120, w_en=1, r_en=0, address=    23, pixel value=zzzzzzzz // write 1111_1111; read will be high impedance
time=                 130, w_en=1, r_en=0, address=    24, pixel value=zzzzzzzz // write 1111_1111; read will be high impedance
time=                 140, w_en=1, r_en=0, address=    25, pixel value=zzzzzzzz // write 1111_1111; read will be high impedance
time=                 160, w_en=0, r_en=1, address=    20, pixel value=11111111 // read again
time=                 170, w_en=0, r_en=1, address=    21, pixel value=11111111 // read again
time=                 180, w_en=0, r_en=1, address=    22, pixel value=11111111 // read again
time=                 190, w_en=0, r_en=1, address=    23, pixel value=11111111 // read again
time=                 200, w_en=0, r_en=1, address=    24, pixel value=11111111 // read again
time=                 210, w_en=0, r_en=1, address=    25, pixel value=11111111 // read again
xsim: Time (s): cpu = 00:00:02 ; elapsed = 00:00:08 . Memory (MB): peak = 1078.117 ; gain = 0.000
INFO: [USF-XSim-96] XSim completed. Design snapshot 'Ram_tb_behav' loaded.
INFO: [USF-XSim-97] XSim simulation ran for 1000ns
launch_simulation: Time (s): cpu = 00:00:03 ; elapsed = 00:01:44 . Memory (MB): peak = 1078.117 ; gain = 0.000

```