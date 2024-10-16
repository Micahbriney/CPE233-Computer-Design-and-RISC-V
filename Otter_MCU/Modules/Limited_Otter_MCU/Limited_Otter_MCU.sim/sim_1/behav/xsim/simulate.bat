@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Feb 26 20:25:54 -0800 2020
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim otter_tb_behav -key {Behavioral:sim_1:Functional:otter_tb} -tclbatch otter_tb.tcl -view C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Lab 5/Modules/Limited_Otter_MCU/otter_tb_behav.wcfg -log simulate.log"
call xsim  otter_tb_behav -key {Behavioral:sim_1:Functional:otter_tb} -tclbatch otter_tb.tcl -view C:/Users/mjrbr/OneDrive/Cal Poly/Winter 2020/CPE 233/Group Folder/Lab 5/Modules/Limited_Otter_MCU/otter_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0