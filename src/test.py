import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

@cocotb.test()
async def run_smoke_test(dut):
    dut._log.info("start")
    clock = Clock(dut.dclk, 10, units="us")
    cocotb.start_soon(clock.start())
    await ClockCycles(dut.dclk, 2)
    #assert int(dut.pass) == 1 

